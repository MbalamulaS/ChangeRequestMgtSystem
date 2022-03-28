import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { LogsComponent } from './requestlogs/logs/logs.component';

const routes: Routes = [
  {path:'logs', component: LogsComponent},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReportsRoutingModule { }
