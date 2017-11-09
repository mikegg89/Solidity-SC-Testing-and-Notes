pragma solidity ^0.4.0;

    /** 3. In this lession we are going to transfer some Ether to a contract and
     * get some ether from a contract.
     *  We are going to make a payable contract, and send wei which 
     * is the smallest amount of ether you can have, wei is 10 to the power of 18 
     * at the creation of the contract you should never send ether to it, so dont
     * do this in a constructor it will crash.
     * You will need to send ether in a function. payable is a keyword in solidity
     * the funcion is a setter but is a payable setter.
     */

contract PayableContract{
    
    function receiveFunds() payable {
        
    }
    
    // here we are going to create a getter that showes us how much ether is in 
    // the contract. the word "this" is a pointer to the current contract it has
    // other variables other than balance but here we are using balance.
    
    function getter() constant returns(uint){
        return this.balance;
    }
}

 /** 4. In this lession we are going to get some ether from a contract.
     * in solidity it is quite usless to put a return statment in the setters
     * because when you build a Dapp you will not be able to get the return value
     * of the function if its a setter only if its a getter, because when you call
     * a setter function the transaction has to be mined and returned, instead you
     * will get a transaction receipt so if you want a spacific value returned 
     * you should use events.
     *  Here we will be using the send function, the send function is very particular
     * because it can be called on a address. so meaning if you want to send some
     * ether to a address A you need to do something like "A.send" in order to do
     * this you need to know what address to send to so we will set up something
     * like a custodial account, basicly a bank account.
     * We also made a permission so that the msg.sender is the only one who can
     * witdrawFunds from the contract and is the only one who can use the getter 
     * to see the funds in the contract.
     */

contract CustodialContract{
    
    address client;
    bool _switch = false;
    
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
        
    }
    
    function witdrawFunds(uint amount) ifClient {
        if(client.send(amount)){
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


