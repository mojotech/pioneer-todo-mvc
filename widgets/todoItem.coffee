module.exports = ->
  root = exports ? this
  this.Widgets = this.Widgets || {}

  this.Widgets.TodoItem = this.Widget.extend

    check: -> @click(".toggle")

    isShown: ->
      @find()
        .then (elem) -> elem.isDisplayed()

    isChecked: ->
      @driver.executeScript("return $('.toggle[checked=\"\"]').length > 0")
