import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { MatSnackBar, MatSnackBarHorizontalPosition, MatSnackBarVerticalPosition } from '@angular/material/snack-bar';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SharedserviceService {

  public isLoading: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
  horizontalPosition: MatSnackBarHorizontalPosition = 'right';
  verticalPosition: MatSnackBarVerticalPosition = 'top';

  constructor(private snackBar: MatSnackBar, private httpClient: HttpClient) { }

  private handleError(errorResponse: HttpErrorResponse){
    return throwError(errorResponse.error);
  }

  //Success snark
  openSnackBar(message: string) {
    this.snackBar.open(message, 'close', {
      duration: 5000,
      panelClass: ['successSnarkBar'],
      horizontalPosition: this.horizontalPosition,
      verticalPosition: this.verticalPosition,
    });
  }

  //Failure snark
  openFailureSnackBar(message: string) {
    this.snackBar.open(message, 'close', {
      duration: 5000,
      panelClass: ['failureSnarkBar'],
      horizontalPosition: this.horizontalPosition,
      verticalPosition: this.verticalPosition,
    });
  }

  getactivitiesByInstID(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/viewactivity?institution_id='+id).pipe(catchError(this.handleError));;
  }



  getContractsByInstID(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/view-contract?instituion_id='+id).pipe(catchError(this.handleError));;
  }

  getMilestones(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/milestones').pipe(catchError(this.handleError));;
  }

  getProgressMilestoneByActId(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/view-activity-prog-mile?activity_id='+id).pipe(catchError(this.handleError));;
  }

  getProgressMilestoneByInstitution_Id(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/view-activity-progress-milestone?institution_id='+id).pipe(catchError(this.handleError));;
  }

  getDisbursementMilestoneByActId(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/view-funddisbursement-milestone?activity_id='+id).pipe(catchError(this.handleError));;
  }

  getUsers(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/users').pipe(catchError(this.handleError));
  }

  getInstitutions(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/institutions').pipe(catchError(this.handleError));
  }

  getSystemsList(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/mnrtsystems').pipe(catchError(this.handleError));
  }

  getRequestList(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/request').pipe(catchError(this.handleError));
  }

  getRoles(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/roles').pipe(catchError(this.handleError));
  }

}
