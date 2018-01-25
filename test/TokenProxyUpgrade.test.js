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
    const tokenV0Proxy = await TokenV0.new()
    await tokenProxy.upgradeTo('v0', tokenV0Proxy.address)

    const tokenV0 = await TokenV0.at(tokenProxy.address)
    console.log('_totalSupply: ', (await tokenV0.totalSupply()).toNumber())

    console.log('init()')
    await tokenV0.init()

    console.log('_totalSupply: ', (await tokenV0.totalSupply()).toNumber())
    console.log(`balanceOf(${accounts[0]}): `, (await tokenV0.balanceOf(accounts[0])).toNumber())

    // this will still be 0...
    console.log('TOKEN V0 PROXY _totalSupply: ', ((await tokenV0Proxy.totalSupply()).toNumber()))
    console.log('')

    console.log('upgrade to v1 mintable')
    const tokenV1Proxy = await TokenV1.new()
    await tokenProxy.upgradeTo('v1', tokenV1Proxy.address)
    const tokenV1 = await TokenV1.at(tokenProxy.address)

    const amt = 2345678
    console.log(`mint ${amt} to ${accounts[1]}`)
    await tokenV1.mint(accounts[1], amt)

    console.log('_totalSupply: ', (await tokenV1.totalSupply()).toNumber())
    console.log(`balanceOf(${accounts[0]}): `, (await tokenV1.balanceOf(accounts[0])).toNumber())
    console.log(`balanceOf(${accounts[1]}): `, (await tokenV1.balanceOf(accounts[1])).toNumber())
    console.log('TOKEN V1 PROXY _totalSupply: ', ((await tokenV1Proxy.totalSupply()).toNumber()))
  })
})
