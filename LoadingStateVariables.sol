pragma solidity ^0.8.0;
contract LoadingStateVariables{
    uint public total;
    // [1,2,3,4,5,6]
    // gas cost : 50012
    function sumIsEvenMoreGasStart(uint[] memory a) public {
        for(uint i=0;i<a.length;i+=1){
            if(a[i]%2 == 0 && a[i] < 99){
                total+=a[i];
            }
        }


    }
    // gas cost : 48954
    // reasons for the gas saved : 
    // 1) memory has been changed to calldata as we are just reading the array and calldata saves gas
    // 2) external has been used as we know that it will not be called from inside the contract , this saves some gas as well
    function moreGasSaved(uint[] calldata a)external {
        for(uint i=0;i<a.length;i++){
            if(a[i]%2 == 0 && a[i] < 99){
                total+=a[i];
            }
        }
    }

}