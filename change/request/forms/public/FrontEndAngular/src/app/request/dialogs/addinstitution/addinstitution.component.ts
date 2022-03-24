import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AdduserComponent } from 'src/app/authentication/dialogs/register/adduser.component';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { RequestService } from '../../services/request.service';

@Component({
  selector: 'me-addinstitution',
  templateUrl: './addinstitution.component.html',
  styleUrls: ['./addinstitution.component.scss']
})
export class AddinstitutionComponent implements OnInit {

  
 
  constructor(public matDialogRef: MatDialogRef<AdduserComponent>, private router: Router, public sharedService: SharedserviceService, private requestService: RequestService,) { }
  instForm!: FormGroup;

  ngOnInit(): void {
    //Form Validation
    this.instForm = new FormGroup({
      name: new FormControl(null,[Validators.required]),
      vote_code: new FormControl(null,[Validators.required]),
      vote_name: new FormControl(null,[Validators.required]),
      sub_vote_code: new FormControl(null,[Validators.required]),
      sub_vote_name: new FormControl(null,[Validators.required]),

    });
  }

  onSubmit(){
    let date = new Date().toLocaleString();
    var formdata = new FormData();
    formdata.append("inst_name", this.instForm.value.name);
    formdata.append("vote_code", this.instForm.value.vote_code);
    formdata.append("vote_name", this.instForm.value.vote_name);
    formdata.append("sub_vote_no", this.instForm.value.sub_vote_code);
    formdata.append("sub_vote_name", this.instForm.value.sub_vote_name);
    formdata.append("created_at", date);
    formdata.append("status", "true");
    
      this.sharedService.isLoading.next(true);
      this.requestService.addIntitutions(formdata).subscribe(result=>{
        this.sharedService.isLoading.next(false);
        console.log(result);
        if(result.data != null){
          this.sharedService.openSnackBar("Institution successifully added!")
          //this.router.navigate(['/cms']);
          this.matDialogRef.close();
        }
        else{
          this.sharedService.openFailureSnackBar("Institution not added!")
        }

      },errorResponse=>{
        console.log("Error: "+ errorResponse)
      });
    
  }

  onClose(){
    this.matDialogRef.close();
  }

 

}
