Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I add three todos to the list$/, ->
    W = new @Widgets.NewTodo()
    W.enter("todo 1").then ->
      W.enter("todo 2").then ->
        W.enter("todo 3")

  @When /^I complete one todo$/, ->
    new @Widgets.TodoList()
    .complete(1)

  @When /^I click the toggle all button$/, ->
    new @Widgets.ToggleAll()
    .click()

  @Then /^all todos should be the same state as the toggle button$/, ->
    new @Widgets.ToggleAll()
    .isChecked().then (value) =>
      state = value
      new @Widgets.TodoList()
      .each((item) ->
        item.getAttribute({selector: "input", attribute: "checked"}).should.eventually.eql(state)
      )

  @When /^I complete all todos$/, ->
    new @Widgets.TodoList()
    .each( (item) ->
      item.click("input")
    )

  @Then /^the toggle-all button should not be checked$/, ->
    new @Widgets.ToggleAll()
    .getAttribute("checked").should.eventually.eql(null)

  @Then /^the toggle-all button should be checked$/, ->
    new @Widgets.ToggleAll()
    .getAttribute("checked").should.eventually.eql("true")

  @When /^I complete two todos$/, ->
    W = new @Widgets.TodoList()
    W.complete(0).then ->
      W.complete(1)

  @When /^I click clear completed$/, ->
    new @Widgets.ClearCompleted()
    .click()

