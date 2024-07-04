import { LightningElement,track } from 'lwc';
import postOfficeSearch from '@salesforce/apex/PostalAPIController.postOfficeSearch';
const columns = [
    { label: 'Name', fieldName: 'name' },
    { label: 'Branch Type', fieldName : 'branchType'}
];

export default class SearchPostOffice extends LightningElement {
    @track data = [];
    @track columns = columns;
    
    @track pincode='';
    handleInputChange(event){
        this.pincode = event.target.value; 
    }
        doSearch(){
            console.log('Inside Onlick');
            postOfficeSearch({pincode:this.pincode})
            .then(result=>{
                this.data = result;
                console.log('DATA::'+this.data);
            })
            .catch(error=>{
                this.data = [];
            });
        }
    
    
    
}