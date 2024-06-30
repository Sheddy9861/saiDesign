/*The method industrySummary takes as input a list of accounts with Industry and AnnualRevenue fields populated. 
The method should sum up annual revenue by each industry and return a Map with each industry as a key, and sum of 
annual revenue for that industry as the value.
For example, given the following accounts:

a1
Name: 'Acme Enterprises'
Industry: 'Banking'
AnnualRevenue: 550,000
a2
Name: 'Universal Containers'
Industry: 'Retail'
AnnualRevenue: 200,000
a3
Name: 'SForce Capital'
Industry: 'Banking'
AnnualRevenue: 450,000
The method call industrySummary(new List {a1, a2, a3}) should return a map containing the following key/value pairs:

'Retail' -> 200,000
'Banking' -> 1,000,000
*/
public class ApexProblems {
    public static Map<String, Decimal> industrySummary(List<Account> accounts){
        Map<String, Decimal> industryVSRevenue = new Map<String, Decimal>();
        for(Account eachAccount : accounts){
            if(!industryVSRevenue.containskey(eachAccount.Industry)){
                industryVSRevenue.put(eachAccount.Industry , eachAccount.AnnualRevenue);
            }else{
                decimal temp;
                temp=eachAccount.AnnualRevenue + industryVSRevenue.get(eachAccount.Industry);
                industryVSRevenue.put(eachAccount.Industry, temp);
            }
            
        }
        System.debug('MAP HAS::::'+industryVSRevenue);
        return industryVSRevenue;
    }
    public static Map<String,List<Case>> casesByType(List<Case> cases) {
        Map<String,List<Case>> caseTypeVsCases = new Map<String,List<Case>>();
        List<Case> caseList = new List<Case>();
        for(Case eachCase : cases){
            if(eachCase.Type != null){
                if(!caseTypeVsCases.containskey(eachCase.Type)){
                    caseTypeVsCases.put(eachCase.Type, new List<Case>{eachCase});
                }else{
                    caseTypeVsCases.get(eachCase.Type).add(eachCase);
                }
            }
        }
        
        System.debug('DEBUGGG::'+caseTypeVsCases);
        return caseTypeVsCases;
    }
}