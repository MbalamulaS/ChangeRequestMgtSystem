import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, throwError, Observable } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { SharedserviceService } from './sharedservice.service';

@Injectable({
  providedIn: 'root'
})
export class RolepermissionService {

  constructor(private httpClient: HttpClient, public sharedService: SharedserviceService) { }
  //role permission array
  userrolepermission: BehaviorSubject<any[]> = new BehaviorSubject(null);

  //checklist progress level
  progress_level: BehaviorSubject<any> = new BehaviorSubject(null);


  private handleError(errorResponse: HttpErrorResponse){
    return throwError(errorResponse.error); 
  }

  getpermissionsByRoleId(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/rolespermissions?role_id='+id).pipe(catchError(this.handleError));;
  }

  getuserrolepermission(role_id:any){
    this.sharedService.isLoading.next(true);
    this.getpermissionsByRoleId(role_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);

      this.userrolepermission.next(result.data);

      //console.log(this.userrolepermission.value);

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }

  
}
