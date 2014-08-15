Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^I activate edit mode$/, ->
    new @Widgets.TodoList()
    .at(0).then (widget) =>
      widget.doubleClick()

  @Given /^clear the input$/, ->
    new @Widgets.InputEdit()
    .find().then (el) -> el.clear()

  @Then /^the toggle button will be hidden$/, ->
    new @Widgets.TodoList()
    .at(0).then (widget) ->
      widget.isVisible({
        selector: "input.toggle"
      }).should.eventually.eql(false)

  @Then /^the destroy button will be hidden$/, ->
    new @Widgets.TodoList()
    .at(0).then (widget) ->
      widget.isVisible({
        selector: "button.destroy"
      }).should.eventually.eql(false)

  @Given /^I fill the input with something$/, ->
    new @Widgets.InputEdit()
    .fill({
      value:[Driver.Key.SPACE, "addition"]
    })

  @Given /^press enter$/, ->
    new @Widgets.InputEdit()
    .fill({
      value:Driver.Key.ENTER
    })

  @Given /^click elsewhere$/, ->
    new @Widget({
      root: "#footer"
    }).click()

  @Then /^it should be saved$/, ->
    new @Widgets.InputEdit()
    .getValue().should.eventually.eql("new todo addition")

  @Given /^press escape$/, ->
    new @Widgets.InputEdit()
    .fill({
      value:Driver.Key.ESCAPE
    })

  @Then /^it should be unchanged$/, ->
    new @Widgets.InputEdit()
    .getValue().should.eventually.eql("new todo")

  @Given /^I fill the input with something untrimmed$/, ->
    new @Widgets.InputEdit()
    .fill({
      value:[
        Driver.Key.SPACE,
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
    .at(0).then (el) ->
      el.getAttribute("class").then (className) ->
        ((string) ->
          if(string.indexOf("editing") > -1)
            true
          else
            false
        )(className)
        .should.eql(false)

  @Given /^delete the text from the input$/, ->
    new @Widgets.InputEdit()
    .find().then (el) -> el.clear()

  @Then /^it should be removed$/, ->
    new @Widgets.TodoList()
    .isVisible().should.eventually.eql(false)
