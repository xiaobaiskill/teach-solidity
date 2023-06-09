// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Strs {
    // 元素 <= 255 = 1 bytes; 
    // 65535 >= 元素 >= 256 = 2 bytes;
    enum UserStatus{
        SLEEPING,
        WORKING,
        EATING,
        RESTING
    }

    struct UserInfo {
        // 20 bytes
        address user; // 0x0
        // 2 bytes
        uint16 age;  // 0x0
        // 32 bytes
        uint256 money; // 0x1
        // 1 bytes 
        UserStatus status; // 0x2 // 如果UserStatus 的状态超过了 255 ,则UserStatus 就会变为 uint16 
        // 1 bytes
        bool sex;   // 0x2 

        uint256[] hobby; // 0x3
    }

    UserInfo public userInfo;

    function setUserStatus(address user,uint16 age, uint256 money, UserStatus status,bool sex, uint256[] memory hobby)external{
        userInfo = UserInfo({
            user:user,
            age:age,
            money:money,
            status:status,
            sex:sex,
            hobby:hobby
        });
    }

}


/*
{
	"address user": "0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8",
	"uint16 age": 10,
	"uint256 money": "100",
	"uint8 status": 1,
	"bool sex": true,
	"uint256[] hobby": [
		"1",
		"2",
		"3"
	]
}

0x0: 0x00000000000000000000000ad8b934580fce35a11b58c6d73adee468a2833fa8
0x1: 0x0000000000000000000000000000000000000000000000000000000000000064
0x2: 0x0000000000000000000000000000000000000000000000000000000000000101
0x3: 0x0000000000000000000000000000000000000000000000000000000000000003
0xc2575a0e9e593c00f959f8c92f12db2869c3395a3b0502d05e2516446f71f85b: 1
0xc2575a0e9e593c00f959f8c92f12db2869c3395a3b0502d05e2516446f71f85c: 2
0xc2575a0e9e593c00f959f8c92f12db2869c3395a3b0502d05e2516446f71f85d: 3
*/
