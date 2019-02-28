trigger RejectDoubleBooking on prasadRevenueS__Session_Speaker__c (before insert, before update) {

    //collect ID's to reduce data calls 
    List<Id> speakerIds = new List<Id>();    
    Map<Id,DateTime> requested_bookings = new Map<Id,DateTime>();
    
    //get all speakers related to the trigger
    //set booking map with ids to fill later
    for(prasadRevenueS__Session_Speaker__c newItem : trigger.new) {
        requested_bookings.put(newItem.Session__c,null); 
        speakerIds.add(newItem.Speaker__c);
    }
    
    //fill out the start date/time for the related sessions
    List<prasadRevenueS__Session__c> related_sessions = [SELECT ID, prasadRevenueS__Session_Date__c from prasadRevenueS__Session__c WHERE ID IN :requested_bookings.keySet()];
    for(prasadRevenueS__Session__c related_session : related_sessions) {
        requested_bookings.put(related_session.Id,related_session.prasadRevenueS__Session_Date__c);
    }
    
    //get related speaker sessions to check against
    List<prasadRevenueS__Session_Speaker__c> related_speakers = [SELECT ID, prasadRevenueS__Speaker__c, prasadRevenueS__Session__c, prasadRevenueS__Session__r.prasadRevenueS__Session_Date__c from prasadRevenueS__Session_Speaker__c WHERE prasadRevenueS__Speaker__c IN :speakerIds];
    
    //check one list against the other
    for(prasadRevenueS__Session_Speaker__c requested_session_speaker : trigger.new) {
        DateTime booking_time = requested_bookings.get(requested_session_speaker.prasadRevenueS__Session__c);
        for(prasadRevenueS__Session_Speaker__c related_speaker : related_speakers) {
            if(related_speaker.prasadRevenueS__Speaker__c == requested_session_speaker.prasadRevenueS__Speaker__c &&
               related_speaker.prasadRevenueS__Session__r.prasadRevenueS__Session_Date__c == booking_time) {
                   requested_session_speaker.addError('The speaker is already booked at that time');
               }
        }
    }


}