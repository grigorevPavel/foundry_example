// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;
import "forge-std/Test.sol";
contract RandomAddress is Test {
    bytes32 internal nextUser = keccak256(abi.encodePacked("user address"));

    function randomAddress() public returns (address payable) {
        //bytes32 to address conversion
        address payable user = payable(address(uint160(uint256(nextUser))));
        nextUser = keccak256(abi.encodePacked(nextUser));
        return user;
    }
}
