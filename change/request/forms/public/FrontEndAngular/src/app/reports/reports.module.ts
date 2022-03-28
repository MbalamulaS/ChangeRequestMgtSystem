import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ReportsRoutingModule } from './reports-routing.module';
import { LogsComponent } from './requestlogs/logs/logs.component';
import { CustommaterialsModule } from '../custommaterials/custommaterials.module';


@NgModule({
  declarations: [
    LogsComponent
  ],
  imports: [
    CommonModule,
    ReportsRoutingModule,
    CustommaterialsModule
  ]
})
export class ReportsModule { }
