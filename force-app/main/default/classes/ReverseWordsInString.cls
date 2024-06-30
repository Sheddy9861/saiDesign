/*Given a string that contains a sequence of words separated by spaces, write a method that reverses the order of the characters in each word.
You must maintain white space and the order of the words.
Example 1:
Input: lets learn apex strings

Output: stel nrael xepa sgnirts

Example 2:
Input: DSA is fun

Output: ASD si nuf
*/
public class ReverseWordsInString {
    public static String reverseWords(String str){
        List<String> splitString = str.split(' ');
        Map<String,List<Integer>> mapOfStringVsAscii = new Map<String,List<Integer>>();
        Map<String,List<Integer>> mapOfStringVsReversedAscii = new Map<String,List<Integer>>();
        for(String eachString : splitString){
            mapOfStringVsAscii.put(eachString,eachString.getChars());
        }
        for(String eachString : splitString){
            List<Integer> listOfInts = mapOfStringVsAscii.get(eachString);
            List<Integer> reversedIntegerList = new List<Integer>();
            for(Integer i=listOfInts.size()-1 ; i>=0 ; i--){
				reversedIntegerList.add(listOfInts[i]);
            }
           mapOfStringVsReversedAscii.put(eachString,reversedIntegerList); 
        }
        
        List<String> listOfString = new List<String>();
        for(String eachString : splitString){
            String reversedString = String.fromCharArray(mapOfStringVsReversedAscii.get(eachString));
            listOfString.add(reversedString);
        }
        
		String reversedString = String.join(listOfString, ' ');
 		return reversedString;
        
    }
}