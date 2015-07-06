Barcli = require 'barcli'
five = require 'johnny-five'
board = new five.Board
  debug: false
  repl: false





board.on 'ready', ->

  # initialize sensors
  accelerometer = new five.Accelerometer
    controller: 'MPU6050'

  barometer = new five.Barometer
    controller: 'BMP180'

  compass = new five.Compass
    controller: 'HMC5883L'

  esc = new five.ESC 3





  # initialize guages
  barometerGauge = new Barcli
    label: 'Air Pressure'
    precision: 2

  compassGauge = new Barcli
    label: 'Compass'
    precision: 2

  xGauge = new Barcli
    label: 'X Axis'
    precision: 2

  yGauge = new Barcli
    label: 'Y Axis'
    precision: 2

  zGauge = new Barcli
    label: 'Z Axis'
    precision: 2





  # attach sensors to guages
  accelerometer.on 'change', ->
    xGauge.update parseFloat @x
    yGauge.update parseFloat @y
    zGauge.update parseFloat @z

  barometer.on 'data', ->
    barometerGauge.update parseFloat @pressure

  compass.on 'data', ->
    compassGauge.update @heading
