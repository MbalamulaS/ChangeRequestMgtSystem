import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AdduserComponent } from 'src/app/authentication/dialogs/register/adduser.component';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { RequestService } from 'src/app/request/services/request.service';

@Component({
  selector: 'me-addmnrtsystem',
  templateUrl: './addmnrtsystem.component.html',
  styleUrls: ['./addmnrtsystem.component.scss']
})
export class AddmnrtsystemComponent implements OnInit {
 
  constructor(public matDialogRef: MatDialogRef<AdduserComponent>, private router: Router, public sharedService: SharedserviceService, private requestService: RequestService,) { }
  mnrtsystemForm!: FormGroup;

  ngOnInit(): void {
    //Form Validation
    this.mnrtsystemForm = new FormGroup({
      mnrtsystem_name: new FormControl(null,[Validators.required]),
    });
  }

  onSubmit(){
    let date = new Date().toLocaleString();
    var formdata = new FormData();
    formdata.append("mnrtsystem_name", this.mnrtsystemForm.value.mnrtsystem_name);
    
      this.sharedService.isLoading.next(true);
      this.requestService.addMnrtsystem(formdata).subscribe(result=>{
        this.sharedService.isLoading.next(false);
        console.log(result);
        if(result.data != null){
          this.sharedService.openSnackBar("Project successifully added!")
          //this.router.navigate(['/cms']);
          this.matDialogRef.close();
        }
        else{
          this.sharedService.openFailureSnackBar("Project not added!")
        }

      },errorResponse=>{
        console.log("Error: "+ errorResponse)
      });
    
  }

  onClose(){
    this.matDialogRef.close();
  }

 

}
