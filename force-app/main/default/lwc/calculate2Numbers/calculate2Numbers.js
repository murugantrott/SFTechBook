import { LightningElement, track, api } from 'lwc';
import getSum from '@salesforce/apex/CalculateNumbers.getSumResult';

export default class Calculate2Numbers extends LightningElement {
    @track fNumber;
    @track sNumber;
    @track sum;
    @track errors;

    @api title;
    @api greeting;

    handleClick(){
        getSum({firstNumber:this.fNumber, secondNumber:this.sNumber})   
           .then(result=>{
               this.sum = result;
           })
           .catch(error=>{
               this.errors = error;
           });
    }

    handleChange(event){
        if(event.target.name === 'fstNumber'){
            this.fNumber = event.target.value;
        }
        else if(event.target.name === 'scdNumber'){
            this.sNumber = event.target.value;
        }
    }
}