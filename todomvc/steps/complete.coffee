Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I add three todos to the list$/, ->
    new @Widget({
      root: "#new-todo"
    }).sendKeys(
      "todo 1",
      Driver.Key.ENTER,
      "todo 2",
      Driver.Key.ENTER,
      "todo 3",
      Driver.Key.ENTER
    )

  @When /^I complete one todo$/, ->
    new @Widget.List({
      root: "#todo-list"
    }).clickAt({
      index: 1,
      selector: "input"
    })

  @When /^I click the toggle all button$/, ->
    new @Widget({
      root: "#toggle-all"
    }).click()

  @Then /^all todos should be the same state as the toggle button$/, ->
    # new @Widget({
    #   root: "#toggle-all"
    # }).getAttribute("checked").then (value) =>
    #   state = value
    #   new @Widget.List({
    #     root: "#todo-list"
    #   })
    #   .each((item) ->
    #     item.getAttribute({selector: "input", attribute: "checked"}).should.eventually.eql(state)
    #   )
################NEED GET ATTRIBUTE

  @When /^I complete all todos$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .each( (item) ->
      item.click("input")
    )

  @Then /^the toggle-all button should not be checked$/, ->
    new @Widget({
      root: "#toggle-all"
    }).getAttribute("checked").should.eventually.eql(null)

  @Then /^the toggle-all button should be checked$/, ->
    new @Widget({
      root: "#toggle-all"
    }).getAttribute("checked").should.eventually.eql("true")

  @When /^I complete two todos$/, ->
    W = new @Widget.List({
      root: "#todo-list"
    })
    W.clickAt({selector: "input", index: 0}).then ->
      W.clickAt({selector: "input", index: 1})

  @When /^I click clear completed$/, ->
    new @Widget({
      root: "#clear-completed"
    }).click()

