package atom;

typedef NotificationOptions = {
    ?buttons : Array<{
        ?className: String,
        ?onDidClick: Void->Void,
        ?text: String
    }>,
    ?description: String,
    ?detail: String,
    ?dismissable: Bool,
    ?icon: String,
    ?stack: String
}

@:jsRequire("atom","NotificationManager")
extern class NotificationManager {

    function onDidAddNotification( callback : Notification->Void ) : Disposable;

    function addSuccess( message : String, ?options : NotificationOptions ) : Void;
    function addInfo( message : String, ?options : NotificationOptions ) : Void;
    function addWarning( message : String, ?options : NotificationOptions ) : Void;
    function addError( message : String,?options : NotificationOptions ) : Void;
    function addFatalError( message : String, ?options : NotificationOptions ) : Void;

    function getNotifications() : Array<Notification>;

}
