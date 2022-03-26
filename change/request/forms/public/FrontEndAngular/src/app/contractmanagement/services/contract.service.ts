import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { throwError, Observable } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ContractService {

  constructor(private httpClient: HttpClient, public sharedService: SharedserviceService) { }


  private handleError(errorResponse: HttpErrorResponse){
    return throwError(errorResponse.error); 
  }

  getContractByActID(activity_id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/contractby?activity_id='+activity_id).pipe(catchError(this.handleError));
  }

  getContractProgressByContractID(contract_id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/contractprogressby?contract_id='+contract_id).pipe(catchError(this.handleError));
  }

  addContract(form:any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/insertContract',form).pipe(catchError(this.handleError));
  }

  addContractFiles(activity_id: any, form:any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/contractfile-uploads?activity_id='+activity_id,form).pipe(catchError(this.handleError));
  }

  addContractProgress(form:any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/insertContractProgress',form).pipe(catchError(this.handleError));
  }

  getContractFilesByActID(id:any): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/contract-attachment?activity_id='+id).pipe(catchError(this.handleError));
  }

  getAllContractors(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/contractors').pipe(catchError(this.handleError));
  }

  getAllContractCategories(): Observable <any>{
    return this.httpClient.get( environment.baseURL+'api/contractcategories').pipe(catchError(this.handleError));
  }

  updateContractStage(id:any,form:any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/update-contract-stage/'+id,form).pipe(catchError(this.handleError));
  }

  addContractor(form:any): Observable <any>{
    return this.httpClient.post( environment.baseURL+'api/insertContractor',form).pipe(catchError(this.handleError));
  }

  deleteContractor(id:any): Observable <any>{
    return this.httpClient.delete( environment.baseURL+'api/deleteContractor/'+id).pipe(catchError(this.handleError));
  }
  
}
