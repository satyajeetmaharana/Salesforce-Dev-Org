public class mergeSort{
    
    static integer iteration=0; 
    
    public static List<Integer> sort(List<Integer> arr,Integer left,Integer right){
        if(left<right){
            Integer middle = (left+right)/2;
            
            List<Integer> leftArray = new List<integer>();
            List<Integer> rightArray = new List<integer>();
            for(integer i=left;i<middle+1;i++){
                leftArray.add(arr[i]);
            }
            for(integer i=middle+1;i<=right;i++){
                rightArray.add(arr[i]);
            }
            
            System.debug('@@ middle --> ' + middle);
            System.debug('@@ iteration --> ' + iteration);
            System.debug('@@ leftArray --> ' + leftArray);
            System.debug('@@ rightArray --> ' + rightArray);
            
            
            leftArray = sort(leftArray,left,middle);        
            rightArray = sort(rightArray,middle+1,right);
            System.debug('@@ after sort leftArray --> ' + leftArray);
            System.debug('@@ after sort rightArray --> ' + rightArray);
            
            List<integer> mergedArray = mergeArr(leftArray,rightArray);
            System.debug('@@ mergedArray --> ' + mergedArray);
            
            return mergedArray;
        }
        else{
            return arr;
        }
    }

    public static List<Integer> mergeArr(List<Integer> leftArray, List<Integer> rightArray){
        Integer leftLen = leftArray.size();
        Integer rightLen = rightArray.size();
        
        List<Integer> mergedArray = new List<Integer>();
        
        Integer left = 0;
        Integer right = 0;
        
        Integer index = 0;
        
        for(Integer i=0;i<(leftLen+rightLen);i++){
            if(left<leftLen && right<rightLen){
                if(leftArray[left]<rightArray[right]){
                    System.debug('@@left --->'+left );
                    System.debug('@@index --->'+index );
                    mergedArray.add(leftArray[left]);
                    left++;
                    index++;
                }
                else if(leftArray[left]>rightArray[right]){
                    System.debug('@@right --->'+right );
                    System.debug('@@index --->'+index );
                    mergedArray.add(rightArray[right]);
                    right++;
                    index++;
                }
            }
        }
        
        //leftovers
        while(left<leftLen){
            System.debug('@@left in leftovers --->'+left );
            System.debug('@@index in leftovers --->'+index );
            mergedArray.add(leftArray[left]);
            index++;
            left++;
        }
        while(right<rightLen){
            System.debug('@@right in leftovers --->'+right );
            System.debug('@@index in leftovers --->'+index );
            mergedArray.add(rightArray[right]);
            index++;
            right++;
        }
        iteration++;
        return mergedArray;
    }
    
}