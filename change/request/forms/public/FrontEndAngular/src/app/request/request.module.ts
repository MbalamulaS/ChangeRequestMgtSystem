import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RequestRoutingModule } from './request-routing.module';
import { CustommaterialsModule } from '../custommaterials/custommaterials.module';
import { ApprovalComponent } from './pages/approval/approval.component';
import { RequestComponent } from './pages/request/request.component';
import { AddrequestComponent } from './dialogs/addrequest/addrequest.component';
import { UpdaterequestComponent } from './dialogs/updaterequest/updaterequest.component';
import { DeleterequestComponent } from './dialogs/deleterequest/deleterequest.component';
import { MnrtsystemComponent } from './pages/mnrtsystem/mnrtsystem.component';
import { PriorityComponent } from './pages/priority/priority.component';
import { AddmnrtsystemComponent } from './dialogs/addmnrtsystem/addmnrtsystem/addmnrtsystem.component';
import { DeletemnrtsystemComponent } from './dialogs/deletemnrtsystem/deletemnrtsystem/deletemnrtsystem.component';
import { UpdatemnrtsystemComponent } from './dialogs/updatemnrtsystem/updatemnrtsystem/updatemnrtsystem.component';
import { AddpriorityComponent } from './dialogs/addpriority/addpriority/addpriority.component';
import { UpdatepriorityComponent } from './dialogs/updatepriority/updatepriority/updatepriority.component';
import { DeletepriorityComponent } from './dialogs/deletepriority/deletepriority/deletepriority.component';
import { InstitutionsComponent } from './pages/institutions/institutions.component';
import { AddinstitutionComponent } from './dialogs/addinstitution/addinstitution.component';
import { DeleteinstitutionComponent } from './dialogs/deleteinstitution/deleteinstitution.component';
import { UpdateinstitutionComponent } from './dialogs/updateinstitution/updateinstitution.component';


@NgModule({
  declarations: [
    ApprovalComponent,
    RequestComponent,
    AddrequestComponent,
    UpdaterequestComponent,
    DeleterequestComponent,
    MnrtsystemComponent,
    PriorityComponent,
    AddmnrtsystemComponent,
    DeletemnrtsystemComponent,
    UpdatemnrtsystemComponent,
    AddpriorityComponent,
    UpdatepriorityComponent,
    DeletepriorityComponent,
    InstitutionsComponent,
    AddinstitutionComponent,
    DeleteinstitutionComponent,
    UpdateinstitutionComponent
  ],
  imports: [
    CommonModule,
    RequestRoutingModule,
    CustommaterialsModule
  ]
})
export class RequestModule { }
