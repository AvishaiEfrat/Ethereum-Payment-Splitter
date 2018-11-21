module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    development: {
        host: 'localhost',
        port: 8545,
        network_id: '*',
        gasLimit: 1000000000
        //gas: 4500000,
        //gasPrice: 1
        //from: "0x3901bdcA595591a1bbE04f66Ed34526198E97172"
    }
  }
};