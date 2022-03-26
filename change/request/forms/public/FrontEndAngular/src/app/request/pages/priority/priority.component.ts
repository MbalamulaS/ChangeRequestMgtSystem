import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AddpriorityComponent } from '../../dialogs/addpriority/addpriority/addpriority.component';
import { DeletepriorityComponent } from '../../dialogs/deletepriority/deletepriority/deletepriority.component';
import { UpdatepriorityComponent } from '../../dialogs/updatepriority/updatepriority/updatepriority.component';
import { RequestService } from '../../services/request.service';
@Component({
  selector: 'me-priority',
  templateUrl: './priority.component.html',
  styleUrls: ['./priority.component.scss']
})
export class PriorityComponent implements OnInit {
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('leaderstable') leaderstable!: MatTable<any>;

  constructor(private requestService: RequestService, private dialog: MatDialog, public sharedService: SharedserviceService) { }
  data: any = []
  instArray = new MatTableDataSource<any>();
  displayedColumns = ["sn","priority_name","action"];

  ngOnInit(): void {
    this.getPriority();
  }

  getPriority(){
    this.sharedService.isLoading.next(true);
    this.requestService.getPriorities().subscribe(result=>{
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
    this.dialog.open(AddpriorityComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getPriority();
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
     this.dialog.open(UpdatepriorityComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      this.getPriority();
     });
 
   }


  onDelete(row:any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    //dialogConfig.width = "80%";
    //dialogConfig.height="90%";
    dialogConfig.data = {"row":row};
     this.dialog.open(DeletepriorityComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      this.getPriority();
   });
   }

   //Filtering
   applyFilter(filtertext: string){
    console.log(filtertext);
    this.instArray.filter = filtertext.trim().toLowerCase();
  }


}
