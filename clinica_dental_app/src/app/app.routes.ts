import { Routes } from '@angular/router';
import { DentistComponent } from './pages/dentist/dentist.component';
import { HomeComponent } from './pages/home/home.component';
import { AppointmentsComponent } from './pages/dentist/appointments/appointments.component';
import { ScheduleComponent } from './pages/dentist/schedule/schedule.component';
import { ProfileComponent } from './pages/dentist/profile/profile.component';

export const routes: Routes = [
  //Ruta por defecto, home
  {
    path: '',
    component: HomeComponent,
  },
  {
    path: 'login',
    component: DentistComponent,
    children: [
      { path: '', redirectTo: 'miscitas', pathMatch: 'full' }, // por defecto: mis citas
      { path: 'miscitas', component: AppointmentsComponent },
      { path: 'availabilities', component: ScheduleComponent },
      { path: 'perfil', component: ProfileComponent },
    ]
  }
];
