import { LightningElement,track } from 'lwc';

export default class ParentComponent extends LightningElement {
    @track
    name
    userDetail = [
        {
            name : 'Shirdi',
            title : 'Behera',
            company : 'AWC'
        },
        {
            name : 'Rahul',
            title : 'Singh',
            company : 'Baxy' 
        },
        {
            name : 'Virat',
            title : 'Kohli',
            company : 'India' 
        }

    ]
    
}