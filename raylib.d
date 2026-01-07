module raylib;

alias cstr = const(char)*;

struct Color
{
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a;
}

struct Vector2
{
    float x;
    float y;    
}

enum Color RED = Color(255, 0, 0, 255);

extern(C):

void InitWindow(int w, int h, cstr title);
void CloseWindow();
bool WindowShouldClose();
void BeginDrawing();
void EndDrawing();
void ClearBackground(Color color);
void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
Color GetColor(uint hexValue);
Vector2 GetMouseWheelMoveV();


