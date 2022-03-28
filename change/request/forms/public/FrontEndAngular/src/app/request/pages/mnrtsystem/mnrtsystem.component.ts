import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AddmnrtsystemComponent } from '../../dialogs/addmnrtsystem/addmnrtsystem/addmnrtsystem.component';
import { DeletemnrtsystemComponent } from '../../dialogs/deletemnrtsystem/deletemnrtsystem/deletemnrtsystem.component';
import { UpdatemnrtsystemComponent } from '../../dialogs/updatemnrtsystem/updatemnrtsystem/updatemnrtsystem.component';
import { RequestService } from '../../services/request.service';

@Component({
  selector: 'me-mnrtsystem',
  templateUrl: './mnrtsystem.component.html',
  styleUrls: ['./mnrtsystem.component.scss']
})
export class MnrtsystemComponent implements OnInit {

  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('leaderstable') leaderstable!: MatTable<any>;

  constructor(private requestService: RequestService, private dialog: MatDialog, public sharedService: SharedserviceService) { }
  data: any = []
  instArray = new MatTableDataSource<any>();
  displayedColumns = ["sn","mnrtsystem_name","action"];

  ngOnInit(): void {
    this.getProject();
  }

  getProject(){
    this.sharedService.isLoading.next(true);
    this.requestService.getMnrtProjects().subscribe(result=>{
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
    this.dialog.open(AddmnrtsystemComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getProject();
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
     this.dialog.open(UpdatemnrtsystemComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      this.getProject();
     });
 
   }


  onDelete(row:any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    //dialogConfig.width = "80%";
    //dialogConfig.height="90%";
    dialogConfig.data = {"row":row};
     this.dialog.open(DeletemnrtsystemComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      this.getProject();
   });
   }

   //Filtering
   applyFilter(filtertext: string){
    console.log(filtertext);
    this.instArray.filter = filtertext.trim().toLowerCase();
  }


}
