Driver = require('selenium-webdriver')
module.exports = ->
  @Then /^I should see two completed todos on the button$/, ->
    new @Widget({
      root: "#clear-completed"
    })
    .read()
    .should.eventually.eql("Clear completed (2)")

  @Then /^the completed todo should be removed$/, ->
    new @Widget.List({
      root: "#todo-list"
    })
    .items().then (items) ->
      items.length.should.eql(2)

  @Then /^the clear completed button should be hidden$/, ->
    new @Widget({
      root: "#clear-completed"
    }).isPresent().should.eventually.eql(false)

