import { LightningElement, track } from 'lwc';

export default class CalcTest extends LightningElement {
    firstnum=0;
    secnum=0;
    @track result=0;

    handleChanges(event){
        if(event.target.name == 'fnum'){
            this.firstnum=event.target.value;
        }

        if(event.target.name == 'snum'){
            this.secnum=event.target.value;
        }

        this.result = parseInt(this.firstnum) +
                      parseInt(this.secnum);
    }
}