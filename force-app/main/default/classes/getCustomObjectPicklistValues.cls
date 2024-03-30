/**
 * @description       : this class is to fetch the piklist values of custom object used in melody matcher
 * @author            : Rudransh Shukla
 * @group             : 
 * @last modified on  : 03-30-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class getCustomObjectPicklistValues {

    public List<String> getPicklistValues(
    String objectApiName,
    String fieldName
  ) {
    List<String> picklistValues = new List<String>();

    try {
      Schema.DescribeFieldResult fieldDescribe = Schema.getGlobalDescribe()
        .get(objectApiName)
        .getDescribe()
        .fields.getMap()
        .get(fieldName)
        .getDescribe();
      for (Schema.PicklistEntry entry : fieldDescribe.getPicklistValues()) {
        picklistValues.add(entry.getLabel());
      }
    } catch (Exception e) {
      System.debug('Error---->' + e.getMessage()+'--------->'+e.getLineNumber());
    }

    return picklistValues;
  }

  @AuraEnabled(cacheable=true)
  public static List<String> getCriteriaValues() {
    

    String fieldName = 'Crieteria__c';
    String objectApiName = 'customer_user__c';

    getPicklistController controller = new getPicklistController();

    List<String> picklistValues = controller.getPicklistValues(
      objectApiName,
      fieldName
    );

    return picklistValues;
  }
    
}