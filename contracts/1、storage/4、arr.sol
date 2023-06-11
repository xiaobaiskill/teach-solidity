// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Arr {
    uint256[] public nums; // 0x0 or bytes32[] 

    uint8[] public nums8s; // 0x1

    uint120[] public nums128s; // 0x2

    string[] public strs; // slot: 0x3

    // [5,6,7,8]
    // len: solt
    // 0: keccak(solt) + 0: 
    // 1: keccak(solt) + 1
    // ....
    // n: keccak(solt) + n
    function setNums(uint256[] calldata _nums) external {
        nums = _nums;
    }

    // [5,6,7,8]
    // len: solt: 1
    // 0: keccak(solt): 可能存储 32 uint8 
    function setNum8s(uint8[] calldata _nums) external {
        nums8s = _nums;
    }

    // [5,6,7,8]

    // 0 0007
    // len: solt: 2
    // keccak(2):  0000 000000000000000000000000000006 000000000000000000000000000005
    // keccak(2) + 1: 0000 000000000000000000000000000008 000000000000000000000000000007
    function setNums120s(uint120[] calldata _nums) external {
        nums128s = _nums;
    }

    // string[] 不能用 calldata
    // [aaaa,aa,aaa] (都是小于 31 bytes 的元素)
    // out:
        // slot: 0x3
        // keccak(slot): 0x6161616100000000000000000000000000000000000000000000000000000008
        // keccak(slot)+1: 0x6161000000000000000000000000000000000000000000000000000000000004
        // keccak(slot)+2: 0x6161610000000000000000000000000000000000000000000000000000000006

    // [aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa,bb,cc] (第一个元素超过了31bytes)
    // slot: 0x3(数组长度)
    // keccak(slot): 0x41 (65)         // 第0个元素 (因为第0个元素长度超过了31bytes, 所以实际数据存储在当前keccak(key)上)
    //  	keccak(keccak(slot)) : 0x6161616161616161616161616161616161616161616161616161616161616161 	   // 第0 个元素的数据
    // keccak(slot) + 1: 0x6262000000000000000000000000000000000000000000000000000000000004               // 第1个元素的数据
    // keccak(slot) + 2: 0x6363000000000000000000000000000000000000000000000000000000000004               // 第2个元素的数据


    function setStrs(string[] memory _str) external {
        strs = _str;
    }
}
