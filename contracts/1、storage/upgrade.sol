// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


abstract contract Proxy {
    fallback() external payable {
        _fallback();
    }

    receive() external payable {
        _fallback();
    }

    function _implementation() internal view virtual returns (address);

    function _delegate(address implementation) internal {
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(
                gas(),
                implementation,
                0,
                calldatasize(),
                0,
                0
            )
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }

    function _willFallback() internal virtual {}

    function _fallback() internal {
        _willFallback();
        _delegate(_implementation());
    }
}

contract UpgradeabilityProxy is Proxy {
    bytes32 internal constant IMPLEMENTATION_SLOT =
        0x7050c9e0f4ca769c69bd3a8ef740bc37934f8e2c036e5a723fd8ee048ed3f8c3;

    function _implementation() internal view override returns (address impl) {
        bytes32 slot = IMPLEMENTATION_SLOT;
        assembly {
            impl := sload(slot)
        }
    }

    function upgradeTo(address newImplementation) internal {
        _setImplementation(newImplementation);
    }

    function _setImplementation(address newImplementation) internal {
        bytes32 slot = IMPLEMENTATION_SLOT;
        assembly {
            sstore(slot, newImplementation)
        }
    }
}