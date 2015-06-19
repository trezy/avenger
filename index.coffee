five = require 'johnny-five'
board = new five.Board()

board.on 'ready', ->
  esc = new five.ESC 3
