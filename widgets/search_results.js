module.exports = function() {
  this.Widgets = this.Widgets || {};

  return this.Widgets.TodoList = this.Widget.List.extend({
    root: '#todo-list',
    itemSelector: 'li'
  });
}
