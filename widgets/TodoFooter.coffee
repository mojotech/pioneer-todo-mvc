module.exports = ->
  this.Widgets = this.Widgets || {}

  return this.Widgets.TodoFooter = this.Widget.View.extend
    appName: 'TodoMVC'
    regionPath: 'footer'

    summaryText: ->
      @ui('summary').then (el)-> el.getText()

    filterByCompleted: ->
      @ui('completed').then (el) -> el.click()

    filterByActive: ->
      @ui('active').then (el) -> el.click()
