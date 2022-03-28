import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatSortModule } from '@angular/material/sort';
import { MatTableModule } from '@angular/material/table';
import { MatTabsModule} from '@angular/material/tabs';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { MatExpansionModule} from '@angular/material/expansion';
import { MatBadgeModule} from '@angular/material/badge';
import { MatStepperModule} from '@angular/material/stepper';
import { DragDropModule} from '@angular/cdk/drag-drop';
import { NgxChartsModule } from '@swimlane/ngx-charts';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatRadioModule} from '@angular/material/radio';
import { MatDatepickerModule} from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import {MatGridListModule} from '@angular/material/grid-list'; 
import {MatSelectModule} from '@angular/material/select'; 

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    MatPaginatorModule,
    MatSortModule,
    MatFormFieldModule,
    FormsModule,
    ReactiveFormsModule,
    MatCardModule,
    MatTableModule,
    MatIconModule,
    MatSnackBarModule,
    MatDialogModule,
    MatMenuModule,
    MatTabsModule,
    NgbModule,
    MatExpansionModule,
    MatBadgeModule,
    MatStepperModule,
    DragDropModule,
    MatRadioModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatGridListModule,
    MatSelectModule
  ],
  exports: [
    MatPaginatorModule,
    MatSortModule,
    MatFormFieldModule,
    FormsModule,
    ReactiveFormsModule,
    MatCardModule,
    MatTableModule,
    MatIconModule,
    MatSnackBarModule,
    MatDialogModule,
    MatMenuModule,
    MatTabsModule,
    NgbModule,
    MatExpansionModule,
    MatBadgeModule,
    MatStepperModule,
    DragDropModule,
    MatDatepickerModule,
    MatRadioModule,
    MatNativeDateModule,
    MatGridListModule,
    MatSelectModule
  ]
})
export class CustommaterialsModule { }
