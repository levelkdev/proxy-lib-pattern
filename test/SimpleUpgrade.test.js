/* global describe it artifacts */

import { expect } from 'chai'
import { web3 } from './helpers/w3'

const accounts = web3.eth.accounts

const SimpleStorageLib = artifacts.require('SimpleStorageLib')

const SimpleV0 = artifacts.require('SimpleV0')
const SimpleV1 = artifacts.require('SimpleV1')
const SimpleCore = artifacts.require('SimpleCore')

describe('SimpleUpgrade', () => {
  it.only('bare bones contract upgradability, here we go!', async () => {
    const simpleStorageLib = await SimpleStorageLib.new()

    SimpleCore.link('SimpleStorageLib', simpleStorageLib.address)
    const simpleCore = await SimpleCore.new()

    SimpleV0.link('SimpleStorageLib', simpleStorageLib.address)
    const simpleV0 = await SimpleV0.new()

    console.log('upgradeTo v0')
    await simpleCore.upgradeTo('v0', simpleV0.address)

    const simpleCoreV0 = await SimpleV0.at(simpleCore.address)

    console.log('setThing()')
    await simpleCoreV0.setThing()
    console.log('thing: ', (await simpleCoreV0.getThing()).toNumber())

    console.log('')

    console.log('upgradeTo v1')
    SimpleV1.link('SimpleStorageLib', simpleStorageLib.address)
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
  })
})
