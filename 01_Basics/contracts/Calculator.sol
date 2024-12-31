// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Calculator {
    uint256 public result =0;
    function add (uint256 num)public  {
        result = result+num;
        

    }
    function sub  (uint256 num)public  {
        result = result-num;


    }
    function mul (uint256 num)public  {
        result = result*num;


    }

    function get() public view returns (uint256){
        return result;
    }

}