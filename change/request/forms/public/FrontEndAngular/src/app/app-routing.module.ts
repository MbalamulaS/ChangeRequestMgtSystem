import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { pathToFileURL } from 'url';
import { HomeComponent } from './layouts/home/home.component';


const routes: Routes = [
  {
    path:'',
    loadChildren: () => import('./authentication/authentication.module').then((module) => module.AuthenticationModule)
  },
  {
    path:'',
    component:HomeComponent,
    children:[
      {
        path:'dashboard',
        loadChildren: () => import('./home/home.module').then((module) => module.HomeModule)
      },
      {
        path:'user',
        loadChildren: () => import('./authentication/authentication.module').then((module) => module.AuthenticationModule)
      },       
          
      {
        path:'requesting',
        loadChildren: () => import('./request/request.module').then((module) => module.RequestModule)
      },
    ]
  }
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
