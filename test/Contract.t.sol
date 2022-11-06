// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Variable.sol";
import "forge-std/Vm.sol";
import "test/utils/RandomAddress.sol";

contract VariableTest is Test, RandomAddress {

    event Add(int256 x, int256 y);
    event Sub(int256 x, int256 y);
    event Div(int256 x, int256 y);
   
    Variable testVariable;

    function setUp() public {        
        testVariable = new Variable(0);
    }

    function testAdd() public {
        int y=196;
        int256 oldX = testVariable.x();
        testVariable.add(y);
        int256 newX = testVariable.x();
        assertEq(newX - oldX, y);
        
    }
    function testAddEventEmitted() public {
        vm.expectEmit(false, false, false, false);
        emit Add(1, 1);
        testVariable.add(1);
    }
    function testAddAllowedAnyAddress() public {
        address newAddress = randomAddress();
        vm.prank(newAddress);
        testVariable.add(1);
    }

    function testSub() public {
        int y=196;
        int256 oldX = testVariable.x();
        testVariable.sub(y);
        int256 newX = testVariable.x();
        assertEq(oldX - newX, y);
    }
    function testSubAllowedAnyAddress() public {
        address newAddress = randomAddress();
        vm.prank(newAddress);
        testVariable.sub(1);
    }
    function testSubEventEmitted() public {
        vm.expectEmit(false, false, false, false);
        emit Sub(-1, 1);
        testVariable.sub(1);
    }

    function testDiv() public {
        testVariable.add(10);
        int y = 2;
        int256 oldX = testVariable.x();

        testVariable.div(y);
        int256 newX = testVariable.x();

        assertEq(oldX / y, newX);
    }

    function testDivAllowedAnyAddress() public {
        address newAddress = randomAddress();
        vm.prank(newAddress);
        testVariable.div(1);
    }

    function testDivEventEmitted() public {
        vm.expectEmit(false, false, false, false);
        emit Div(0, 1);
        testVariable.div(1);
    }

    function testDivEdgeCase() public {
        int256 y = 0;
        vm.expectRevert(bytes("Error: Division by zero"));
        testVariable.div(y);
    }
}
