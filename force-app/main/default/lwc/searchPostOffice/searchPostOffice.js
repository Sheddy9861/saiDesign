import { LightningElement,track } from 'lwc';
import getPostOfficesDetails from '@salesforce/apex/GetPostOffices.getPostOfficesDetails';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Description', fieldName: 'Description'},
    { label: 'BranchType', fieldName: 'BranchType' },
    { label: 'DeliveryStatus', fieldName: 'DeliveryStatus'},
    { label: 'Circle', fieldName: 'Circle'},
    { label: 'District', fieldName: 'District'},
    { label: 'Division', fieldName: 'Division'},
    { label: 'Region', fieldName: 'Region'},
    { label: 'Block', fieldName: 'Block'},
    { label: 'State', fieldName: 'State'},
    { label: 'Country', fieldName: 'Country'},
    { label: 'Pincode', fieldName: 'Pincode',type: 'number'}
    
];

export default class SearchPostOffice extends LightningElement {
    @track data = [];
    @track columns = columns;
    handleOnclick(){
        getPostOfficesDetails({}).then((response)=>{
            this.data = response;
        })
    }
}