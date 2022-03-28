import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit, Optional } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AuthServiceService } from '../../services/auth-service.service';

@Component({
  selector: 'me-updaterole',
  templateUrl: './updaterole.component.html',
  styleUrls: ['./updaterole.component.scss']
})
export class UpdateroleComponent implements OnInit {

  constructor(@Optional() @Inject(MAT_DIALOG_DATA) public data: any, public matDialogRef: MatDialogRef< UpdateroleComponent>, private router: Router, public sharedService: SharedserviceService, private authService: AuthServiceService) { }

  RoleForm!: FormGroup;

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
    this.RoleForm = new FormGroup({
      
      role_title: new FormControl(this.data.row.role_title,[Validators.required,Validators.minLength(1)])
     

    });
  }

  onSubmit(){
    var formdata = new FormData();

    //this.LeaderForm.value.name
   
    //formdata.append("role_title", this.RoleForm.value.role_title);
    formdata.append("role_title", "Administrator");
    formdata.append("status", "true");
    formdata.append("created_at", "2021-12-12");
   
    
      this.sharedService.isLoading.next(true);
      this.authService.updateRoleById(this.record_id,formdata).subscribe(result=>{
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
