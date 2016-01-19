package atom;

@:native("NotificationManager")
extern class NotificationManager {

    function onDidAddNotification( callback : Notification->Void ) : Disposable;

    function addSuccess( message : String, ?options : {?detail:String} ) : Void;
    function addInfo( message : String, ?options : {?detail:String} ) : Void;
    function addWarning( message : String, ?options : {?detail:String} ) : Void;
    function addError( message : String,?options : {?detail:String} ) : Void;
    function addFatalError( message : String, ?options : {?detail:String} ) : Void;

    function getNotifications() : Array<Notification>;

}
