###
this is the main server file
###

# get required modules
sys = require "sys"
fs = require "fs"
http = require "http"
util = require "util"

# create and assign globals, please keep this limited
g = {}
g.dir = __dirname + "/"

# replace the {client} tag in the html with the compiled client script
prepareHtml = () ->
    html = (fs.readFileSync g.dir + "../index.xhtml").toString()
    js = (fs.readFileSync g.dir + "client.js").toString()
    html = html.replace "{client}", js

# get the page contents
g.page = prepareHtml()

# this is called on connect to client
# set up the connection and send index.html
servFunc = (req, res) ->
    
    # write header
    header = "content-type" : "text/html"
    res.writeHead 200, header
    
    # write this loaded page to the browser
    res.write g.page
    
    res.end()
        
serv = http.createServer servFunc
serv.listen process.env.C9_PORT, "0.0.0.0"
