Driver = require('selenium-webdriver')
module.exports = ->
  @When /^I click completed on the first todo$/, ->
    new @Widget.List({
      root: "#todo-list"
    }).clickAt({
      selector: "input"
      index: 0
    })

  @Then /^its parent li should have class completed$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .at(0).then (el) ->
      el.getAttribute("class").then (className) ->
        ((string) ->
          if(string.indexOf("completed") > -1)
            true
          else
            false
        )(className)
        .should.eql(true)

  @Then /^its complete value should be checked$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .at(0).then (el) ->
      el.getAttribute({selector:".toggle", attribute:"checked"}).should.eventually.eql("true")

  @Then /^I double click it$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .at(0).then (widget) =>
      widget.find().then (el) =>
        new Driver.ActionSequence(@driver).doubleClick(el).perform()

  @Then /^the todo should be in editing mode$/, ->
    new @Widget.List({
      root: "#todo-list"
    }).at(0).then (el) ->
      el.getAttribute("class").then (className) ->
        ((string) ->
          if(string.indexOf("editing") > -1)
            true
          else
            false
        )(className)
        .should.eql(true)
