import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { ContractService } from '../../services/contract.service';
import { AddcontractComponent } from '../addcontract/addcontract.component';

@Component({
  selector: 'me-addcontractprogress',
  templateUrl: './addcontractprogress.component.html',
  styleUrls: ['./addcontractprogress.component.scss']
})
export class AddcontractprogressComponent implements OnInit {

  constructor(@Inject(MAT_DIALOG_DATA) public data:any,  public matDialogRef: MatDialogRef<AddcontractComponent>,public sharedService: SharedserviceService, private contractService: ContractService) { }
  Form!: FormGroup;
  attachedFiles:any[] = [];
  activity_id: any = null;
  contract_id: any = null;

  ngOnInit(): void {

    this.activity_id = this.data.activity_id;
    this.contract_id = this.data.contract_id;

    //Form Validation
    this.Form = new FormGroup({
      amount_disbursed: new FormControl(null,[Validators.required]),
      date_disbursed: new FormControl(null,[Validators.required]),
      remark: new FormControl(null),
    });
  }

  onClose(){
    this.matDialogRef.close();
  }

  onSubmit(){
    let date = new Date().toLocaleString();
    var formdata = new FormData();
    formdata.append("contract_id", this.contract_id);
    formdata.append("amount_disbursed", this.Form.value.amount_disbursed);
    formdata.append("date_disbursed", this.Form.value.date_disbursed.year+'-'+this.Form.value.date_disbursed.month+'-'+this.Form.value.date_disbursed.day);
    formdata.append("remark", this.Form.value.remark);
    formdata.append("created_by", localStorage.getItem("user_id"));
    formdata.append("status", "1");

    this.sharedService.isLoading.next(true);
    this.contractService.addContractProgress(formdata).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      //console.log(result.data);

      //save attachment
      this.attachFile();

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

  onFileSelected(event) {

    for (var i = 0; i < event.target.files.length; i++) { 
      this.attachedFiles.push(event.target.files[i]);
    }
    console.log(this.attachedFiles);
  }

onRemoveFile(index:any){
  this.attachedFiles.splice(index,1);
  //console.log(this.attachedFiles)
}

attachFile(){
  if(this.attachedFiles.length > 0){
    const formData = new FormData();

     for (var i = 0; i < this.attachedFiles.length; i++) { 
      formData.append("fileName[]", this.attachedFiles[i]);
    }


    this.sharedService.isLoading.next(true);
    this.contractService.addContractFiles(this.activity_id,formData).subscribe(result=>{
      this.sharedService.isLoading.next(false);

      //this.sharedService.openSnackBar("Files Uploaded");
      

    },errorResponse=>{
      this.matDialogRef.close();
      console.log("Error: "+ errorResponse);

    });
  }
}


}
