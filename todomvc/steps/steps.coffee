Driver = require('selenium-webdriver')
module.exports = ->
  @Given /^I visit TODOMVC$/, ->
    this.driver.get('http://todomvc.com/architecture-examples/angularjs/')

  @When /^I make sure that there are no todos$/, ->
    W = new @Widgets.TodoList()
    W.isVisible().then (result) =>
      if(result)
        tog = new @Widgets.ToggleAll()
        tog.isVisible().then (vis) =>
          if(vis)
            tog.getAttribute("checked").then (atr) =>
              if(!atr)
                tog.click().then =>
                  new @Widgets.ClearCompleted().click()
              else
                new @Widgets.ClearCompleted().click()
