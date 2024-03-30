import { LightningElement, wire } from 'lwc';
import getCriteriaValues from '@salesforce/apex/getCustomObjectPicklistValues.getCriteriaValues';
import addRecordMethod from '@salesforce/apex/createRecord.addRecordMethod';
import sendEmail from '@salesforce/apex/emailService.sendEmail';

export default class GetPlaylist extends LightningElement {
    criteriaValues = [];
    name;
    email;
    criteria;

    @wire(getCriteriaValues)
    wiredGetCriteriaValues({ error, data }) {
        if (data) {
            this.criteriaValues = data;
            console.log(this.criteriaValues);
        }
        if (error) {
            const err = error
            console.error('error---->', err);
        }
    }

    handleName(event) {
        this.name = event.target.value;
    }
    handleEmail(event) {
        this.email = event.target.value;
    }
    handleCriteria(event) {
        this.criteria = event.target.value;
    }
    handleSaveButton() {
        addRecordMethod({
            name: this.name,
            email: this.email,
            criteria: this.criteria
        })
            // .then(() => {
            //     sendEmail({
            //         emailId: this.email,
            //         criteria: this.criteria,
            //         name: this.name
            //     })
            .then(() => {
                    alert("Record created successfully, check email");
                    this.name = '';
                    this.email = '';
                    this.criteria = '';
                // }).catch((error) => {
                //     console.log('error',error);
                //     alert('Email could not be sent, we are sorry for incovenience');
                //     this.name = '';
                //     this.email = '';
                //     this.criteria = '';
                // })

            })
            .catch(error => {
                console.error('error--->', error);
                alert("Record cannot be saved. Please try again later.");
                this.name = '';
                this.email = '';
                this.criteria = '';
            });
    }
}
