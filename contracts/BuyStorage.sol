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

  UserRole[] public userRoles;

  function currentRole() public view returns (UserRole[] memory) {
    return userRoles;
  }

  function getBalance() public view returns (uint256) {
    return address(this).balance;
  }

  function buyGold(
    address payable ownerAddress,
    int256 _day,
    int256 _month,
    int256 _year
  ) external payable {
    // require(msg.balance > msg.value)
    UserRole memory userRole;
    ownerAddress.transfer(5000000000000000);

    userRole.userAddress = msg.sender;
    userRole.role = "gold";
    userRole.day = _day;
    userRole.month = _month;
    userRole.year = _year;

    userRoles.push(userRole);
  }

  function buyPreminum(
    address payable ownerAddress,
    int256 _day,
    int256 _month,
    int256 _year
  ) public payable {
    // require(msg.balance > msg.value);
    ownerAddress.transfer(7000000000000000);

    UserRole memory userRole;
    userRole.userAddress = msg.sender;
    userRole.role = "preminum";
    userRole.day = _day;
    userRole.month = _month;
    userRole.year = _year;

    userRoles.push(userRole);
  }
}
