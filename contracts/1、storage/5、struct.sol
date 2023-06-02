// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Strs {
    enum UserStatus{
        SLEEPING,
        WORKING,
        EATING,
        RESTING
    }
    struct UserInfo {
        address user;
        uint16 age;

        uint256 money;
        UserStatus status; // 如果UserStatus 的状态超过了 255 ,则UserStatus 就会变为 uint16 
        bool sex;

        uint256[] hobby;
    }

    UserInfo public userInfo;

    function setUserStatus(UserInfo memory _userInfo)external{
        userInfo = _userInfo;
    }

}
