import raylib;

void main(){
    InitWindow(800, 600, "hello from D");

    while (!WindowShouldClose()){
        BeginDrawing();
            {
                ClearBackground(RED);
            }
        EndDrawing();
    }

    CloseWindow();
}

