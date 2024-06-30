public class Div {
    public static String div(Integer a, Integer b){
        Integer result; 
        try{
            result = a/b;
            return String.valueOf(result); 
        }catch(Exception ex){
            return ex.getMessage();
        }
        
    }
    
}