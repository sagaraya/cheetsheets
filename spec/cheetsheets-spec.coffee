{WorkspaceView} = require 'atom'
Cheetsheets = require '../lib/cheetsheets'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Cheetsheets", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('cheetsheets')

  describe "when the cheetsheets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.cheetsheets')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'cheetsheets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.cheetsheets')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'cheetsheets:toggle'
        expect(atom.workspaceView.find('.cheetsheets')).not.toExist()
