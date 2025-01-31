// SPDX-License-Identifier: MIT
pragma solidity >0.8.0 <0.9.0;


contract ClientReceipt{
    event Deposit(
        address indexed _from,
        bytes32 indexed _id,
        uint _value
    );


    function deposit(bytes32 _id) public payable{
        emit Deposit(msg.sender, _id, msg.value);
    }   
}