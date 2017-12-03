
@:keep
class Main {

    static inline function __init__() {
        untyped module.exports = Main;
    }

    static function activate( state ) {
        trace( 'Hxatom activate' );
        trace( atom.AtomEnvironment );
        Atom.notifications.addInfo('Hxatom!');
    }

    static function deactivate() {
        trace( 'Hxatom deactivate' );
    }

}
