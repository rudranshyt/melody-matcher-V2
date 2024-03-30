import { LightningElement } from 'lwc';

export default class HomePageTab extends LightningElement {
    handleClickButton() {
        const pageReference = {
            type: "standard__webPage",
            attributes: {
                url: "/add-record"
            }
        };
        this[NavigationMixin.Navigate](pageReference);
    }
}