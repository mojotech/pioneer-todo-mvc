Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^I should see three active todos$/, ->

  @Then /^the number of todos should be wrapped in a strong tag$/, ->
    new @Widgets.TodoCount()
    .hasStrongTag()
    .should.eventually.eql(true)

  @Given /^I complete that todo$/, ->
    new @Widgets.TodoList()
    .complete(0)

  @Then /^I should see zero items$/, ->
    new @Widgets.TodoCount()
    .read()
    .should.eventually.eql("0 items left")

  @Then /^I should see one item$/, ->
    new @Widgets.TodoCount()
    .read()
    .should.eventually.eql("1 item left")

  @Then /^I should see three items$/, ->
    new @Widgets.TodoCount()
    .read()
    .should.eventually.eql("3 items left")

