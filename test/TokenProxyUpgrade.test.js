/* global describe it artifacts */

import { expect } from 'chai'
import { web3 } from './helpers/w3'

const accounts = web3.eth.accounts

const TokenV0 = artifacts.require('TokenV0')
const TokenV1 = artifacts.require('TokenV1')
const TokenProxy = artifacts.require('TokenProxy')

describe('TokenProxyUpgrade', () => {
  it.only('token proxy upgrade', async () => {
    const tokenProxy = await TokenProxy.new()
    const tokenV0 = await TokenV0.new()
    await tokenProxy.upgradeTo('v0', tokenV0.address)

    const tokenProxyV0 = await TokenV0.at(tokenProxy.address)
    console.log('_totalSupply: ', (await tokenProxyV0.totalSupply()).toNumber())

    console.log('init()')
    await tokenProxyV0.init()

    console.log('_totalSupply: ', (await tokenProxyV0.totalSupply()).toNumber())
    console.log(`balanceOf(${accounts[0]}): `, (await tokenProxyV0.balanceOf(accounts[0])).toNumber())

    // this will still be 0...
    console.log('TOKEN V0 _totalSupply: ', ((await tokenV0.totalSupply()).toNumber()))
    console.log('')

    console.log('upgrade to v1 mintable')
    const tokenV1 = await TokenV1.new()
    await tokenProxy.upgradeTo('v1', tokenV1.address)
    const tokenProxyV1 = await TokenV1.at(tokenProxy.address)

    const amt = 2345678
    console.log(`mint ${amt} to ${accounts[1]}`)
    await tokenProxyV1.mint(accounts[1], amt)

    console.log('_totalSupply: ', (await tokenProxyV1.totalSupply()).toNumber())
    console.log(`balanceOf(${accounts[0]}): `, (await tokenProxyV1.balanceOf(accounts[0])).toNumber())
    console.log(`balanceOf(${accounts[1]}): `, (await tokenProxyV1.balanceOf(accounts[1])).toNumber())



    console.log('TOKEN V0 _totalSupply: ', ((await tokenV0.totalSupply()).toNumber()))
    console.log('TOKEN V1 _totalSupply: ', ((await tokenV1.totalSupply()).toNumber()))
  })
})
