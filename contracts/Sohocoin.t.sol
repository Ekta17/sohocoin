// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Sohocoin} from "./Sohocoin.sol";
import {Test} from "forge-std/Test.sol";

contract SohocoinTest is Test {
  Sohocoin sohocoin;
  address owner;
  address otherUser = address(0x123);

  function setUp() public {
    sohocoin = new Sohocoin();
    owner = address(this);
  }

  function testInitialSupplyMintedToDeployer() public {
    assertEq(sohocoin.balanceOf(address(this)), 1000000 * 10 ** sohocoin.decimals(), "Deployer should have initial supply");
  }

  function testOtherAddressHasZeroBalance() public {
    address other = address(0xBEEF);
    assertEq(sohocoin.balanceOf(other), 0, "Other address should have zero balance");
  }

  function testTokenMetadata() public {
    assertEq(sohocoin.name(), "Soho", "Token name should be Soho");
    assertEq(sohocoin.symbol(), "SOHO", "Token symbol should be SOHO");
    assertEq(sohocoin.decimals(), 18, "Token decimals should be 18");
  }

  function testMintByOwner() public {
    uint256 amount = 500 * 10**sohocoin.decimals();
    sohocoin.mint(owner, amount);
    uint256 balance = sohocoin.balanceOf(owner);
    assertEq(balance, 1000000 * 10**sohocoin.decimals() + amount, "Mint by owner should increase balance");
  }

  function testMintByNonOwner() public {
    vm.prank(otherUser);  // Next call is from otherUser address
    (bool success, ) = address(sohocoin).call(
      abi.encodeWithSignature("mint(address,uint256)", otherUser, 100));
    assertEq(success, false, "Mint by non-owner should fail");
  }

  function testBurnByOwner() public {
    uint256 amount = 500 * 10**sohocoin.decimals();
    sohocoin.burn(amount);
    uint256 balance = sohocoin.balanceOf(owner);
    assertEq(balance, 1000000 * 10**sohocoin.decimals() - amount, "Burn by owner should decrease balance");
  }

  function testBurnByNonOwner() public {
    vm.prank(otherUser);  // Next call is from otherUser address
    (bool success, ) = address(sohocoin).call(
      abi.encodeWithSignature("burn(uint256)", 100));
    assertEq(success, false, "Burn by non-owner should fail");
  }

}
