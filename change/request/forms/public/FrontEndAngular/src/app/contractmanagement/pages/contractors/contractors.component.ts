import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AddcontractorComponent } from '../../dialogs/addcontractor/addcontractor.component';
import { ContractService } from '../../services/contract.service';

@Component({
  selector: 'me-contractors',
  templateUrl: './contractors.component.html',
  styleUrls: ['./contractors.component.scss']
})
export class ContractorsComponent implements OnInit {

  
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(private contractService: ContractService, private dialog: MatDialog, public sharedService: SharedserviceService) { }
  data: any = []
  contractorsArray = new MatTableDataSource<any>();
  displayedColumns = ["sn","name","address","phone","email","action"];

  ngOnInit(): void {
    this.getContractors();
  }

  getContractors(){
    this.sharedService.isLoading.next(true);
    this.contractService.getAllContractors().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.contractorsArray.data = result.data;
      this.contractorsArray.sort = this.sort;
      this.contractorsArray.paginator = this.paginator;

    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

  onAdd(){
    const dialogConfig = new MatDialogConfig();
     dialogConfig.disableClose = false;
     dialogConfig.autoFocus = true;
     dialogConfig.width = "60%";
     //dialogConfig.height="90%";
    this.dialog.open(AddcontractorComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getContractors();
    });
  }

  onUpdate(row:any){
    // //this.messagesService.openSnackBar("Update id"+id);
    // const dialogConfig = new MatDialogConfig();
    //      dialogConfig.disableClose = false;
    //      dialogConfig.autoFocus = true;
    //      dialogConfig.width = "80%";
    //      //dialogConfig.height="90%";
    //      dialogConfig.data = {"row":row};
    //  this.dialog.open(UpdateinstitutionComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    //   this.getInst();
    //  });
 
   }


  onDelete(row:any){
  //   const dialogConfig = new MatDialogConfig();
  //   dialogConfig.disableClose = false;
  //   dialogConfig.autoFocus = true;
  //   //dialogConfig.width = "80%";
  //   //dialogConfig.height="90%";
  //   dialogConfig.data = {"row":row};
  //    this.dialog.open(DeleteinstitutionComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
  //     this.getInst();
  //  });
   }

   //Filtering
   applyFilter(filtertext: string){
    this.contractorsArray.filter = filtertext.trim().toLowerCase();
  }
}
