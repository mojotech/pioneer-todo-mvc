module.exports = function() {
  this.Given(/^I view todomvc$/, function() {
    return this.driver.get("http://todomvc.com/labs/architecture-examples/backbone_marionette/")
  });

  this.When(/^I add a todo "([^"]*)"$/, function(text) {
    return new this.Widgets.TodoEntry().add(text);
  });

  this.Then(/^I should see "([^"]*)" todos$/, function(count) {
    new this.Widgets.TodoList().items().should.eventually.have.length(+count);
  });
}
