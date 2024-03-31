import { LightningElement, track } from 'lwc';

export default class Agaramtrackpropery extends LightningElement {
     @track greetings;

    handlegreetingschange(event){
        this.greetings = event.target.value;
        console.log(this.greetings);
    }

}