// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Strs {
    string public str; // slot: 0x0
    // 和bytes 一致
    
    // in: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa (31 bytes)
    // out: 0x616161616161616161616161616161616161616161616161616161616161613e 


    // in: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa (32 bytes)
    // out:
        // slot: 0x41 = 65 
        // keccak(slot): 0x6161616161616161616161616161616161616161616161616161616161616161

    function setStr(string calldata _str)external{
        str = _str;
    }
}
