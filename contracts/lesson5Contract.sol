pragma solidity ^0.4.0;

    /** 6. In this lession we will be learning how to contact contract to contract.
     * strings are dynamic arrays, you cannot return them outside of the contract
     * so what we have to do is to use the bytes32 format so you have to declare
     * it as a bytes32 variable and return it as a bytes32. It will give you a 
     * hexadecimal number that represents the string. so you will have to convert
     * the hex to a string in the aplication outside the contract.
    **/
    
contract CallerContract {
    CalledContract toBeCalled = new CalledContract();
    
    function getNumber() constant returns(uint){
        return toBeCalled.getNumber();
    }
    
    function getWords() constant returns(bytes32){
        return toBeCalled.getWords();
    }
}

contract CalledContract {
    
    bytes32 words = "hey it worked";
    uint number = 42;
    
    function getNumber() constant returns(uint) {
        return number;
    }
    
    function getWords() constant returns(bytes32) {
        return words;
    }
}

/** 7. In this lession we will be learning how to contact contract to contract.
     * so when we spawn the CallerContract with thew word "new" in it, it will
     * spawn a new version of the calledcontract so here we will change it to where we
     * can talk to that contract in particualar. so first we will deploy the
     * CalledContract and copy the address of that contract in the CallerContract,
     * erase the word "new" and in the parentheseis put the address, so the 
     * next time the contract is deployed its not looking for a new instance
     * its looking at a contract thats allready on the blockchain. you must keep
     * the source code of the CalledContract though or you will get an error.
    **/
    
contract CallerContract {
    CalledContract toBeCalled = CalledContract(0x5e72914535f202659083db3a02c984188fa26e9f);
    
    function getNumber() constant returns(uint){
        return toBeCalled.getNumber();
    }
    
    function getWords() constant returns(bytes32){
        return toBeCalled.getWords();
    }
}

contract CalledContract {
    
    bytes32 words = "hey it worked";
    uint number = 42;
    
    function getNumber() constant returns(uint) {
        return number;
    }
    
    function setNumber(uint _number){
        number = _number;
    }
    
    function getWords() constant returns(bytes32) {
        return words;
    }
}

// so now with the setter I can change the calledContract variable number with the setter
// and then launch the callerContract and it will give me the new value that I changed it
// to on the blockchain.