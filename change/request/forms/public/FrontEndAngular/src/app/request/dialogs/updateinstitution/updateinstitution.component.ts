import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit, Optional } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { RequestService } from '../../services/request.service';

@Component({
  selector: 'me-updateinstitution',
  templateUrl: './updateinstitution.component.html',
  styleUrls: ['./updateinstitution.component.scss']
})
export class UpdateinstitutionComponent implements OnInit {

  
  constructor(@Optional() @Inject(MAT_DIALOG_DATA) public data: any, public matDialogRef: MatDialogRef<UpdateinstitutionComponent>, private router: Router, public sharedService: SharedserviceService, private requestService: RequestService ) { 
    
  }

  instForm!: FormGroup;

  record_id: any = null;

  user:any = "default";

  ngOnInit(): void {
    //Get current data
    console.log(this.data.row);
    //Get record id
    this.user = localStorage.getItem('user');
    
    this.record_id = this.data.row.id;
    //this.getInstitutions();
    //this.getRoles();
    //Form Validation
    this.instForm = new FormGroup({
      
      inst_name: new FormControl(this.data.row.inst_name,[Validators.required,Validators.minLength(1)]),
      vote_code: new FormControl(this.data.row.vote_code,[Validators.required,Validators.minLength(1)]),
      sub_vote_no: new FormControl(this.data.row.sub_vote_no,[Validators.required,Validators.minLength(1)]),
      vote_name: new FormControl(this.data.row.vote_name,[Validators.required,Validators.minLength(1)]),
      sub_vote_name: new FormControl(this.data.row.sub_vote_name,[Validators.required,Validators.minLength(1)])

    });
  }


  onSubmit(){
    let date = new Date().toLocaleString();
    var formdata = new FormData();
    //var jina=this.instForm.value.inst_name;
    formdata.append("inst_name", this.instForm.value.inst_name);
    formdata.append("vote_code", this.instForm.value.vote_code);
    formdata.append("vote_name", this.instForm.value.vote_name);
    formdata.append("sub_vote_no", this.instForm.value.sub_vote_no);
    formdata.append("sub_vote_name", this.instForm.value.sub_vote_name);
    formdata.append("updated_at", date);
    formdata.append("updated_by", this.user);
    formdata.append("status", "true");
    //console.log("Submitted data!!!!! "+ formdata)
    //console.log("Submitted data!!!!! "+ jina)
   
    
      this.sharedService.isLoading.next(true);
      this.requestService.updateInstitutionById(this.record_id,formdata).subscribe(result=>{
        this.sharedService.isLoading.next(false);
        //console.log(result);
        if(result.status == "201 Created"){
          this.sharedService.openSnackBar("Successifully registered!")
          //this.router.navigate(['/cms']);
          this.matDialogRef.close();
        }
        else{
          this.sharedService.openFailureSnackBar("Unable to register!")
        }

      },errorResponse=>{
        console.log("Error: "+ errorResponse)
      });
    
  }

  onClose(){
    this.matDialogRef.close();
  }


}
