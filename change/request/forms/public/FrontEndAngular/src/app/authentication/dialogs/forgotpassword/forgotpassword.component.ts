import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AuthServiceService } from '../../services/auth-service.service';

@Component({
  selector: 'me-forgotpassword',
  templateUrl: './forgotpassword.component.html',
  styleUrls: ['./forgotpassword.component.scss']
})
export class ForgotpasswordComponent implements OnInit {

  constructor(public matDialogRef: MatDialogRef<ForgotpasswordComponent>,public sharedService: SharedserviceService,private authService: AuthServiceService) { }
  ResetForm!: FormGroup;
  emailSentStatus:boolean = false;
  emailExistStatus: boolean = false;
  hidesubmitbutton: boolean = false;

  ngOnInit(): void {
    //Form Validation
    this.ResetForm = new FormGroup({
      email: new FormControl(null,[Validators.required, Validators.email])
    });
  }

  onClose(){
    this.matDialogRef.close();
  }

  onSubmit(){
    var formdata = new FormData();
    formdata.append("email", this.ResetForm.value.email);

    this.sharedService.isLoading.next(true);
    this.authService.passResetResquest(formdata).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      console.log(result);
      if(result.status == "Success"){
        //this.sharedService.openSnackBar("Password reset mail has been sent!")
        this.emailExistStatus = false;
        this.emailSentStatus = true;
        localStorage.setItem("resetmail",this.ResetForm.value.email);
        this.hidesubmitbutton = true;
      }
      else{
        //this.sharedService.openFailureSnackBar("Email does not exist!")
        this.emailExistStatus = true;
        this.emailSentStatus = false;
        this.hidesubmitbutton = false;
      }

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
      this.sharedService.isLoading.next(false);
      this.emailExistStatus = true;
        this.emailSentStatus = false;
      
    });

  }

}
