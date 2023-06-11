// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Strs {

    struct UserInfo {
        // 20 + 2 +  1 = 23 bytes 
        // 20 bytes
        address user; 
        // 2 bytes
        uint16 age;  
        // 1 bytes
        bool sex; 

        // 32 bytes
        uint256 money; 
    }

    // keccak(abi.encode(key,slot)) => UserInfo
    mapping(address => UserInfo) public users;  // 0x0 

    function setBlacklist(address user,uint16 age,bool sex, uint256 money)external{
        users[user] = UserInfo({
            user:user,
            age:age,
            sex: sex,
            money:money
        });
    }
}


/*
{
	"address user": "0xD4Fc541236927E2EAf8F27606bD7309C1Fc2cbee",
	"uint16 age": 10,
	"bool sex": true,
	"uint256 money": "2"
}


key: keccak(abi.encode(0xD4Fc541236927E2EAf8F27606bD7309C1Fc2cbee, 0x0)) =>
    0x000000000000000000000000D4Fc541236927E2EAf8F27606bD7309C1Fc2cbee => address 
      0000000000000000000000000000000000000000000000000000000000000000 => slot
    => 0x6e9a1f01736880462dee0eb8faab3c2d6d975cde44d9ef0eac79ef1012b1d5ed

    
out:
{
	"0x216999892a733bac44c5c2d6acbb717f9b2fde8d786ac522b0a0ae40ecc2679d": {
		"key": "0x6e9a1f01736880462dee0eb8faab3c2d6d975cde44d9ef0eac79ef1012b1d5ed",
		"value": "0x00000000000000000001000ad4fc541236927e2eaf8f27606bd7309c1fc2cbee"
	},
	"0x141795f21bf44e99ff1c7d21e21fefd83314eeecf220659ea4685cd246c33aa9": {
		"key": "0x6e9a1f01736880462dee0eb8faab3c2d6d975cde44d9ef0eac79ef1012b1d5ee",
		"value": "0x0000000000000000000000000000000000000000000000000000000000000002"
	}
}

*/

