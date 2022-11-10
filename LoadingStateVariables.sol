pragma solidity ^0.8.0;
contract LoadingStateVariables{
    uint public total;
    
    // gas cost : 50012
    function sumIsEvenMoreGasStart(uint[] memory a) public {
        for(uint i=0;i<a.length;i+=1){
            if(a[i]%2 == 0 && a[i] < 99){
                total+=a[i];
            }
        }


    }

}