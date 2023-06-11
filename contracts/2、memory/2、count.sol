// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// mstore(mslot, value) => 在 mslot 的地方存储 value (永远都是 32 bytes, 和类型无关) (memory)
// sstore(slot,value)  => 在 slot 的地方存储 value (永远都是 32 bytes, 和类型无关). (storage)
contract yul {
    address owner;
    
    function add(uint256 num1, uint8 num2) external pure returns(uint256 res) {
        assembly{
           res := add(num1, num2)
        }
    }

    function sub(uint256 num1, uint8 num2) external pure returns(uint256 res) {
        assembly{
           res := sub(num1, num2)
        }
    }

    function mul(uint256 num1, uint8 num2) external pure returns(uint256 res) {
        assembly{
           res := mul(num1, num2)
        }
    }

    function div(uint256 num1, uint8 num2) external pure returns(uint256 res) {
        assembly{
           res := div(num1, num2)
        }
    }
}
