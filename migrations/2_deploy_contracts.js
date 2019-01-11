var FITSToken = artifacts.require("./FITSToken.sol");
var FITSTokenSale = artifacts.require("./FITSTokenSale.sol");

module.exports = function(deployer) {
  deployer.deploy(FITSToken, 1000000);
  //.then(function() {
    //Token price is 0.001 Ether
    //var tokenPrice = 1000000000000000;
    //return deployer.deploy(FITSTokenSale, FITSToken.address, tokenPrice);
  //});
};
