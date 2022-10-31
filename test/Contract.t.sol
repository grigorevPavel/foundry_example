// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Contract.sol";
import "forge-std/Vm.sol";
import "test/utils/RandomAddress.sol";

contract ContractTest is Test, RandomAddress {

    event Add(int256 x, int256 y);
    event Sub(int256 x, int256 y);
   
    Contract testContract;

    function setUp() public {        
        testContract = new Contract();
    }

    function testAdd() public {
        int y=196;
        int256 oldX = testContract.x();
        testContract.add(y);
        int256 newX = testContract.x();
        assertEq(newX - oldX, y);
        
    }
    function testAddEventEmitted() public {
        vm.expectEmit(false, false, false, false);
        emit Add(1, 1);
        testContract.add(1);
    }
    function testAddAllowedAnyAddress() public {
        address newAddress = randomAddress();
        vm.prank(newAddress);
        testContract.add(1);
    }

    function testSub() public {
        int y=196;
        int256 oldX = testContract.x();
        testContract.sub(y);
        int256 newX = testContract.x();
        assertEq(oldX - newX, y);
    }
    function testSubAllowedAnyAddress() public {
        address newAddress = randomAddress();
        vm.prank(newAddress);
        testContract.sub(1);
    }
     function testSubEventEmitted() public {
        vm.expectEmit(false, false, false, false);
        emit Sub(-1, 1);
        testContract.sub(1);
    }
}
