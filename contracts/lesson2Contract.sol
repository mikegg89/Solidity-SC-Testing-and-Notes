pragma solidity ^0.4.0;

    /** 1. In this contract we are going to learn how to make permission funcions.
        In object oriented programming a contract is like a class and in all classes
        there is something called a constructor, a constructor is a function that 
        will be called at the creation at the instance of the contract, its like
        a blueprint and it will be deployd to the blockchain it will creat a physical
        reprisantation of the blueprint on the chain.
        
        we are going to save the creator of the contract.
    */
    
contract lesson2Contract {
    
    string word = "Hello World";
    address issuer;
    
    // the constructor needs to have the same name as the contract name.
    function lesson2Contract(){
        issuer = msg.sender;
    }
    
    function getWord() constant returns(string) {
        return word;
    }
    
    function setWord(string newWord) returns(string) {
        if(issuer != msg.sender){
            return "this is not the creator";
        }
        else{
            word = newWord;
            return "this is the creator!";
        }
    } 
    
}

    /** 2. In this contract we are going to learn how to make permission funcions
     * but unlike in the last one we are going to add a modifier for the function.
    */
    
contract lesson2Contract {
    
    string word = "Hello World";
    address issuer;
    
    function lesson2Contract(){
        issuer = msg.sender;
    }
    
    // The modifier is kinda like a function but you cannot return somthing so you
    // must do a throw and an else continue with the _;
    modifier ifIssuer(){
        if(issuer != msg.sender){
            throw;
        }
        else{
            _;
        }
    }
    
    function getWord() constant returns(string) {
        return word;
    }
    
    function setWord(string newWord) ifIssuer returns(string) {
        word = newWord;
        return "this is the creator!";
        }
     
    
}