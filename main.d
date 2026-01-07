import raylib;
import std.stdio;

uint WINDOW_WIDTH = 800;
uint WINDOW_HEIGHT = 600;


void DrawAxis()
{
    DrawLine(0, WINDOW_HEIGHT/2, WINDOW_WIDTH, WINDOW_HEIGHT/2, RED);
    DrawLine(WINDOW_WIDTH/2, 0, WINDOW_WIDTH/2, WINDOW_HEIGHT, RED);
}

int  main(string[] args){
    if (args.length != 2){
        stderr.writeln(i"Usage: $(args[0]) ...f(x)");
        return 1;
    }    

    InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "hello from D");

    scope(exit) {
        CloseWindow();  
    }

    while (!WindowShouldClose()){
        BeginDrawing();
            {
                ClearBackground(GetColor(0x181818));
                DrawAxis();
            }
        EndDrawing();
    }
    return 0;
}

