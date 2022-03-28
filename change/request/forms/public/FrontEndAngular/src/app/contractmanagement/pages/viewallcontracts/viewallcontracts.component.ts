import { Component, OnInit, ViewChild } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { AuthServiceService } from 'src/app/authentication/services/auth-service.service';
import { RolepermissionService } from 'src/app/shared/services/rolepermission.service';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AddcontractComponent } from '../../dialogs/addcontract/addcontract.component';
import { AddcontractprogressComponent } from '../../dialogs/addcontractprogress/addcontractprogress.component';
import { ViewcontractComponent } from '../../dialogs/viewcontract/viewcontract.component';
import { ContractService } from '../../services/contract.service';

@Component({
  selector: 'me-viewallcontracts',
  templateUrl: './viewallcontracts.component.html',
  styleUrls: ['./viewallcontracts.component.scss']
})
export class ViewallcontractsComponent implements OnInit {

  
  
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('table') leaderstable!: MatTable<any>;
  
  displayedColumns = ["sn","date_disbursed","amount_disbursed","remark"];

  constructor( private dialog: MatDialog, public sharedService: SharedserviceService, private contractService: ContractService,private rolepermissionService: RolepermissionService,private authService: AuthServiceService) { }
  Form!: FormGroup;
  activities: any[] = [];
  milestones:any[] = [];
  contract_id: any = null;
  contract_title:any = null;
  contract_amount:any = null;
  signed_date:any = null;
  contract_type: any = null;
  contract_stage: any = null;
  contract:any[] = [];
  selected_institution_id:any;
  contractProgressArray = new MatTableDataSource<any>();
  institutions: any[] = [];
  userrolepermissionArray:any[] = [];
  permissions = {"viewchecklistddp":false};

  ngOnInit(): void {

    //get intitutions
    this.getInstitutions();

    //this.getActivitiesByInstID(localStorage.getItem('institution_id'));

    //check role
    this.check_rolepermission(localStorage.getItem('role_id'))
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

  getActivitiesByInstID(institution_id:any){
    this.sharedService.isLoading.next(true);
    this.sharedService.getactivitiesByInstID(institution_id).subscribe(result=>{
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

  onRoleChange(institution_id:any){
    console.log(institution_id);
    this.selected_institution_id = institution_id;
    this.getActivitiesByInstID(this.selected_institution_id);

  }

  getContracts(activity_id:any){
    this.sharedService.isLoading.next(true);
    this.contractService.getContractByActID(activity_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      console.log(result.data);
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

  check_rolepermission(role_id:any){
    this.sharedService.isLoading.next(true);
    this.rolepermissionService.getpermissionsByRoleId(role_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);

      this.userrolepermissionArray = result.data;

      //console.log(result.data)

      for(var i = 0; i < this.userrolepermissionArray.length; ++i){

        if(this.userrolepermissionArray[i].permission.permission_code == 'viewchecklistddp'){
          this.permissions.viewchecklistddp = true;
        }

      }


      //check permission for showing search
      if(this.permissions.viewchecklistddp == true){
        this.activities = [];
      }
      else if(this.permissions.viewchecklistddp == false){
        this.getActivitiesByInstID(localStorage.getItem('institution_id'));
      }


      //console.log(this.progress_level);

    

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
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
