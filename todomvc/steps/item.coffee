Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I click completed on the first todo$/, ->
    new @Widgets.TodoList()
    .clickAt({
      selector: "input"
      index: 0
    })

  @Then /^its parent li should have class completed$/, ->
    new @Widgets.TodoList()
    .at(0).then (el) ->
      el.getAttribute("class").then (className) ->
        ((string) ->
          if(string.indexOf("completed") > -1)
            true
          else
            false
        )(className)
        .should.eql(true)

  @Then /^its complete value should be checked$/, ->
    new @Widgets.TodoList()
    .at(0).then (el) ->
      el.getAttribute({selector:".toggle", attribute:"checked"}).should.eventually.eql("true")

  @Then /^I double click it$/, ->
    new @Widgets.TodoList()
    .at(0).then (widget) =>
      widget.doubleClick()

  @Then /^the todo should be in editing mode$/, ->
    new @Widgets.TodoList()
    .at(0).then (el) ->
      el.getAttribute("class").then (className) ->
        ((string) ->
          if(string.indexOf("editing") > -1)
            true
          else
            false
        )(className)
        .should.eql(true)

  @Given /^I hover over it$/, ->
    new @Widgets.TodoList()
    .at(0).then (el) =>
      el.hover()

  @Then /^I should be able to see the remove button$/, ->
    new @Widget({
      root: ".destroy"
    }).isVisible().should.eventually.eql(true)
