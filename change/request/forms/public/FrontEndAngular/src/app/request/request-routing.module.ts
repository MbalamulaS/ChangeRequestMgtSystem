import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { RequestComponent } from './pages/request/request.component';
import { ApprovalComponent } from './pages/approval/approval.component';
import { MnrtsystemComponent } from './pages/mnrtsystem/mnrtsystem.component';
import { PriorityComponent } from './pages/priority/priority.component';
import { InstitutionsComponent } from './pages/institutions/institutions.component';

const routes: Routes = [
  {path:'request', component: RequestComponent},
  {path: 'approval', component: ApprovalComponent},
  {path: 'mnrtsystem', component: MnrtsystemComponent},
  {path: 'priority', component: PriorityComponent},
  {path: 'institution', component: InstitutionsComponent},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RequestRoutingModule { }
