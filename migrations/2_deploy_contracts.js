var FITSToken = artifacts.require("./FITSToken.sol");

module.exports = function(deployer) {
  deployer.deploy(FITSToken, 1000000);
};
