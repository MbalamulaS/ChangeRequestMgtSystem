import { BreakpointObserver } from '@angular/cdk/layout';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { MatSidenav } from '@angular/material/sidenav';
import { Router } from '@angular/router';
import { delay } from 'rxjs/operators';
import { UpdatepasswordComponent } from 'src/app/authentication/dialogs/updatepassword/updatepassword.component';
import { UserprofileComponent } from 'src/app/authentication/dialogs/userprofile/userprofile.component';
import { AuthServiceService } from 'src/app/authentication/services/auth-service.service';
import { RolepermissionService } from 'src/app/shared/services/rolepermission.service';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {

  currentYear: number = new Date().getFullYear();

  @ViewChild(MatSidenav)
  sidenav!: MatSidenav;

  constructor(private observer: BreakpointObserver, private router: Router, public sharedService: SharedserviceService, private authService: AuthServiceService, private dialog: MatDialog, public rolepermissionService: RolepermissionService) {}
  user:any = "default";
  pending_approval_count: number = 0;
  permissions = {"viewchecklist":false,"reportactivityprogress":false,"viewactivityprogress":false, "manageusersrolespermissions":false,"registeruser":false,"rolesandpermissons":false,"systemsetup":false,"reportconsolidation":false, "addfunddisbursement":false,"reportcontract":false,"viewcontract":false,"addgfscode":false,"setupmilestone":false,"addinstitution":false};
  userrolepermissionArray: any[] = [];
  activityprogressmilestone:any[] = [];

  ngOnInit() {
    if(this.authService.isAuthenticated() == false){
      this.router.navigate(['/login'])
    }
   else{
      //set username
      this.user = localStorage.getItem('user_name');

      //get activity progress milestone
      this.getActProgressMilestoneByInstitution_Id(localStorage.getItem('institution_id'))

    }

   

  }

  ngAfterViewInit() {
    this.observer
      .observe(['(max-width: 800px)'])
      .pipe(delay(1))
      .subscribe((res) => {
        if (res.matches) {
          this.sidenav.mode = 'over';
          this.sidenav.close();
        } else {
          this.sidenav.mode = 'side';
          this.sidenav.open();
        }
      });
  }

  onLogout(){
    this.authService.logout();
  }

  showProfile(){
    const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = false;
        dialogConfig.autoFocus = true;
        dialogConfig.width = "50%";
        //dialogConfig.height="90%";
    this.dialog.open(UserprofileComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    
    });
  }

  onChangePassword(){
    const dialogConfig = new MatDialogConfig();
        dialogConfig.disableClose = false;
        dialogConfig.autoFocus = true;
        dialogConfig.width = "50%";
        //dialogConfig.height="90%";
    this.dialog.open(UpdatepasswordComponent, dialogConfig).afterClosed().subscribe(dialogData=>{
    
    });
  }

  getActProgressMilestoneByInstitution_Id(inst_id:any){
    this.sharedService.isLoading.next(true);
    this.sharedService.getProgressMilestoneByInstitution_Id(inst_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.activityprogressmilestone  = result.data;

      //get role and permission
      this.checklist_rolepermission(localStorage.getItem('role_id'));

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }

  checklist_rolepermission(role_id:any){
    this.sharedService.isLoading.next(true);
    this.rolepermissionService.getpermissionsByRoleId(role_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);

      this.userrolepermissionArray = result.data;

      for(var i = 0; i < this.userrolepermissionArray.length; ++i){
        if(this.userrolepermissionArray[i].permission.permission_code == 'superadmin'){
          
          this.permissions.viewchecklist = true;
          this.permissions.reportactivityprogress = true;
          this.permissions.viewactivityprogress = true;
          this.permissions.manageusersrolespermissions = true;
          this.permissions.registeruser = true;
          this.permissions.rolesandpermissons = true;
          this.permissions.systemsetup = true;
          this.permissions.reportconsolidation = true;
          this.permissions.addfunddisbursement = true;
          this.permissions.reportcontract = true;
          this.permissions.viewcontract = true;
          this.permissions.addgfscode = true;
          this.permissions.setupmilestone = true;
          this.permissions.addinstitution = true;

        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'viewchecklist'){
          this.permissions.viewchecklist = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'systemsetup'){
          this.permissions.systemsetup = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'reportactivityprogress'){
          this.permissions.reportactivityprogress = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'viewactivityprogress'){
          this.permissions.viewactivityprogress = true;
        }

        if(this.userrolepermissionArray[i].permission.permission_code == 'manageusersrolespermissions'){
          this.permissions.manageusersrolespermissions = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'registeruser'){
          this.permissions.manageusersrolespermissions = true;
          this.permissions.registeruser = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'rolesandpermissons'){
          this.permissions.manageusersrolespermissions = true;
          this.permissions.rolesandpermissons = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'reportconsolidation'){
          this.permissions.reportconsolidation = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'addfunddisbursement'){
          this.permissions.addfunddisbursement = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'reportcontract'){
          this.permissions.reportcontract = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'viewcontract'){
          this.permissions.viewcontract = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'addgfscode'){
          this.permissions.addgfscode = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'setupmilestone'){
          this.permissions.setupmilestone = true;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'addinstitution'){
          this.permissions.addinstitution = true;
        }

        if(this.userrolepermissionArray[i].permission.permission_code == 'approvemilestonelevel1'){
          //this.progress_level = '1';
          this.pending_approval_count = this.activityprogressmilestone.filter(item => item.progress_level == '1').length;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'approvemilestonelevel2'){
          //this.progress_level = '2';
          this.pending_approval_count = this.activityprogressmilestone.filter(item => item.progress_level == '2').length;
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'approvemilestonelevel3'){
          //this.progress_level = '3';
        }
        if(this.userrolepermissionArray[i].permission.permission_code == 'addactualprogress'){
          //this.progress_level = '0';
          this.pending_approval_count = this.activityprogressmilestone.filter(item => item.progress_level == '0').length;
        }
        
      }

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }

}
