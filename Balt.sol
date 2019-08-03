pragma solidity ^0.5.1;

import "./SafeMath.sol";

/*
Those (smart) contracts (2) will be use to send automaticaly some eth, to a specific date and address, after a certain amount of time. I will use it as a "saving account" for some of my familly members (2).

Here are some features of those (2) contract :
- There is one contract for each person.
- Only the beneficiary can withdraw the funds.
- Everyone can deposit fund on the smart contract, at any time (Happy Birthday).
- The funds can be withdraw only after the releaseTime.
- You have to set a future releaseTime !
- The releaseTime correspond to the birthday date of the beneficiary : try to guess it if you want ;-)
*/


contract Balt{
  
  
  using SafeMath for uint256;
  address payable public beneficiary;
  uint256 public releaseTime;

  modifier OnlyBalt { require (msg.sender == 0xCae0f3170BD28A73E79752b26f787fBd09f157ef);
  _;
  }

  function () external payable {
  }

  function getBalance()  public view returns (uint) {
    return address(this).balance;
  }
    
  constructor(
    address payable _beneficiary,
    uint256 _releaseTime
  )
    public
    payable
  {
    require(_releaseTime > block.timestamp);
    beneficiary = _beneficiary;
    releaseTime = _releaseTime;
  }

  function release() public {
    require(block.timestamp >= releaseTime);
    address(beneficiary).transfer(address(this).balance);
  }
}
