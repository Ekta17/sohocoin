// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

  error NotOwner(string reason);

contract Sohocoin is ERC20, Ownable {

  constructor() ERC20("Soho", "SOHO") Ownable(msg.sender) {
    _mint(msg.sender, 1000000 * 10 ** decimals());
  }

  function mint(address to, uint256 amount) public onlyOwner {
    if(msg.sender != owner()){
      revert NotOwner("You do not have permission to mint Soho!");
    }
    _mint(to, amount);
  }

  function burn(uint256 amount) public {
    if(msg.sender != owner()){
      revert NotOwner("You do not have permission to burn Soho!");
    }
    _burn(msg.sender, amount);
  }

}
