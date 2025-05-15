import { Injectable } from '@angular/core';
import { Reserva } from '../model/Reserva';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ReservasService {

  constructor(private http:HttpClient) { }

  getReservas():Observable<Reserva[]>{
    return this.http.get<Reserva[]>('assets/reservas.json');
  }

  getReservasPorFecha(fecha: Date): Observable<Reserva[]> {
    return this.getReservas().pipe(
      map(reservas =>
        reservas.filter(reserva => {
          const reservaFecha = new Date(reserva.fechaReserva);
          return reservaFecha.getFullYear() === fecha.getFullYear() &&
                 reservaFecha.getMonth() === fecha.getMonth() &&
                 reservaFecha.getDate() === fecha.getDate();
        })
      )
    );
  }
}

