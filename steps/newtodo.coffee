Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I enter a new todo$/, ->
    new @Widgets.NewTodo()
    .enter("new todo")

  @When /^I enter a new todo with extra spaces$/, ->
    new @Widgets.NewTodo()
    .enter([
      "untrimmed text",
      Driver.Key.SPACE,
      Driver.Key.SPACE,
      Driver.Key.SPACE
    ])

  @Then /^I enter a new todo that is empty$/, ->
    new @Widgets.NewTodo()
    .enter("")

  @Then /^it should be appended to the todo list$/, ->
    new @Widgets.TodoList()
    .readAt(0).should.eventually.eql("new todo")

  @Then /^it should not add it to the list$/, ->
    new @Widgets.TodoList()
    .length().should.eventually.eql(1)

  @Then /^the input should be cleared$/, ->
    new @Widgets.NewTodo()
    .getValue().should.eventually.eql("")

  @Then /^the input should be trimmed$/, ->
    new @Widgets.TodoList()
    .readAt(0).should.eventually.eql("untrimmed text")

