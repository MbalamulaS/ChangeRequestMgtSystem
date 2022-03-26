import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './pages/login/login.component';
import { RegisterComponent } from './pages/register/register.component';
import { ResetpasswordComponent } from './pages/resetpassword/resetpassword.component';
import { RolesandpermissionsComponent } from './pages/rolesandpermissions/rolesandpermissions.component';
//import { RolesComponent } from './pages/roles/roles.component';

const routes: Routes = [
  {
    path:'',
    component:LoginComponent
  },
  {
    path:'login',
    component:LoginComponent
  },
  {
    path:'register',
    component:RegisterComponent
  },
  {
    path:'resetpassword',
    component:ResetpasswordComponent
   },
  {
    path:'rolesandpermissions',
    component:RolesandpermissionsComponent
  }

  
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AuthenticationRoutingModule { }
