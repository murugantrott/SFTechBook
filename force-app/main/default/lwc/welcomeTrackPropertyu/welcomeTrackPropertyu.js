import { LightningElement,track } from 'lwc';

export default class WelcomeTrackPropertyu extends LightningElement {
    @track greetings;

    handleGreetingChange(event){
        this.greetings=event.target.value;
    }
}