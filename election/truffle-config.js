module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,  // Update the port to 8545
      network_id: "*" // Match any network id
    },
    develop: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    }
  },
  compilers: {
    solc: {
      version: "0.5.16",
      // Other solc compiler options...
    }
  }
};

