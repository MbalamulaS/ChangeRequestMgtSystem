import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AuthServiceService } from '../../services/auth-service.service';

@Component({
  selector: 'me-userprofile',
  templateUrl: './userprofile.component.html',
  styleUrls: ['./userprofile.component.scss']
})
export class UserprofileComponent implements OnInit {

  constructor(public matDialogRef: MatDialogRef<UserprofileComponent>, private router: Router, public sharedService: SharedserviceService, private authService: AuthServiceService) { }
  name: any;
  email: any;
  role: any;
  institution;
  
  ngOnInit(): void { 
    this.getUserById();
  }

  onClose(){
    this.matDialogRef.close();
  }

  getUserById(){
    this.sharedService.isLoading.next(true);
    this.authService.getUserById(localStorage.getItem('user_id')).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      console.log(result[0]);
      this.name = result[0].name;
      this.email = result[0].email;
      this.role = result[0].role_title;
      this.institution = result[0].inst_name;
    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

}
