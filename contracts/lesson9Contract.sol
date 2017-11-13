pragma solidity ^0.4.0;

/** 1. event logging and extacting the information will be the theme for this lesson
 *  we are going to create a contract where we can send a transaction to without
 *  spesifying any functions.
 * 
 **/
 
contract transaction {
    
    event senderLogger(address);
    event valueLogger(uint);
    address private owner;
    
    // this is the constructor.
    function transaction() {
        owner = msg.sender;
    }
    
    // this makes it to where only the msg.sender can deposit into the account
    modifier isOwner {
        require(owner == msg.sender);
        _;
    }
    
    // this makes it to where you have to send more than 1 ether minimum.
    // I tested this and you can use require instead of assert I need to know the 
    // difference.
    modifier validValue {
        assert(msg.value >= 1 ether);
        _;
    }

    function isPayable () payable isOwner validValue {
        senderLogger(msg.sender);
        valueLogger(msg.value);
    }
    
    function getValue() constant returns (uint) {
        return this.balance;
    }
    
}


/** Playing around with code and thought this was interesting, I made two contracts
    both have the payable function in them, one is more restricted and one is open
    and i was able to get around the restrictions and make a deposit with the unrestricted ones, 
    I did try and withdraw funds and I was restricted though because the .send function has to 
    have an address attached to it, and that was the msg.sender. 
**/

pragma solidity ^0.4.0;
 
contract restrictedAccessAccountContract {
    
    event senderLogger(address);
    event valueLogger(uint);
    address private owner;
    
    function transaction() {
        owner = msg.sender;
    }
    
    modifier isOwner {
        require(owner == msg.sender);
        _;
    }
    
    modifier validValue {
        require(msg.value >= 1 ether);
        _;
    }

    function () payable isOwner validValue {
        senderLogger(msg.sender);
        valueLogger(msg.value);
    }

    
}

contract opendAccessAccountContract is restrictedAccessAccountContract {
    
    function () payable {
        
    }
        
    function getValue() constant returns (uint) {
        return this.balance;
    }
    
}