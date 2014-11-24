{ScrollView} = require 'atom-space-pen-views'

module.exports =
class CheetsheetsView extends ScrollView

  @content: ->
    @iframe id: 'cheetsheets-web-view-iframe', name: 'disable-x-frame-options', tabindex: -1, src: ""

  constructor: (url, title) ->
    super

    @attr('src', url)
    @title = title

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    debugger
    @remove

  # Gets the title of the page based on the uri
  #
  # Returns a {String}
  getTitle: ->
    @title || 'cheetsheets'
