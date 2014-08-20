Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I click completed on the first todo$/, ->
    new @Widgets.TodoList()
    .complete(0)

  @Then /^its parent li should have class completed$/, ->
    new @Widgets.TodoList()
    .isCompleted(0)
    .should.eventually.eql(true)

  @Then /^its complete value should be checked$/, ->
    new @Widgets.TodoList()
    .isChecked(0)
    .should.eventually.eql("true")

  @Then /^I double click it$/, ->
    new @Widgets.TodoList()
    .edit(0)

  @Then /^the todo should be in editing mode$/, ->
    new @Widgets.TodoList()
    .isEditing(0)
    .should.eventually.eql(true)

  @Given /^I hover over it$/, ->
    new @Widgets.TodoList()
    .at(0).then (el) ->
      el.hover()

  @Then /^I should be able to see the remove button$/, ->
    new @Widget({
      root: ".destroy"
    }).isVisible().should.eventually.eql(true)
