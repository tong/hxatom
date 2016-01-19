package atom;

@:native("Notification")
extern class Notification {
    function getType() : String;
    function getMessage() : String;
}
