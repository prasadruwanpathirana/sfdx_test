trigger SendConfirmationEmail on prasadRevenueS__Session_Speaker__c (after insert) {

        //collect ID's in one list of a single SOQL query
    List<Id> sessionSpeakerIds = new List<Id>();    
    for(prasadRevenueS__Session_Speaker__c newItem : trigger.new) {
        sessionSpeakerIds.add(newItem.Id);  
    }
    
    // Retrieve session name and time + speaker name and email address related to ID's
    List<prasadRevenueS__Session_Speaker__c> sessionSpeakers =
            [SELECT prasadRevenueS__Session__r.Name,
                    prasadRevenueS__Session__r.Session_Date__c,
                    prasadRevenueS__Speaker__r.First_Name__c,
                    prasadRevenueS__Speaker__r.Last_Name__c,
                    prasadRevenueS__Speaker__r.Email__c
             FROM prasadRevenueS__Session_Speaker__c WHERE Id IN :sessionSpeakerIds];

     if(sessionSpeakers.size() > 0) {  
            // Send confirmation email if we know the speaker's email address
            prasadRevenueS__Session_Speaker__c sessionSpeaker = sessionSpeakers[0];
            if (sessionSpeaker.prasadRevenueS__Speaker__r.prasadRevenueS__Email__c != null) {
                String address = sessionSpeaker.prasadRevenueS__Speaker__r.prasadRevenueS__Email__c;
                String subject = 'Speaker Confirmation';
                String message = 'Dear ' + sessionSpeaker.prasadRevenueS__Speaker__r.prasadRevenueS__First_Name__c +',Your session "' + sessionSpeaker.Session__r.Name + '" on ' + sessionSpeaker.prasadRevenueS__Session__r.prasadRevenueS__Session_Date__c + ' is confirmed.' + 'Thanks for speaking at the conference!';
                EmailManager.sendMail(address, subject, message);
            }
        }
    }