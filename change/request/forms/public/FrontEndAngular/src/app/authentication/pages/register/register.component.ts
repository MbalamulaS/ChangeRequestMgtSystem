import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { RolepermissionService } from 'src/app/shared/services/rolepermission.service';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AdduserComponent } from '../../dialogs/register/adduser.component';
import { AuthServiceService } from '../../services/auth-service.service';

@Component({
  selector: 'me-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('leaderstable') leaderstable!: MatTable<any>;

  constructor(private authService: AuthServiceService, private dialog: MatDialog, public sharedService: SharedserviceService, private rolepermissionService: RolepermissionService) { }
  data: any = []
  leadersArray = new MatTableDataSource<any>();
  leadersdisplayedColumns = ["sn","name","email","institution","role","status","action"];
  permissions = {"institutionadmin":false,"superadmin":false};
  userrolepermissionArray: any[] = [];

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

  onAdd(){
    const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = false;
        dialogConfig.autoFocus = true;
        dialogConfig.width = "50%";
        //dialogConfig.height="90%";
    this.dialog.open(AdduserComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      if(this.permissions.superadmin){
        this.getRegisteredUsers();
      }
      else if(this.permissions.institutionadmin){
        this.getRegisteredUsersByInstID(localStorage.getItem('institution_id'));
      }
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
