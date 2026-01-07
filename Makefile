main: main.d ./raylib/build/raylib/libraylib.a
	dmd main.d -L-L./raylib/build/raylib -L-lraylib
