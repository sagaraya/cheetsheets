path = require 'path'
cheetsheetsConfig = require './cheetsheets-config.coffee'
CheetsheetsView = require './cheetsheets-view'

module.exports =
  config: cheetsheetsConfig.config
  cheetsheetsView: null

  activate: (state) ->
    selector = 'atom-workspace'

    # define commands by config
    atom.commands.add selector, "cheetsheets:emoji": (event) ->
      atom.workspace.open('cheetsheets:emoji', split:'right', activatePane:false)

    atom.commands.add selector, "cheetsheets:markdown": (event) ->
      atom.workspace.open('cheetsheets:markdown', split:'right', activatePane:false)

    # define opener
    atom.workspace.addOpener (uri) ->
      basename = path.basename(uri)
      switch basename
        when 'cheetsheets:emoji'
          url = cheetsheetsConfig.getEmojiUrl()
        when 'cheetsheets:markdown'
          url = cheetsheetsConfig.getMarkdownUrl()

      new CheetsheetsView(url, basename) if url

  deactivate: ->
    @cheetsheetsView.destroy()

  serialize: ->
    cheetsheetsViewState: @cheetsheetsView.serialize()
