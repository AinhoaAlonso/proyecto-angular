import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { SlotsService } from '../service/slots.service';
import { Slot } from '../model/Slot';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-slots',
  imports: [FormsModule, CommonModule],
  templateUrl: './slots.component.html',
  styleUrl: './slots.component.css'
})
export class SlotsComponent implements OnInit{

  slots:Slot[];
  slotsMorning:Slot[] = [];
  slotsAfternoon: Slot[] = [];
  constructor(private slotsService:SlotsService){

  }
 ngOnInit(): void {
    this.getSlotsAll();

  }

  getSlotsAll(){
    this.slotsService.getSlotsAll().subscribe(
      data => {
        this.slots = data;
        console.log("Datos", data);

        //Una vez que tenemos los datos filtrados
        this.slotsMorning = this.slots.filter((s)=> s.period == 'mañana');
        this.slotsAfternoon = this.slots.filter((s)=> s.period == 'tarde');
      }
    )
  }
}
