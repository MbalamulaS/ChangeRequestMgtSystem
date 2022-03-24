import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AuthServiceService } from '../../services/auth-service.service';

@Component({
  selector: 'me-updatepassword',
  templateUrl: './updatepassword.component.html',
  styleUrls: ['./updatepassword.component.scss']
})
export class UpdatepasswordComponent implements OnInit {

  constructor(public matDialogRef: MatDialogRef<UpdatepasswordComponent>,public sharedService: SharedserviceService,private authService: AuthServiceService) { }
  ResetForm!: FormGroup;

  ngOnInit(): void {
    //Form Validation
    this.ResetForm = new FormGroup({
      oldpassword: new FormControl(null,[Validators.required]),
      password: new FormControl(null,[Validators.required]),
      password2: new FormControl(null,[Validators.required]),
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
      

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });

  }

}
