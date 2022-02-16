pragma solidity "0.8.11";

contract Faucet
{

  //Give out ether to anybody who requests
  function withdraw(uint withdraw_amount) public
  {
    //Limit withdraw amount to 0.1 Eth (100,000,000,000,000,000 wei)
    require(withdraw_amount <= 100000000000000000);

    //send amount to address who requested
    payable(msg.sender).transfer(withdraw_amount);
  }

  //`external` uses less gas than `public`
  //public should only be used if called both externally and internally

  //fallback function: accept any incoming amount with call data
  fallback() external payable {}

  //receive function: accept any incoming amount without call data
  receive() external payable {}
}
