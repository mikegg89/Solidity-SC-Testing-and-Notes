pragma solidity ^0.4.0;

    /** 5. In this lession I will be learning about events, events are pieces
     * of code you can put inside of functions and it will record something on 
     * the blockchain, this something can be a string, a int, a basic type.
     * we use events to keep a historicle trace of the transactions that a given
     * account/address.
     *  there are two types of accounts in ethereum, the first
     * is type is the user owned account, and the other is a contract witch is 
     * basicly like a user owned account meaning it has some storage for ether 
     * but it has some place to store exicution logic in the form of a smart 
     * contract. events belong in setters not getters, they spawn logs, ethereum
     * is a consensus mechanism so we use events to keep the actual redord.
     */

contract CustodialContract{
    
    address client;
    bool _switch = false;
    
    event updateStatus(string _msg, address user);
    event userStatus(string _msg, address user, uint amount);
    
    function CustodialContract(){
        client = msg.sender;
    }
    
    modifier ifClient(){
        if(msg.sender != client){
            throw;
        }
        _;
    }
    
    function depositFunds() payable {
        userStatus('user has deposited some money', msg.sender, msg.value);
    }
    
    function witdrawFunds(uint amount) ifClient {
        if(client.send(amount)){
            updateStatus("user witdrew some funds", msg.sender);
            _switch = true;
        }
        else{
            _switch = false;
        }
    }
    
    function getFunds() ifClient constant returns(uint){
        return this.balance;
    }
}