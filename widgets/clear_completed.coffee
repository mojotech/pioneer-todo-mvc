module.exports = ->
  @Widgets = @Widgets || {}

  @Widgets.ClearCompleted = @Widget.extend
    root: "#clear-completed"
