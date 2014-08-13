Driver = require('selenium-webdriver')
args = require('minimist')(ARGV)

module.exports = ->
  @Given /^I visit TODOMVC$/, ->
    @URL = args["urlPath"]
    this.driver.get(@URL)

  @When /^I make sure that there are no todos$/, ->
    new @Widgets.TodoList()
    .clearAll()
