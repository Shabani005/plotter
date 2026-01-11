import raylib;
import settings;
import std.stdio;
import std.math;
import std.string;
import std.conv;
import std.format;

uint WINDOW_WIDTH = 800;
uint WINDOW_HEIGHT = 600;

float X_MIN = -10.0f;
float X_MAX = 10.0f;
float Y_MIN = -5.0f;
float Y_MAX = 5.0f;

mixin(format("float f(float x){\nreturn %s;\n }\n", functionPlot));

float clampX(float x, float xMin, float xMax){
    return (x - xMin) / (xMax - xMin) * WINDOW_WIDTH;
}

float clampY(float y, float yMin, float yMax){
    return WINDOW_HEIGHT - (y - yMin) / (yMax - yMin) * WINDOW_HEIGHT;
}

void DrawAxis()
{
    float zeroX = clampX(0, X_MIN, X_MAX);
    float zeroY = clampY(0, Y_MIN, Y_MAX);
    
    DrawLine(0, cast(int)zeroY, WINDOW_WIDTH, cast(int)zeroY, RED);
    DrawLine(cast(int)zeroX, 0, cast(int)zeroX, WINDOW_HEIGHT, RED);
}

void DrawFunction()
{
    float step = (X_MAX - X_MIN) / WINDOW_WIDTH;

    float prevX = X_MIN;
    float prevY = f(prevX);

    for (float x = X_MIN + step; x <= X_MAX; x += step)
    {
        float y = f(x);

        if (!isNaN(prevY) && !isNaN(y))
        {
            int x1 = cast(int)clampX(prevX, X_MIN, X_MAX);
            int y1 = cast(int)clampY(prevY, Y_MIN, Y_MAX);
            int x2 = cast(int)clampX(x, X_MIN, X_MAX);
            int y2 = cast(int)clampY(y, Y_MIN, Y_MAX);

            DrawLine(x1, y1, x2, y2, GREEN);
        }

        prevX = x;
        prevY = y;
    }
}

int  main(string[] args){
    // if (args.length != 2){
    //     stderr.writeln(i"Usage: $(args[0]) f(x)=...");
    //     return 1;
    // }    

    InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "hello from D function plotter");

    scope(exit) {
        CloseWindow();   
    }
    
    while (!WindowShouldClose()){
        BeginDrawing();
            {
                ClearBackground(GetColor(0x181818));
                DrawAxis();
                DrawFunction();
            }
        EndDrawing();
    }
    return 0;
}

