import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { RequestService } from '../../services/request.service';


@Component({
  selector: 'me-addrequest',
  templateUrl: './addrequest.component.html',
  styleUrls: ['./addrequest.component.scss']
})
export class AddrequestComponent implements OnInit {



 
  constructor(public matDialogRef: MatDialogRef<AddrequestComponent>, private router: Router, public sharedService: SharedserviceService, private authService: RequestService) { }
  RequestForm!: FormGroup;
  institutions: any [] = [];
  mnrtsystems: any [] = [];
  categories: any [] = [];
  priorities: any [] = [];
  roles: any [] = [];

  ngOnInit(): void {
    this.getInstitutions();
    this.getProjects();
    this.getRequestcategories();
    this.getPriorities();
    this.getRoles();
    //Form Validation
    this.RequestForm = new FormGroup({
      mnrtsystem: new FormControl(null,[Validators.required]),
      category: new FormControl(null,[Validators.required]),
      description: new FormControl(null,[Validators.required]),
      priority: new FormControl(null,[Validators.required]),
      institution: new FormControl(null,[Validators.required]),
      deadline: new FormControl(null,[Validators.required]),
      reason: new FormControl(null,[Validators.required]),

    });
  }

  onSubmit(){
    let date = new Date().toLocaleString();
    var formdata = new FormData();
    
    formdata.append("mnrtsystem_id", this.RequestForm.value.mnrtsystem);
    formdata.append("request_type", this.RequestForm.value.category);
    formdata.append("request_desc", this.RequestForm.value.description);
    formdata.append("institution_id", this.RequestForm.value.institution);
    formdata.append("priority", this.RequestForm.value.priority);
    formdata.append("deadline", this.RequestForm.value.deadline.year+'-'+this.RequestForm.value.deadline.month+'-'+this.RequestForm.value.deadline.day);
    formdata.append("reason", this.RequestForm.value.reason);
    formdata.append("status", "true");
   
      this.sharedService.isLoading.next(true);
      this.authService.registerUser(formdata).subscribe(result=>{
        this.sharedService.isLoading.next(false);
        //console.log(result);
        if(result.status == "success"){
          this.sharedService.openSnackBar("Data saved successifully!")
          //this.router.navigate(['/cms']);
          this.matDialogRef.close();
        }
        else{
          this.sharedService.openFailureSnackBar("Request not sent!")
        }

      },errorResponse=>{
        console.log("Error: "+ errorResponse)
      });
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

  getProjects(){
    this.sharedService.isLoading.next(true);
    this.authService.getProjects().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.mnrtsystems = result.data;
    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

  getRequestcategories(){
    this.sharedService.isLoading.next(true);
    this.authService.getRequestcategories().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.categories = result.data;
    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

  getPriorities(){
    this.sharedService.isLoading.next(true);
    this.authService.getPriorities().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.priorities = result.data;
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
