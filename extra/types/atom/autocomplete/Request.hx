package atom.autocomplete;

typedef Request = {
    var editor : TextEditor;
    var bufferPosition : Point;
    var scopeDescriptor : String;
    var prefix : String;
    var activatedManually : Bool;
}
