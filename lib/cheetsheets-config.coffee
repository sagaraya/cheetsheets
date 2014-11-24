module.exports =
  config:
    cheetsheets:
      type: 'object'
      properties:
        emoji:
          type: 'string'
          default: 'http://www.emoji-cheat-sheet.com/'
        markdown:
          type: 'string'
          default: 'https://help.github.com/articles/github-flavored-markdown/'
    shouldRenderOnMenuBar:
      type: 'boolean'
      default: true #TODO:これがfalseだったらメニューバーから消してpackagesに入れる

  getEmojiUrl: ->
    config = atom.config.get('cheetsheets.cheetsheets')
    config.emoji

  getMarkdownUrl: ->
    config = atom.config.get('cheetsheets.cheetsheets')
    config.markdown
