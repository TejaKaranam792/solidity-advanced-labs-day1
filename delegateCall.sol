//SPDX-License-Identifier:MIT
pragma solidity ^0.8.26;

contract delegate{
    uint public num;
    function execute(address _b)public{
        (bool ok,)=_b.delegatecall(abi.encodeWithSignature("setNum(uint)",42));
        require(ok,"failed");
    }
}

contract b{
    uint public num;
    function setNum(uint _b)public{
        num=_b;
    }
}