 // Get Token Sale instance
 FITSTokenSale.deployed().then(function(i) {tokenSale=i;})
 // Get Token instance
 FITSToken.deployed().then(function(i){token=i;})
 // Set tokens available for sale
 tokensAvailable = 750000;
 // Set Admin
 admin = web3.eth.accounts[0]
 // Transfer tokens to contract
token.transfer(tokenSale.address, tokensAvailable, {from: admin})
