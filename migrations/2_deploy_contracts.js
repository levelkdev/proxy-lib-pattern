/* global artifacts */

const SafeMathLib = artifacts.require('SafeMathLib')
const ERC20Lib = artifacts.require('ERC20Lib')
const ShrimpCoin = artifacts.require('ShrimpCoin')

module.exports = function (deployer) {
  deployer.deploy(SafeMathLib)
  deployer.link(SafeMathLib, ERC20Lib)
  deployer.deploy(ERC20Lib)
  deployer.link(ERC20Lib, ShrimpCoin)
  deployer.deploy(
    ShrimpCoin
  )
}
