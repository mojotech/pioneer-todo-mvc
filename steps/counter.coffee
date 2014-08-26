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
    @W.read({selector: "#todo-count"})
    .should.eventually.eql("0 items left")

  @Then /^I should see one item$/, ->
    @W.read({selector: "#todo-count"})
    .should.eventually.eql("1 item left")

  @Then /^I should see three items$/, ->
    @W.read({selector: "#todo-count"})
    .should.eventually.eql("3 items left")

