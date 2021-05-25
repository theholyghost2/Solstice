use SDL2::Raw;
use Solstice::SDL2MainLoop;

my int ($w, $h) = 800, 600;
my SDL_Window $window;
my SDL_Renderer $renderer;
constant $sdl-lib = 'SDL2';

SDL_Init(VIDEO);

$window = SDL_CreateWindow(
		"Pagan Visions Roguelike - SDL 2",
		SDL_WINDOWPOS_CENTERED_MASK, SDL_WINDOWPOS_CENTERED_MASK,
		$w, $h,
		SHOWN
		);	

my $renderer = SDL_CreateRenderer( $window, -1, ACCELERATED );

SDL_ClearError();

my SDL_RendererInfo $renderer_info .= new;
SDL_GetRendererInfo($renderer, $renderer_info);
say $renderer_info;
say %PIXELFORMAT.pairs.grep({ $_.value == any($renderer_info.texf1, $renderer_info.texf2, $renderer_info.texf3) });

my $mainloop = SDL2MainLoop($renderer);
$mainloop.mainloop();
		
