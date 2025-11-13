//SPDX-License-Identifier:MIT
pragma solidity ^0.8.26;

contract Fallback{
    event Received(address sender,uint amount);
    event fallbacks(address sender,uint amount,bytes data);

    receive() external payable{
        emit Received(msg.sender,msg.value);
    }

    fallback()external payable{
        emit fallbacks(msg.sender,msg.value,msg.data);
    }

}