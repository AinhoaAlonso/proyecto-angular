import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Availability } from '../model/profesional-availability';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProfessionalAvailabilitiesTsService {

  constructor(private http:HttpClient) { }

  getAvailabilitiesAll():Observable<Availability[]>{
      return this.http.get<Availability[]>('assets/disponibilidad_dentistas.json');
    }
}
