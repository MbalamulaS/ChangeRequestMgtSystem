import { CdkDragDrop, moveItemInArray, transferArrayItem } from '@angular/cdk/drag-drop';
import { ThrowStmt } from '@angular/compiler';
import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';
import { AuthServiceService } from '../../services/auth-service.service';
import { AddRoleComponent } from '../../dialogs/roles/add-role.component';
import { DeleteroleComponent } from '../../dialogs/deleterole/deleterole.component';
import { UpdateroleComponent } from '../../dialogs/updaterole/updaterole.component';

@Component({
  selector: 'me-rolesandpermissions',
  templateUrl: './rolesandpermissions.component.html',
  styleUrls: ['./rolesandpermissions.component.scss']
})
export class RolesandpermissionsComponent implements OnInit {

  
  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('table') leaderstable!: MatTable<any>;

  constructor(private authService: AuthServiceService, private dialog: MatDialog, public sharedService: SharedserviceService, private changeDetectorRef: ChangeDetectorRef) { }
  rolesForm!: FormGroup;
  rolesArray = new MatTableDataSource<any>();
  displayedColumns = ["sn","role_title","action"];
  selected_role_id: any;
  roles:any[] = [];
  rolepermissions: any[] = []
  rolepermissionsObj: any[] = []
  rolepermissionTosave: any[] = []
  allpermissions: any[] = []
  allpermissionsObj: any[] = []
  

  ngOnInit(): void {

    this.getallPermission();

    this.getRoles();
  }

  //for drag and drop event
  drop(event: CdkDragDrop<string[]>) {
    if (event.previousContainer === event.container) {
      moveItemInArray(event.container.data, event.previousIndex, event.currentIndex);
    } else {
      transferArrayItem(
        event.previousContainer.data,
        event.container.data,
        event.previousIndex,
        event.currentIndex,
      );
    }

    console.log(this.rolepermissions);
  }

  onsavePermission(){
   
    this.rolepermissionTosave = [];
    for(var i = 0; i < this.rolepermissions.length; ++i){
      this.rolepermissionTosave.push({"role_id": this.selected_role_id, "permission_id":this.rolepermissions[i].permission_id})
      }
    let rolepermissionjson = JSON.stringify({'roles':this.rolepermissionTosave});
    
    //console.log(rolepermissionjson);

    //save permission
    this.sharedService.isLoading.next(true);
    this.authService.addrolespermission(this.selected_role_id,rolepermissionjson).subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      if(result.message != null){
        this.sharedService.openSnackBar("Permissions saved successifully!");
      }
      else{
        this.sharedService.openFailureSnackBar("Permissions saved saved!");
      }

    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });

  }

  getRoles(){
    this.sharedService.isLoading.next(true);
    this.authService.getRoles().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.rolesArray.data = result.data;
      setTimeout(() => this.rolesArray.sort = this.sort);
      setTimeout(() => this.rolesArray.paginator = this.paginator);

      this.roles = result.data;

    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

  getallPermission(){
    this.allpermissions = [];
    this.sharedService.isLoading.next(true);
    this.authService.getallPermissions().subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.allpermissionsObj = result.data;
      for(var i = 0; i < this.allpermissionsObj.length; ++i){
        
      this.allpermissions.push({"permission_id":this.allpermissionsObj[i].id, "permission_code":this.allpermissionsObj[i].permission_code})
      }


    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

  getpermissionByRoleId(id:any){
    this.rolepermissions = [];
    this.sharedService.isLoading.next(true);
    this.authService.getpermissionsByRoleId(id).subscribe(result=>{
    this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.rolepermissionsObj = result.data;
      for(var i = 0; i < this.rolepermissionsObj.length; ++i){
        this.rolepermissions.push({"permission_id":this.rolepermissionsObj[i].permission.id, "permission_code":this.rolepermissionsObj[i].permission.permission_code})
      }

      this.filteravailablePermission();

    },errorResponse=>{
      console.log("Error: "+ errorResponse)
    });
  }

  filteravailablePermission(){

    for(var i = 0; i < this.rolepermissions.length; ++i){
      this.allpermissions = this.allpermissions.filter(item => item.permission_id != this.rolepermissions[i].permission_id);
    }
    //console.log(this.allpermissions);
  }

  onRoleChange(role_id:any){
    //console.log(role_id);
    this.selected_role_id = role_id;
    this.getallPermission();
    this.getpermissionByRoleId(role_id);

  }

  onAdd(){
    const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = false;
        dialogConfig.autoFocus = true;
        dialogConfig.width = "50%";
        //dialogConfig.height="90%";
    this.dialog.open(AddRoleComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    this.getRoles();
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

  onUpdate(row:any){
    //this.messagesService.openSnackBar("Update id"+id);
    const dialogConfig = new MatDialogConfig();
         dialogConfig.disableClose = false;
         dialogConfig.autoFocus = true;
         dialogConfig.width = "80%";
         //dialogConfig.height="90%";
         dialogConfig.data = {"row":row};
     this.dialog.open(UpdateroleComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      this.getRoles();
     });
 
   }



  onDelete(row:any){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    //dialogConfig.width = "80%";
    //dialogConfig.height="90%";
    dialogConfig.data = {"row":row};
     this.dialog.open(DeleteroleComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
      this.getRoles();
   });
   }


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




  
  // onView(row:any){
  //   const dialogConfig = new MatDialogConfig();
  //  dialogConfig.disableClose = false;
  //  dialogConfig.autoFocus = true;
  //  //dialogConfig.width = "80%";
  //  //dialogConfig.height="90%";
  //  dialogConfig.data = {"row":row};
  // this.dialog.open(ViewLeaderComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
  // //this.getLeaders();
  // });
  // }


}
