use v6.c;
use Test;      # a Standard module included with Rakudo 
use lib 'lib';

my $num-tests = 15;

plan $num-tests;
 
# .... tests 
#  

use-ok "Solstice::Diamond";
use-ok "Solstice::Entity";
use-ok "Solstice::Shadax";
use-ok "Solstice::Room";
use-ok "Solstice::Tilemap";

use-ok "Solstice::Controller";
use-ok "Solstice::Move";
use-ok "Solstice::Room1";
use-ok "Solstice::Room2";
use-ok "Solstice::Tilemap1";

use-ok "Solstice::SDL2MainLoop";
use-ok "Solstice::OchreFloorDiamond";
use-ok "Solstice::OchreSlabDiamond";
use-ok "Solstice::SolsticeModel";
use-ok "Solstice::SolsticeView";

done-testing;  # optional with 'plan' 
