Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^Footer should be hidden$/, ->
    new @Widget({
      root: "#footer"
    })
    .isVisible().should.eventually.eql(false)

  @Then /^Main should be hidden$/, ->
    new @Widget({
      root: "#main"
    })
    .isVisible().should.eventually.eql(false)

