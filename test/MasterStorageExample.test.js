/* global describe it artifacts */

import { expect } from 'chai'
import { web3 } from './helpers/w3'

const accounts = web3.eth.accounts

const MasterStorage = artifacts.require('MasterStorage')
const ERC20Storage = artifacts.require('ERC20Storage')
const OtherStorage = artifacts.require('OtherStorage')
const MasterStorageEx1 = artifacts.require('MasterStorageEx1')
const MasterStorageEx2 = artifacts.require('MasterStorageEx2')
const MyToken = artifacts.require('MyToken')
const OtherThing = artifacts.require('OtherThing')

describe('MasterStorage Example', () => {
  it('test of master storage contract', async () => {
    const masterStorage = await MasterStorage.new()
    const ex1 = await MasterStorageEx1.new(masterStorage.address)
    await ex1.setNum(26)
    const n = (await ex1.getNum()).toNumber()
    console.log(`n = ${n}`)

    console.log('upgrade to ex2')
    const ex2 = await MasterStorageEx2.new(masterStorage.address)
    await ex1.upgrade(ex2.address)

    try {
      await ex1.getNum()
    } catch (err) {
      console.log('ex1.getNum() failed')
    }

    const n2 = (await ex2.getNum()).toNumber()
    console.log(n2)
  })

  it.only('test of master storage for token with proxy', async () => {
    const masterStorage = await MasterStorage.new()
    const erc20Proxy = await ERC20Storage.new()
    const myToken1 = await MyToken.new(erc20Proxy.address, masterStorage.address, 10 * 10 ** 18)
    const myToken2 = await MyToken.new(erc20Proxy.address, masterStorage.address, 45 * 10 ** 18)

    const otherProxy = await OtherStorage.new()
    const otherThing = await OtherThing.new(otherProxy.address, masterStorage.address, 4455667788)

    console.log('')

    console.log('myToken1:')
    console.log('  totalySupply(): ', (await myToken1.totalSupply()).toNumber())
    console.log('')

    console.log('myToken2:')
    console.log('  totalySupply(): ', (await myToken2.totalSupply()).toNumber())
    console.log('')

    console.log('otherThing:')
    console.log('  amount(): ', (await otherThing.amount()).toNumber())
  })
})
