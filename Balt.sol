pragma solidity ^0.5.1;

import "./SafeMath.sol";

contract Balt{
  
  
  using SafeMath for uint256;
  address payable public beneficiary;
  uint256 public releaseTime;

  modifier OnlyBalt { require (msg.sender == //adress);
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
