// load dependencies
const { expect } = require('chai');
// import utilities from OZ test helpers
const { BN, expectEvent, expectRevert } = require('@openzeppelin/test-helpers');
// load compiled artifacts
const TestToken = artifacts.require('TestToken');

// start test block
contract('TestToken', function() {
  const assignedCap      = new BN('100000000000000000000000000'); // 100 mil ** 18
  const assignedDecimals = new BN('18');
  const supplyAtCreation = new BN('10000000000000000000000000')

  beforeEach(async function() {
    // deploy a new TestToken for each test
    this.testToken = await TestToken.new();
  });

  it('ensure max cap is 100 million tokens', async function() {
    expect(await this.testToken.cap()).to.be.bignumber.equal(assignedCap);
  });

  it('ensure 18 decimals', async function() {
    expect(await this.testToken.decimals()).to.be.bignumber.equal(assignedDecimals);
  });

  it('ensure 10 million tokens are minted at creation', async function() {
    expect(await this.testToken.totalSupply()).to.be.bignumber.equal(supplyAtCreation);
  });
})