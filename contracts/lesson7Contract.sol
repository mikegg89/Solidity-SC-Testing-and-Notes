pragma solidity ^0.4.0;

    /** 1. now were going to go over access modification and error handling.
     * in our modifier we are using the phrase require(owner == msg.sender); _;
     * because the keyword throw will be taken out of the solidity language in later
     * versions of solidity.
    **/
 
interface Regulator {
    
    
    function checkValue(uint amount) returns(bool);
    function loan() returns(bool);
}
 

contract bank is Regulator {
    
    uint private value;
    address private owner;
    
    // simple modifier that puts constraints on function of choice
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function bank(uint amount) {
        value = amount;
        owner = msg.sender;
    }
    
    // we made it to where the msg.sender is the only one who can deposit and 
    // withdraw funds from the contract.
    function deposit(uint amount) onlyOwner {
        value += amount;
    }
    
    function withdraw(uint amount) onlyOwner {
        if(checkValue(amount)) {
            value -= amount;
        }
    }
    
    function balance() constant returns (uint) {
        return value;
    }

    function loan() returns (bool){
       return value > 0;
    }
    
     function checkValue(uint amount) returns (bool){
       return value >= amount;
    }
    
} 




// 2. ways to handle errors

contract testThrowsContract {
    
    function testAssert() {
        // in this we need to give a logical error like false or 1 == 2 witch is 
        // not true. with assert the gas is always consumed on the send
        assert(1 == 2);
    }
    
    function testRequire() {
        // again we need to pass in a bool value that throws a logical error. require
        // is more of a peramiter requirement, the gas is consumed in the msg but 
        // the opt code thrown for require is actually revert, so in matropolus
        // the gas is no longer consumed with this.. at least he thinks.
        require(1 == 2);
    }
    
    function testRevert() {
        // revert doesnt require any peramiters, you can use it as is. revert should
        // revert the gas that msg, so like in an ICO if you have ran out of coins 
        // to sell you could give back the gas cost to people who try and still
        // buy the coins. so you can also use these functions to penialize people
        // for trying to access functions they should not have access to.
        revert();
    }
    
    function testThrow() {
        // throw is simular to revert but its more of a operation than a function
        // with throw it does consume all the gas.
        throw;
    }
    
}