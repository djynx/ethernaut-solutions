// SPDX-License-Identifier: UNLICENSED
pragma solidity <0.7.0;

contract Destroy {
    function destroy() public {
        selfdestruct(address(0));
    }
}
