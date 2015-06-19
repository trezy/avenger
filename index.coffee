five = require 'johnny-five'
board = new five.Board()

board.on 'ready', ->
  console.log 'Board is ready!'
