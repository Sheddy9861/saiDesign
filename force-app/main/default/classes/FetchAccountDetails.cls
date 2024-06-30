public class FetchAccountDetails {
	@InvocableMethod(label='Get Contact Details' description='Get Contacts from Account Name' category='Contacts')
    public static List<String> getContactDetails(List<String> names){
        List<String> contactIds= new List<Id>();
        List<Contact> listOfContacts = [SELECT ID FROM Contact WHERE Account.Name IN:names];
        for(Contact eachContact: listOfContacts){
            contactIds.add(eachContact.Id);
        }
        return contactIds;
    }
}