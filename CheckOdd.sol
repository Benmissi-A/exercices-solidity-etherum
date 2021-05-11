// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd{
    function check(uint256 number) public pure returns (bool) {
       bool result = number % 2 == 0 ?  true : false ;
       return result;
    }
}