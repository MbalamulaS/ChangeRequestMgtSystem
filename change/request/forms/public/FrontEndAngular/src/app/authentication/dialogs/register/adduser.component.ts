import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AuthServiceService } from '../../services/auth-service.service';

@Component({
  selector: 'me-adduser',
  templateUrl: './adduser.component.html',
  styleUrls: ['./adduser.component.scss']
})
export class AdduserComponent implements OnInit {

 
  constructor(public matDialogRef: MatDialogRef<AdduserComponent>, private router: Router, public sharedService: SharedserviceService, private authService: AuthServiceService) { }
  RegisterForm!: FormGroup;
  institutions: any [] = [];
  roles: any [] = [];

  ngOnInit(): void {
    this.getInstitutions();
    this.getRoles();
    //Form Validation
    this.RegisterForm = new FormGroup({
      email: new FormControl(null,[Validators.required, Validators.email]),
      name: new FormControl(null,[Validators.required]),
      institution: new FormControl(null,[Validators.required,Validators.minLength(1)]),
      role: new FormControl(null,[Validators.required,Validators.minLength(1)]),
      password: new FormControl(null,[Validators.required]),
      password2: new FormControl(null,[Validators.required])

    });
  }

  onSubmit(){
    var formdata = new FormData();
    formdata.append("name", this.RegisterForm.value.name);
    formdata.append("email", this.RegisterForm.value.email);
    formdata.append("password", this.RegisterForm.value.password);
    formdata.append("institution_id", this.RegisterForm.value.institution);
    formdata.append("role_id", this.RegisterForm.value.role);
    formdata.append("status", "true");
    if(this.RegisterForm.value.password != this.RegisterForm.value.password2){
      this.sharedService.openFailureSnackBar("Password must match!")
    }
    else{
      this.sharedService.isLoading.next(true);
      this.authService.registerUser(formdata).subscribe(result=>{
        this.sharedService.isLoading.next(false);
        //console.log(result);
        if(result.status == "success"){
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
  }

  onClose(){
    this.matDialogRef.close();
  }

  getInstitutions(){
    this.sharedService.isLoading.next(true);
    this.authService.getInstitutions().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.institutions = result.data;
    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

  getRoles(){
    this.sharedService.isLoading.next(true);
    this.authService.getRoles().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.roles = result.data;
    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }
  

}
