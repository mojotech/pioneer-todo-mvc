module.exports = ->
  this.Widgets = this.Widgets || {}

  return this.Widgets.TodoApp = this.Widget.View.extend
    root: '#todoapp'
    appName: 'TodoMVC'
    regionPath: 'header'

    addTodo: (text) ->
      @ui('input').then (elem) ->
        elem.sendKeys(text, Driver.Key.ENTER)
