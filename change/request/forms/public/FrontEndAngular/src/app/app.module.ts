import { BrowserModule, Title } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { HomeComponent } from './layouts/home/home.component';
import { AuthComponent } from './layouts/auth/auth.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { MatToolbarModule } from '@angular/material/toolbar';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTabsModule } from '@angular/material/tabs';
import { MatListModule } from '@angular/material/list';
import { MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import { MatProgressBarModule} from '@angular/material/progress-bar';
import { CustommaterialsModule } from './custommaterials/custommaterials.module';
import { HttpinterceptorService } from './shared/services/httpinterceptor.service';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    AuthComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MatCardModule,
    MatIconModule,
    MatProgressSpinnerModule,
    FlexLayoutModule,
    NgbModule,
    HttpClientModule,
    MatProgressBarModule,
    MatMenuModule,
    MatSnackBarModule,
    MatFormFieldModule,
    MatTabsModule,
    CustommaterialsModule
  ],
  providers: [{provide: HTTP_INTERCEPTORS, useClass: HttpinterceptorService, multi: true }, Title],
  bootstrap: [AppComponent]
})
export class AppModule { }
