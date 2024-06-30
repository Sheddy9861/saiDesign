import { LightningElement } from 'lwc';

export default class ChildOne extends LightningElement {
    inputTask='';
    handleInputChange(event){
        this.inputTask = event.detail.value;
    }

    handleTaskSubmit(){
        const custEvent = new CustomEvent('addtask',{
            detail : this.inputTask
        })
        this.dispatchEvent(custEvent);
        inputTask='';
    }
}