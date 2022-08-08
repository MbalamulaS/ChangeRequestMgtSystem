import { Component, OnInit } from '@angular/core';
import { RolepermissionService } from 'src/app/shared/services/rolepermission.service';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';

@Component({
  selector: 'me-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  view:any = ['700','300'];
  colorScheme: any = {
    domain: ['#C24641','#6698FF','#008000','#CD7F32']
  }

  constructor(public sharedService: SharedserviceService, public rolepermissionService: RolepermissionService) { }
  users_count: any
  institutions_count: any;
  activities:any[] = [];
  mnrtsystems:any[] = [];
  activity_count: number = 0;
  mnrtsystems_count: number = 0;
  request_count: number = 0;
  contract_count: number = 0;
  activitysummaries:any[] = [];
  activityprogressmilestone: any[] = []
  financialSummaryData: any[] = [];
  implementationSummaryData: any[] = [];
  milestones: any[] = [];
  activityMilestoneData:any[]=[];
  data2 = [{name:"act1",value:12},{name:"act2",value:18},{name:"act3",value:3},{name:"act4",value:6}];
  userrolepermissionArray:any[] = [];
  permissions = {"viewadmindashboard":false};

  ngOnInit(): void {
    this.getUsersCount();
    this.getInstitutionssCount();
    this.getMnrtSystemsCount();
    this.getRequestCount();

    //get role and permission
    this.checklist_rolepermission(localStorage.getItem('role_id'));

    //get intitutions and milestones
    this.getActivitiesByInstID(localStorage.getItem('institution_id'))

    //get contracts
    this.getContractsByInstID(localStorage.getItem('institution_id'))


  }

  getUsersCount(){
    this.sharedService.isLoading.next(true);
    this.sharedService.getUsers().subscribe(result=>{
      this.sharedService.isLoading.next(false);

      this.users_count  = result.data.length;

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }

  getInstitutionssCount(){
    this.sharedService.isLoading.next(true);
    this.sharedService.getInstitutions().subscribe(result=>{
      this.sharedService.isLoading.next(false);

      this.mnrtsystems_count  = result.data.length;

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }

  getMnrtSystemsCount(){
    this.sharedService.isLoading.next(true);
    this.sharedService.getSystemsList().subscribe(result=>{
      this.sharedService.isLoading.next(false);

      this.institutions_count  = result.data.length;

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }

  getRequestCount(){
    this.sharedService.isLoading.next(true);
    this.sharedService.getRequestList().subscribe(result=>{
      this.sharedService.isLoading.next(false);

      this.request_count  = result.data.length;

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }


  setSummaries(activitysummaries:any[]){
    this.financialSummaryData = [];
    this.implementationSummaryData = [];

    for(var i = 0; i < this.activitysummaries.length ; i++ ){
      this.financialSummaryData.push({"name": this.activitysummaries[i].activity_code,"series": [ { "name": "Approved Budget", "value": this.activitysummaries[i].approved_budget },{"name": "Amount Allocated","value": this.activitysummaries[i].total_fund_allocated },{"name": "Amount Received","value": this.activitysummaries[i].total_fund_received },{ "name": "Amount Spent", "value": this.activitysummaries[i].total_fund_spent }]})
    }

    for(var i = 0; i < this.activitysummaries.length ; i++ ){
      this.implementationSummaryData.push({"name": this.activitysummaries[i].activity_code,"series": [ { "name": "Overal Activity Target", "value": this.activitysummaries[i].activity_target },{"name": "Current Target Reached","value": this.activitysummaries[i].actual_target }]})
    }
  }

  getActivitiesByInstID(inst_id:any){
    this.sharedService.isLoading.next(true);
    this.sharedService.getactivitiesByInstID(inst_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.activities  = result.data;
      this.activity_count = result.data.length;

    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }


  getContractsByInstID(inst_id:any){
    this.sharedService.isLoading.next(true);
    this.sharedService.getContractsByInstID(inst_id).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      //console.log(result.data);
      this.contract_count = result.data.length;

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

        if(this.userrolepermissionArray[i].permission.permission_code == 'viewadmindashboard'){
          this.permissions.viewadmindashboard = true;
        }


      }
    },errorResponse=>{
      console.log("Error: "+ errorResponse);
    });
  }


}
