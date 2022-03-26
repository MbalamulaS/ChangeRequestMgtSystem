import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AuthenticationRoutingModule } from './authentication-routing.module';
import { LoginComponent } from './pages/login/login.component';
import { RegisterComponent } from './pages/register/register.component';
import { CustommaterialsModule } from '../custommaterials/custommaterials.module';
import { AdduserComponent } from './dialogs/register/adduser.component';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { ForgotpasswordComponent } from './dialogs/forgotpassword/forgotpassword.component';
import { ResetpasswordComponent } from './pages/resetpassword/resetpassword.component';
import { UserprofileComponent } from './dialogs/userprofile/userprofile.component';
import { RolesandpermissionsComponent } from './pages/rolesandpermissions/rolesandpermissions.component';
import { AddRoleComponent } from './dialogs/roles/add-role.component';
import { DeleteroleComponent } from './dialogs/deleterole/deleterole.component';
import { UpdateroleComponent } from './dialogs/updaterole/updaterole.component';
import { DeleteuserComponent } from './dialogs/deleteuser/deleteuser.component';
import { UpdatepasswordComponent } from './dialogs/updatepassword/updatepassword.component';
//import { RolesComponent } from './pages/roles/roles.component';
//import { AddRoleComponent } from './dialogs/roles/add-role.component';
//import { DeleteroleComponent } from './dialogs/deleterole/deleterole.component';


@NgModule({
  declarations: [
    LoginComponent,
    RegisterComponent,
    AdduserComponent,
    ForgotpasswordComponent,
    ResetpasswordComponent,
    UserprofileComponent,
    RolesandpermissionsComponent,
    UserprofileComponent,
    AddRoleComponent,
    DeleteroleComponent,
    UpdateroleComponent,
    DeleteuserComponent,
    UpdatepasswordComponent
    //RolesComponent,
    //AddRoleComponent,
   // DeleteroleComponent
  ],
  imports: [
    CommonModule,
    AuthenticationRoutingModule,
    CustommaterialsModule,
    MatProgressBarModule
  ]
})
export class AuthenticationModule { }
