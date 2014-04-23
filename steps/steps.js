module.exports = function() {
  this.Given(/^I am a human$/, function() {
    return this.driver.get("http://google.com")
  });

  this.When(/^I look up a duck$/, function() {
    var searchForm = new this.Widgets.searchForm();

    return searchForm.searchFor("duck");
  });

  this.Then(/^I should see "([^"]*)" ducks$/, function(count) {
    var searchResults = new this.Widgets.SearchResults();
    return searchResults.items().then(function(items) {
      items.length.should.equal(+count);
    });
  });
}
