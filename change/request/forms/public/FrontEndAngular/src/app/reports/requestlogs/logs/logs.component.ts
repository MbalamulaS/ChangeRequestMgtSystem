import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { RolepermissionService } from 'src/app/shared/services/rolepermission.service';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { ReportsServicesService } from '../../services/reports-services.service';
import * as XLSX from 'xlsx'; 
import pdfMake from "pdfmake/build/pdfmake";
import pdfFonts from "pdfmake/build/vfs_fonts";
pdfMake.vfs = pdfFonts.pdfMake.vfs;

@Component({
  selector: 'me-logs',
  templateUrl: './logs.component.html',
  styleUrls: ['./logs.component.scss']
})
export class LogsComponent implements OnInit {
  
   
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('leaderstable') leaderstable!: MatTable<any>;

  constructor(private authService: ReportsServicesService, private dialog: MatDialog, public sharedService: SharedserviceService, private rolepermissionService: RolepermissionService) { }
  data: any = []
  
  leadersArray = new MatTableDataSource<any>();
  leadersdisplayedColumns = ["id","mnrtsystem_name","request_desc","category_name","priority","created_at","deadline","reason","institution","status","action"];
  permissions = {"institutionadmin":false,"superadmin":false};
  userrolepermissionArray: any[] = [];
  today = new Date();
  

  ngOnInit(): void {

    this.checklist_rolepermission(localStorage.getItem('role_id'));

    

  }

  getRegisteredUsers(){
    this.sharedService.isLoading.next(true);
    this.authService.getRegisteredUsers().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.leadersArray.data = result.data;
      this.leadersArray.sort = this.sort;
      this.leadersArray.paginator = this.paginator;

    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }
  

  getRegisteredUsersByInstID(inst_id:any){
    this.sharedService.isLoading.next(true);
    this.authService.getRegisteredUsersByInstID(inst_id).subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.leadersArray.data = result.data;
      this.leadersArray.sort = this.sort;
      this.leadersArray.paginator = this.paginator;

    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }



  // onUpdate(row:any){
  //  //this.messagesService.openSnackBar("Update id"+id);
  //  const dialogConfig = new MatDialogConfig();
  //       dialogConfig.disableClose = false;
  //       dialogConfig.autoFocus = true;
  //       dialogConfig.width = "80%";
  //       //dialogConfig.height="90%";
  //       dialogConfig.data = {"row":row};
  //   this.dialog.open(UpdateLeaderComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
  //     this.getLeaders();
  //   });

  // }
  // onDelete(row:any){
  //  const dialogConfig = new MatDialogConfig();
  //  dialogConfig.disableClose = false;
  //  dialogConfig.autoFocus = true;
  //  //dialogConfig.width = "80%";
  //  //dialogConfig.height="90%";
  //  dialogConfig.data = {"row":row};
  //   this.dialog.open(DeleteLeaderComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
  //   this.getLeaders();
  // });
  // }

  onDelete(row:any){
  //   const dialogConfig = new MatDialogConfig();
  //   dialogConfig.disableClose = false;
  //   dialogConfig.autoFocus = true;
  //   //dialogConfig.width = "80%";
  //   //dialogConfig.height="90%";
  //   dialogConfig.data = {"row":row};
  //    this.dialog.open(DeleteroleComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
  //     this.getRegisteredUsers();
  //  });
   }
  

  //Filtering
  applyFilter(filtertext: string){
    console.log(filtertext);
    this.leadersArray.filter = filtertext.trim().toLowerCase();
  }

  //Test method
  onTestButton(){
    //this.messagesService.openFailureSnackBar("Message!")
  }

  checklist_rolepermission(role_id:any){
    this.sharedService.isLoading.next(true);
    this.rolepermissionService.getpermissionsByRoleId(role_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);

      this.userrolepermissionArray = result.data;

      for(var i = 0; i < this.userrolepermissionArray.length; ++i){
        if(this.userrolepermissionArray[i].permission.permission_code == 'superadmin'){
          
          this.permissions.superadmin = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'institutionadmin'){
          this.permissions.institutionadmin = true;
        }
      }

      //console.log(this.permissions.institutionadmin)

      if(this.permissions.superadmin){
        this.getRegisteredUsers();
      }
      else if(this.permissions.institutionadmin){
        this.getRegisteredUsersByInstID(localStorage.getItem('institution_id'));
      }


    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }


}