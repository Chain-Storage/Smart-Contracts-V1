//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "hardhat/console.sol";

contract BuyStorage {
  struct UserRole {
    address userAddress;
    string role;
    int256 day;
    int256 month;
    int256 year;
  }

  constructor(string memory _role) {
    _role = "standart";
  }

  UserRole[] public userRoles;

  function currentRole() public view returns (UserRole[] memory) {
    return userRoles;
  }

  function buyGold(
    int256 _day,
    int256 _month,
    int256 _year
  ) public payable {
    // require(msg.balance > msg.value)
    UserRole memory userRole;

    userRole.userAddress = msg.sender;
    userRole.role = "gold";
    userRole.day = _day;
    userRole.month = _month;
    userRole.year = _year;

    userRoles.push(userRole);
  }

  function buyPreminum(
    int256 _day,
    int256 _month,
    int256 _year
  ) public payable {
    // require(msg.balance > msg.value);
    UserRole memory userRole;

    userRole.userAddress = msg.sender;
    userRole.role = "preminum";
    userRole.day = _day;
    userRole.month = _month;
    userRole.year = _year;

    userRoles.push(userRole);
  }
}
