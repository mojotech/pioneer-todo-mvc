Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^I activate edit mode$/, ->
    new @Widgets.TodoList()
    .edit(0)

  @Given /^clear the input$/, ->
    new @Widgets.InputEdit()
    .clear()

  @Then /^an input will be brought forward$/, ->
    @W.isVisible({selector: "input.edit"})
    .should.eventually.eql(true)

  @Then /^the input will be focused$/, ->
    @driver.switchTo().activeElement().then (el) =>
      new @Widget({
        el: el
      })
      .getValue().should.eventually.eql("new todo")

  @Then /^the toggle button will be hidden$/, ->
    new @Widgets.TodoList()
    .checkButtonVisibility(0, "input.toggle")
    .should.eventually.eql(false)

  @Then /^the destroy button will be hidden$/, ->
    new @Widgets.TodoList()
    .checkButtonVisibility(0, "button.destroy")
    .should.eventually.eql(false)

  @Given /^I fill the input with something$/, ->
    new @Widgets.InputEdit()
    .append("addition")

  @Given /^press enter$/, ->
    new @Widgets.InputEdit()
    .sendKeys(Driver.Key.ENTER)

  @Given /^click elsewhere$/, ->
    @W.click({selector: "#footer"})

  @Then /^it should be saved$/, ->
    @W.getValue({selector: "input.edit"})
    .should.eventually.eql("new todo addition")

  @Given /^press escape$/, ->
    new @Widgets.InputEdit()
    .sendEscape()

  @Then /^it should be unchanged$/, ->
    @W.getValue({selector: "input.edit"})
    .should.eventually.eql("new todo")

  @Given /^I fill the input with something untrimmed$/, ->
    new @Widgets.InputEdit()
    .append({
      value:[
        "addition",
        Driver.Key.SPACE,
        Driver.Key.SPACE,
        Driver.Key.SPACE
      ]
    })

  @Then /^it should be trimmed upon save$/, ->
    new @Widgets.TodoList()
    .readAt(0).should.eventually.eql("new todo addition")

  @Then /^the editing class should be removed from parent li$/, ->
    new @Widgets.TodoList()
    .isEditing(0)
    .should.eventually.eql(false)

  @Given /^delete the text from the input$/, ->
    new @Widgets.InputEdit()
    .find().then (el) -> el.clear()

  @Then /^it should be removed$/, ->
    @W.isVisible({selector: "#todo-list"})
    .should.eventually.eql(false)
