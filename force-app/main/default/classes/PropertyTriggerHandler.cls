public with sharing class PropertyTriggerHandler {
    //Before Insert
    public static void onBeforeInsert(List<PropertyTwo__c> listOfProperties){
        List<PropertyTwo__c> listOfPropertiesToBeProcessed = new List<PropertyTwo__c>();
        for(PropertyTwo__c eachProperty : listOfProperties){
            if(eachProperty.Agent__c != null){
                listOfPropertiesToBeProcessed.add(eachProperty);
            }
        }
        validateLicence(listOfPropertiesToBeProcessed);
    }
    //Before Update
    public static void onBeforeUpdate(Map<Id,PropertyTwo__c> oldMapProperties, List<PropertyTwo__c> listOfProperties){
        List<PropertyTwo__c> listOfUpdatedProperty = new List<PropertyTwo__c>();
        for(PropertyTwo__c eachProperty : listOfProperties){
            if(((oldMapProperties.get(eachProperty.Id).Agent__c) != (eachProperty.Agent__c)) || 
               ((oldMapProperties.get(eachProperty.Id).State__c) != (eachProperty.State__c))){
                   listOfUpdatedProperty.add(eachProperty);
                   validateLicence(listOfUpdatedProperty);
               }
        }
    }
    /*------------------------------------------------Business Logic------------------------------------------------------------------*/
    public static void validateLicence(List<PropertyTwo__c> properties){
        Map<Id, PropertyTwo__c> mapOfAgentIdVsProperty= new Map<Id, PropertyTwo__c>();
        for(PropertyTwo__c eachProperty : properties){
            mapOfAgentIdVsProperty.put(eachProperty.Agent__c, eachProperty);
        }
        
        List<Licence__c> listOfLicences = [SELECT State__c, Start_Date__c, Expiration_Date__c,Agent__c FROM 
                                           Licence__c WHERE Agent__c =: mapOfAgentIdVsProperty.keySet()];
        Map<Id, Licence__c> mapOfAgentIdAndLicence = new Map<Id, Licence__c>();
        for(Licence__c eachLicence : listOfLicences){
            mapOfAgentIdAndLicence.put(eachLicence.Agent__c, eachLicence);
        }
        
        for(PropertyTwo__c eachProp :properties){
            if(mapOfAgentIdAndLicence.containskey(eachProp.Agent__c)){
                if((mapOfAgentIdAndLicence.get(eachProp.Agent__c).Expiration_Date__c <= Date.today()) ||
                   ((mapOfAgentIdAndLicence.get(eachProp.Agent__c).State__c != eachProp.State__c))){
                       eachProp.adderror('Please choose an appropriate Agent');
                   }
            }
            
        }
    }
}