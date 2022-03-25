import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { ContractService } from '../../services/contract.service';

@Component({
  selector: 'me-updatecontractstage',
  templateUrl: './updatecontractstage.component.html',
  styleUrls: ['./updatecontractstage.component.scss']
})
export class UpdatecontractstageComponent implements OnInit {

  constructor(@Inject(MAT_DIALOG_DATA) public data:any,  public matDialogRef: MatDialogRef<UpdatecontractstageComponent>,public sharedService: SharedserviceService, private contractService: ContractService) { }
  Form!: FormGroup;
  current_contract_stage: any = null;
  contract_id: any = null;
  contract_stages: any =['Not-started','On-going','Completed'];

  ngOnInit(): void {
    console.log(this.data.contract);
    this.current_contract_stage = this.data.contract[0].contract_stage;
    this.contract_id = this.data.contract[0].id;

    //Form Validation
    this.Form = new FormGroup({
      contract_stage: new FormControl(null,[Validators.required]),
    });
  }

  onClose(){
    this.matDialogRef.close();
  }

  onSubmit(){
    var formdata = new FormData();
    formdata.append("contract_stage", this.Form.value.contract_stage);

    this.sharedService.isLoading.next(true);
    this.contractService.updateContractStage(this.contract_id,formdata).subscribe(result=>{
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
      console.log("Error: "+ errorResponse);
    });

  }

}
