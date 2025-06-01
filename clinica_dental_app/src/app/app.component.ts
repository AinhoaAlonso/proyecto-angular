import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CalendarioComponent } from './calendario/calendario.component';
import { NavigationComponent } from './pages/navigation/navigation.component';
import { DentistComponent } from './pages/dentist/dentist.component';
import { SlotsComponent } from './slots/slots.component';


@Component({
  selector: 'app-root',
  imports: [RouterOutlet, NavigationComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'clinica_dental_app';
}
