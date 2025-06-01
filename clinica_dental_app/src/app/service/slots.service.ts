import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Slot } from '../model/Slot';

@Injectable({
  providedIn: 'root'
})
export class SlotsService {

  constructor(private http:HttpClient) { }

  getSlotsAll():Observable<Slot[]>{
    return this.http.get<Slot[]>('assets/slots.json');
  }
}
