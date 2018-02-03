/* global describe it artifacts */

import { expect } from 'chai'
import { web3 } from './helpers/w3'

const accounts = web3.eth.accounts

const MasterStorage = artifacts.require('MasterStorage')
const MasterStorageEx1 = artifacts.require('MasterStorageEx1')

describe('MasterStorage Example', () => {
  it.only('test of master storage contract', async () => {
    const masterStorage = await MasterStorage.new()
    const ex1 = await MasterStorageEx1.new(masterStorage.address)
    await ex1.setNum(26)
    const n = (await ex1.getNum()).toNumber()
    console.log(`n = ${n}`)
  })
})
