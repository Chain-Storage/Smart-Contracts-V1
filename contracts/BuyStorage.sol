//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "hardhat/console.sol";

contract BuyStorage {
  struct UserRole {
    address userAddress;
    string role;
  }

  constructor(string memory _role) {
      _role = "standart"; 
  }

  UserRole[] public userRoles;

  function currentRole() public view returns (UserRole[] memory) {
      return userRoles;
  }

  function buyGold() public payable {}

  function buyPreminum() public payable {}
}
