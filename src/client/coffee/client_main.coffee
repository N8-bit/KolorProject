###
this is the main coffee file for the client to run
###

###
globals: Please only put the canvas and the context into g
###
g = {}
g.canvas = null
g.context = null
g.debug = {}

createSettings = () ->
    {
        fps : 30
    }

window.main = () ->
    # get global drawing context
    g.canvas = document.getElementById "canvas"
    g.context = g.canvas.getContext "2d"
    
    # get settings
    set = createSettings()
    delay = 1000 / set.fps
    
    # set up the event loops
    setInterval update, delay
    setInterval draw, delay

update = () ->
    #

g.debug.x = 0
draw = () ->
    g.context.clearRect 0, 0, 640, 480
    
    g.debug.x += 2
    #g.context.fillRect g.debug.x, 30, 100, 100
    g.context.fillText "Hi Dad! >:3", g.debug.x, 30
