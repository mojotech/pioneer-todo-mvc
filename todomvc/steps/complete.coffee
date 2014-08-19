Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I add three todos to the list$/, ->
    new @Widgets.NewTodo()
    .sendKeys(
      "todo 1",
      Driver.Key.ENTER,
      "todo 2",
      Driver.Key.ENTER,
      "todo 3",
      Driver.Key.ENTER
    )

  @When /^I complete one todo$/, ->
    new @Widgets.TodoList()
    .clickAt({
      index: 1,
      selector: "input"
    })

  @When /^I click the toggle all button$/, ->
    new @Widgets.ToggleAll()
    .click()

  @Then /^all todos should be the same state as the toggle button$/, ->
    new @Widgets.ToggleAll()
    .getAttribute("checked").then (value) =>
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
    W.clickAt({selector: "input", index: 0}).then ->
      W.clickAt({selector: "input", index: 1})

  @When /^I click clear completed$/, ->
    new @Widgets.ClearCompleted()
    .click()

