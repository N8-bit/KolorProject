var coffee = require("coffee");

exports.compile = function(content){
    var compiled = coffee.CoffeeScript.compile(content);
    return compiled;
}