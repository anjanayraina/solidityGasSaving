// SPDX-License-Identifier: GPL-3.0
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
    // gas : 48546
    // loading the state variables everytime to the functions takes  more gas 
    // its better to just load it once in a variable and update after doing all the operations 
    function moreMoreGasSaved(uint[] calldata a)external {
        uint _total ;
        for(uint i=0;i<a.length;i++){
            if(a[i]%2 == 0 && a[i] < 99){
                _total+=a[i];
            }
        }
        total = _total;
    }

    // gas : 48538
    // you can save some more gas by doing ++i in the loop iteratoins 
    function moreMoreMoreGasSaved(uint[] calldata a)external {
        uint _total ;
        for(uint i=0;i<a.length;++i){
            if(a[i]%2 == 0 && a[i] < 99){
                _total+=a[i];
            }
        }
        total = _total;
    }
    // gas : 48495
    // save the length of the array in a variable instead of checking after evety iterations
     function finalGasSaved(uint[] calldata a)external {
        uint _total ;
        uint len = a.length;
        for(uint i=0;i<len;++i){
            if(a[i]%2 == 0 && a[i] < 99){
                _total+=a[i];
            }
        }
        total = _total;
    }
}