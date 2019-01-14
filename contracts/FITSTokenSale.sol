pragma solidity >=0.4.21 <0.6.0;

import "./FITSToken.sol";

contract FITSTokenSale {

  address payable admin;
  FITSToken public tokenContract;
  uint256 public tokenPrice;
  uint256 public tokensSold;

  event Sell(address _buyer, uint256 _amount);

  constructor(FITSToken _tokenContract, uint256 _tokenPrice) public {
    // Assign an admin
    admin = msg.sender;
    // Token contract
    tokenContract = _tokenContract;
    // Token price
    tokenPrice = _tokenPrice;
  }

  // multiply
  function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
  }

  // Buy Tokens
  function buyTokens(uint256 _numberOfTokens) public payable {

        // Require that value is equal to tokens
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        // Require that the contract has enough tokens
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
        // Require that a transfer is succesful
        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        tokensSold += _numberOfTokens;

        // Trigger the sell event
        emit Sell(msg.sender, _numberOfTokens);
    }

    // Ending Token FITSTokenSale
    function endSale() public {
        // Require admin.
        require(msg.sender == admin);
        // Transfer remaining FITS tokens to admin.
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));

        // Destroy contract
        // UPDATE: Let's not destroy the contract here
        // Just transfer the balance to the admin
        admin.transfer(address(this).balance);
    }
}
