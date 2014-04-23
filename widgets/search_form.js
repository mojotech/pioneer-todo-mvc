module.exports = function() {
  this.Widgets = this.Widgets || {};

  return this.Widgets.searchForm = this.Widget.extend({
    root: '#mngb',
    searchFor: function(text) {
      return this.fill("#gbqfq", text);
    }
  })
}
