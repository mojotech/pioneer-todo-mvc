Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I enter a new todo$/, ->
    new @Widget({
      root: "#new-todo"
    }).sendKeys("new todo", Driver.Key.ENTER)

  @When /^I enter a new todo with extra spaces$/, ->
    new @Widget({
      root: "#new-todo"
    }).sendKeys(
      "untrimmed text",
      Driver.Key.SPACE,
      Driver.Key.SPACE,
      Driver.Key.SPACE,
      Driver.Key.ENTER
    )

  @Then /^I enter a new todo that is empty$/, ->
    new @Widget({
      root: "#new-todo"
    }).sendKeys(
      "",
      Driver.Key.ENTER
    )

  @Then /^it should be appended to the todo list$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .readAt(0).should.eventually.eql("new todo")

  @Then /^it should not add it to the list$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .items().then (items) ->
      items.length.should.eql(1)

  @Then /^the input should be cleared$/, ->
    new @Widget({
      root: "#new-todo"
    }).getValue().should.eventually.eql("")

  @Then /^the input should be trimmed$/, ->
    new @Widget.List({
      root: "#todo-list"
    }).readAt(0).should.eventually.eql("untrimmed text")

