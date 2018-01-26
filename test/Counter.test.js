/* global describe it beforeEach artifacts */

import { expect } from 'chai'
import { web3 } from './helpers/w3'

const EternalStorageLib = artifacts.require('EternalStorageLib')
const Counter = artifacts.require('Counter')

describe('Counter', () => {
  it('can count', async () => {
    const eternalStorageLib = await EternalStorageLib.new()
    Counter.link('EternalStorageLib', eternalStorageLib.address)
    const counter = await Counter.new()
    await counter.addOne()
    await counter.addOne()
    await counter.addOne()
    const count = await counter.count.call()
    expect(count.toNumber()).to.equal(3)
  })
})
