// https://github.com/dlang/dmd/issues/21932

import std.stdio;
import clibs.sdl;

void main(){
  // Flags for subsystems we want to initialize
	SDL_InitFlags flags = SDL_INIT_VIDEO | SDL_INIT_EVENTS;

  // Initialize SDL
	if(SDL_Init(flags)){
		writeln("SDL was initialized");
	}else{
		writeln("Failed to initialize subsystems");
    return;
	}

  // Create our window
  SDL_Window* window = SDL_CreateWindow("DSDL3 window w/ manual binding - no dub packages",
                                        320,240,0);

  // 3 second delay (3000 ms)
  SDL_Delay(3000);

  // Destroy window
  SDL_DestroyWindow(window);

	writeln("Shutting down initialized subsystems");
	SDL_Quit();
}
