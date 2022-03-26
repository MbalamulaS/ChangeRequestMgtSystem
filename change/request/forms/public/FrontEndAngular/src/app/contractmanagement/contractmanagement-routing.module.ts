import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ContractorsComponent } from './pages/contractors/contractors.component';
import { ReportcontractComponent } from './pages/reportcontract/reportcontract.component';
import { ViewallcontractsComponent } from './pages/viewallcontracts/viewallcontracts.component';

const routes: Routes = [
  {
    path:'reportcontract',
    component: ReportcontractComponent
  },
  {
    path:'viewcontract',
    component: ViewallcontractsComponent
  },
  {
    path:'contractors',
    component: ContractorsComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ContractmanagementRoutingModule { }
