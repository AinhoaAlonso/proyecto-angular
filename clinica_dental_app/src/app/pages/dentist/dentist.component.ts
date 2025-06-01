import { Component } from '@angular/core';
import { RouterModule} from '@angular/router';
import { ScheduleComponent } from "./schedule/schedule.component";

@Component({
  selector: 'app-dentist',
  imports: [RouterModule, ScheduleComponent],
  templateUrl: './dentist.component.html',
  styleUrl: './dentist.component.css'
})
export class DentistComponent {

}
