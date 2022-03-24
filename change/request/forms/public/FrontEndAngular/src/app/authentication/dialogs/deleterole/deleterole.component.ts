import { Component, Inject, OnInit, Optional } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { AuthServiceService } from '../../services/auth-service.service';
import { Router } from '@angular/router';
import { SharedserviceService } from 'src/app/shared/services/sharedservice.service';

@Component({
  selector: 'me-deleterole',
  templateUrl: './deleterole.component.html',
  styleUrls: ['./deleterole.component.scss']
})
export class DeleteroleComponent implements OnInit {

  row: any = [];
  constructor(@Optional() @Inject(MAT_DIALOG_DATA) public data: any, public matDialogRef: MatDialogRef<DeleteroleComponent>, private router: Router, public sharedService: SharedserviceService, private authService: AuthServiceService ) { 
    
  }

  ngOnInit(): void {
    this.row = this.data.row;
    console.log(this.data.row);
  }

  onDelete(){
    this.sharedService.isLoading.next(true);
    this.authService.deleteroleById(this.row.id).subscribe(result=>{
      this.sharedService.isLoading.next(false);
      console.log(result);
      if(result.data.id == this.row.id){
        this.sharedService.openSnackBar("Successifully deleted!")
      }
      else{
        this.sharedService.openSnackBar("Error! Not Deleted.")
      }
      //Close dialog
      this.matDialogRef.close();

    },errorResponse=>{
      this.sharedService.openSnackBar("Error! Not Deleted.")
      console.log("Error: "+ errorResponse)
      //Close dialog
      this.matDialogRef.close();
    });
  }

   //Close dialog
   onClose(){
    this.matDialogRef.close();
  }


}
