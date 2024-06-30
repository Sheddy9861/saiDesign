/*Write an APex logiv to query and iterate a List<Account> named accList and create a Map<String, List<Contact>> where 
the key is Acount Number and the value is a list of related Contact records associalted with each of queried Account*/
public class MapPractice {
    public static void getAccountIdAndContacts(){
        Map<String, List<Contact>> accNumVsConList = new Map<String, List<Contact>>();
        List<Account> accList=[SELECT Id, Name, AccountNumber FROM Account];
        List<Contact> conList =[SELECT Id, Name, Account.AccountNumber FROM Contact WHERE AccountID IN: accList];
        for(Contact eachContact : conList){
            if(!accNumVsConList.containsKey(eachContact.Account.AccountNumber)){
                accNumVsConList.put(eachContact.Account.AccountNumber, new List<Contact>{eachContact});
            }else{
                accNumVsConList.get(eachContact.Account.AccountNumber).add(eachContact);
            }
        }
        System.debug('ACCOUNT MAP DEBUGG::'+accNumVsConList);
    }
    public static void mapTest(){
        Map<String,List<String>> countryVsStateMap = new Map<String,List<String>>();
        countryVsStateMap.put('India',new List<String>{'Odisha','Haryana'});
        System.debug('DEBUGGGGGGGGG'+countryVsStateMap);
        countryVsStateMap.get('India').add('Delhi');
        System.debug('DEBUGGGGGGGGG'+countryVsStateMap);
    }
    
}