Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^I should see three active todos$/, ->

  @Then /^the number of todos should be wrapped in a strong tag$/, ->
    new @Widget({
      root: "#todo-count"
    })
    .getInnerHTML().then (html) ->
      ((string) ->
        if(string.indexOf("<strong>3</strong>") > -1)
          true
        else
          false
      )(html)
      .should.eql(true)

  ##########Gonna need to change for html reasons
  @Given /^I complete that todo$/, ->
    new @Widget.List({
      root: "#todo-list"
    }).clickAt({
      selector: "input",
      index: 0
    })

  @Then /^I should see zero items$/, ->
    new @Widget({
      root: "#todo-count"
    })
    .read()
    .should.eventually.eql("0 items left")

  @Then /^I should see one item$/, ->
    new @Widget({
      root: "#todo-count"
    })
    .read()
    .should.eventually.eql("1 item left")

  @Then /^I should see three items$/, ->
    new @Widget({
      root: "#todo-count"
    })
    .read()
    .should.eventually.eql("3 items left")

