public class TwoSumTypeTwo {
    public static List<Integer> twoSumMethod(List<Integer> sortedArray, Integer target){
        List<Integer> listOfIndices = new List<Integer>();
        Integer pointer_one = 0;
        Integer pointer_two = sortedArray.size()-1;
        while(pointer_one < pointer_two){
            Integer sum = sortedArray[pointer_one] + sortedArray[pointer_two];
            if(sum == target){
                listOfIndices.add(pointer_one);
                listOfIndices.add(pointer_two);
                return listOfIndices;
            }else if(sum < target){
                pointer_one++;
            }else{
                pointer_two--;
            }
        }
        return listOfIndices;
    }
}