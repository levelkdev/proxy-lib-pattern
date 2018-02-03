/* global describe it artifacts */

import { expect } from 'chai'
import { web3 } from './helpers/w3'

const accounts = web3.eth.accounts

const EternalStorageLib = artifacts.require('EternalStorageLib')

const SimpleV0 = artifacts.require('SimpleV0')
const SimpleV1 = artifacts.require('SimpleV1')
const SimpleV2 = artifacts.require('SimpleV2')
const SimpleCore = artifacts.require('SimpleCore')

describe('SimpleUpgrade', () => {
  it('bare bones contract upgradability, here we go!', async () => {
    const eternalStorageLib = await EternalStorageLib.new()

    SimpleCore.link('EternalStorageLib', eternalStorageLib.address)
    const simpleCore = await SimpleCore.new()

    SimpleV0.link('EternalStorageLib', eternalStorageLib.address)
    const simpleV0 = await SimpleV0.new()

    console.log('upgradeTo v0')
    await simpleCore.upgradeTo('v0', simpleV0.address)

    const simpleCoreV0 = await SimpleV0.at(simpleCore.address)

    console.log('setThing()')
    await simpleCoreV0.setThing()
    console.log('thing: ', (await simpleCoreV0.getThing()).toNumber())

    console.log('')

    console.log('upgradeTo v1')
    SimpleV1.link('EternalStorageLib', eternalStorageLib.address)
    const simpleV1 = await SimpleV1.new()
    await simpleCore.upgradeTo('v1', simpleV1.address)
    const simpleCoreV1 = await SimpleV1.at(simpleCore.address)

    console.log('incrementThing()')
    await simpleCoreV1.incrementThing()
    console.log('thing: ', (await simpleCoreV1.getThing()).toNumber())

    console.log('')

    console.log('setOther()')
    await simpleCoreV1.setOther()
    console.log('other: ', (await simpleCoreV1.getOther()).toNumber())

    console.log('upgradeTo v2')
    SimpleV2.link('EternalStorageLib', eternalStorageLib.address)
    const simpleV2 = await SimpleV2.new()
    await simpleCore.upgradeTo('v2', simpleV2.address)
    const simpleCoreV2 = await SimpleV2.at(simpleCore.address)

    /* const acct1 = '0x3284e1ca52b1bd5428e69ecbfe164f8e68baf4c1'
    const acct2 = '0x62d82601d171e07b73145ea9246c6d4f9b1f2d70'
    console.log(`add balances[${acct1}] = 4000`)
    simpleCoreV2.setBalance(acct1, 4000)
    console.log(`add balances[${acct2}] = 6500`)
    simpleCoreV2.setBalance(acct2, 6500)

    console.log(`balances[${acct1}]: `, (await simpleCoreV2.getBalance(acct1)).toNumber())
    console.log(`balances[${acct2}]: `, (await simpleCoreV2.getBalance(acct2)).toNumber())  */

    console.log('')
    console.log('account: ', accounts[0])
    console.log('buy: ', 0.02 * 10 ** 18)
    await simpleCoreV2.buy({ value: 0.02 * 10 ** 18 })
    console.log(`balances[${accounts[0]}] = `, (await simpleCoreV2.getSenderBalance()).toNumber())
  })
})
