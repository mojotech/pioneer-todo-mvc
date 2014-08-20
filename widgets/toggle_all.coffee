_      = require('lodash')
Driver = require('selenium-webdriver')
module.exports = ->
  @Widgets = @Widgets || {}

  @Widgets.ToggleAll = @Widget.extend
    root: "#toggle-all"

    isChecked: ->
      @getAttribute("checked")

  @Widgets.ClearCompleted = @Widget.extend
    root: "#clear-completed"
