import { LightningElement,track } from 'lwc';

export default class InputChecker extends LightningElement {
    @track
    numberValue;
    outputValue;
    name='Sai';
    @track
    address ={
        City: "Haryana",
        Country: "India"
    }

    handleInputChange(event){
        this.numberValue= event.target.value;
        console.log('Number Value::::::'+this.numberValue);
    }
    handleReset(){
        this.outputValue ='';
        this.numberValue='';
    }
    handleOnclick(){
        console.log('Number Value::'+ this.numberValue);
        
        if(this.numberValue == 1){
            this.outputValue='You are the One.';
        }
        else if(this.numberValue == 2){
            this.outputValue='You are Second.';
        }
        else if(this.numberValue == 3){
            this.outputValue='You are Third.';
        }
        else{
            this.outputValue='You are Out of this World.';
        }
    }
    handleCityInputChange(event){
        this.address.City = event.target.value;
    }
}