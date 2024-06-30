import { LightningElement } from 'lwc';

export default class BmiCalculator extends LightningElement {
    weight=""
    height=""
    value=""
    result=""

    onChangeHandler(event){
        if(event.target.dataset.id === 'height'){
            this.height = event.target.value
        }
        else if(event.target.dataset.id === 'weight'){
            this.weight = event.target.value
        }
    }

    onSubmitHandler(event){
        event.preventDefault();
        console.log('Weight is::', this.weight);
        console.log('Height is::', this.height);
        this.calculate();
    }
    calculate(){
        let tempValue = (this.weight / this.height/ this.height)*10000;
        this.value = tempValue.toFixed(2);
        console.log('You BMI value is', this.value);
        this.healthCheck(this.value)
        console.log('Your Result is ',this.result)
    }
    healthCheck(value){
        if(value <= 18.5){
            this.result = "UnderWeight."
        }
        else if(value > 18.5 && value < 25){
            this.result ="Healthy"
        }
        else if(value > 25 && value < 30){
            this.result ="Overweight"
        }
        else if(value > 30){
            this.result = "Obese"
        }
    }

    onClickHandler(){
        this.result =""
    }

}