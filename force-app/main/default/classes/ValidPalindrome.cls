/*
A String is a considered a valid palindrome if it reads the same forwards and backwards. For the purpose of this problem, 
we consider a String to be a valid palindrome if it reads the same forwards and backwards after after converting all characters 
to lowercase, and removing all characters that are not a number or a letter.

Given a String str, return true if is a valid palindrome given the definition above, and return 
false if it is not. Assume that the input will contain only English numbers and letters (0-9, a-z, A-Z) 
along with punctuation and spaces.

Examples:
isPalindrome('A man, a plan, a canal: Panama') returns true

isPalindrome('Panama') returns false
*/

public class ValidPalindrome {
    public static void isPalindrome(String str){
        String processedString = str.replaceAll('[/\\W]', '').toLowerCase();
        System.debug(processedString);
        Boolean isPalindrome = false;
        Integer pointerOne = 0;
        Integer pointerTwo = processedString.length()-1;
        while(pointerOne < pointerTwo){
            if(processedString.charAt(pointerOne) == processedString.charAt(pointerTwo)) {
                pointerOne++;
                pointerTwo--; 
            }
			            
        }
        
        
    }
}