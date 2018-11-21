var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations
    //,{
    //gas: 4500000,
    //gasPrice: 10000000000,
    //from: "0x3901bdcA595591a1bbE04f66Ed34526198E97172"}
    );
};
