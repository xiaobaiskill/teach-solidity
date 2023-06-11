// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// enum 和 struct 只有在使用的时,才会分配slot. 不使用不分配 slot
// 只是定义了 一种新的数据类型
contract Strs {
    // 元素 <= 255 = 1 bytes; 
    // 65535 >= 元素 >= 256 = 2 bytes;
    enum UserStatus{
        SLEEPING, // 0
        WORKING,  // 1
        EATING,
        RESTING
    }

    struct UserInfo {
        // 20 bytes
        address user; // 0x1
        // 2 bytes
        uint16 age;  // 0x1
        // 32 bytes
        uint256 money; // 0x2
        // 1 bytes 
        UserStatus status; // 0x3 // 如果UserStatus 的状态超过了 255 ,则UserStatus 就会变为 uint16 
        // 1 bytes
        bool sex;   // 0x3

        uint256[] hobby; // 0x4 
    }

    /*

 优化gas后的 定义方案   
    struct UserInfo {
        // 20 + 2 + 1 + 1 = 24 bytes  = left 8 bytes
        // 20 bytes
        address user; 
        // 2 bytes
        uint16 age;  
        // 1 bytes 
        UserStatus status; 
        // 1 bytes
        bool sex; 

        // left 8 bytes  
        // uint64 // 如果升级的话,还可以使用 

        // 32 bytes
        uint256 money; //
    
        uint256[] hobby;
    }
    
    */

    uint256 public number; // 0

    UserInfo public userInfo;

    constructor(){
        number = 1;
    }

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
0x0: 1
0x1: 0x00000000000000000000000ad8b934580fce35a11b58c6d73adee468a2833fa8
0x2: 0x0000000000000000000000000000000000000000000000000000000000000064
0x3: 0x0000000000000000000000000000000000000000000000000000000000000101
0x4: 0x0000000000000000000000000000000000000000000000000000000000000003
0x8a35acfbc15ff81a39ae7d344fd709f28e8600b4aa8c65c6b64bfe7fe36bd19b: 1
0x8a35acfbc15ff81a39ae7d344fd709f28e8600b4aa8c65c6b64bfe7fe36bd19c: 2
0x8a35acfbc15ff81a39ae7d344fd709f28e8600b4aa8c65c6b64bfe7fe36bd19d: 3
*/
