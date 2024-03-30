/**
 * @description       : email service class for sending emails to users with playlists
 * @author            : Rudransh Shukla
 * @group             : 
 * @last modified on  : 03-30-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class emailService {
    @AuraEnabled
    public static void sendEmail(string emailId, string criteria, string name) {

        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{emailId}); 
            email.setSubject('Melody Matcher - Here is your special Playlist'); 
            if(criteria == '1') { 
                email.setPlainTextBody('Dear '+name+',\n\n'+'Here is your special playlist - https://open.spotify.com/playlist/37i9dQZF1EIdhQkHfnuNWv?si=94f84e1bf1c84eaa \n\n'+'Hope you enjoy the music.\n\n'+'Warm Regards\n'+'Melody Matcher'); 
            }
            else if(criteria == '3') { 
                email.setPlainTextBody('Dear '+name+',\n\n'+'Here is your special playlist - https://open.spotify.com/playlist/37i9dQZF1E8NSFs6Vi97QB?si=1e6224442a044382 \n\n'+'Hope you enjoy the music.\n\n'+'Warm Regards\n'+'Melody Matcher'); 
            }
            else if(criteria == '4') { 
                email.setPlainTextBody('Dear '+name+',\n\n'+'Here is your special playlist - https://open.spotify.com/playlist/6x99H1Qmr878Qk4WpNGCN1?si=4bb647e7eee045ce&pt=475dbc3f002dd7b269390a27075ef2ae \n\n'+'Hope you enjoy the music.\n\n'+'Warm Regards\n'+'Melody Matcher'); 
            }
            else {
            email.setPlainTextBody('Dear '+name+',\n\n'+'Here is your playlist. We apologize for the inconvenience, but the specific playlist for your criteria is not available at the moment.\n\n'+'Warm Regards\n'+'Melody Matcher');
            }
            
            emailsToSend.add(email);

            if(!emailsToSend.isEmpty()) {
            Messaging.SendEmailResult[] sendResults = Messaging.sendEmail(emailsToSend);
            for(Messaging.SendEmailResult result : sendResults) {
                if(result.isSuccess()) {
                    System.debug('Email sent successfully');
                } else {
                    System.debug('Failed to send email----> ' + result.getErrors()[0].getMessage());
                }
            }
        }
    }
}