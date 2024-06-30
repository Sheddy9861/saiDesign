public class CustomExceptionClass {
public static List<Account> checkAccounts(List<Account> accounts)
{
  List<Account> accountsToBeReturned = new List<Account>();
            if(accounts.size() == null){
                throw new AccountException('accounts should not be null');
            }
            for(Account eachAccount : accounts){
                if(eachAccount.BillingCity == null){
                    throw new AccountException('Invalid BillingCity');
                }else{
                    accountsToBeReturned.add(eachAccount);
                }
            }
        return accountsToBeReturned;
}

//do not remove the following custom-defined exception
public class AccountException extends Exception {}
}