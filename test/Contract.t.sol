// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Contract.sol";

contract ContractTest is Test {
    Contract testContract;
    function setUp() public {        
        testContract = new Contract();
    }

    function testExample() public {
        bool x = true;
        assertTrue(x);
    }
    function testAdd() public {
        int y=196;
        int256 oldX = testContract.x();
        testContract.add(y);
        int256 newX = testContract.x();
        assertEq(newX - oldX, y);
        
    }
    function testSub() public {
        int y=196;
        int256 oldX = testContract.x();
        testContract.sub(y);
        int256 newX = testContract.x();
        assertEq(newX- oldX, -y);
    }

}
