module raylib;

alias cstr = const(char)*;

struct Color
{
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a;
}

enum Color RED = Color(255, 0, 0, 255);

extern(C):

void InitWindow(int w, int h, cstr title);
void CloseWindow();
bool WindowShouldClose();
void BeginDrawing();
void EndDrawing();
void ClearBackground(Color color);
