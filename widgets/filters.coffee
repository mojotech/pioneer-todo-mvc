module.exports = ->
  @Widgets = @Widgets || {}

  @Widgets.Filters = @Widget.List.extend
    root: "#filters"

    isSelected: (index) ->
      @at(index).then (el) ->
        el.getAttribute({
          selector: "a",
          attribute: "class"
        }).then (className) ->
          className.indexOf("selected") > -1
