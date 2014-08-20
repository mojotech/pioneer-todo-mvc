Driver = require('selenium-webdriver')
module.exports = ->

  @Then /^only completed todos are shown$/, ->
    new @Widgets.TodoList()
    .checkEachClass("completed")
    .should.eventually.eql([true, true])

  @Then /^only active todos are shown$/, ->
    new @Widgets.TodoList()
    .checkEachClass("completed")
    .should.eventually.eql([false])

  @When /^I click on the active link$/, ->
    new @Widgets.Filters()
    .find({text: "Active"})
    .then (el) -> el.click()

  @Then /^I should be on the active page$/, ->
    this.driver.getCurrentUrl()
    .then (url) =>
      url.should.eql(@URL + "#/active")

  @When /^I click on the completed link$/, ->
    new @Widgets.Filters()
    .find({text: "Completed"})
    .then (el) -> el.click()

  @Then /^I should be on the completed page$/, ->
    this.driver.getCurrentUrl()
    .then (url) =>
      url.should.eql(@URL + "#/completed")

  @When /^I click on the all link$/, ->
    new @Widgets.Filters()
    .find({text: "All"})
    .then (el) -> el.click()

  @Then /^I should be on the home page$/, ->
    this.driver.getCurrentUrl()
    .then (url) =>
      url.should.eql(@URL + "#/")

  @Then /^I should see all todos$/, ->
    new @Widgets.TodoList()
    .length().should.eventually.eql(3)

  @Then /^the active link should be active$/, ->
    new @Widgets.Filters()
    .isSelected(1)
    .should.eventually.eql(true)

  @Then /^the completed link should be active$/, ->
    new @Widgets.Filters()
    .isSelected(2)
    .should.eventually.eql(true)

  @Then /^the all link should be active$/, ->
    new @Widgets.Filters()
    .isSelected(0)
    .should.eventually.eql(true)
