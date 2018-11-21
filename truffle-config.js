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
    }
  }
};
