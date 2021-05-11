// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract PayableCalculator {
    

    //mapping(address => uint256) private _balances;
    address private _owner;
    uint256 private _ownerBalance;
    uint256 private _countOperation;
    

    constructor(address owner_){
        _owner = owner_;
    }
    
      modifier onlyOwner() {
        require(msg.sender == _owner, "Ownable: Only owner can call this function");
        _;
    }
    
    modifier transaction(){
         require(msg.value == 1e15, "not enough money");
         _setCountOperation() ;
        _ownerBalance += 1e15;
        _;
    }
    
    function add(int256 a,int256 b) public payable transaction returns (int256 ) {
        return a + b;
    }
    
    function sub(int256 a,int256 b) public payable transaction returns (int256) {
   
        return   a - b;
    }
    
    function mul(int256 a,int256 b) public payable transaction returns (int256) {

       return  a * b;
    }
    
    function div(int256 a,int256 b) public payable transaction returns (int256) {
        require(b !=0, "Cal: can not divide by 0");

        return    a / b;
    }
    


// count    
     function countOperation() public view  returns (uint256) {
         return _countOperation;
     }    
 
    
     function _setCountOperation() private {
        _countOperation ++ ;
     }
     
    
     
// payable

    
    function withdrawAll() public onlyOwner {
        require(_ownerBalance > 0,"SmartWallet: can no withdraw 0 ether");
        uint256 amount = _ownerBalance;
        _ownerBalance = 0;
        payable(_owner).transfer(amount);
    }
    
        function total() public view returns (uint256) {
        return address(this).balance;
    }
}