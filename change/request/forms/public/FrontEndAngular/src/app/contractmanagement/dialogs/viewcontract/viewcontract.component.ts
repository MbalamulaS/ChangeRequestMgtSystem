import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { ContractService } from '../../services/contract.service';

@Component({
  selector: 'me-viewcontract',
  templateUrl: './viewcontract.component.html',
  styleUrls: ['./viewcontract.component.scss']
})
export class ViewcontractComponent implements OnInit {

  constructor(@Inject(MAT_DIALOG_DATA) public data:any,  public matDialogRef: MatDialogRef<ViewcontractComponent>,public sharedService: SharedserviceService, private contractService: ContractService) { }
  Form!: FormGroup;
  attachedFiles:any[] = [];
  activity_id: any = null;
  contract_amount: any = null;
  contract_type: any = null;
  contract_title: any = null;
  contract_category_name: any = null;
  contract_quantity: any = null;
  contract_unit: any = null;
  contractor_name: any = null;
  contract_stage: any = null;
  advanced_payment: any = null;
  signed_date: any = null;
  commencement_date: any = null;
  completion_date: any = null;
  contract_types:any = ['Goods','Works','Consultance','Non Consultance'];


  ngOnInit(): void {

    console.log(this.data.contract)
    
    //get files
    this.getContractFilesByActID(this.data.activity_id);


    //get data
    this.contract_amount = this.data.contract[0].contract_amount;
    this.contract_type = this.data.contract[0].contract_type;
    this.contract_stage = this.data.contract[0].contract_stage;
    this.contract_title = this.data.contract[0].contract_title;
    this.contract_category_name = this.data.contract[0].contractcategory.category_name;
    this.contract_quantity = this.data.contract[0].contract_quantity;
    this.contract_unit = this.data.contract[0].contract_unit;
    this.contractor_name = this.data.contract[0].contractor.contractor_name;
    this.advanced_payment = this.data.contract[0].advanced_payment;
    this.signed_date = this.data.contract[0].signed_date;
    this.commencement_date = this.data.contract[0].commencement_date;
    this.completion_date = this.data.contract[0].completion_date;

  }

  onClose(){
    this.matDialogRef.close();
  }


  getContractFilesByActID(id:any){
    this.sharedService.isLoading.next(true);
    this.contractService.getContractFilesByActID(id).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      
      //console.log(result.data);
      this.attachedFiles = result.data;
      
  
    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  
  }



}
