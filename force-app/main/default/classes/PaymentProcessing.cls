public with sharing class PaymentProcessing {
    public void doProcessing(){
        String Id ='0012w00001So1JfAAJ';
        Account acc = [SELECT Id, Name, Net_Banking__c FROM Account WHERE Id=:Id];
        //Create Instance of the Interface
        IPaymentSystem paymentProcessingObj = NULL;
        if(acc.Net_Banking__c == 'Net Banking'){
            paymentProcessingObj = new NetBankingPayment();
        }
        else if(acc.Net_Banking__c =='GPay'){
            paymentProcessingObj = new GpayPayment();
        }
        paymentProcessingObj.getServiceFee();
    }
}