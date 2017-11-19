pragma solidity ^0.4.0;

contract basicContract {
    
    address public owner = msg.sender;
    
    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function payhere() payable {
        
    }
    
    function withdraw(uint amount) isOwner {
        owner.transfer(amount);
    }
    
    function getBallance() constant public returns (uint) {
        return this.balance;
    }
    
}