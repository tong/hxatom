
@:keep
class Main {

    @:expose("activate")
    static function activate( state ) {
        Atom.notifications.addInfo( 'HXAtom example package activated', {
            detail: 'https://github.com/tong/hxatom',
            dismissable: true
        } );
    }

    @:expose("deactivate")
    static function deactivate() {
        trace( 'HXAtom example package deactivated' );
    }

}
