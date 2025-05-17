import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatCalendar } from '@angular/material/datepicker';
import { MatNativeDateModule, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatListModule } from '@angular/material/list';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { Appointment } from '../model/Appointment';
import { ReservasService } from '../service/reservas.service';


@Component({
  selector: 'app-calendario',
  standalone: true,
  imports: [
    CommonModule,
    MatCardModule,
    MatCalendar,
    MatNativeDateModule,
    MatListModule,
    MatDividerModule,
    MatIconModule,
  ],
  templateUrl: './calendario.component.html',
  styleUrls: ['./calendario.component.css']
})
export class CalendarioComponent implements OnInit{
  selectedDate: Date = new Date();
  appointments: Appointment[];
  filteredAppointments: Appointment[]=[];
  constructor(private reservasService:ReservasService) {}

  ngOnInit(): void {
    this.getAppointmentsByDate(this.selectedDate);
  }

  onDateChange(date: Date): void {
    this.selectedDate = date;
    this.getAppointmentsByDate(date);
  }

  getAppointmentsByDate(date: Date): void {
    this.reservasService.getAppointmentsByDate(date)
    .subscribe(data => {
      this.filteredAppointments = data;
      console.log("Reservas Filtradas por Fecha", this.filteredAppointments);
    });
  }

  // Función que bloquea sábados y domingos
  dateFilter = (date: Date | null): boolean => {
    if (!date) return false;
    const day = date.getDay();
    // 0 = domingo, 6 = sábado
    return day !== 0 && day !== 6;
}

}
