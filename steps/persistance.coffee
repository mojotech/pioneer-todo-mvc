Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^I should still see three todos$/, ->
    new @Widgets.TodoList()
    .length().should.eventually.eql(3)

  @Given /^that todo should still be complete$/, ->
    new @Widgets.TodoList()
    .isChecked(1)
    .should.eventually.eql("true")

  @Then /^I visit Google$/, ->
    this.driver.get("http://www.google.com")
