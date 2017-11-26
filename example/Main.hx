
@:keep
class Main {

    static inline function __init__() {
        untyped module.exports = Main;
    }

    static function activate( state : Dynamic ) {
        trace( 'Hxatom Example' );
        trace( atom.AtomEnvironment );
        Atom.notifications.addInfo('Hxatom!');
    }

    static function deactivate() {
    }
}
