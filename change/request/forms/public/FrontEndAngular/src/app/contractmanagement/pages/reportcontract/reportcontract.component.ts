import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AddcontractComponent } from '../../dialogs/addcontract/addcontract.component';
import { AddcontractprogressComponent } from '../../dialogs/addcontractprogress/addcontractprogress.component';
import { UpdatecontractstageComponent } from '../../dialogs/updatecontractstage/updatecontractstage.component';
import { ViewcontractComponent } from '../../dialogs/viewcontract/viewcontract.component';
import { ContractService } from '../../services/contract.service';

@Component({
  selector: 'me-reportcontract',
  templateUrl: './reportcontract.component.html',
  styleUrls: ['./reportcontract.component.scss']
})
export class ReportcontractComponent implements OnInit {

  
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('table') leaderstable!: MatTable<any>;
  
  displayedColumns = ["sn","date_disbursed","amount_disbursed","remark"];

  constructor( private dialog: MatDialog, public sharedService: SharedserviceService, private contractService: ContractService) { }
  activities: any[] = [];
  milestones:any[] = [];
  contract_id: any = null;
  contract_title:any = null;
  contract_amount:any = null;
  signed_date:any = null;
  contract_type: any = null;
  contract_stage: any = null;
  contract:any[] = [];
  contractProgressArray = new MatTableDataSource<any>();

  ngOnInit(): void {
    this.getActivitiesByInstID();
  }

  getActivitiesByInstID(){
    this.sharedService.isLoading.next(true);
    this.sharedService.getactivitiesByInstID(localStorage.getItem('institution_id')).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.activities  = result.data;

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }

  showContracts(activity_id:any){
    this.contract = [];
    this.contractProgressArray.data = [];
    this.contract_title = null;
    this.contract_amount = null;
    this.getContracts(activity_id);
  }

  clearTable(){
    this.contractProgressArray.data = [];
  }

  getContracts(activity_id:any){
    this.sharedService.isLoading.next(true);
    this.contractService.getContractByActID(activity_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.contract = result.data;
      if(this.contract.length != 0){
        this.contract_id = result.data[0].id;
        this.contract_title = result.data[0].contract_title;
        this.contract_amount = result.data[0].contract_amount;
        this.signed_date = result.data[0].signed_date;
        this.contract_type = result.data[0].contract_type;
        this.contract_stage = result.data[0].contract_stage;
        //get contract progress
        this.getContractProgress(result.data[0].id);
      }

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });

  }

  getContractProgress(contract_id:any){
    this.sharedService.isLoading.next(true);
    this.contractService.getContractProgressByContractID(contract_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);

      //console.log(result.data);

      //table data
      this.contractProgressArray.data = result.data;
      this.contractProgressArray.sort = this.sort;
      this.contractProgressArray.paginator = this.paginator;

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }

  addContract(activity_id:any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.width = "70%";
    //dialogConfig.height="90%";
    dialogConfig.data = {"activity_id":activity_id};
    this.dialog.open(AddcontractComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getContracts(activity_id);
    });
  }

  addContractProgress(activity_id:any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.width = "70%";
    //dialogConfig.height="90%";
    dialogConfig.data = {"contract_id": this.contract_id, "activity_id":activity_id};
    this.dialog.open(AddcontractprogressComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getContracts(activity_id);
    });
  }

  updateConstractStage(activity_id:any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.width = "40%";
    dialogConfig.data = {"contract":this.contract};
    this.dialog.open( UpdatecontractstageComponent,dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getContracts(activity_id);
    });
  }

  onView(activity_id:any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.width = "70%";
    //dialogConfig.height="90%";
    dialogConfig.data = {"contract":this.contract,"activity_id":activity_id};
    this.dialog.open( ViewcontractComponent,dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getContracts(activity_id);
    });
  }

}
