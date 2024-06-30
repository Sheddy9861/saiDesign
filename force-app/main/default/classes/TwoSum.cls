/*
You are given a list of unsorted integers and a target value. If the list contains two values that add up to target, 
return a list containing the indexes of the two numbers. You may not use a number more than once. Every input will have a solution.
Tests will include lists of up to 10,000 members. Only solutions that run in linear time will pass.
Example 1
Input: nums = [2,8,11,15], target = 10 Output: [0,1] nums[0] + nums[1] = 10
Example 2
Input: nums = [6,6,3,22, 1, 11, 56], target = 4 Output: [2,4] nums[2] + nums[4] = 4
*/

public class TwoSum {
    public static List<Integer> twoSumMethod(List<Integer> nums, Integer target) {
        List<Integer> listOfIndices = new List<Integer>();
        Map<Integer, Integer> hashMap = new Map<Integer, Integer>();
        for(Integer i=0; i < nums.size(); i++){
            if(hashMap.containsKey(nums[i])){
                //System.debug('Success');
                listOfIndices.add(hashMap.get(nums[i]));
                listOfIndices.add(i);
            }else{
                hashMap.put(target-nums[i],i);
            }
        }
        return listOfIndices;
    }
}