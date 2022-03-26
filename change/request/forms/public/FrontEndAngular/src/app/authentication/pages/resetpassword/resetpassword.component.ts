import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AuthServiceService } from '../../services/auth-service.service';


@Component({
  selector: 'me-resetpassword',
  templateUrl: './resetpassword.component.html',
  styleUrls: ['./resetpassword.component.scss']
})
export class ResetpasswordComponent implements OnInit {

  
  constructor(public sharedService: SharedserviceService, private authService: AuthServiceService, private router: Router, private dialog: MatDialog,private route: ActivatedRoute) { }
  Form!: FormGroup;
  token: any;
  

  ngOnInit(): void {
    //get parameter link
    this.route.queryParams
    .subscribe(params => {
      console.log(params); 
      this.token = params.token;
      console.log(this.token); 
    }
  );

    //Form Validation
    this.Form = new FormGroup({
      password: new FormControl(null,[Validators.required]),
      password2: new FormControl(null,[Validators.required]),
    });

  }

  onSubmit(){

    if(this.Form.value.password == this.Form.value.password2){
    var formdata = new FormData();
    formdata.append("token", this.token);
    formdata.append("password", this.Form.value.password);
    formdata.append("email", localStorage.getItem("resetmail"));

    this.sharedService.isLoading.next(true);
    this.authService.updatePassword(formdata).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      console.log(result.token);

      if(result.status == "Success"){

        this.sharedService.openSnackBar("Password updated successfully!")
        localStorage.removeItem("resetmail");
        this.router.navigate(['/login']);
        
      }
      else{
        this.sharedService.openFailureSnackBar("Token failure, kindly send another request!")
      }

    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });

  }
  else{
    this.sharedService.openFailureSnackBar("Password does not match!");
  }

  }


}
