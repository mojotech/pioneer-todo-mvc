Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^I should see two completed todos on the button$/, ->
    new @Widgets.ClearCompleted()
    .read()
    .should.eventually.eql("Clear completed (2)")

  @Then /^the completed todo should be removed$/, ->
    new @Widgets.TodoList()
    .length().should.eventually.eql(2)

  @Then /^the clear completed button should be hidden$/, ->
    new @Widgets.ClearCompleted()
    .isVisible().should.eventually.eql(false)

