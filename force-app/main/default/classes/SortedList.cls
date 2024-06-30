public class SortedList {
    public boolean isSorted(List<Integer> numbers) {
        Integer left = 0;
        Integer right = numbers.size() - 1;
        
        //for Ascending Case:::
        if(numbers[left] < numbers[right]){
            while(left < right){
                if(numbers[left + 1] < numbers[left]){
                    return false;
                }
                left++;
            }
        }
        //for Descending Case:::
        if(numbers[left] > numbers[right]){
            while(left < right){
                if(numbers[left + 1] > numbers[left]){
                    return false;
                }
                left++;
            }
        }
        return true;
    }
}