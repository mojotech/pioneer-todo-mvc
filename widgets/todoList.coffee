module.exports = ->
  this.Widgets = this.Widgets || {}

  this.Widgets.TodoList = this.Widget.List.extend
    root: '#todo-list'

    itemClass: this.Widgets.TodoItem

    itemSelector: 'li'

    numShown: ->
      @filter (item) -> item.isShown()

    getItem: (index) ->
      @items().then (items) -> items[index]
