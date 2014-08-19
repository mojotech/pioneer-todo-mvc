Driver = require('selenium-webdriver')
module.exports = ->

  @Then /^only completed todos are shown$/, ->
    new @Widgets.TodoList()
    .each( (item) =>
      item.isVisible().then (vis) ->
      #### The following is the isPresent work around
      # item.find().then (elm) -> elm.isDisplayed().then (vis) ->
        item.getAttribute("class").then (className) ->
          if(vis)
            item.getAttribute("class").then (className) ->
              ((string) ->
                if(string.indexOf("completed") > -1)
                  true
                else
                  false
              )(className)
              .should.eql(true)
      )

  @Then /^only active todos are shown$/, ->
    new @Widgets.TodoList()
    .each( (item) =>
      item.isVisible().then (vis) ->
      #### The following is the isPresent work around
      # item.find().then (elm) -> elm.isDisplayed().then (vis) ->
          item.getAttribute("class").then (className) ->
            if(vis)
              item.getAttribute("class").then (className) ->
                ((string) ->
                  if(string.indexOf("completed") > -1)
                    true
                  else
                    false
                )(className)
                .should.eql(false)
      )

  @When /^I click on the active link$/, ->
    new @Widget.List({
      root: "#filters"
    })
    .find({text: "Active"})
    .then (el) -> el.click()

  @Then /^I should be on the active page$/, ->
    this.driver.getCurrentUrl()
    .then (url) =>
      url.should.eql(@URL + "#/active")

  @When /^I click on the completed link$/, ->
    new @Widget.List({
      root: "#filters"
    })
    .find({text: "Completed"})
    .then (el) -> el.click()

  @Then /^I should be on the completed page$/, ->
    this.driver.getCurrentUrl()
    .then (url) =>
      url.should.eql(@URL + "#/completed")

  @When /^I click on the all link$/, ->
    new @Widget.List({
      root: "#filters"
    })
    .find({text: "All"})
    .then (el) -> el.click()

  @Then /^I should be on the home page$/, ->
    this.driver.getCurrentUrl()
    .then (url) =>
      url.should.eql(@URL + "#/")

  @Then /^I should see all todos$/, ->
    new @Widgets.TodoList()
    .items().then (arr) -> arr.length.should.eql(3)
