// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DemoV1 {
    uint256 public aa; // 0x0

    function init(){
        aa = 11;
    }
}


contract DemoV2 {
    uint256 public aa; // 0x0

    uint256 public bb; // 0x1

    function init(){
        aa = 11;
    }
}


contract DemoV3 {
    uint256 public aa; // 0x0

    uint256 public bb; // 0x1

    uint256 public cc; // 0x2
    
    struct xx {
        // 20 + 2 = 22 
        address user;
        uint16 age;
    }

    xx public member; // 0x3  22 bytes; left 10 bytes

    address public owner; // 0x4 

    function init(){
        aa = 11;
    }
}


contract DemoV4Fail {
    uint256 public aa; // 0x0

    uint256 public bb; // 0x1

    uint256 public cc; // 0x2
    
    struct xx {
        // 20 + 2 = 22 
        address user;
        uint16 age;
        // left 10 byte

        // 20
        address to;  // 冲突, 实际数据为之前的owner
    }

    xx public member; // 0x3 0x4  22 bytes; left 10 bytes

    address public owner; // 0x5  // 该实际为0地址

    function init(){
        aa = 11;
    }
}






contract DemoV4Success {
    uint256 public aa; // 0x0

    uint256 public bb; // 0x1

    uint256 public cc; // 0x2
    
    struct xx { 
        // left 10 bytes                   age.                       user.                          == 32 bytes // 0x3
        //  00000000000000000000           XXXX        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        // 20 + 2 = 22 
        address user;
        uint16 age;
        // left 10 byte
        // uint80 xxx 

        ///  xxx1             xxx2                age               user                               = 32 bytes 
        //  XXXXXXXXXX      XXXXXXXXXX           XXXX        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        
        uint40 xxx1 
        uint40 xxx2
    }

    xx public member; // 0x3  22 bytes; left 10 bytes

    address public owner; // 0x4 

    address public admin; // 0x5

    function init(){
        aa = 11;
    }
}



contract DemoV5Success {
    uint256 public aa; // 0x0

    uint256 public bb; // 0x1

    uint256 public cc; // 0x2
    
    struct xx { 
        // left 10 bytes                   age.                       user.                          == 32 bytes // 0x3
        //  00000000000000000000           XXXX        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        // 20 + 2 = 22 
        address user;
        uint16 age;
        // left 10 byte
        // uint80 xxx 

        ///  xxx1             xxx2                age               user                               = 32 bytes 
        //  XXXXXXXXXX      XXXXXXXXXX           XXXX        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        
        uint40 xxx1 
        uint40 xxx2
    }

    xx public member; // 0x3  22 bytes; left 10 bytes

    
    address public owner; // 0x4 
    // left 12 byte
    uint96 num; 

    address public admin; // 0x5

    function init(){
        aa = 11;
    }
}
