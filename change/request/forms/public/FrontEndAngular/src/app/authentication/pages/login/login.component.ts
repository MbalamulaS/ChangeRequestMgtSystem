import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { ForgotpasswordComponent } from '../../dialogs/forgotpassword/forgotpassword.component';
import { AuthServiceService } from '../../services/auth-service.service';

@Component({
  selector: 'me-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  constructor(public sharedService: SharedserviceService, private authService: AuthServiceService, private router: Router, private dialog: MatDialog,) { }
  LoginForm!: FormGroup;

  ngOnInit(): void {
    //Form Validation
    this.LoginForm = new FormGroup({
      email: new FormControl(null,[Validators.required, Validators.email]),
      password: new FormControl(null,[Validators.required]),
     
    });
  }

  onLogin(){
    var formdata = new FormData();
    formdata.append("email", this.LoginForm.value.email);
    formdata.append("password", this.LoginForm.value.password);

    // formdata.append("email", "maro.emmanuel1@gmail.com");
    // formdata.append("password", "12345678");

    this.sharedService.isLoading.next(true);
    this.authService.userLogin(formdata).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      console.log(result.token);
      if(result.token != null){

        this.authService.saveUserData(result);
        this.router.navigate(['/dashboard']);
      }
      else{
        this.sharedService.openFailureSnackBar("Wrong email or password!")
      }

    },errorResponse=>{
      this.sharedService.isLoading.next(false);
      this.sharedService.openFailureSnackBar("Wrong email or password!")
      console.log("Error: "+ errorResponse)
    });

  }

  forgotPassword(){
    const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = false;
        dialogConfig.autoFocus = true;
        dialogConfig.width = "50%";
        //dialogConfig.height="90%";
    this.dialog.open(ForgotpasswordComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    
    });
  }

}
