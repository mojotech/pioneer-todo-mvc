Driver = require('selenium-webdriver')
module.exports = ->
  @Given /^I visit TODOMVC$/, ->
    this.driver.get('http://todomvc.com/architecture-examples/emberjs/')

  @When /^I make sure that there are no todos$/, ->
    W = new @Widget.List({
      root: "#todo-list"
    })
    W.isVisible().then (result) =>
      if(result)
        tog = new @Widget({
          root: "#toggle-all"
        })
        tog.isVisible().then (vis) =>
          if(vis)
            tog.getAttribute("checked").then (atr) =>
              if(!atr)
                tog.click().then =>
                  new @Widget({
                    root: "#clear-completed"
                  }).click()
              else
                new @Widget({
                  root: "#clear-completed"
                }).click()
