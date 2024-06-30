// --- Directions
// Given a string, return a new string with the reversed
//   reverse('apple') === 'elppa'
//   reverse('hello') === 'olleh'
//   reverse('Greetings!') === '!sgniteerG'

public class ReverseAString {
    public static String reverseString(String inputString){
        List<Integer> ascciList = new List<Integer>();
        List<Integer> reversedAscciList = new List<Integer>();
        ascciList=inputString.getChars(); //Returns an array of character values(ASCCI Values) that represent the characters in this string.
        for(Integer i=ascciList.size()-1 ; i>=0 ; i--){
                reversedAscciList.add(ascciList[i]);
        }
        String reversedString = String.fromCharArray(reversedAscciList);//Returns a String from the values of the list of integers.
        return reversedString;
    }
}