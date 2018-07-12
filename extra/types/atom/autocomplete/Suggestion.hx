package atom.autocomplete;

/*
@:enum abstract SuggestionType(String) to String {
    var variable = "variable";
    var constant = "constant";
    var property = "property";
    var value = "value";
    var method = "method";
    var function_ = "function";
    var class_ = "class";
    var type = "type";
    var keyword = "keyword";
    var tag = "tag";
    var snippet = "snippet";
    var import_ = "import";
    var require = "require";
    var package_ = "package";
}
*/

typedef Suggestion = {

    @:optional var text : String;
    @:optional var snippet : String;

    @:optional var displayText : String;
    @:optional var replacementPrefix : String;
    //@:optional var type : SuggestionType;
    @:optional var type : String;
    @:optional var leftLabel : String;
    @:optional var leftLabelHTML : String;
    @:optional var rightLabel : String;
    @:optional var rightLabelHTML : String;
    @:optional var className : String;
    @:optional var iconHTML : String;
    @:optional var description : String;
    @:optional var descriptionMoreURL : String;
};
