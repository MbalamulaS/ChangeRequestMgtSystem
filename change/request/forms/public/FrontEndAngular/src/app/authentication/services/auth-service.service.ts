import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthServiceService {

  constructor(private httpClient: HttpClient, private router: Router) { }
  //Check if user login
  userinfo: BehaviorSubject<any> = new BehaviorSubject(false);

  private handleError(errorResponse: HttpErrorResponse){
    return throwError(errorResponse.error); 
  }


  getRegisteredUsers(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/users').pipe(catchError(this.handleError));
  }

  getRegisteredUsersByInstID(inst_id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/user?institution_id='+inst_id).pipe(catchError(this.handleError));
  }

  updatePassword(form: any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/update-password',form).pipe(catchError(this.handleError));;
  }
 
  registerUser(formdata: any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/register',formdata).pipe(catchError(this.handleError));;
  }

  registerRole(formdata: any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/insertRole',formdata).pipe(catchError(this.handleError));;
  }

  updateRoleById(id:any, formdata: any): Observable<any>{
    return this.httpClient.put(environment.baseURL+'api/updateRole/'+id, formdata).pipe(catchError(this.handleError));
  }


  userLogin(formdata: any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/login',formdata).pipe(catchError(this.handleError));;
  }
  
  getInstitutions(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/institutions').pipe(catchError(this.handleError));;
  }

  getRoles(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/roles').pipe(catchError(this.handleError));;
  }

  deleteroleById(id:any): Observable<any> { 
    return this.httpClient.delete(environment.baseURL + 'api/deleteRole/'+id).pipe(catchError(this.handleError));
  }

  getUserById(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/user/'+id).pipe(catchError(this.handleError));;
  }

  getallPermissions(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/permissions').pipe(catchError(this.handleError));;
  }

  getpermissionsByRoleId(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/rolespermissions?role_id='+id).pipe(catchError(this.handleError));;
  }

  addrolespermission(id:any,data: any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/insertdelete-rolepermission?role_id='+id,data,{headers:{"Content-Type":"application/json"}}).pipe(catchError(this.handleError));;
  }



  


  saveUserData(result:any){
    localStorage.setItem("token", result.token.original.token);
    localStorage.setItem("user_name", result.data.name);
    localStorage.setItem("user_id", result.data.id);
    localStorage.setItem("role_id", result.data.role_id);
    localStorage.setItem("institution_id", result.data.institution_id);

    const data = {
      token: result.token,
      user_name: result.data.name
    }

    this.userinfo.next(data);

  }

  //check if user is authenticated
  isAuthenticated(): boolean{
    let token = localStorage.getItem("token");
    if(token){
      return true;
    }
    else{
      return false;
    }
    
  }

  //logout
  logout() { 
    localStorage.removeItem('token');
    localStorage.removeItem('user_name');
    localStorage.removeItem('user_id');
    localStorage.removeItem('user_info');
    localStorage.removeItem("role_id");
    localStorage.removeItem("institution_id");
    //console.log('localstorage remove access_token...');rgb(92, 223, 136)
    this.router.navigate(['/login']);
  }

  passResetResquest(formdata: any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/req-password-reset',formdata).pipe(catchError(this.handleError));;
  }

}
