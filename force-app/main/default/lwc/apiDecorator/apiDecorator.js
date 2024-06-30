import { LightningElement, track } from 'lwc';

export default class ApiDecorator extends LightningElement {
    firstName= 'Sai'
    lastName ='Behera'

    @track
    address = {
        name: 'Baripada',
        city: 'Baripada Town'

    }

    get fullName(){
        return `${this.firstName.toUpperCase()} ${this.lastName.toUpperCase()}`;
    }
    
    changeHandler(event) {
        this.address.city = event.target.value;
    }
}