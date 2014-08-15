Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^I activate edit mode$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .at(0).then (widget) =>
      widget.doubleClick()

  @Given /^clear the input$/, ->
    new @Widget({
      root: "input.edit"
    }).find().then (el) -> el.clear()

  @Then /^the toggle button will be hidden$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .at(0).then (widget) ->
      widget.isVisible({
        selector: "input.toggle"
      }).should.eventually.eql(false)

  @Then /^the destroy button will be hidden$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .at(0).then (widget) ->
      widget.isVisible({
        selector: "button.destroy"
      }).should.eventually.eql(false)

  @Given /^I fill the input with something$/, ->
    new @Widget({
      root: "input.edit"
    })
    .fill({
      value:[Driver.Key.SPACE, "addition"]
    })

  @Given /^press enter$/, ->
    new @Widget({
      root: "input.edit"
    })
    .fill({
      value:Driver.Key.ENTER
    })

  @Given /^click elsewhere$/, ->
    new @Widget({
      root: "#footer"
    }).click()

  @Then /^it should be saved$/, ->
    new @Widget({
      root: "input.edit"
    })
    .getValue().should.eventually.eql("new todo addition")

  @Given /^press escape$/, ->
    new @Widget({
      root: "input.edit"
    })
    .fill({
      value:Driver.Key.ESCAPE
    })

  @Then /^it should be unchanged$/, ->
    new @Widget({
      root: "input.edit"
    })
    .getValue().should.eventually.eql("new todo")

  @Given /^I fill the input with something untrimmed$/, ->
    new @Widget({
      root: "input.edit"
    })
    .fill({
      value:[
        Driver.Key.SPACE,
        "addition",
        Driver.Key.SPACE,
        Driver.Key.SPACE,
        Driver.Key.SPACE
      ]
    })

  @Then /^it should be trimmed upon save$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .readAt(0).should.eventually.eql("new todo addition")

  @Then /^the editing class should be removed from parent li$/, ->
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
        .should.eql(false)

  @Given /^delete the text from the input$/, ->
    new @Widget({
      root: "input.edit"
    }).find().then (el) -> el.clear()

  @Then /^it should be removed$/, ->
    new @Widget({
      root: "#todo-list"
    })
    .isVisible().should.eventually.eql(false)
