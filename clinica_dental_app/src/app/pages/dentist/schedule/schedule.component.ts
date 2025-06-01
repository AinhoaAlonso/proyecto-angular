
import { Component, OnInit } from '@angular/core';
import { ProfessionalAvailabilitiesTsService } from '../../../service/professional-availabilities.ts.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Availability } from './../../../model/profesional-availability';

@Component({
  selector: 'app-schedule',
  imports: [FormsModule, CommonModule],
  templateUrl: './schedule.component.html',
  styleUrl: './schedule.component.css'
})
export class ScheduleComponent implements OnInit {

  objectKeys = Object.keys;
  disponibilidades: Availability[] = [];
  disponibilidadesAgrupadas: any = {};
  Object = Object;
  fechaSeleccionada: string = '';
  disponibilidadesFiltradas: any = {};

  constructor(private professionalAvailabilitiesService:ProfessionalAvailabilitiesTsService){}

   ngOnInit(): void {
    this.professionalAvailabilitiesService.getAvailabilitiesAll().subscribe({

      next: (data) => {
        console.log('Datos recibidos del backend:', data);
        this.disponibilidades = data;
        this.disponibilidadesAgrupadas = this.groupByProfessionalAndDate(this.disponibilidades);
        console.log('Datos agrupados:', this.disponibilidadesAgrupadas);
      },
      error: (err) => console.error('Error cargando disponibilidades:', err)
    });
  }
  groupByProfessionalAndDate(data: Availability[]) {
    console.log('Agrupando datos:', data);
    return data.reduce((acc, item) => {
      const prof = item.professional;
      const dateStr = item.date;

      if (!acc[prof]) acc[prof] = {};
      if (!acc[prof][dateStr]) acc[prof][dateStr] = [];

      // Aquí asegúrate que slot y status se copian correctamente
      console.log('ITEM:', item);

       // Ahora recorremos cada franja horaria
      const availabilityArray = Array.isArray(item.availability) ? item.availability : [];
      availabilityArray.forEach(slot => {
        acc[prof][dateStr].push({
          time: slot.time,
          status: slot.status
        });
      });

      return acc;
    }, {});
  }
  toggleSlot(slot: { time: string; status: string }) {
    console.log('Slot antes de toggle:', slot);
    if (slot.status === 'libre') {
      slot.status = 'no disponible';  // bloquea la franja
    } else if (slot.status === 'no disponible') {
      slot.status = 'libre';  // libera la franja
    }
      console.log('Slot después de toggle:', slot);
      // Aquí deberías llamar al backend para actualizar la disponibilidad en la DB
  }

  filtrarPorFecha() {
  this.disponibilidadesFiltradas = {};

    for (const prof of Object.keys(this.disponibilidadesAgrupadas)) {
      const fechas = this.disponibilidadesAgrupadas[prof];
      if (fechas[this.fechaSeleccionada]) {
        this.disponibilidadesFiltradas[prof] = {
          [this.fechaSeleccionada]: fechas[this.fechaSeleccionada]
        };
      }
    }
  }
}
