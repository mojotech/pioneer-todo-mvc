Driver = require('selenium-webdriver')
module.exports = ->

  @Given /^I visit TODOMVC$/, ->
    this.driver.get('http://todomvc.com/architecture-examples/backbone/')

  @When /^I make sure that there are no todos$/, ->
    W = new @Widget({
      root: "#todo-list"
    })
    W.isVisible().then (result) =>
      if(result)
        W.getInnerHTML().then (html) =>
            unless html is ""
              new @Widget({
                root: "#toggle-all"
              }).click().then =>
                new @Widget({
                  root: "#clear-completed"
                }).click()
