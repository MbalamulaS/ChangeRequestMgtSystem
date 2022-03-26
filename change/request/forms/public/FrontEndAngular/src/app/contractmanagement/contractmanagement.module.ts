import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ContractmanagementRoutingModule } from './contractmanagement-routing.module';
import { ReportcontractComponent } from './pages/reportcontract/reportcontract.component';
import { ViewcontractComponent } from './dialogs/viewcontract/viewcontract.component';
import { CustommaterialsModule } from '../custommaterials/custommaterials.module';
import { AddcontractComponent } from './dialogs/addcontract/addcontract.component';
import { AddcontractprogressComponent } from './dialogs/addcontractprogress/addcontractprogress.component';
import { ViewallcontractsComponent } from './pages/viewallcontracts/viewallcontracts.component';
import { ContractorsComponent } from './pages/contractors/contractors.component';
import { AddcontractorComponent } from './dialogs/addcontractor/addcontractor.component';
import { UpdatecontractstageComponent } from './dialogs/updatecontractstage/updatecontractstage.component';


@NgModule({
  declarations: [
    ReportcontractComponent,
    ViewcontractComponent,
    AddcontractComponent,
    AddcontractprogressComponent,
    ViewallcontractsComponent,
    ContractorsComponent,
    AddcontractorComponent,
    UpdatecontractstageComponent
  ],
  imports: [
    CommonModule,
    ContractmanagementRoutingModule,
    CustommaterialsModule
  ]
})
export class ContractmanagementModule { }
