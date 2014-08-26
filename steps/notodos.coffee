Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^Footer should be hidden$/, ->
    @W.isVisible({selector: "#footer"})
    .should.eventually.eql(false)

  @Then /^Main should be hidden$/, ->
    @W.isVisible({selector: "#main"})
    .should.eventually.eql(false)

