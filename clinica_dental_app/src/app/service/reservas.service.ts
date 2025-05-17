import { Injectable } from '@angular/core';
import { Appointment } from '../model/Appointment';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class ReservasService {

  constructor(private http:HttpClient) { }

  getAppointmentsAll():Observable<Appointment[]>{
    return this.http.get<Appointment[]>('assets/reservas.json');
  }

  getAppointmentsByDate(date: Date): Observable<Appointment[]> {
    return this.getAppointmentsAll().pipe(
      map(appo =>
        appo.filter(appo => {
          const appointmentDate = new Date(appo.dateAppointment);
          return appointmentDate.getFullYear() === date.getFullYear() &&
                 appointmentDate.getMonth() === date.getMonth() &&
                 appointmentDate.getDate() === date.getDate();
        })
      )
    );
  }
}

