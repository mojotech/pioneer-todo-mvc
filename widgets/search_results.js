module.exports = function() {
  this.Widgets = this.Widgets || {};

  return this.Widgets.SearchResults = this.Widget.List.extend({
    root: '.gstl_0',
    itemSelector: 'tr'
  });
}
