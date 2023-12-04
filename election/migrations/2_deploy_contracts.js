// migrations/2_deploy_contracts.js
const MissingDiaries = artifacts.require("MissingDiaries");

module.exports = function (deployer) {
  deployer.deploy(MissingDiaries);
};

