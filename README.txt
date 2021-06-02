This game uses SDL2::Raw as a module, if it complains about libSDL2.dylib
"image not found" you have to compile SDL2 (http://libsdl.org) then put
everything (bin lib include drectory in /usr/local

This is for Raku modules who cannot find their native library on a Mac OS.
If you are using linux or BSD just install the libSDL2 packages in your
 package manager.

This software was built upon a Mac OS.

Note that you must run the game with the images directory in it from where you
run it.

Run Solstice.pl6 script file to bootstrap the game.

key bindings:

arrow keys : movement
