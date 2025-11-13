//SPDX-License-Identifier:MIT
pragma solidity ^0.8.26;

contract b{
    function add(uint _a,uint _b)external pure returns(uint){
        return _a+_b;
    }
}

contract a{
    function get(address B)external returns(uint){
        bytes memory encoded=abi.encodeWithSignature(
            "add(uint,uint)",
            10,
            2
            );
    

        (bool ok,bytes memory result)=B.call(encoded);
        require(ok);

        uint sum=abi.decode(result,(uint));
        return sum;

    }
}