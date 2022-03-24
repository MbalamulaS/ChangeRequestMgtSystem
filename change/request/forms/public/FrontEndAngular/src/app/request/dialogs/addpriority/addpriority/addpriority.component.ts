import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AdduserComponent } from 'src/app/authentication/dialogs/register/adduser.component';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { RequestService } from 'src/app/request/services/request.service';
@Component({
  selector: 'me-addpriority',
  templateUrl: './addpriority.component.html',
  styleUrls: ['./addpriority.component.scss']
})
export class AddpriorityComponent implements OnInit {

  constructor(public matDialogRef: MatDialogRef<AdduserComponent>, private router: Router, public sharedService: SharedserviceService, private requestService: RequestService,) { }
  priorityForm!: FormGroup;

  ngOnInit(): void {
    //Form Validation
    this.priorityForm = new FormGroup({
      priority_name: new FormControl(null,[Validators.required]),
    });
  }

  onSubmit(){
    let date = new Date().toLocaleString();
    var formdata = new FormData();
    formdata.append("priority_name", this.priorityForm.value.priority_name);
    
      this.sharedService.isLoading.next(true);
      this.requestService.addPriority(formdata).subscribe(result=>{
        this.sharedService.isLoading.next(false);
        console.log(result);
        if(result.data != null){
          this.sharedService.openSnackBar("Priority successifully added!")
          //this.router.navigate(['/cms']);
          this.matDialogRef.close();
        }
        else{
          this.sharedService.openFailureSnackBar("Priority not added!")
        }

      },errorResponse=>{
        console.log("Error: "+ errorResponse)
      });
    
  }

  onClose(){
    this.matDialogRef.close();
  }

 

}
