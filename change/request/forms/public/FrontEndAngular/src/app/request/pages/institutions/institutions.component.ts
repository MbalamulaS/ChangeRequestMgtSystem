import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AddinstitutionComponent } from '../../dialogs/addinstitution/addinstitution.component';
import { DeleteinstitutionComponent } from '../../dialogs/deleteinstitution/deleteinstitution.component';
import { UpdateinstitutionComponent } from '../../dialogs/updateinstitution/updateinstitution.component';
import { RequestService } from '../../services/request.service';

@Component({
  selector: 'me-institutions',
  templateUrl: './institutions.component.html',
  styleUrls: ['./institutions.component.scss']
})
export class InstitutionsComponent implements OnInit {

  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('leaderstable') leaderstable!: MatTable<any>;

  constructor(private requestService: RequestService, private dialog: MatDialog, public sharedService: SharedserviceService) { }
  data: any = []
  instArray = new MatTableDataSource<any>();
  displayedColumns = ["sn","inst_name","vote_code","vote_name","sub_vote_no","sub_vote_name","action"];

  ngOnInit(): void {
    this.getInst();
  }

  getInst(){
    this.sharedService.isLoading.next(true);
    this.requestService.getIntitutions().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.instArray.data = result.data;
      this.instArray.sort = this.sort;
      this.instArray.paginator = this.paginator;

    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

  onAdd(){
    const dialogConfig = new MatDialogConfig();
     dialogConfig.disableClose = false;
     dialogConfig.autoFocus = true;
     dialogConfig.width = "80%";
     //dialogConfig.height="90%";
    this.dialog.open(AddinstitutionComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getInst();
    });
  }

  onUpdate(row:any){
    //this.messagesService.openSnackBar("Update id"+id);
    const dialogConfig = new MatDialogConfig();
         dialogConfig.disableClose = false;
         dialogConfig.autoFocus = true;
         dialogConfig.width = "80%";
         //dialogConfig.height="90%";
         dialogConfig.data = {"row":row};
     this.dialog.open(UpdateinstitutionComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      this.getInst();
     });
 
   }


  onDelete(row:any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    //dialogConfig.width = "80%";
    //dialogConfig.height="90%";
    dialogConfig.data = {"row":row};
     this.dialog.open(DeleteinstitutionComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      this.getInst();
   });
   }

   //Filtering
   applyFilter(filtertext: string){
    console.log(filtertext);
    this.instArray.filter = filtertext.trim().toLowerCase();
  }


}
