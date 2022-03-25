import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AuthServiceService } from '../../services/auth-service.service';

@Component({
  selector: 'me-add-role',
  templateUrl: './add-role.component.html',
  styleUrls: ['./add-role.component.scss']
})
export class AddRoleComponent implements OnInit {

  constructor(public matDialogRef: MatDialogRef<AddRoleComponent>, private router: Router, public sharedService: SharedserviceService, private authService: AuthServiceService) { }

  RoleForm!: FormGroup;
  
  ngOnInit(): void {
    //this.getInstitutions();
    //this.getRoles();
    //Form Validation
    this.RoleForm = new FormGroup({
      
      role_title: new FormControl(null,[Validators.required,Validators.minLength(1)])
     

    });
  }

  onSubmit(){
    let date = new Date().toLocaleString();
    var formdata = new FormData();
   
    formdata.append("role_title", this.RoleForm.value.role_title);
    formdata.append("status", "true");
    formdata.append("created_at", date);
   
    
      this.sharedService.isLoading.next(true);
      this.authService.registerRole(formdata).subscribe(result=>{
        this.sharedService.isLoading.next(false);
        console.log(result);
        if(result.data.title != null){
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
