Driver = require('selenium-webdriver')
_      = require('lodash')
module.exports = ->
  @Widgets = @Widgets || {}

  @Widgets.NewTodo = @Widget.extend
    root: "#new-todo"

    enter: (text) ->
      text = Array::concat(text)
      text.push(Driver.Key.ENTER)

      @sendKeys.apply(this, text)
