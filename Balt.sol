pragma solidity ^0.5.1;

import "./SafeMath.sol";

/*
Person n°1 - 13/04/2007
*/


contract Balt{
  
  using SafeMath for uint256;
  address payable public beneficiary;
  uint256 public releaseTime;

  constructor(address payable _beneficiary, uint256 _releaseTime) public payable{
    require(_releaseTime > block.timestamp);
    beneficiary = _beneficiary;
    releaseTime = _releaseTime;
  }

  function release() public {
    require(block.timestamp >= releaseTime);
    address(beneficiary).transfer(address(this).balance);
  }
  
}
