import { Component } from '@angular/core';
import { LoginService } from '../../service/login.service';

@Component({
  selector: 'app-login',
  imports: [],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {

    constructor( private loginService: LoginService){}
}
