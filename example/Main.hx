
@:keep
class Main {

    @:expose("activate")
    static function activate( state ) {
        trace( atom.AtomEnvironment );
        Atom.notifications.addSuccess( 'HXAtom!', {
            detail: 'https://github.com/tong/hxatom',
            dismissable: true
        } );
    }

    @:expose("deactivate")
    static function deactivate() {
        trace( 'HXAtom deactivate' );
    }

}
