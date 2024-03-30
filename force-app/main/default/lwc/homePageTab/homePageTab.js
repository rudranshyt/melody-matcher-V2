import { LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";

export default class HomePageTab extends NavigationMixin(LightningElement) {
    handleClickButton() {
        const pageReference = {
            type: "standard__webPage",
            attributes: {
                url: "/get-playlist"
            }
        };
        this[NavigationMixin.Navigate](pageReference);
    }
}