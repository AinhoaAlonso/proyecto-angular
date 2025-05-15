import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatCalendar } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatListModule } from '@angular/material/list';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { Reserva } from '../model/Reserva';
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
  reservas: Reserva[];
  reservasFiltradas: Reserva[]=[];
  constructor(private reservasService:ReservasService) {}

  ngOnInit(): void {
    this.cargarReservasDia(this.selectedDate);
  }

  onDateChange(date: Date): void {
    this.selectedDate = date;
    this.cargarReservasDia(date);
  }

  cargarReservasDia(fecha: Date): void {
    this.reservasService.getReservasPorFecha(fecha)
    .subscribe(data => {
      this.reservasFiltradas = data;
      console.log("Reservas Filtradas por Fecha", this.reservasFiltradas);
    });
  }
}
