module.exports = function() {
  this.Widgets = this.Widgets || {};

  return this.Widgets.TodoEntry = this.Widget.extend({
    root: '#todoapp',
    add: function(text) {
      return this.find("#new-todo").then(function(elm) {
        elm.sendKeys(text, Driver.Key.ENTER);
      });
    }
  })
}
