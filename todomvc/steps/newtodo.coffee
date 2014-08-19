Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I enter a new todo$/, ->
    new @Widgets.NewTodo()
    .sendKeys("new todo", Driver.Key.ENTER)

  @When /^I enter a new todo with extra spaces$/, ->
    new @Widgets.NewTodo()
    .sendKeys(
      "untrimmed text",
      Driver.Key.SPACE,
      Driver.Key.SPACE,
      Driver.Key.SPACE,
      Driver.Key.ENTER
    )

  @Then /^I enter a new todo that is empty$/, ->
    new @Widgets.NewTodo()
    .sendKeys(
      "",
      Driver.Key.ENTER
    )

  @Then /^it should be appended to the todo list$/, ->
    new @Widgets.TodoList()
    .readAt(0).should.eventually.eql("new todo")

  @Then /^it should not add it to the list$/, ->
    new @Widgets.TodoList()
    .items().then (items) ->
      items.length.should.eql(1)

  @Then /^the input should be cleared$/, ->
    new @Widgets.NewTodo()
    .getValue().should.eventually.eql("")

  @Then /^the input should be trimmed$/, ->
    new @Widgets.TodoList()
    .readAt(0).should.eventually.eql("untrimmed text")

