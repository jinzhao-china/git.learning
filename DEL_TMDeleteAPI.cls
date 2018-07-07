@RestResource(urlMapping = '/deleteAll')
global with sharing class DEL_TMDeleteAPI {
   /* @HttpDelete
    global static void deleteAll() {
        RestResponse res = RestContext.response;
        RestRequest req = RestContext.request;
        String delId = req.params.get('Id');
        List<String> errList = new List<String>();
        String errMsg = '';
        try {
            List<User> userList = [SELECT Id FROM User WHERE Id = :delId LIMIT 1];
            if (userList.size() > 0) {
                List<ServiceTerritoryMember> serviceTerritoryMemberList = [select Id from ServiceTerritoryMember WHERE CreatedById = :delId];
                // List<ServiceResource> list1 = [select Id from ServiceResource WHERE CreatedById = :delId];


                // Savepoint sp = Database.setSavepoint();
                try {

                    Delete serviceTerritoryMemberList;
                    List<TMSalesStorePremium__c> sspList = [select Id from TMSalesStorePremium__c WHERE CreatedById = :delId];

                    Delete sspList;
                    List<ServiceTerritoryLocation> stlList = [select Id from ServiceTerritoryLocation WHERE CreatedById = :delId];

                    Delete stlList;
                    List<TMCampaignsforLocations__c> cfrList = [select Id from TMCampaignsforLocations__c WHERE CreatedById = :delId];

                    Delete cfrList;
                    List<ProductConsumed> list20 = [select Id from ProductConsumed WHERE CreatedById = :delId];

                    Delete list20;
                    List<ProductRequired> list21 = [select Id from ProductRequired WHERE CreatedById = :delId];

                    Delete list21;
                    List<TMAppointmentStatus__c> appointmentStatusList = [select Id from TMAppointmentStatus__c WHERE CreatedById = :delId];

                    Delete appointmentStatusList;
                    List<TMSalesRepAssignment__c> list5 = [select Id from TMSalesRepAssignment__c WHERE CreatedById = :delId];

                    Delete list5;
                    List<TMSignedConsumedItem__c> list6 = [select Id from TMSignedConsumedItem__c WHERE CreatedById = :delId];

                    Delete list6;
                    List<TMSignedDocuments__c> list7 = [select Id from TMSignedDocuments__c WHERE CreatedById = :delId];

                    Delete list7;
                    List<TMTourPackageStatus__c> list9 = [select Id from TMTourPackageStatus__c WHERE CreatedById = :delId];

                    Delete list9;
                    List<ServiceAppointment> list8 = [select Id from ServiceAppointment WHERE CreatedById = :delId];

                    Delete list8;
                    List<TMMarketingAgentLocation__c> list15 = [select Id from TMMarketingAgentLocation__c WHERE CreatedById = :delId];

                    Delete list15;
                    List<TMTransportation__c> list24 = [select Id from TMTransportation__c WHERE CreatedById = :delId];

                    Delete list24;
                    List<TMPaymentRecord__c> list25 = [select Id from TMPaymentRecord__c WHERE CreatedById = :delId];

                    Delete list25;
                    List<TMParticipants__c> list26 = [select Id from TMParticipants__c WHERE CreatedById = :delId];

                    Delete list26;
                    List<WorkOrder> workOrderList = [select Id, OwnerId, Owner.Name from WorkOrder WHERE CreatedById = :delId];

                    Delete workOrderList;
                    List<ServiceTerritory> serviceTerritoryList = [select Id, OwnerId, Owner.Name from ServiceTerritory WHERE CreatedById = :delId];

                    Delete serviceTerritoryList;
                    List<TMTimeSlotAllocation__c> list10 = [select Id from TMTimeSlotAllocation__c WHERE CreatedById = :delId];
                    Delete list10;
                    // Delete list1;
                    List<TimeSlot> list11 = [select Id from TimeSlot WHERE CreatedById = :delId];

                    Delete list11;
                    List<OperatingHours> list12 = [select Id from OperatingHours WHERE CreatedById = :delId];

                    Delete list12;
                    List<Schema.Location> list14 = [select Id from Location WHERE CreatedById = :delId];

                    Delete list14;

                    List<Campaign> list17 = [select Id from Campaign WHERE CreatedById = :delId];

                    Delete list17;
                    List<TMMarketingSource__c> list18 = [select Id from TMMarketingSource__c WHERE CreatedById = :delId];

                    Delete list18;
                    List<TMMarketingProgramCategory__c> list19 = [select Id from TMMarketingProgramCategory__c WHERE CreatedById = :delId];

                    Delete list19;
                    List<ProductItem> list22 = [select Id from ProductItem WHERE CreatedById = :delId];

                    Delete list22;
                    List<Product2> list23 = [select Id from Product2 WHERE CreatedById = :delId];

                    Delete list23;

                    List<Contact> list2 = [select Id from Contact WHERE CreatedById = :delId];

                    Delete list2;

                    List<Account> accountList = [select Id from Account WHERE CreatedById = :delId];

                    Delete accountList;

                    List<Lead> list3 = [select Id from Lead WHERE CreatedById = :delId];

                    Delete list3;
                    List<TMContactNotes__c> list4 = [select Id from TMContactNotes__c WHERE CreatedById = :delId];

                    Delete list4;
                } catch (Exception e) {
                    // Database.rollback(sp);
                    errList.add( e.getMessage());
                }
            } else {
                errMsg = 'Unable to find this user !';
                errList.add( errMsg);
            }
        } catch (Exception e) {
            errMsg = e.getTypeName() + ' : ' + e.getMessage() + ' ' + e.getStackTraceString();
            errList.add(errMsg);
        }
        if (errList.size() > 0) {
            res.responseBody = Blob.valueOf(JSON.serialize(errList));
            res.statusCode = 408;
        } else {
            res.statusCode = 200;
        }
    }*/
}