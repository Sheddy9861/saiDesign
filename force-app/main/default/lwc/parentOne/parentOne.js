import { LightningElement,track } from 'lwc';

export default class ParentOne extends LightningElement {
    @track taskList=[];

    handleAddTask(event){
        this.taskList.push(event.detail);
    }
}