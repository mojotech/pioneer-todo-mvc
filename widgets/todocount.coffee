module.exports = ->
  @Widgets = @Widgets || {}

  @Widgets.TodoCount = @Widget.extend
    root: "#todo-count"

    hasStrongTag: ->
      @getInnerHTML().then (html) ->
        html.indexOf("strong") > -1
