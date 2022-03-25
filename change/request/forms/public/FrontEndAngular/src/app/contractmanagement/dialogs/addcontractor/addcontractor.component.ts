import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { ContractService } from '../../services/contract.service';

@Component({
  selector: 'me-addcontractor',
  templateUrl: './addcontractor.component.html',
  styleUrls: ['./addcontractor.component.scss']
})
export class AddcontractorComponent implements OnInit {

  constructor( public matDialogRef: MatDialogRef<AddcontractorComponent>,public sharedService: SharedserviceService, private contractService: ContractService) { }
  Form!: FormGroup;

  ngOnInit(): void {
    //Form Validation
    this.Form = new FormGroup({
      contractor_name: new FormControl(null,[Validators.required]),
      contractor_address: new FormControl(null,[Validators.required]),
      contractor_phone: new FormControl(null,[Validators.required]),
      contractor_email: new FormControl(null,[Validators.email, Validators.required]),
    });
  }

  onClose(){
    this.matDialogRef.close();
  }

  onSubmit(){
    var formdata = new FormData();
    formdata.append("contractor_name", this.Form.value.contractor_name);
    formdata.append("contractor_address", this.Form.value.contractor_address);
    formdata.append("contractor_phone", this.Form.value.contractor_phone);
    formdata.append("contractor_email", this.Form.value.contractor_email);
    formdata.append("status", "1");
    formdata.append("created_by", localStorage.getItem("user"));

    this.sharedService.isLoading.next(true);
    this.contractService.addContractor(formdata).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      //console.log(result.data);
      
      if(result.data != null){
        this.sharedService.openSnackBar("Saved successfully!");
      }
      else{
        this.sharedService.openFailureSnackBar("Not Saved!")
      }
      this.matDialogRef.close();
    },errorResponse=>{
      this.matDialogRef.close();
      console.log("Error: "+ errorResponse);
    });

  }

}
