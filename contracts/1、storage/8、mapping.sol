// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Strs {
    // keccak(abi.encode(key,slot)) => bool
    mapping(address => bool) public blacklist;  // 0x0 

    function setBlacklist(address user,bool status)external{
        blacklist[user] = status;
    }

    // function blacklistLen() external view returns(uint256){
    //     return blacklist.length;
    // }

}


/*

{
	"address user": "0xaE036c65C649172b43ef7156b009c6221B596B8b",
	"bool status": true
}

abi.encode(key, slot) => 

0x
000000000000000000000000aE036c65C649172b43ef7156b009c6221B596B8b  => address(32bytes) 
0000000000000000000000000000000000000000000000000000000000000000  => slot


keccak(0x000000000000000000000000aE036c65C649172b43ef7156b009c6221B596B8b0000000000000000000000000000000000000000000000000000000000000000) =>
    0x8631799c185780243aab6e1f55d0dfcf47e253d1d3030968b58bfcd9ddde708c


out:
    {
	"0xdf8373491497ba0e696335d2690f08e28ccc79cbb23a1ab9b362e56af475352c": {
		"key": "0x8631799c185780243aab6e1f55d0dfcf47e253d1d3030968b58bfcd9ddde708c",
		"value": "0x0000000000000000000000000000000000000000000000000000000000000001"
	}
}



*/
