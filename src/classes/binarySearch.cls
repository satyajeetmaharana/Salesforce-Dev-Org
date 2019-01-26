public class binarySearch{
    public static Boolean findNumber(List<integer> numArr,Integer numToFind,integer left,integer right){
        
        if(numArr.size()==1){
            if(numArr[0]!=numToFind){
                System.debug('NOT FOUND');
                return false;
            }
        }
        
        Integer medianInd = (left+right)/2;
        
        if(numToFind < numArr[medianInd]){
            
            //First half to consider
            return findNumber(numArr,numToFind,left,medianInd);
        }
        else if(numToFind > numArr[medianInd]){
            //Second half to consider
            return findNumber(numArr,numToFind,medianInd+1,right);
        }
        else{
            System.debug('numFound at ' + medianInd);
            return true;
        }
    }
}