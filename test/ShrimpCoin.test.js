/* global describe it beforeEach artifacts */

import { expect } from 'chai'

const SafeMathLib = artifacts.require('SafeMathLib')
const ERC20Lib1 = artifacts.require('ERC20Lib1')
const ERC20Lib2 = artifacts.require('ERC20Lib2')

const DispatcherStorage = artifacts.require('DispatcherStorage')
const Dispatcher = artifacts.require('Dispatcher')
const ShrimpCoin = artifacts.require('ShrimpCoin')

describe('ShrimpCoin', () => {
  it.only('proxy lib update test', async () => {
    const safeMathLib = await SafeMathLib.new()
    ERC20Lib1.link('SafeMathLib', safeMathLib.address)
    const erc20Lib1 = await ERC20Lib1.new()

    const dispatcherStorage = await DispatcherStorage.new(erc20Lib1.address)

    Dispatcher.unlinked_binary = Dispatcher.unlinked_binary
        .replace('1111222233334444555566667777888899990000',
            dispatcherStorage.address.slice(2))
    const dispatcher = await Dispatcher.new()

    ShrimpCoin.link('ERC20LibInterface', dispatcher.address)
    const shrmp = await ShrimpCoin.new()

    expect((await shrmp.totalSupply()).toNumber()).to.equal(10000)

    ERC20Lib2.link('SafeMathLib', safeMathLib.address)
    const erc20Lib2 = await ERC20Lib2.new()

    await dispatcherStorage.replace(erc20Lib2.address)

    expect((await shrmp.totalSupply()).toNumber()).to.equal(10024)
  })
})
