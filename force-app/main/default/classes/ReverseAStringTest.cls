@isTest
public class ReverseAStringTest {
	@isTest
    private static void reverseAWordTest(){
        String str ='SAI';
        System.assertEquals('IAS', ReverseAString.reverseString(str));
        String str2 ='apple';
        System.assertEquals('elppa', ReverseAString.reverseString(str2));
    }
}