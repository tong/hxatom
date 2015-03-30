##
## hxatom
##

LIB = hxatom

all: haxelib

$(LIB).zip:
	cd ../ && zip -r $(LIB).zip $(LIB) -x $(LIB)/Makefile -x $(LIB)/.git  && mv $(LIB).zip $(LIB)

haxelib: $(LIB).zip

install: haxelib
	haxelib local $(LIB).zip

uninstall:
	haxelib remove $(LIB)

clean:
	rm -f $(LIB).zip

.PHONY: all haxelib install uninstall clean
