/*
this is the build file, it is used to boil down all of our coffee
into one nicely reduced batch of javascript.
*/

// do function cb over each element in xs w/ argument object args
// return an array of all the returns of each called cb
function foreach(xs, cb, args){
    var i = 0;
    var ret = [];
    for(; i < xs.length; i++){
        x = xs[i];
        ret[i] = cb(x, args);
    }
    return ret;
}

function build(){
    // add to our working directories
    require.paths.unshift("src");
    require.paths.unshift("build");
    require.paths.unshift("framework");
    
    // say what's going on
    //console.log ("beginning server & client compilation.");
    
    // require needed files
    var fs = require("fs");
    var paths = require("buildPath");
    var compile = require("compile");
    
    // setup server compilation
    var serverPaths = paths.serverPaths;
    var serverCode = "";
    var serverArgs = {code:serverCode};
    
    // setup client compilation
    var clientPaths = paths.clientPaths;
    var clientCode = "";
    var clientArgs = {code:clientCode};
    
    // get the string of coffee code
    foreach (serverPaths, forPaths, serverArgs);
    foreach (clientPaths, forPaths, clientArgs);
    
    // compile the client and server into .js files
    var serverJs = compile.compile (serverArgs.code);
    var clientJs = compile.compile (clientArgs.code);
    
    // write these js files to the bin
    fs.writeFileSync ("bin/server.js", serverJs);
    fs.writeFileSync ("bin/client.js", clientJs);
    
    // declare what we've written
    //console.log ("bin/server.js written.");
    //console.log ("bin/client.js written.");
    
    // go through all listed source directories for coffee files
    function forPaths (path, args)
    {
        var files = fs.readdirSync (path);
        var fileArgs = {path:path, codeObj:args};
        foreach (files, forFiles, fileArgs);
    }
    
    // go through all files in a directory and read it to the compilation
    function forFiles (file, args)
    {
        var path = args.path;
        data = fs.readFileSync (path + file).toString();
        
        args.codeObj.code = args.codeObj.code + data;
    }
}
build()















