Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^Footer should be hidden$/, ->
    W = new @Widget({
      root: "#footer"
    })
    if(W.isPresent())
      # console.log('present')
      W.isVisible().should.eventually.eql(false)

  @Then /^Main should be hidden$/, ->
    W = new @Widget({
      root: "#main"
    })
    if(W.isPresent())
      # console.log('present')
      W.isVisible().should.eventually.eql(false)

