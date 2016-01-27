package atom.autocomplete;

typedef Suggestion = {

    @:optional var text : String;
    @:optional var snippet : String;

    @:optional var displayText : String;
    @:optional var replacementPrefix : String;
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
