module.exports = ->
  @Widgets = @Widgets || {}

  @Widgets.Filters = @Widget.List.extend
    root: "#filters"

    isSelected: (index) ->
      @at(index).then (el) ->
        el.hasClass({
          className: "selected",
          selector: "a"
        })
