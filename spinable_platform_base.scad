// =====================================================================
//  SpinAble Platform - Base and tops  (sketch v0.3)
//  One switch, one motor, swappable 3D-printed tops.
//  The top you drop on decides the motion: spin, rumble, up-and-down,
//  tick, or launch. Spinning tops carry an add-on hex for printed
//  accessories.
//
//  Open in OpenSCAD, then Window > Customizer. Every setting is a
//  drop-down. Pick "Which part" to export each STL one at a time.
//  Units: millimetres. See README.md for parts, wiring and the
//  Top Interface Spec that every top must follow.
// =====================================================================

/* [Which part] */
// Choose what to show. Export one printable part at a time as STL.
part = "assembly"; // [assembly:Base with spin disc (preview), assembly_rumble:Base with rumble top (preview), assembly_lift:Base with up-and-down top (preview), assembly_ticker:Base with ticker top (preview), assembly_launcher:Base with launcher top (preview), assembly_flag:Base with flag accessory on the hub (preview), base_shell:Base shell (print), bottom_plate:Bottom plate (print), hub:Universal hub (print), test_disc:Test spin disc (print), fit_test:Fit-test coupon (print), rumble_rotor:Rumble rotor (print), rumble_housing:Rumble housing (print), rumble_lid:Rumble lid (print), cam:Up-down cam (print), lifter_foot:Lifter foot (print), lifter_post:Lifter post (print), lifter_housing:Lifter housing (print), ticker_rotor:Ticker rotor (print), ticker_housing:Ticker housing (print), ticker_tab:Ticker tab (print), launcher_cam:Launcher cam (print), launcher_housing:Launcher housing (print), launcher_arm:Launcher arm (print), launcher_spring:Launcher spring (print), accessory_flag:Flag accessory (print), none:Modules only]

// Print-ready turns parts the right way up for the printer bed. As assembled shows how they sit in use.
orientation = "print"; // [print:Print-ready, assembled:As assembled]

/* [Base size] */
// Footprint of the square base. Bigger is steadier when the launcher snaps.
base_width = 140; // [120:120 mm - compact, 140:140 mm - standard, 160:160 mm - extra stable]

// Overall height of the base. Taller leaves more room inside for wiring.
base_height = 55; // [45:45 mm - low, 55:55 mm - standard, 65:65 mm - roomy]

// How rounded the corners are.
corner_radius = 15; // [8:Slightly rounded, 15:Rounded, 25:Very rounded]

// Wall thickness. Thicker walls are stronger and heavier.
wall = 3; // [2.4:2.4 mm - light, 3:3 mm - standard, 4:4 mm - heavy duty]

/* [Motor and hub] */
// Shaft length of your N20 gear motor (check the listing). Changes how deep the hub's shaft hole is.
motor_shaft_length = 10; // [10:10 mm shaft - most common, 15:15 mm shaft]

// How the motor is held under the deck.
motor_screws = "yes"; // [yes:Pocket + two M1.6 x 3 mm screws through the deck, no:Pocket only - glue it in]

// How tightly the hub grips the motor shaft. Print the fit-test coupon first. Go tighter if the hub slips.
shaft_fit = 0.15; // [0.05:Tight press fit, 0.15:Snug - start here, 0.25:Loose - glue it]

// Size of the hex drive that every top plugs onto. Keep this the same for all your tops.
hex_size = 8; // [6:6 mm - small light tops, 8:8 mm - standard, 10:10 mm - heavy tops]

// Gap between the hex and the socket in each top. Looser makes tops easier for students to swap.
hex_clearance = 0.4; // [0.2:Tight, 0.4:Standard, 0.6:Loose - easiest swapping]

/* [Top locking ring] */
// Groove in the deck that holds tops with a part that must stay still (up-and-down cam tops, ticker tops).
lock_ring = "yes"; // [yes:Groove with 3 keys, no:Flat deck]

// Diameter of the locking groove. Stationary top housings must match this.
lock_ring_diameter = 90; // [70:70 mm, 90:90 mm - standard, 110:110 mm - needs 140 mm base or bigger]

/* [Controls] */
// Simple: motor runs only while the switch is pressed, no code. Smart: microcontroller adds latch/timed mode and a speed knob.
build_type = "smart"; // [simple:Simple - momentary only, smart:Smart - momentary + latch + speed knob]

// Hole for the panel-mount 3.5 mm switch jack (back wall). Match your jack's thread.
jack_hole = 6.2; // [6.2:6 mm thread - PJ-392 style, 8.2:8 mm thread]

// Hole for the power switch and the mode switch (front wall).
toggle_hole = 6.2; // [6.2:6 mm mini toggle, 12.2:12 mm round rocker]

// Hole for the speed knob potentiometer (front wall, smart build only).
pot_hole = 7.2; // [7.2:7 mm bushing - 16 mm pot, 9.7:9.5 mm bushing - 24 mm pot]

/* [Braille labels] */
// Raised braille above each control (dots stand out from the walls). Uses your 3D braille dot specs.
braille_labels = "uncontracted"; // [uncontracted:UEB uncontracted, contracted:UEB contracted, none:No labels]

/* [Bottom plate] */
// How the bottom plate screws into the corner posts.
screw_type = "self_tap"; // [self_tap:M3 self-tapping screws into plastic, insert:M3 heat-set inserts]

// Recesses for stick-on rubber bumper feet (stops the base walking).
feet = "yes"; // [yes:4 recesses for 10 mm bumpers, no:Flat bottom]

// Battery pack. Sets where the zip-tie slots go.
battery = "3AA"; // [3AA:3 x AA holder - 4.5 V - recommended, 4AA:4 x AA holder - 6 V - simple build only]

/* [Tops] */
// Ticker tab leaf thickness. Thicker ticks harder and asks more of the motor.
ticker_tab = 1.2; // [0.8:Light tick - 0.8 mm, 1.2:Standard - 1.2 mm, 1.6:Strong tick - 1.6 mm]

// Rumble lid flap thickness. Thicker presses harder on the ridges: stronger buzz, more load on the motor.
rumble_flap = 1.2; // [1.0:Light - 1.0 mm, 1.2:Standard - 1.2 mm, 1.5:Strong - 1.5 mm]

// Which way your motor turns, seen from above. Run the test disc and watch its bump. The launcher only works one way round.
launcher_direction = "ccw"; // [ccw:Counter-clockwise, cw:Clockwise]

// Launcher spring height. Taller snaps harder and asks more of the motor.
launcher_spring = 4; // [3:Gentle - 3 mm, 4:Standard - 4 mm, 5:Strong - 5 mm]

// How the add-on hex on top of a spinning top holds an accessory.
addon_hold = 0.25; // [0:Slip fit - lifts straight off, 0.25:Light snap, 0.35:Firm snap]

/* [Hidden] */
$fn = 64;
tab_t             = ticker_tab;
rumble_flap_t     = rumble_flap;
launcher_spring_h = launcher_spring;
addon_snap        = addon_hold;
eps = 0.01;

// --- Your braille specs (from your flash-card file) ---
dot_h      = 0.9;   // dot height
dot_d      = 1.6;   // dot base diameter
dot_sp     = 2.5;   // dot spacing within a cell
cell_sp    = 6.5;   // cell-to-cell spacing

// --- Fixed interface numbers (do not change once you make tops) ---
deck_t       = 4;     // deck thickness
local_deck   = 2.5;   // deck thickness right over the motor
hub_gap      = 1;     // hub floats this far above the deck
hub_base_h   = 8;     // hub collar height; tops rest on its shoulder
hex_h        = 10;    // hex drive height
groove_w     = 4;     // lock groove width
groove_d     = 2;     // lock groove depth
key_w        = 8;     // key notch width
key_len      = 6;     // key notch reach outward from groove
plate_t      = 3;     // bottom plate thickness
plate_clear  = 0.3;   // gap around bottom plate
post_r       = 4.5;   // corner post radius

// --- N20 gear motor ---
n20_w   = 12;     // across the round sides
n20_t   = 10;     // across the flats
n20_len = 24;     // gearbox + motor body (no terminals)
n20_screw_sp = 9; // gearbox screw spacing (M1.6)
motor_pocket_clear = 0.3;
holder_wall = 2;
holder_h    = 14;

// --- Derived ---
W  = base_width;
H  = base_height;
R  = corner_radius;
deck_top      = H;
shaft_exposed = motor_shaft_length - local_deck;
bore_depth    = shaft_exposed - hub_gap;
hub_d         = hex_size / cos(30) + 4;
shoulder_z    = deck_top + hub_gap + hub_base_h;   // where tops sit
hex_top_z     = shoulder_z + hex_h;
ctrl_z        = 20;                                 // control hole height
label_top_z   = ctrl_z + 17;                        // top row of braille dots
disc_sock_d   = hex_h + 0.5;   // socket deeper than the hex so tops rest on the shoulder
disc_boss_h   = 3 + disc_sock_d - 0.5;
in_half       = W/2 - wall;                         // inside half-width

batt_w = (battery == "3AA") ? 47 : 62;              // holder width (across cells)
batt_l = 60;                                        // holder length (along cells)
batt_y = in_half - batt_w/2 - 3;                    // battery sits toward back

// Post position: tucked into each corner so it merges with the wall
post_d   = max(0, R - wall - post_r + 0.5);
post_pos = (W/2 - R) + post_d / sqrt(2);
post_hole = (screw_type == "insert") ? 4.0 : 2.6;

// --- Braille words (dot numbers per cell) ---
// Uncontracted: plain letters. Contracted UEB: ch, ow, er, ed groupsigns.
function word(name) =
  braille_labels == "contracted" ?
    (name == "switch" ? [[2,3,4],[2,4,5,6],[2,4],[2,3,4,5],[1,6]] :
     name == "power"  ? [[1,2,3,4],[2,4,6],[1,2,4,5,6]] :
     name == "mode"   ? [[1,3,4],[1,3,5],[1,4,5],[1,5]] :
     name == "speed"  ? [[2,3,4],[1,2,3,4],[1,5],[1,2,4,6]] : [])
  :
    (name == "switch" ? [[2,3,4],[2,4,5,6],[2,4],[2,3,4,5],[1,4],[1,2,5]] :
     name == "power"  ? [[1,2,3,4],[1,3,5],[2,4,5,6],[1,5],[1,2,3,5]] :
     name == "mode"   ? [[1,3,4],[1,3,5],[1,4,5],[1,5]] :
     name == "speed"  ? [[2,3,4],[1,2,3,4],[1,5],[1,5],[1,4,5]] : []);

function label_width(n) = (n - 1) * cell_sp + dot_sp + dot_d;

// --- Checks ---
assert(lock_ring == "no" || lock_ring_diameter/2 + groove_w/2 + key_len + 2 < W/2,
       "Locking ring is too big for this base. Pick a smaller ring or a bigger base.");
assert(H - local_deck - n20_len - 3 > plate_t + 2,
       "Base is too short for the motor. Pick a taller base.");

// Front controls spacing and label-fit warning
front_flat = W - 2*R;
n_front    = (build_type == "smart") ? 3 : 1;
front_sp   = front_flat / 3;
if (braille_labels != "none" && build_type == "smart" &&
    label_width(5) > front_sp - 3)
  echo("WARNING: Front braille labels may touch. Use contracted labels or a bigger base.");

echo(str("TOP INTERFACE SPEC -> hex ", hex_size, " mm across flats, socket ",
         hex_size + hex_clearance, " mm; tops rest on shoulder ",
         shoulder_z - deck_top, " mm above deck; hex is ", hex_h,
         " mm tall; lock groove centre diameter ", lock_ring_diameter, " mm."));

// =====================================================================
//  Helpers
// =====================================================================
module rsq(w, r) { offset(r = r) square(w - 2*r, center = true); }

module hex_prism(af, h) { cylinder(d = af / cos(30), h = h, $fn = 6); }

// One braille dot: short rod with a hemisphere on top (your preferred shape)
module dot() {
  translate([0, 0, -0.2]) cylinder(d = dot_d, h = dot_h - dot_d/2 + 0.25, $fn = 24);
  translate([0, 0, dot_h - dot_d/2])
    intersection() {
      sphere(d = dot_d, $fn = 24);
      translate([0, 0, dot_d/2]) cube(dot_d, center = true);
    }
}

// Braille word laid out flat: x = reading direction, y = up, dots point +z
module braille_word(cells) {
  n = len(cells);
  w = (n - 1) * cell_sp + dot_sp;
  translate([-w/2, 0, 0])
    for (i = [0 : n - 1])
      for (d = cells[i]) {
        col = (d >= 4) ? 1 : 0;
        row = (d - 1) % 3;
        translate([i * cell_sp + col * dot_sp, -row * dot_sp, 0]) dot();
      }
}

// D-shaped bore for a 3 mm N20 shaft
module d_profile() {
  d = 3 + shaft_fit;
  intersection() {
    circle(d = d, $fn = 40);
    translate([-d/2, -d/2]) square([d, 2.5 + shaft_fit]);
  }
}

// =====================================================================
//  Base shell (modelled as assembled: open bottom at z=0, deck on top)
// =====================================================================
module motor_holder_solid() {
  ow = n20_w + 2*motor_pocket_clear + 2*holder_wall;
  ot = n20_t + 2*motor_pocket_clear + 2*holder_wall;
  translate([-ow/2, -ot/2, deck_top - deck_t - holder_h])
    cube([ow, ot, holder_h + eps]);
}

module motor_holder_cut() {
  pw = n20_w + 2*motor_pocket_clear;
  pt = n20_t + 2*motor_pocket_clear;
  // pocket from below, stops at the thin local deck
  translate([-pw/2, -pt/2, deck_top - deck_t - holder_h - 1])
    cube([pw, pt, holder_h + 1 + (deck_t - local_deck)]);
  // shaft + bushing hole
  translate([0, 0, deck_top - local_deck - 1]) cylinder(d = 5, h = local_deck + 2);
  // gearbox screws, counterbored from the top so heads sit below the hub
  if (motor_screws == "yes")
    for (sx = [-1, 1]) translate([sx * n20_screw_sp/2, 0, 0]) {
      translate([0, 0, deck_top - local_deck - 1]) cylinder(d = 1.9, h = local_deck + 2, $fn = 20);
      translate([0, 0, deck_top - 1.5]) cylinder(d = 3.4, h = 2, $fn = 24);
    }
  // wire exit slot at the bottom of the holder
  translate([-3, -20, deck_top - deck_t - holder_h - 1]) cube([6, 40, 4]);
}

module lock_ring_cut() {
  if (lock_ring == "yes") {
    rc = lock_ring_diameter / 2;
    translate([0, 0, deck_top - groove_d]) {
      difference() {
        cylinder(r = rc + groove_w/2, h = groove_d + 1, $fn = 128);
        translate([0, 0, -1]) cylinder(r = rc - groove_w/2, h = groove_d + 3, $fn = 128);
      }
      for (a = [90, 210, 330]) rotate([0, 0, a])
        translate([rc - groove_w/2, -key_w/2, 0]) cube([groove_w + key_len, key_w, groove_d + 1]);
    }
  }
}

// x positions of the front controls
function front_x() = (build_type == "smart") ? [-front_sp, 0, front_sp] : [0];
function front_holes() = (build_type == "smart") ? [toggle_hole, toggle_hole, pot_hole] : [toggle_hole];
function front_words() = (build_type == "smart") ? ["power", "mode", "speed"] : ["power"];

module control_holes() {
  xs = front_x(); hs = front_holes();
  for (i = [0 : len(xs) - 1])
    translate([xs[i], -W/2 - 1, ctrl_z]) rotate([-90, 0, 0]) cylinder(d = hs[i], h = wall + 2);
  // switch jack on the back wall
  translate([0, W/2 + 1, ctrl_z]) rotate([90, 0, 0]) cylinder(d = jack_hole, h = wall + 2);
}

module labels() {
  if (braille_labels != "none") {
    xs = front_x(); ws = front_words();
    // front wall: reader faces +y, reads left-to-right along +x
    for (i = [0 : len(xs) - 1])
      translate([xs[i], -W/2, label_top_z]) rotate([90, 0, 0]) braille_word(word(ws[i]));
    // back wall: reader faces -y, so reading direction is -x
    translate([0, W/2, label_top_z]) rotate([90, 0, 180]) braille_word(word("switch"));
  }
}

module base_shell() {
  difference() {
    union() {
      difference() {
        linear_extrude(H) rsq(W, R);
        translate([0, 0, -1]) linear_extrude(H - deck_t + 1) rsq(W - 2*wall, R - wall);
      }
      // corner posts for the bottom plate
      for (sx = [-1, 1], sy = [-1, 1])
        translate([sx * post_pos, sy * post_pos, plate_t])
          cylinder(r = post_r, h = H - deck_t - plate_t + eps);
      motor_holder_solid();
      labels();
    }
    motor_holder_cut();
    lock_ring_cut();
    control_holes();
    // screw holes in the posts
    for (sx = [-1, 1], sy = [-1, 1])
      translate([sx * post_pos, sy * post_pos, plate_t - 1])
        cylinder(d = post_hole, h = 12, $fn = 24);
  }
}

// =====================================================================
//  Bottom plate (sits inside the walls, flush with the bottom edge)
// =====================================================================
module bottom_plate() {
  foot_pos = post_pos - 9;
  difference() {
    linear_extrude(plate_t) rsq(W - 2*wall - 2*plate_clear, max(1, R - wall - plate_clear));
    // countersunk M3 screw holes
    for (sx = [-1, 1], sy = [-1, 1]) translate([sx * post_pos, sy * post_pos, 0]) {
      translate([0, 0, -1]) cylinder(d = 3.4, h = plate_t + 2, $fn = 24);
      translate([0, 0, -eps]) cylinder(d1 = 6.4, d2 = 3.4, h = 1.6, $fn = 24);
    }
    // rubber feet recesses
    if (feet == "yes")
      for (sx = [-1, 1], sy = [-1, 1])
        translate([sx * foot_pos, sy * foot_pos, -eps]) cylinder(d = 10.6, h = 1);
    // zip-tie slots for the battery holder (two straps)
    for (sx = [-1, 1], sy = [-1, 1])
      translate([sx * batt_l/4 - 2, batt_y + sy * (batt_w/2 + 3) - 1.25, -1]) cube([4, 2.5, plate_t + 2]);
    // tactile "front" notch so you can tell which way it goes back on
    translate([0, -(W/2 - wall), -1]) cylinder(d = 6, h = plate_t + 2);
  }
}

// =====================================================================
//  Universal hub: D-bore on the motor shaft, hex drive on top
// =====================================================================
module hub() {
  difference() {
    union() {
      cylinder(d = hub_d, h = hub_base_h);
      translate([0, 0, hub_base_h - eps]) {
        hex_prism(hex_size, hex_h - 1);
        translate([0, 0, hex_h - 1 - eps])
          cylinder(d1 = hex_size / cos(30), d2 = (hex_size - 1.4) / cos(30), h = 1, $fn = 6);
      }
    }
    translate([0, 0, -eps]) linear_extrude(bore_depth) d_profile();
    translate([0, 0, -eps]) cylinder(d1 = 3.8, d2 = 3, h = 0.5, $fn = 32); // entry chamfer
  }
}

// =====================================================================
//  Test spin disc: plain disc top, modelled print-ready (disc on bed)
// =====================================================================
module test_disc() {
  disc_d = min(80, lock_ring_diameter - groove_w - 6);
  boss_d = hex_size / cos(30) + 5;
  sock_d = disc_sock_d;
  boss_h = disc_boss_h;
  difference() {
    union() {
      cylinder(d = disc_d, h = 3, $fn = 128);
      cylinder(d = boss_d, h = boss_h);
      // one raised tactile bump near the rim so a student can feel it turn
      translate([disc_d/2 - 7, 0, 3 - eps]) cylinder(d = 8, h = 3);
    }
    translate([0, 0, boss_h - sock_d]) hex_prism(hex_size + hex_clearance, sock_d + 1);
    translate([0, 0, boss_h - 0.6]) cylinder(d1 = (hex_size + hex_clearance) / cos(30),
                                             d2 = (hex_size + hex_clearance + 1.2) / cos(30),
                                             h = 0.61, $fn = 6);
  }
}

// =====================================================================
//  Fit-test coupon: motor pocket, screw holes, and a hex socket sample
// =====================================================================
module fit_test() {
  ow = n20_w + 2*motor_pocket_clear + 2*holder_wall;
  ot = n20_t + 2*motor_pocket_clear + 2*holder_wall;
  pw = n20_w + 2*motor_pocket_clear;
  pt = n20_t + 2*motor_pocket_clear;
  // motor section, print-ready: thin deck on the bed, pocket opening upward
  difference() {
    union() {
      translate([-12, -10, 0]) cube([24, 20, deck_t]);
      translate([-ow/2, -ot/2, 0]) cube([ow, ot, deck_t + 8]);
    }
    translate([-pw/2, -pt/2, local_deck]) cube([pw, pt, 20]);
    translate([0, 0, -1]) cylinder(d = 5, h = local_deck + 2);
    if (motor_screws == "yes")
      for (sx = [-1, 1]) translate([sx * n20_screw_sp/2, 0, 0]) {
        translate([0, 0, -1]) cylinder(d = 1.9, h = local_deck + 2, $fn = 20);
        translate([0, 0, -1]) cylinder(d = 3.4, h = 2.5, $fn = 24);
      }
  }
  // socket sample with the snap groove: drop the printed hub into it to
  // check the swap feel, and the peg below to check the add-on snap
  translate([26, 0, 0]) difference() {
    cylinder(d = hex_size / cos(30) + 6, h = 1.5 + socket_depth);
    translate([0, 0, 1.5 + socket_depth]) mirror([0, 0, 1]) addon_socket(socket_depth + eps);
  }
  // add-on peg sample: the hex that sits on top of the tops
  translate([48, 0, 0]) {
    cylinder(d = 16, h = 2);
    translate([0, 0, 2 - eps]) addon_hex();
  }
}

// =====================================================================
//  Dummy parts for the assembly preview
// =====================================================================
module dummy_motor() {
  color("silver")
  translate([0, 0, deck_top - local_deck]) {
    translate([0, 0, -n20_len])
      intersection() {
        cylinder(d = n20_w, h = n20_len);
        translate([-n20_w/2, -n20_t/2, 0]) cube([n20_w, n20_t, n20_len]);
      }
    difference() { cylinder(d = 3, h = motor_shaft_length);
      translate([-2, 1, -1]) cube([4, 2, motor_shaft_length + 2]); }
  }
}

module dummy_battery() {
  color("royalblue", 0.5)
  translate([-batt_l/2, batt_y - batt_w/2, plate_t]) cube([batt_l, batt_w, 16]);
}

// =====================================================================
//  Swappable tops
//  Datum for every spinning part: bottom-centre, z=0 on the hub shoulder
//  (the face that also sits on the printer bed). Housings: z=0 is the
//  bottom of the locking skirt, on the bed; the foot that lands on the
//  deck is at z = skirt_drop.
//  BOSL2 is installed but not included: pulling it in would fill the
//  Customizer with library settings this sketch does not use.
// =====================================================================

// --- Locking skirt (matches the groove cut in the base) ---
skirt_drop     = 1.6;   // how far the skirt hangs into the 2 mm groove; spec max 1.8
skirt_t        = 3.6;   // spec wall thickness inside the 4 mm groove
key_fit_w      = 7.6;   // spec key width inside the 8 mm notch
key_end_clear  = 0.8;   // skirt key stops this short of the notch end
skirt_chamfer  = 0.5;   // lead-in on the skirt bottom
deck_foot_t    = 2.8;   // ring above the skirt, beside the groove
land_w         = 1.2;   // flat the housing rests on, just outside the groove.
                        // Short enough to print as a ledge; a 45° chamfer
                        // carries the rest of the ring out to full width.

groove_r       = lock_ring_diameter / 2;
skirt_r_in     = groove_r - skirt_t / 2;
skirt_r_out    = groove_r + skirt_t / 2;
key_r_end      = groove_r + groove_w / 2 + key_len - key_end_clear;
socket_depth   = hex_h + 1;          // 11 mm: deeper than the 10 mm hex, above the 10.5 spec
shoulder_above = hub_gap + hub_base_h;

// --- Add-on hex: the same 8 mm hex as the hub, on top of spinning tops ---
// An accessory made for the hub also fits on any top that has one.
addon_bump_z   = 6;                   // snap bump height above the add-on shoulder
addon_bump_len = 4;                   // along the flat
addon_bump_r   = 1;                   // rounded bump profile

// --- Up and down: 1-lobe face cam, off-centre sliding post ---
cam_lift      = 20;
cam_lobes     = 1;                    // one rise per turn; gravity keeps up to ~300 RPM
cam_r_in      = 17;                   // narrow ring: the dome always touches at track_r
cam_r_out     = 23;
cam_z_low     = 10;
cam_boss_h    = 12;
cam_boss_r    = 8;
cam_disc_t    = 4;
cam_segments  = 120;
track_r       = 20;                   // follower axis, on the track
// One lobe puts the extra plastic on the high side. A low crescent on the
// low side, outside the ring and under the foot's reach, balances it.
cw_r_out      = 31;
cw_half       = 120;                  // crescent spans ±120° around the low point
cam_ring_moment = (cam_lobes == 1)
  ? (cam_lift / 2) * PI * (pow(cam_r_out, 3) - pow(cam_r_in, 3)) / 3 : 0;
cw_h          = cam_ring_moment / (2 * sin(cw_half) * (pow(cw_r_out, 3) - pow(cam_r_out, 3)) / 3);

slide_d       = 8;
sleeve_slop   = 0.25;                 // per side, free running, so a dry post cannot bind
sleeve_id     = slide_d + 2 * sleeve_slop;
sleeve_wall   = 3.2;
sleeve_od     = sleeve_id + 2 * sleeve_wall;
foot_od        = 14;                  // larger than the sleeve, so the foot stays captive
foot_flange_h  = 3.2;
foot_dome_r    = 6;                   // hemisphere; one contact point on the cam
foot_h         = foot_flange_h + foot_dome_r;
spigot_d       = 6;
spigot_len     = 4;                   // stops short of the bridged floor inside the dome
spigot_hole_d = spigot_d + 0.3;       // glue clearance, diametral
cap_d         = 16;
cap_h         = 3.2;
guard_r_in    = 34;                   // clears the counterweight (31) and the foot (27)
guard_t       = 3.2;
sleeve_ring   = 14;                   // full-round part of the sleeve
// The sleeve's underside is a 45° slope, lowest on the side facing the
// guard wall, so it grows out of the ribs with no support. The sloped
// part still guides the post on three sides.
sleeve_len    = sleeve_od + sleeve_ring;
post_show     = 14;                   // how much post stays above the sleeve at rest

cam_z_high      = cam_z_low + cam_lift;
contact_low     = shoulder_above + cam_z_low;
contact_high    = shoulder_above + cam_z_high;
foot_top_low    = contact_low + foot_h;
foot_top_high   = contact_high + foot_h;
sleeve_bottom_d = foot_top_high + 3;  // deck-relative
sleeve_top_d    = sleeve_bottom_d + sleeve_len;
post_top_low_d  = sleeve_top_d + post_show;
shaft_len       = post_top_low_d - foot_top_low;
guard_top_d     = sleeve_bottom_d + 2;

// --- Ticker: 10 rounded teeth, replaceable tangential reed ---
tick_teeth    = 10;
tick_disc_r   = 26;
tick_disc_t   = 4;
tick_tooth_r  = 3.2;
tick_tooth_rc = 28.8;                 // outer radius = 32
tick_tooth_z0 = 0;                    // teeth start on the bed; the disc is narrower than they reach
tick_tooth_h  = 6;
tick_boss_h   = 12;
tick_boss_r   = 9;
tick_outer_r  = tick_tooth_rc + tick_tooth_r;
tab_h         = 5;
tab_defl      = 0.8;                  // how far a tooth pushes the nose
tab_nose_r    = 2.5;
tab_nose_rc   = tick_outer_r - tab_defl + tab_nose_r;
tab_beam_in   = 35.5;
tab_beam_out  = tab_beam_in + tab_t;
tab_a0        = -42;                  // beam start, degrees
tab_a1        = -8;                   // beam end
tab_root_a0   = -48;
tab_root_a1   = -34;
tab_root_r    = 43;
tab_z0        = shoulder_above + tick_tooth_z0 + 0.6 + skirt_drop;
tab_wall_top  = shoulder_above + tick_tooth_z0 + tick_tooth_h + 4 + skirt_drop;
tick_wall_in  = 38;
tick_wall_out = tick_wall_in + guard_t;

// --- Rumble: 48 fine ridges under a flap in a snap-on lid ---
rb_disc_r     = 31;
rb_disc_t     = 3;
rb_boss_r     = 9;
rb_boss_h     = 12;
rb_ridges     = 48;                   // 48 x 3.3 turns/s = 160 buzzes a second at 200 RPM
rb_ridge_r    = 1.0;                  // rounded ridge
rb_ridge_h    = 0.4;                  // how far each ridge lifts the nub
rb_ridge_r0   = 22;
rb_ridge_r1   = 30;
rb_nub_r      = 2;
rb_nub_rc     = 26;                   // nub rides the ridges here
rb_preload    = 0.8;                  // flap is pushed up this far when the lid is on
rb_lid_t      = 2.4;
rb_lid_under  = shoulder_above + rb_boss_h + 1;   // deck-relative, 1 mm over the boss
rb_lid_top    = rb_lid_under + rb_lid_t;
rb_wall_in    = 38;
rb_wall_out   = rb_wall_in + guard_t;
rb_wall_top   = skirt_drop + rb_lid_under;        // housing frame
rb_flap_a0    = 0;                    // flap root
rb_flap_a1    = 60;                   // flap tip; the nub sits just inside it
rb_flap_r0    = 22;
rb_flap_r1    = 30;
rb_slot       = 1.2;
rb_lip_t      = 1.6;
rb_lip_d      = 4;                    // fingers hang this far into the wall
rb_lip_r_out  = rb_wall_in - 0.3;
rb_bead       = 0.5;                  // snap bead on each finger
rb_fingers    = 6;
rb_key_w      = 4;                    // stops the lid turning with the rotor
rb_nub_a      = rb_flap_a1 - 5;
rb_nub_z      = shoulder_above + rb_disc_t - rb_preload + rb_nub_r;   // nub centre, flap relaxed

// --- Launcher: snail cam, crank arm, spiral spring ---
// Local frame: pivot axis along +x, arm lies flat toward +y and snaps
// up to +z. The whole mechanism is turned or mirrored into place by
// ln_place() so it suits the motor's direction.
ln_track_r    = 18;                   // tip touches the cam here
ln_ring_in    = 15.5;
ln_ring_out   = 20.5;
ln_disc_t     = 3;
ln_boss_r     = 8;
ln_boss_h     = 12;
ln_low        = 4;                    // ramp start, above the shoulder
ln_gap        = 1.5;                  // tip clears the ramp start when the arm is up
ln_ramp_end   = 330;                  // degrees of slow rise; then a dwell, then the cliff
ln_step       = 2.5;
ln_crank      = 14;                   // tip offset from the pivot
ln_a_flat     = 120;                  // crank angle with the arm flat
ln_a_up       = 210;                  // crank angle with the arm upright
ln_tip_r      = 3;
ln_pin_r      = 2;
ln_axis_y     = 10.5;                 // keeps the tip within ±3.5 mm of the track line
ln_tip_x      = ln_track_r;
ln_tip_low_c  = shoulder_above + ln_low + ln_gap + ln_tip_r;   // deck-relative
ln_axis_z     = ln_tip_low_c - ln_crank * sin(ln_a_up);
ln_top        = ln_axis_z + ln_crank * sin(ln_a_flat) - ln_tip_r - shoulder_above;
ln_plate_x0   = 30;
ln_plate_t    = 5;
ln_boss_af    = 6;
ln_boss_len   = 7;
ln_arm_len    = 52;
ln_arm_w      = 6;
ln_hub_r      = 6;
ln_web_w      = 7;
ln_cradle_w   = 20;
ln_cradle_t   = 12;                   // cradle is thicker than the arm so a pom-pom sits in it
ln_tower_x0   = ln_plate_x0 + ln_plate_t + 1;
ln_tower_x1   = ln_tower_x0 + 10;
ln_wall_top   = 10;                   // deck-relative; well under the flat arm
// spiral spring
ln_sp_t       = 1.0;
ln_sp_r0      = 4.9;                  // starts inside the hub, so the root is solid
ln_sp_r1      = 10;
ln_sp_pitch   = 2.2;
ln_sp_hub_r   = 5;
ln_sp_preload = 30;                   // degrees; the 12-point hole fits the hex every 30°
ln_finger_a   = -22;                  // where the spring's finger rests, arm upright
ln_finger_w   = 2.4;
ln_finger_r1  = 15.5;
ln_sp_x1      = ln_plate_x0 - 0.5;
ln_sp_x0      = ln_sp_x1 - launcher_spring_h;
ln_sp_turns   = (ln_sp_r1 - ln_sp_r0) / ln_sp_pitch;
ln_sp_len     = 2 * PI * (ln_sp_r0 + ln_sp_r1) / 2 * ln_sp_turns;
ln_sp_k       = 2000 * launcher_spring_h * pow(ln_sp_t, 3) / (12 * ln_sp_len);  // N·mm per rad, PETG
ln_sp_t_flat  = ln_sp_k * (ln_sp_preload + 90) * PI / 180;
ln_slope      = (ln_top - ln_low) / (ln_ramp_end / 360 * 2 * PI * ln_track_r);
ln_cam_torque = ln_sp_t_flat / (ln_crank * abs(cos(ln_a_flat))) * (ln_slope + 0.2) * ln_track_r;

// PETG flexural modulus, used only for the console estimate. PLA is stiffer
// and will stall this motor, so the tab is a PETG or TPU part.
tab_E_mpa = 2000;
tab_arc_len = (tab_a1 - tab_a0) / 360 * 2 * PI * (tab_beam_in + tab_beam_out) / 2;
tab_I = tab_h * pow(tab_t, 3) / 12;
tab_force_n = 3 * tab_E_mpa * tab_I * tab_defl / pow(tab_arc_len, 3);
tab_torque_kgcm = tab_force_n * (tick_outer_r / 1000) / 0.0980665;

assert(skirt_drop <= 1.8, "Skirt hangs deeper than the locking groove allows.");
assert(skirt_t <= groove_w - 0.2, "Skirt is too thick for the groove.");
assert(key_fit_w <= key_w - 0.2, "Keys are too wide for the notches.");
assert(socket_depth >= hex_h + 0.5, "Socket is not deeper than the hex.");
assert(cam_r_out <= 40, "Cam is wider than a housed top is allowed to be.");
assert(track_r - foot_dome_r >= cam_boss_r + 2, "Lifter foot hits the cam boss.");
assert(cw_h <= cam_z_low, "Cam counterweight rises into the foot.");
assert(skirt_r_in - shoulder_above >= cw_r_out + 2, "Cam counterweight rubs the housing floor.");
assert(tick_outer_r <= 40, "Ticker teeth are wider than a housed top is allowed to be.");
assert(sleeve_bottom_d >= foot_top_high + 2, "Lifter foot hits the sleeve at the top of the stroke.");
assert(shaft_len > sleeve_len, "Post pulls out of the sleeve at the bottom of the stroke.");
assert(guard_r_in >= cw_r_out + 3, "Lifter housing rubs the cam.");
assert(tab_nose_rc - tab_nose_r > tick_disc_r + 2, "Ticker tab rubs the disc between teeth.");
assert(skirt_r_in - guard_r_in > deck_foot_t && skirt_r_in - tick_wall_in > deck_foot_t,
       "Housing wall is too close to the skirt for the 45° floor.");
assert(rb_ridge_r1 < rb_disc_r && rb_disc_r + 3 < rb_lip_r_out - rb_lip_t, "Rumble rotor rubs the lid fingers.");
assert(ln_sp_r1 + ln_sp_t / 2 + 1 < ln_crank - ln_pin_r, "Launcher spring rubs the crank pin.");
assert(ln_wall_top + 3 < ln_axis_z - ln_arm_w / 2, "Flat launcher arm hits the housing wall.");

// Gravity keeps the foot on the cam only while (lift/2)(lobes·ω)² < g.
cam_rpm_max = 60 / (2 * PI) * sqrt(2 * 9.81 / (cam_lift / 1000)) / cam_lobes;

echo(str("TOPS -> lift ", cam_lift, " mm, ", cam_lobes,
         " lobes; follower at r ", track_r, " mm; sleeve id ", sleeve_id,
         " mm; foot leaves the cam above about ", round(cam_rpm_max),
         " RPM; counterweight ", cw_h, " mm tall."));
echo(str("TOPS -> rumble ", rb_ridges, " ridges: ", round(rb_ridges * 200 / 60),
         " buzzes a second at 200 RPM."));
echo(str("TOPS -> launcher lift ", ln_top - ln_low, " mm; spring ", ln_sp_t_flat,
         " N·mm at flat; est. cam load ", ln_cam_torque / 98.0665,
         " kg·cm (motor stall is 0.44). PETG spring assumption."));
echo(str("TOPS -> ticker ", tick_teeth, " teeth, tab ", tab_t,
         " mm x ", tab_arc_len, " mm, est. peak ", tab_force_n,
         " N, ", tab_torque_kgcm, " kg·cm (motor stall is 0.44). PETG assumption."));

// Locking skirt. z=0 is the skirt bottom.
module lock_skirt(extra_h = 0) {
  $fn = 128;
  difference() {
    cylinder(r = skirt_r_out, h = skirt_drop + extra_h);
    translate([0, 0, -eps]) cylinder(r = skirt_r_in, h = skirt_drop + extra_h + 2 * eps);
    // 45° lead-in on the ring only. Keys are added after, full height.
    translate([0, 0, -eps])
      cylinder(r1 = skirt_r_in + skirt_chamfer, r2 = skirt_r_in, h = skirt_chamfer + eps);
    difference() {
      translate([0, 0, -eps]) cylinder(r = skirt_r_out + 1, h = skirt_chamfer + eps);
      translate([0, 0, -eps])
        cylinder(r1 = skirt_r_out - skirt_chamfer, r2 = skirt_r_out, h = skirt_chamfer + 2 * eps);
    }
  }
  for (a = [90, 210, 330])
    rotate([0, 0, a])
      translate([skirt_r_in, -key_fit_w / 2, 0])
        cube([key_r_end - skirt_r_in, key_fit_w, skirt_drop + extra_h]);
}

// Housing body above the skirt, as one turned profile (r, z):
// the floor climbs at 45° from the top of the skirt inward to the wall,
// so nothing is a flat ledge in mid-air. Outside the skirt there is a
// short land that rests on the deck, then a 45° chamfer out to the ring.
// z=0 is the skirt bottom, as in lock_skirt().
module housing_body(wall_in, wall_out, wall_top) {
  sd = skirt_drop;
  rt = skirt_drop + deck_foot_t;
  d  = skirt_r_in - wall_in;
  wt = wall_out - wall_in;
  ro = skirt_r_out + 3;
  lr = skirt_r_out + land_w;
  rotate_extrude($fn = 128)
    polygon([
      [skirt_r_in, sd],
      [wall_in, sd + d],
      [wall_in, wall_top],
      [wall_out, wall_top],
      [wall_out, sd + d],
      [skirt_r_in + wt - (rt - sd), rt],
      [ro, rt],
      [ro, sd + (ro - lr)],
      [lr, sd]
    ]);
}

// Height of the outer 45° slope at radius r (for things set on it).
function housing_outer_z(wall_in, wall_out, r) =
  skirt_drop + (skirt_r_in - wall_in) - (r - wall_out);

// Blind hex socket opening downward at z=0 (shoulder / bed).
module hex_socket_from_bottom(depth) {
  translate([0, 0, -eps]) hex_prism(hex_size + hex_clearance, depth + eps);
  translate([0, 0, -eps])
    cylinder(d1 = (hex_size + hex_clearance + 1.6) / cos(30),
             d2 = (hex_size + hex_clearance) / cos(30),
             h = 0.7, $fn = 6);
}

// Add-on hex on top of a spinning top. z=0 is the add-on shoulder (the
// top of the top's boss). Same size and chamfer as the hub's hex, so one
// accessory fits both. Optional snap bumps on two opposite flats.
module addon_hex() {
  hex_prism(hex_size, hex_h - 1);
  translate([0, 0, hex_h - 1 - eps])
    cylinder(d1 = hex_size / cos(30), d2 = (hex_size - 1.4) / cos(30), h = 1, $fn = 6);
  if (addon_snap > 0)
    for (a = [30, 210])
      rotate([0, 0, a])
        translate([hex_size / 2 + addon_snap - addon_bump_r, 0, addon_bump_z])
          rotate([90, 0, 0])
            cylinder(r = addon_bump_r, h = addon_bump_len, center = true, $fn = 24);
}

// Socket for an accessory: opens downward at z=0, like every top's socket,
// with a shallow groove the snap bumps click into. On the hub (no bumps)
// the groove does nothing.
module addon_socket(depth = socket_depth) {
  g = hex_size + hex_clearance + 1;
  hex_socket_from_bottom(depth);
  translate([0, 0, addon_bump_z - 1.2]) cylinder(d = g / cos(30), h = 1.2, $fn = 6);
  translate([0, 0, addon_bump_z - eps])
    cylinder(d1 = g / cos(30), d2 = (hex_size + hex_clearance) / cos(30), h = 0.5, $fn = 6);
}

function arc_pt(r, a) = [r * cos(a), r * sin(a)];

module annulus_sector(r_in, r_out, a0, a1, h) {
  n = max(3, round(abs(a1 - a0)));
  linear_extrude(h)
    polygon(concat(
      [for (i = [0:n]) arc_pt(r_out, a0 + (a1 - a0) * i / n)],
      [for (i = [n:-1:0]) arc_pt(r_in, a0 + (a1 - a0) * i / n)]
    ));
}

// ---------------------------------------------------------------------
//  Face cam. Print: shoulder on the bed, ramp upward. One 20 mm lobe on
//  a narrow ring, balanced by a low crescent on the opposite side.
// ---------------------------------------------------------------------
function cam_top_z(a) =
  cam_z_low + (cam_lift / 2) * (1 - cos(cam_lobes * a));

module cam_slice(a) {
  da = 360 / cam_segments;
  rotate([0, 0, a])
    linear_extrude(cam_top_z(a))
      polygon([
        [cam_r_in, -0.02],
        [cam_r_out + 0.02, -0.02],
        [(cam_r_out + 0.02) * cos(da + 0.05), (cam_r_out + 0.02) * sin(da + 0.05)],
        [cam_r_in * cos(da + 0.05), cam_r_in * sin(da + 0.05)]
      ]);
}

module cam() {
  difference() {
    union() {
      cylinder(r = cam_r_out, h = cam_disc_t);
      cylinder(r = cam_boss_r, h = cam_boss_h);
      for (i = [0:cam_segments - 1])
        hull() {
          cam_slice(i * 360 / cam_segments);
          cam_slice((i + 1) * 360 / cam_segments);
        }
      // counterweight, centred on the low point (cam angle 0)
      if (cw_h > 0) annulus_sector(cam_r_out - eps, cw_r_out, -cw_half, cw_half, cw_h);
      translate([0, 0, cam_boss_h - eps]) addon_hex();
    }
    hex_socket_from_bottom(socket_depth);
  }
}

// ---------------------------------------------------------------------
//  Lifter foot, post, housing.
//  Foot prints with the post face on the bed and the hemisphere up.
//  In use it is flipped: hemisphere down on the cam, hole up.
//  The hole is open on the bed and bridges shut inside the dome, so
//  the spigot has a floor and the contact surface stays smooth.
//  Post datum (use): spigot tip at z=0. Print flips it, cap on the bed.
//  Assembly: drop the post spigot-first down through the sleeve, then
//  glue the foot onto the spigot from underneath. The foot and the cap
//  are both wider than the sleeve, so the post is then captive.
// ---------------------------------------------------------------------
module lifter_foot_print() {
  difference() {
    union() {
      cylinder(d = foot_od, h = foot_flange_h);
      intersection() {
        translate([0, 0, foot_flange_h]) sphere(r = foot_dome_r, $fn = 64);
        translate([-foot_dome_r, -foot_dome_r, foot_flange_h - eps])
          cube([2 * foot_dome_r, 2 * foot_dome_r, foot_dome_r + 1]);
      }
    }
    translate([0, 0, -eps]) cylinder(d = spigot_hole_d, h = foot_flange_h + 1);
    translate([0, 0, -eps])
      cylinder(d1 = spigot_hole_d + 1.2, d2 = spigot_hole_d, h = 0.8);
  }
}

module lifter_foot() {
  translate([0, 0, foot_h]) mirror([0, 0, 1]) lifter_foot_print();
}

module lifter_post_use() {
  cylinder(d = spigot_d, h = spigot_len + eps);
  translate([0, 0, spigot_len]) cylinder(d = slide_d, h = shaft_len);
  translate([0, 0, spigot_len + shaft_len - eps]) cylinder(d = cap_d, h = cap_h + eps);
}

module lifter_post() {
  total = spigot_len + shaft_len + cap_h;
  translate([0, 0, total]) mirror([0, 0, 1]) lifter_post_use();
}

module lifter_housing() {
  // Sleeve sits over the track, not on the axis: a centred foot would
  // bridge every lobe and never go down.
  sleeve_z = skirt_drop + sleeve_bottom_d;   // lowest point of the sleeve
  guard_z  = skirt_drop + guard_top_d;
  g_out    = guard_r_in + guard_t;
  sr       = sleeve_od / 2;
  ridge_out = g_out + 1.4;
  ridge_z   = housing_outer_z(guard_r_in, g_out, ridge_out) - 0.3;
  difference() {
    union() {
      lock_skirt(eps);
      housing_body(guard_r_in, g_out, guard_z);
      // ridges a student can feel: this top is the up-and-down one.
      // They start on the sloped floor, so their bottoms are inside it.
      for (a = [0:45:315])
        rotate([0, 0, a])
          translate([g_out - 0.8, -1.4, ridge_z])
            cube([ridge_out - g_out + 0.8, 2.8, guard_z - ridge_z]);
      // sleeve, its underside cut at 45°: lowest at +x (toward the guard
      // wall, where the middle rib meets it), highest facing the centre
      intersection() {
        translate([track_r, 0, sleeve_z]) cylinder(r = sr, h = sleeve_len);
        translate([track_r, 0, sleeve_z])
          rotate([90, 0, 0])
            linear_extrude(height = sleeve_od + 2, center = true)
              polygon([[sr + 1, -1], [sr + 1, sleeve_len + 1],
                       [-sr - 1, sleeve_len + 1], [-sr - 1, 2 * sr + 1]]);
      }
      // ribs from the sleeve out to the guard, fanned around the sleeve.
      // Each starts where the sleeve's sloped underside is, and its guard
      // end drops by more than its reach, so the underside is steeper than 45°.
      for (a = [-50, 0, 50]) {
        s_pt  = [track_r + sr * cos(a), sr * sin(a)];
        g_pt  = [guard_r_in * cos(a), guard_r_in * sin(a)];
        s_z   = sleeve_z + sr * (1 - cos(a));
        g_z   = s_z - (norm(g_pt - s_pt) + 1);
        top_z = sleeve_z + sleeve_len;
        hull() {
          translate([track_r, 0, s_z])
            rotate([0, 0, a])
              translate([sr - eps, -1.6, 0])
                cube([eps, 3.2, top_z - s_z]);
          rotate([0, 0, a])
            translate([guard_r_in - eps, -1.6, g_z])
              cube([guard_t + eps, 3.2, top_z - g_z]);
        }
      }
    }
    translate([track_r, 0, sleeve_z - 1])
      cylinder(d = sleeve_id, h = sleeve_len + 2);
    // lead-in at the top: the post goes in from above, spigot first
    translate([track_r, 0, sleeve_z + sleeve_len - 1 + eps])
      cylinder(d1 = sleeve_id, d2 = sleeve_id + 1.4, h = 1);
  }
}

// ---------------------------------------------------------------------
//  Ticker rotor, housing, tab.
//  The tab is its own part so a broken reed is a one-minute reprint.
//  Print the tab upright, in PETG or TPU. PLA at this thickness snaps
//  or stalls the motor.
// ---------------------------------------------------------------------
module ticker_rotor() {
  difference() {
    union() {
      cylinder(r = tick_disc_r, h = tick_disc_t);
      cylinder(r = tick_boss_r, h = tick_boss_h);
      translate([0, 0, tick_boss_h - eps]) addon_hex();
      for (i = [0:tick_teeth - 1])
        rotate([0, 0, i * 360 / tick_teeth])
          translate([tick_tooth_rc, 0, tick_tooth_z0])
            cylinder(r = tick_tooth_r, h = tick_tooth_h);
    }
    hex_socket_from_bottom(socket_depth);
  }
}

// Datum: housing print frame (skirt bottom at z=0), so the tab drops
// straight into the socket. show() lowers it onto the bed for the STL.
module ticker_tab() {
  translate([0, 0, tab_z0]) {
    annulus_sector(tab_beam_out - eps, tab_root_r, tab_root_a0, tab_root_a1, tab_h);
    annulus_sector(tab_beam_in, tab_beam_out, tab_a0, tab_a1, tab_h);
    hull() {
      annulus_sector(tab_beam_in, tab_beam_out, tab_a1 - 2, tab_a1, tab_h);
      translate(arc_pt(tab_nose_rc, 0)) cylinder(r = tab_nose_r, h = tab_h);
    }
    translate(arc_pt(tab_nose_rc, 0)) cylinder(r = tab_nose_r, h = tab_h);
  }
}

module ticker_housing() {
  // 0.1° per side is about 0.07 mm at the root: a light press.
  socket_a0 = tab_root_a0 - 0.1;
  socket_a1 = tab_root_a1 + 0.1;
  socket_r1 = tab_root_r + 0.3;          // back wall stops the tab sliding outward
  rt        = skirt_drop + deck_foot_t;
  difference() {
    union() {
      lock_skirt(eps);
      housing_body(tick_wall_in, tick_wall_out, tab_wall_top);
      // short nubs, so this housing feels different from the ridged lifter.
      // They start a little above the ring so their bottoms sit in the floor slope.
      for (a = [0:30:330])
        rotate([0, 0, a])
          translate([tick_wall_out - 0.8, -1.2, rt + 0.5])
            cube([1.6 + 0.8, 2.4, 4]);
      // block outside the wall that closes the back of the tab socket
      translate([0, 0, rt - 0.5])
        annulus_sector(tick_wall_out - eps, socket_r1 + 2, socket_a0 - 3, socket_a1 + 3,
                       tab_wall_top - rt + 0.5);
    }
    // drop-in socket, open at the top and toward the centre
    translate([0, 0, tab_z0 - 0.2])
      annulus_sector(tick_wall_in - 1, socket_r1, socket_a0, socket_a1,
                     tab_wall_top - tab_z0 + 2);
  }
}

// ---------------------------------------------------------------------
//  Rumble rotor, housing, lid.
//  48 rounded ridges pass under a nub on a flap cut into the lid, so the
//  lid buzzes where the student's hand rests. The lid snaps on and covers
//  the spinning part. Print the lid top-down in PETG: the flap is a spring.
// ---------------------------------------------------------------------
module rumble_rotor() {
  difference() {
    union() {
      cylinder(r = rb_disc_r, h = rb_disc_t, $fn = 128);
      cylinder(r = rb_boss_r, h = rb_boss_h);
      for (i = [0:rb_ridges - 1])
        rotate([0, 0, i * 360 / rb_ridges])
          translate([rb_ridge_r0, 0, rb_disc_t + rb_ridge_h - rb_ridge_r])
            rotate([0, 90, 0])
              cylinder(r = rb_ridge_r, h = rb_ridge_r1 - rb_ridge_r0, $fn = 24);
    }
    hex_socket_from_bottom(socket_depth);
  }
}

rb_groove_z = rb_wall_top - rb_lip_d + 1;   // housing frame: where the lid beads sit

module rumble_housing() {
  difference() {
    union() {
      lock_skirt(eps);
      housing_body(rb_wall_in, rb_wall_out, rb_wall_top);
    }
    // groove the lid's beads click into; its roof is a 45° slope
    translate([0, 0, rb_groove_z - 0.8])
      rotate_extrude($fn = 128)
        polygon([[rb_wall_in - 1, 0], [rb_wall_in + 0.7, 0],
                 [rb_wall_in + 0.7, 1.6], [rb_wall_in - 1, 3.3]]);
    // notch for the lid's key, so the lid cannot turn with the rotor
    rotate([0, 0, 90])
      translate([rb_wall_in - 1, -(rb_key_w + 0.6) / 2, rb_wall_top - rb_lip_d - 0.5])
        cube([guard_t + 2, rb_key_w + 0.6, rb_lip_d + 1]);
  }
}

// Use frame: z=0 is the lid underside, resting on the housing wall.
module rumble_lid() {
  ft = rumble_flap_t;
  slot_a = rb_slot / ((rb_flap_r0 + rb_flap_r1) / 2) * 180 / PI;
  ro = rb_lip_r_out;
  difference() {
    union() {
      cylinder(r = rb_wall_out, h = rb_lid_t, $fn = 128);
      // snap fingers with beads; slots let them flex
      difference() {
        union() {
          translate([0, 0, -rb_lip_d]) cylinder(r = ro, h = rb_lip_d + eps, $fn = 128);
          translate([0, 0, -rb_lip_d])
            rotate_extrude($fn = 128)
              polygon([[ro - eps, 0.2], [ro + rb_bead, 0.7], [ro + rb_bead, 1.1], [ro - eps, 1.6]]);
          // key
          rotate([0, 0, 90])
            translate([ro - rb_lip_t, -rb_key_w / 2, -rb_lip_d])
              cube([rb_wall_in + 2.2 - (ro - rb_lip_t), rb_key_w, rb_lip_d + eps]);
        }
        translate([0, 0, -rb_lip_d - 1]) cylinder(r = ro - rb_lip_t, h = rb_lip_d + 2, $fn = 128);
        for (i = [0:rb_fingers - 1])
          rotate([0, 0, i * 360 / rb_fingers + 30])
            translate([ro - rb_lip_t - 1, -1, -rb_lip_d - 1])
              cube([rb_lip_t + rb_bead + 2, 2, rb_lip_d + 1]);
      }
    }
    // thin the flap from below, then cut the U-slot round it (root at rb_flap_a0)
    translate([0, 0, -eps])
      annulus_sector(rb_flap_r0, rb_flap_r1, rb_flap_a0, rb_flap_a1, rb_lid_t - ft + eps);
    translate([0, 0, -1])
      difference() {
        annulus_sector(rb_flap_r0 - rb_slot, rb_flap_r1 + rb_slot, rb_flap_a0, rb_flap_a1 + slot_a,
                       rb_lid_t + 2);
        translate([0, 0, -1])
          annulus_sector(rb_flap_r0, rb_flap_r1, rb_flap_a0 - 1, rb_flap_a1, rb_lid_t + 4);
      }
  }
  // nub on a stalk under the flap tip
  nz = rb_nub_z - rb_lid_under;
  translate([rb_nub_rc * cos(rb_nub_a), rb_nub_rc * sin(rb_nub_a), 0]) {
    translate([0, 0, nz]) cylinder(r = 1.5, h = rb_lid_t - ft - nz + eps, $fn = 24);
    hull() {
      translate([0, 0, nz]) sphere(r = rb_nub_r, $fn = 32);
      translate([0, 0, nz + rb_nub_r + 1]) cylinder(r = 1.5, h = 0.1, $fn = 24);
    }
  }
}

// ---------------------------------------------------------------------
//  Launcher cam, housing, arm, spring.
//  The cam is a ramp that rises slowly for 330°, dwells, then drops off
//  a cliff. A crank pin on the arm rides it: the ramp slowly lays the
//  arm flat against the spiral spring, and at the cliff the spring snaps
//  it upright against a stop. The arm, the spring and the housing's
//  tower are drawn in a local frame (pivot along +x, arm flat toward +y)
//  and ln_place() turns or mirrors them to suit the motor's direction.
// ---------------------------------------------------------------------
function ln_H(u) = u >= ln_ramp_end ? ln_top : ln_low + (ln_top - ln_low) * u / ln_ramp_end;

module ring_seg(r_in, r_out, a0, a1, h0, h1) {
  w = 0.05;
  hull() {
    rotate([0, 0, a0])
      linear_extrude(h0)
        polygon([[r_in, -0.01], [r_out, -0.01], arc_pt(r_out, w), arc_pt(r_in, w)]);
    rotate([0, 0, a1 - w])
      linear_extrude(h1)
        polygon([[r_in, -0.01], [r_out, -0.01], arc_pt(r_out, w), arc_pt(r_in, w)]);
  }
}

// Turning counter-clockwise, the ramp climbs under the tip; at cam angle
// 0 it drops straight back to the low level.
module launcher_cam_ccw() {
  difference() {
    union() {
      cylinder(r = ln_ring_out, h = ln_disc_t, $fn = 128);
      cylinder(r = ln_boss_r, h = ln_boss_h);
      for (i = [0:360 / ln_step - 1])
        ring_seg(ln_ring_in, ln_ring_out, i * ln_step, (i + 1) * ln_step,
                 ln_H(360 - i * ln_step), ln_H(360 - (i + 1) * ln_step));
      translate([0, 0, ln_boss_h - eps]) addon_hex();
    }
    hex_socket_from_bottom(socket_depth);
  }
}

module launcher_cam() {
  if (launcher_direction == "cw") mirror([0, 1, 0]) launcher_cam_ccw();
  else launcher_cam_ccw();
}

module ln_place() {
  if (launcher_direction == "cw") mirror([0, 1, 0]) children();
  else rotate([0, 0, 180]) children();
}

ln_pin_pt = arc_pt(ln_crank, ln_a_flat);    // crank pin, arm flat, in the arm plane

// 2D (u, v) drawing in the arm plane -> (y, z); extruded along +x from x0.
module ln_plane(x0, h) { translate([x0, 0, 0]) rotate([90, 0, 90]) linear_extrude(h) children(); }

module ln_arm_2d() {
  difference() {
    union() {
      circle(r = ln_hub_r);
      translate([0, -ln_arm_w / 2]) square([ln_arm_len - ln_cradle_w + eps, ln_arm_w]);
      hull() {
        circle(r = ln_web_w / 2);
        translate(ln_pin_pt) circle(r = ln_web_w / 2);
      }
    }
    circle(d = 3.4, $fn = 24);
  }
}

// Cradle at the arm tip: a U that holds a pom-pom while the arm is flat.
module ln_cradle_2d() {
  L = ln_arm_len;
  difference() {
    translate([L - ln_cradle_w, -ln_arm_w / 2]) square([ln_cradle_w, ln_arm_w + 9]);
    translate([L - ln_cradle_w + 3, ln_arm_w / 2]) square([ln_cradle_w - 6, 10]);
  }
}

// Arm in its axis frame: pivot along +x through the origin, arm flat along +y.
module launcher_arm_axis() {
  difference() {
    union() {
      ln_plane(ln_plate_x0, ln_plate_t) ln_arm_2d();
      ln_plane(ln_plate_x0 + ln_plate_t - ln_cradle_t, ln_cradle_t) ln_cradle_2d();
      // crank pin reaching in over the cam, ball tip
      translate([ln_tip_x, ln_pin_pt[0], ln_pin_pt[1]]) {
        rotate([0, 90, 0]) cylinder(r = ln_pin_r, h = ln_plate_x0 - ln_tip_x + eps, $fn = 24);
        hull() {
          sphere(r = ln_tip_r, $fn = 32);
          translate([ln_tip_r + 1, 0, 0]) rotate([0, 90, 0]) cylinder(r = ln_pin_r, h = 0.1, $fn = 24);
        }
      }
      // hex boss the spring keys onto
      translate([ln_plate_x0 - ln_boss_len, 0, 0])
        rotate([0, 90, 0]) hex_prism(ln_boss_af, ln_boss_len + eps);
    }
    translate([ln_plate_x0 - ln_boss_len - 1, 0, 0])
      rotate([0, 90, 0]) cylinder(d = 3.4, h = ln_boss_len + ln_plate_t + 2, $fn = 24);
  }
}

function ln_spiral(off, a_end, n) =
  [for (i = [0:n])
    let(s = i / n,
        a = a_end - ln_sp_turns * 360 * (1 - s),
        r = ln_sp_r0 + (ln_sp_r1 - ln_sp_r0) * s + off)
    arc_pt(r, a)];

function ln_reverse(l) = [for (i = [len(l) - 1:-1:0]) l[i]];

// Relaxed spring, drawn in the hub's frame with the arm upright. On
// assembly the finger is turned ln_sp_preload further and set against
// its block, so the spring holds the arm up against the stop.
ln_sp_relaxed_a = ln_finger_a - 90 - ln_sp_preload;

module ln_spring_2d() {
  n = 240;
  difference() {
    union() {
      circle(r = ln_sp_hub_r, $fn = 48);
      polygon(concat(ln_spiral(ln_sp_t / 2, ln_sp_relaxed_a, n),
                     ln_reverse(ln_spiral(-ln_sp_t / 2, ln_sp_relaxed_a, n))));
      rotate(ln_sp_relaxed_a)
        translate([ln_sp_r1 - 0.4, -ln_finger_w / 2])
          square([ln_finger_r1 - ln_sp_r1 + 0.4, ln_finger_w]);
    }
    // 12-point hole: fits the hex boss every 30°
    for (a = [0, 30]) rotate(a) circle(d = (ln_boss_af + 0.3) / cos(30), $fn = 6);
  }
}

// Interior under the housing's 45° floor, deck-relative. Anything the
// launcher adds is cut back to the floor slope, so it prints unsupported.
module ln_floor_void() {
  translate([0, 0, -eps]) cylinder(r1 = skirt_r_in, r2 = 0, h = skirt_r_in, $fn = 128);
  translate([0, 0, -50]) cylinder(r = skirt_r_in, h = 50, $fn = 128);
}

// Tower with the pivot screw, the block the spring's finger presses on,
// and the stop the crank hits when the arm is upright. Deck-relative.
module ln_mechanism() {
  rt_d = deck_foot_t;    // ring top, deck-relative
  difference() {
    union() {
      intersection() {
        translate([ln_tower_x0, ln_axis_y - 8, rt_d - 0.5])
          cube([ln_tower_x1 - ln_tower_x0, 16, ln_axis_z + 7.5 - rt_d]);
        cylinder(r = skirt_r_out + 2.9, h = 100, $fn = 128);
      }
      // finger block, in the spring's plane, carried down to the floor
      translate([ln_plate_x0 - 7.5, 0, 0])
        rotate([90, 0, 90])
          linear_extrude(7)
            translate([ln_axis_y, ln_axis_z])
              hull() {
                for (dz = [0, -40]) translate([0, dz])
                  rotate(ln_finger_a)
                    translate([ln_sp_r1 + 1.2, -(ln_finger_w / 2 + 0.3 + 6)])
                      square([ln_finger_r1 - ln_sp_r1 - 1.2, 6]);
              }
      // upright stop, in the arm's plane, carried down to the floor
      translate([ln_plate_x0 + 0.2, 0, 0])
        rotate([90, 0, 90])
          linear_extrude(ln_tower_x0 + 1 - ln_plate_x0 - 0.2)
            translate([ln_axis_y, ln_axis_z])
              hull() {
                for (dz = [0, -40]) translate([0, dz])
                  rotate(ln_a_up)
                    translate([7.5, ln_web_w / 2])
                      square([6.5, 6]);
              }
    }
    ln_floor_void();
    // pilot hole for the M3 pivot screw, threaded in from the arm side
    translate([ln_tower_x0 - 1, ln_axis_y, ln_axis_z])
      rotate([0, 90, 0]) cylinder(d = 2.6, h = ln_tower_x1 - ln_tower_x0 - 1, $fn = 24);
  }
}

module launcher_housing() {
  lock_skirt(eps);
  housing_body(38, 38 + guard_t, skirt_drop + ln_wall_top);
  translate([0, 0, skirt_drop]) ln_place() ln_mechanism();
}

// Arm and spring at rest (arm upright), local frame, deck-relative.
module ln_moving(theta = 90) {
  translate([0, ln_axis_y, ln_axis_z]) {
    rotate([theta, 0, 0]) launcher_arm_axis();
    rotate([theta + ln_sp_preload, 0, 0])
      ln_plane(ln_sp_x0, launcher_spring_h) ln_spring_2d();
  }
}

// Print: arm lies on the outer face of its plate; pin, boss and cradle up.
module launcher_arm_print() {
  translate([0, 0, ln_plate_x0 + ln_plate_t]) rotate([0, 90, 0])
    if (launcher_direction == "cw") mirror([0, 1, 0]) launcher_arm_axis();
    else launcher_arm_axis();
}

module launcher_spring_print() {
  linear_extrude(launcher_spring_h)
    if (launcher_direction == "cw") mirror([1, 0]) ln_spring_2d();
    else ln_spring_2d();
}

ln_tip_ang = atan2(ln_axis_y + ln_crank * cos(ln_a_up), ln_tip_x);
// cam turned so the tip sits just past the cliff, as it does at rest
ln_cam_rest = (launcher_direction == "cw") ? -ln_tip_ang - 10 : 180 + ln_tip_ang - 350;

// ---------------------------------------------------------------------
//  Flag accessory: an example add-on. Bright single colour for CVI.
//  Fits the hub or any add-on hex. Prints socket-down, flag standing up.
// ---------------------------------------------------------------------
module accessory_flag() {
  boss_d = hex_size / cos(30) + 6;
  difference() {
    union() {
      cylinder(d = boss_d, h = socket_depth + 1.5);
      translate([boss_d / 2 - 1, -1.2, 0]) cube([36, 2.4, 30]);
    }
    addon_socket(socket_depth);
  }
}

// Housing print model is placed with the foot on the deck.
module place_housing() {
  translate([0, 0, deck_top - skirt_drop]) children();
}

cam_mesh_clear = 0.35; // keep the hemisphere off the faceted valley in the preview

module lifter_stack() {
  // Use datum: hemisphere tip at z=0. Post is glued into the foot.
  lifter_foot();
  translate([0, 0, foot_h - spigot_len]) lifter_post_use();
}

module place_lifter_rest() {
  // Gravity rest. Cam angle 0 is a valley under the follower. The extra
  // cam_mesh_clear keeps the hemisphere off the cam's facets in the mesh.
  translate([track_r, 0, shoulder_z + cam_z_low + cam_mesh_clear]) lifter_stack();
}

// =====================================================================
//  Output
// =====================================================================
module preview_base() {
  color("gold", 0.9) base_shell();
  color("dimgray") bottom_plate();
  dummy_motor();
  dummy_battery();
  color("white") translate([0, 0, deck_top + hub_gap]) hub();
}

module show() {
  if (part == "assembly") {
    preview_base();
    color("tomato") translate([0, 0, shoulder_z + disc_boss_h]) mirror([0, 0, 1]) test_disc();
  }
  else if (part == "assembly_rumble") {
    preview_base();
    color("steelblue") translate([0, 0, shoulder_z]) rumble_rotor();
    color("seagreen") place_housing() rumble_housing();
    color("orange", 0.8) translate([0, 0, deck_top + rb_lid_under]) rumble_lid();
  }
  else if (part == "assembly_lift") {
    preview_base();
    color("steelblue") translate([0, 0, shoulder_z]) cam();
    color("seagreen") place_housing() lifter_housing();
    color("coral") place_lifter_rest();
  }
  else if (part == "assembly_ticker") {
    preview_base();
    color("steelblue") translate([0, 0, shoulder_z]) ticker_rotor();
    color("seagreen") place_housing() ticker_housing();
    color("orange") place_housing() ticker_tab();
  }
  else if (part == "assembly_launcher") {
    preview_base();
    color("steelblue") translate([0, 0, shoulder_z]) rotate([0, 0, ln_cam_rest]) launcher_cam();
    color("seagreen") place_housing() launcher_housing();
    color("orange") translate([0, 0, deck_top]) ln_place() ln_moving(90);
  }
  else if (part == "assembly_flag") {
    preview_base();
    color("yellow") translate([0, 0, shoulder_z]) accessory_flag();
  }
  else if (part == "base_shell") {
    if (orientation == "print") translate([0, 0, H]) rotate([180, 0, 0]) base_shell();
    else base_shell();
  }
  else if (part == "bottom_plate") bottom_plate();
  else if (part == "hub") {
    if (orientation == "print") hub();
    else translate([0, 0, deck_top + hub_gap]) hub();
  }
  else if (part == "test_disc") {
    if (orientation == "print") test_disc();
    else translate([0, 0, shoulder_z + disc_boss_h]) mirror([0, 0, 1]) test_disc();
  }
  else if (part == "fit_test") fit_test();
  else if (part == "rumble_rotor") {
    if (orientation == "print") rumble_rotor();
    else translate([0, 0, shoulder_z]) rumble_rotor();
  }
  else if (part == "rumble_housing") {
    if (orientation == "print") rumble_housing();
    else place_housing() rumble_housing();
  }
  else if (part == "rumble_lid") {
    // print top-down: the flap is the bottom layers, the nub points up
    if (orientation == "print") translate([0, 0, rb_lid_t]) mirror([0, 0, 1]) rumble_lid();
    else translate([0, 0, deck_top + rb_lid_under]) rumble_lid();
  }
  else if (part == "cam") {
    if (orientation == "print") cam();
    else translate([0, 0, shoulder_z]) cam();
  }
  else if (part == "lifter_foot") {
    if (orientation == "print") lifter_foot_print();
    else lifter_foot();
  }
  else if (part == "lifter_post") {
    if (orientation == "print") lifter_post();
    else lifter_post_use();
  }
  else if (part == "lifter_housing") {
    if (orientation == "print") lifter_housing();
    else place_housing() lifter_housing();
  }
  else if (part == "ticker_rotor") {
    if (orientation == "print") ticker_rotor();
    else translate([0, 0, shoulder_z]) ticker_rotor();
  }
  else if (part == "ticker_housing") {
    if (orientation == "print") ticker_housing();
    else place_housing() ticker_housing();
  }
  else if (part == "ticker_tab") {
    if (orientation == "print") translate([0, 0, -tab_z0]) ticker_tab();
    else place_housing() ticker_tab();
  }
  else if (part == "launcher_cam") {
    if (orientation == "print") launcher_cam();
    else translate([0, 0, shoulder_z]) rotate([0, 0, ln_cam_rest]) launcher_cam();
  }
  else if (part == "launcher_housing") {
    if (orientation == "print") launcher_housing();
    else place_housing() launcher_housing();
  }
  else if (part == "launcher_arm") {
    if (orientation == "print") launcher_arm_print();
    else translate([0, 0, deck_top]) ln_place()
      translate([0, ln_axis_y, ln_axis_z]) rotate([90, 0, 0]) launcher_arm_axis();
  }
  else if (part == "launcher_spring") {
    if (orientation == "print") launcher_spring_print();
    else translate([0, 0, deck_top]) ln_place()
      translate([0, ln_axis_y, ln_axis_z]) rotate([90 + ln_sp_preload, 0, 0])
        ln_plane(ln_sp_x0, launcher_spring_h) ln_spring_2d();
  }
  else if (part == "accessory_flag") {
    if (orientation == "print") accessory_flag();
    else translate([0, 0, shoulder_z]) accessory_flag();
  }
  else if (part == "none") { }
  else echo(str("Unknown part: ", part));
}

show();
