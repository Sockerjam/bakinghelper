
var Action = function() {}

Action.prototype = {
    
run: function(parameters) {
    
    parameters.completionFunction({"selectedText": window.getSelection().toString()});
},
    
finalize: function(parameters) {
    
}
    
};

var ExtensionPreprocessingJS = new Action


