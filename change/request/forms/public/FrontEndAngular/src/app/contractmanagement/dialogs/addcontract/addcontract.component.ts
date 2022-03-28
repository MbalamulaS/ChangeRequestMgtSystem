import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { ContractService } from '../../services/contract.service';

@Component({
  selector: 'me-addcontract',
  templateUrl: './addcontract.component.html',
  styleUrls: ['./addcontract.component.scss']
})
export class AddcontractComponent implements OnInit {

  constructor(@Inject(MAT_DIALOG_DATA) public data:any,  public matDialogRef: MatDialogRef<AddcontractComponent>,public sharedService: SharedserviceService, private contractService: ContractService) { }
  Form!: FormGroup;
  attachedFiles:any[] = [];
  contractors:any[] = [];
  contractCategories: any[] = [];
  activity_id: any = null;
  contract_types:any = ['Goods','Works','Consultancy','Non-Consultancy'];
  contract_stages: any =['Not-started','On-going','Completed'];


  ngOnInit(): void {

    this.activity_id = this.data.activity_id;

    //get contractors
    this.getContractors();

    //get contract categories
    this.getAllContractCategories();
    

    //Form Validation
    this.Form = new FormGroup({
      contract_type: new FormControl(null,[Validators.required]),
      title: new FormControl(null,[Validators.required]),
      contractor_id: new FormControl(null,[Validators.required]),
      contract_stage: new FormControl(null,[Validators.required]),
      contract_category_id: new FormControl(null,[Validators.required]),
      contract_quantity: new FormControl(null,[Validators.required]),
      contract_unit: new FormControl(null,[Validators.required]),
      contract_amount: new FormControl(null,[Validators.required]),
      advanced_payment: new FormControl(null,[Validators.required]),
      signed_date: new FormControl(null,[Validators.required]),
      commencement_date: new FormControl(null,[Validators.required]),
      completion_date: new FormControl(null,[Validators.required]),
    });
  }

  onClose(){
    this.matDialogRef.close();
  }

  onSubmit(){
    var formdata = new FormData();
    formdata.append("activity_id", this.activity_id);
    formdata.append("contract_type", this.Form.value.contract_type);
    formdata.append("contract_title", this.Form.value.title);
    formdata.append("contractor_id", this.Form.value.contractor_id);
    formdata.append("contract_stage", this.Form.value.contract_stage);
    formdata.append("contract_category_id", this.Form.value.contract_category_id);
    formdata.append("contract_quantity", this.Form.value.contract_quantity);
    formdata.append("contract_unit", this.Form.value.contract_unit);
    formdata.append("contract_amount", this.Form.value.contract_amount);
    formdata.append("advanced_payment", this.Form.value.advanced_payment);
    formdata.append("signed_date", this.Form.value.signed_date.year+'-'+this.Form.value.signed_date.month+'-'+this.Form.value.signed_date.day);
    formdata.append("commencement_date", this.Form.value.commencement_date.year+'-'+this.Form.value.commencement_date.month+'-'+this.Form.value.commencement_date.day);
    formdata.append("completion_date", this.Form.value.completion_date.year+'-'+this.Form.value.completion_date.month+'-'+this.Form.value.completion_date.day);
    formdata.append("status", "1");
    formdata.append("created_by", localStorage.getItem("user"));

    this.sharedService.isLoading.next(true);
    this.contractService.addContract(formdata).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      //console.log(result.data);

      //attach files
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

getContractors(){
  this.sharedService.isLoading.next(true);
  this.contractService.getAllContractors().subscribe(result=>{
  this.sharedService.isLoading.next(false);
    //console.log(result.data);
    this.contractors = result.data;

  },errorResponse=>{
    console.log("Error: "+ errorResponse)
  });
}

getAllContractCategories(){
  this.sharedService.isLoading.next(true);
  this.contractService.getAllContractCategories().subscribe(result=>{
  this.sharedService.isLoading.next(false);
    //console.log(result.data);
    this.contractCategories = result.data;

  },errorResponse=>{
    console.log("Error: "+ errorResponse)
  });
}

}
