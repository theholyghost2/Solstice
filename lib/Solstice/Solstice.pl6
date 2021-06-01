use SDL2::Raw;
use Solstice::SDL2MainLoop;

use NativeCall;
use nqp;

my int ($w, $h) = 800, 600;
my SDL_Window $window;
my SDL_Renderer $renderer;
constant $sdl-lib = 'SDL2';

enum GAME_KEYS (
        K_UP => 82,
        K_DOWN => 81,
        K_LEFT => 80,
        K_RIGHT => 79,
        K_SPACE => 44,
        K_ESCAPE => 21,
);

my %down_keys;

SDL_Init(VIDEO);

$window = SDL_CreateWindow(
		"Solstice : Underdark",
		SDL_WINDOWPOS_CENTERED_MASK, SDL_WINDOWPOS_CENTERED_MASK,
		$w, $h,
		SHOWN
		);	

$renderer = SDL_CreateRenderer( $window, -1, ACCELERATED );

SDL_ClearError();

my SDL_RendererInfo $renderer_info .= new;
SDL_GetRendererInfo($renderer, $renderer_info);
say $renderer_info;
say %PIXELFORMAT.pairs.grep({ $_.value == any($renderer_info.texf1, $renderer_info.texf2, $renderer_info.texf3) });

sub render {

        ### SDL_UpdateTexture($tile, 0, $data, 320*32);

        SDL_SetRenderDrawColor($renderer, 0x0, 0x0, 0x0, 0xff);
        SDL_RenderClear($renderer);
        SDL_SetRenderDrawColor($renderer, 0xff, 0xff, 0xff, 0x7f);
        SDL_RenderPresent($renderer);

        SDL_RendererFlip;
}

my @times;
my $event = SDL_Event.new;
my num $df = 0.0001e0;

my $mainloop = Solstice::SDL2MainLoop();

main: loop {
        my $start = nqp::time_n();

while SDL_PollEvent($event) {
        my $casted_event = SDL_CastEvent($event);

        given $casted_event {
                when *.type == QUIT {
                        last main;
                }

                when *.type == KEYDOWN {
                        if GAME_KEYS(.scancode) -> $comm {
                                %down_keys{$comm} = 1;

				if ($comm == K_ESCAPE) {
					exit();
				}

			   ### $shadax.moveLeft();
                           ### $shadax.collideRoom($!currentroom);
#$!shadax = Solstice::JumpingShadax.new($!shadax.getX(),$!shadax.getY(),$!shadax.getWidth(),$!shadax.getHeight());
                           #$!shadax.jump();
                        }
                        CATCH { say $_ }
                }

                when *.type == KEYUP {
                        if GAME_KEYS(.scancode) -> $comm {
                                %down_keys{$comm} = 0;
                        }
                        CATCH { say $_ }
                }
        }
}

###my $img = SDL_LoadBMP("../../images/ochre-floor-tile-1.bmp");
###my $image = SDL2::Raw::SDL_CreateTextureFromSurface($renderer, $img);
###my $destrect = SDL2::Raw::SDL_Rect.new(0,0,800,600);
###SDL2::Raw::SDL_RenderCopy($renderer, $image, 0, $destrect);


######my $img = SDL2::Raw::IMG_LoadTexture($renderer, "../../images/ochre-floor-tile-1.png");
######SDL2::Raw::SDL_SetColorKey($img, SDL2::Raw::SDL_TRUE, (255,255,255));


$mainloop.loopOnce();
render();

@times.push: nqp::time_n() - $start;
$df = nqp::time_n() - $start;
}
@times .= sort;
my @timings = (@times[* div 50], @times[* div 4], @times[* div 2], @times[* * 3 div 4], @times[* - * div 100]);
say "frames per second:";
say (1 X/ @timings).fmt("%3.4f");
say "timings:";
say ( @timings).fmt("%3.4f");
say "";
'raw_timings.txt'.IO.spurt((1 X/ @times).join("\n"));		
