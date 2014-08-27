module.exports = ->
  @Widgets = @Widgets || {}
  World = this

  @Widgets.TodoList = @Widget.List.extend
    root: "#todo-list"

    length: ->
      @items().then (i) -> i.length

    edit: (index) ->
      @at(index).then (widget) ->
        widget.doubleClick()

    complete: (index) ->
      @clickAt({
        selector: "input",
        index: index
      })

    checkEachClass: (className) ->
      @map( (item) =>
        item.isVisible().then (vis) ->
          item.hasClass(className)
      )

    isEditing: (index) ->
      @at(index).then (el) ->
        el.hasClass("editing")

    isCompleted: (index) ->
      @at(index).then (el) ->
        el.hasClass("completed")

    isChecked: (index) ->
      @at(index).then (el) ->
        el.getAttribute({
          selector: ".toggle",
          attribute: "checked"
        })

    checkButtonVisibility: (index, button) ->
      @at(index).then (widget) ->
        widget.isVisible({
          selector: button
        })

    clearAll: ->
      toggle = new World.Widgets.ToggleAll()

      @isVisible().then (visible) =>
        if(visible)
          toggle.isVisible().then (vis) =>
            if(vis)
              toggle.isChecked().then (atr) =>
                if(!atr)
                  toggle.click().then =>
                    World.Widget.click({selector: "#clear-completed"})
                else
                  World.Widget.click({selector: "#clear-completed"})
