import { LightningElement } from 'lwc';

export default class ColorPickler extends LightningElement {
    handleColorChange(event){
        const colorCodeVal = event.target.value;
        const colorCodeEvent = new CustomEvent('colorschange',{
            detail:{colorCodeVal},
        });
        this.dispatchEvent(colorCodeEvent);
    }
}