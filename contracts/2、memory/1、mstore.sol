// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// mstore(mslot, value) => 在 mslot 的地方存储 value (永远都是 32 bytes, 和类型无关) (memory)
// sstore(slot,value)  => 在 slot 的地方存储 value (永远都是 32 bytes, 和类型无关). (storage)
contract yul {
    address owner;
    function set(uint8 user) external  {
        // owner = user;

        assembly{
            // 先将 user 存储至 0xa0 的内存槽中
            mstore(0xa0, user)

            // mload=> 将 0xa0 对应的数据从 内存槽中取出
            // sstore=> 将mload 取出的数据存储至 owner 的slot 中
            sstore(owner.slot, user)
        }
    }

    // function set(uint8 user) external  {
    //     owner =  address(uint160(user));
    // }
}
