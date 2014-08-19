module.exports = ->
  @Widgets = @Widgets || {}

  @Widgets.TodoList = @Widget.List.extend
    root: "#todo-list"

  @Widgets.ToggleAll = @Widget.extend
    root: "#toggle-all"

  @Widgets.ClearCompleted = @Widget.extend
    root: "#clear-completed"

  @Widgets.NewTodo = @Widget.extend
    root: "#new-todo"

  @Widgets.InputEdit = @Widget.extend
    root: "input.edit"

  @Widgets.TodoCount = @Widget.extend
    root: "#todo-count"
