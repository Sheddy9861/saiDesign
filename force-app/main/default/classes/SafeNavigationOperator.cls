public class SafeNavigationOperator {
    public String getAccountBillingCityWithSafeNavigation(List<Account> accounts){
        String result = accounts[0].BillingCity?.toUpperCase();
        return result;
    }
}