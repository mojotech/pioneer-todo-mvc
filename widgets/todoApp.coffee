module.exports = ->
  this.Widgets = this.Widgets || {}

  return this.Widgets.TodoApp = this.Widget.extend
    root: '#todoapp',

    addTodo: (text) ->
      @find('#new-todo').then (elem) ->
        elem.sendKeys(text, Driver.Key.ENTER)

    summaryText: -> @find('#todo-count').getText()

    filterByCompleted: -> @click('#filters li:nth-child(3) a')

    filterByActive: -> @click('#filters li:nth-child(2) a')
