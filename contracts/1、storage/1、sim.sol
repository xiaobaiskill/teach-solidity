// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Sim {
    uint256 num1; // 0x0

    bytes32 bt; // 0x1


    constructor(uint256 _num, bytes32 _bt){
        num1 = _num;
        bt = _bt;
    }
}

contract Sim1 {
    // 1 + 16 = 17 // left 15
    uint8 age; // 1
    uint128 money; // 2

    // uint120 left
    ///       left 15                               money.                    age
    //    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  00000000000000000000000000000002  01
    

    // 20 bytes 
    address owner; // 0x01

    constructor(uint8 _age, uint16 _money){
        age = _age;
        money = _money;
        owner = msg.sender;
    }
}
