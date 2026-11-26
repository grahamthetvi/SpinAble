// =====================================================================
//  SpinAble Platform - Base and tops  (sketch v0.2)
//  One switch, one motor, swappable 3D-printed tops.
//  The top you drop on decides the motion: spin, wobble, up-and-down, or tick.
//
//  Open in OpenSCAD, then Window > Customizer. Every setting is a
//  drop-down. Pick "Which part" to export each STL one at a time.
//  Units: millimetres. See README.md for parts, wiring and the
//  Top Interface Spec that every top must follow.
// =====================================================================

/* [Which part] */
// Choose what to show. Export one printable part at a time as STL.
part = "assembly"; // [assembly:Base with spin disc (preview), assembly_wobble:Base with wobble top (preview), assembly_lift:Base with up-and-down top (preview), assembly_ticker:Base with ticker top (preview), base_shell:Base shell (print), bottom_plate:Bottom plate (print), hub:Universal hub (print), test_disc:Test spin disc (print), fit_test:Fit-test coupon (print), wobble_rotor:Wobble rotor (print), wobble_plug:Wobble plug (print), cam:Up-down cam (print), lifter_foot:Lifter foot (print), lifter_post:Lifter post (print), lifter_housing:Lifter housing (print), ticker_rotor:Ticker rotor (print), ticker_housing:Ticker housing (print), ticker_tab:Ticker tab (print), none:Modules only]

// Print-ready turns parts the right way up for the printer bed. As assembled shows how they sit in use.
orientation = "print"; // [print:Print-ready, assembled:As assembled]

/* [Base size] */
// Footprint of the square base. Bigger is steadier when a wobble top is running.
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

// Recesses for stick-on rubber bumper feet (stops the base walking during wobble tops).
feet = "yes"; // [yes:4 recesses for 10 mm bumpers, no:Flat bottom]

// Battery pack. Sets where the zip-tie slots go.
battery = "3AA"; // [3AA:3 x AA holder - 4.5 V - recommended, 4AA:4 x AA holder - 6 V - simple build only]

/* [Hidden] */
$fn = 64;
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
  // hex socket sample: drop the printed hub into it to check the swap feel
  translate([26, 0, 0]) difference() {
    cylinder(d = hex_size / cos(30) + 5, h = 8);
    translate([0, 0, 1.5]) hex_prism(hex_size + hex_clearance, 8);
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

/* [Ticker tab] */
// Leaf thickness. Thicker ticks harder and asks more of the motor.
tab_t = 1.2; // [0.8:Light tick - 0.8 mm, 1.2:Standard - 1.2 mm, 1.6:Strong tick - 1.6 mm]

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

// --- Wobble: two M8 nuts in an off-center pocket, bayonet plug ---
wobble_r        = 40;
wobble_disc_t   = 3.2;
wobble_boss_h   = 12;                 // 1 mm roof over the 11 mm socket
wobble_boss_r   = 9;
wobble_mass_r   = 24;                 // pocket centre; spec starts near 25 mm
m8_nut_af       = 13;                 // DIN 934 across flats
m8_nut_thk      = 6.5;
wobble_nuts     = 2;
wobble_pocket_af = m8_nut_af + 0.6;   // 0.3 mm per side, nuts drop in
wobble_wall     = 2.4;
wobble_stack_h  = wobble_nuts * m8_nut_thk + 0.4;
plug_body_d     = 16;
plug_lug_r      = 9.6;
plug_lug_w      = 4.4;
plug_lug_t      = 1.6;
plug_bore_d     = plug_body_d + 0.5;  // 0.25 mm per side, free running
plug_undercut_d = plug_lug_r * 2 + 0.4;
plug_undercut_h = 2.4;
plug_lip_t      = 1.6;
plug_body_h     = plug_undercut_h + plug_lip_t;
plug_knob_h     = 3.2;
plug_knob_d     = 14;
wobble_pod_r    = plug_undercut_d / 2 + wobble_wall;
wobble_pocket_z = wobble_disc_t + wobble_stack_h;          // top of the nut cavity
wobble_top_z    = wobble_pocket_z + plug_undercut_h + plug_lip_t;

// --- Up and down: 3-lobe face cam, off-centre sliding post ---
cam_lift      = 8;                    // spec max 10
cam_lobes     = 2;                    // 180° symmetry keeps the cam balanced; 3 lobes outrun gravity
cam_r_in      = 12;
cam_r_out     = 28;                   // under the 40 mm housing limit
cam_z_low     = 16;                   // lowest track, above the centre boss
cam_boss_h    = 12;
cam_boss_r    = 8;
cam_disc_t    = 4;
cam_segments  = 90;
track_r       = 20;                   // follower axis, on the track

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
guard_r_in    = 34;                   // clears the cam (28) and the foot (27)
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
assert(wobble_mass_r + wobble_pod_r + 1 < wobble_r, "Wobble pocket hangs off the disc.");
assert(wobble_boss_h >= socket_depth + 0.8, "Wobble socket breaks through the boss.");
assert(cam_r_out <= 40, "Cam is wider than a housed top is allowed to be.");
assert(cam_z_low >= cam_boss_h + 3, "Cam track hits the centre boss.");
assert(tick_outer_r <= 40, "Ticker teeth are wider than a housed top is allowed to be.");
assert(sleeve_bottom_d >= foot_top_high + 2, "Lifter foot hits the sleeve at the top of the stroke.");
assert(shaft_len > sleeve_len, "Post pulls out of the sleeve at the bottom of the stroke.");
assert(guard_r_in >= cam_r_out + 4, "Lifter housing rubs the cam.");
assert(tab_nose_rc - tab_nose_r > tick_disc_r + 2, "Ticker tab rubs the disc between teeth.");
assert(plug_bore_d < plug_undercut_d, "Plug lugs have no lip to lock under.");
assert(skirt_r_in - guard_r_in > deck_foot_t && skirt_r_in - tick_wall_in > deck_foot_t,
       "Housing wall is too close to the skirt for the 45° floor.");

// Gravity keeps the foot on the cam only while (lift/2)(lobes·ω)² < g.
cam_rpm_max = 60 / (2 * PI) * sqrt(2 * 9.81 / (cam_lift / 1000)) / cam_lobes;

echo(str("TOPS -> wobble pocket for ", wobble_nuts, " x M8 nuts at r ", wobble_mass_r,
         " mm (about ", wobble_nuts * 5, " g if each nut is ~5 g)."));
echo(str("TOPS -> lift ", cam_lift, " mm, ", cam_lobes,
         " lobes; follower at r ", track_r, " mm; sleeve id ", sleeve_id,
         " mm; foot leaves the cam above about ", round(cam_rpm_max), " RPM."));
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
//  Wobble rotor and plug
//  Print: disc on the bed, pocket open upward. Drop two M8 nuts in,
//  insert the plug with the bar lined up on the notches, twist 90°.
// ---------------------------------------------------------------------
module wobble_lugs() {
  for (a = [0, 180])
    rotate([0, 0, a])
      intersection() {
        cylinder(r = plug_lug_r, h = plug_lug_t);
        translate([plug_body_d / 2 - eps, -plug_lug_w / 2, -eps])
          cube([plug_lug_r, plug_lug_w, plug_lug_t + 2 * eps]);
      }
}

module wobble_rotor() {
  difference() {
    union() {
      cylinder(r = wobble_r, h = wobble_disc_t);
      cylinder(r = wobble_boss_r, h = wobble_boss_h);
      translate([wobble_mass_r, 0, wobble_disc_t - eps])
        cylinder(r = wobble_pod_r, h = wobble_top_z - wobble_disc_t + eps);
      // five bumps on top so this top is identifiable by touch
      for (a = [60:60:300])
        rotate([0, 0, a])
          translate([wobble_r - 8, 0, wobble_disc_t - eps])
            cylinder(d = 6, h = 1.6);
    }
    hex_socket_from_bottom(socket_depth);
    translate([wobble_mass_r, 0, wobble_disc_t])
      hex_prism(wobble_pocket_af, wobble_stack_h + eps);
    // undercut the lugs spin in, then a lip they lock behind
    translate([wobble_mass_r, 0, wobble_pocket_z - eps])
      cylinder(d = plug_undercut_d, h = plug_undercut_h + eps);
    translate([wobble_mass_r, 0, wobble_pocket_z + plug_undercut_h - eps])
      cylinder(d = plug_bore_d, h = plug_lip_t + 2 * eps);
    // notches are wedges, so the lip does not leave a knife-edge where a
    // square slot would meet the round bore
    for (a = [0, 180])
      rotate([0, 0, a])
        translate([wobble_mass_r, 0, wobble_pocket_z + plug_undercut_h - eps])
          linear_extrude(plug_lip_t + 2 * eps)
            polygon(concat([[0, 0]],
              [for (i = [-12:12])
                arc_pt(plug_undercut_d / 2 + 0.4, i * 2)]));
    // twist stop, 90° from the notches
    // (added back as a solid below — cut is the undercut itself)
  }
  // One-way stops just past a quarter turn, so the lugs park under the
  // lip and cannot be twisted on around to the notches.
  translate([wobble_mass_r, 0, wobble_pocket_z])
    for (a = [108, 288])
      rotate([0, 0, a])
        translate([plug_body_d / 2 + 0.3, 0, 0])
          cube([plug_undercut_d / 2 - plug_body_d / 2 - 0.1, 1.2, plug_undercut_h]);
}

module wobble_plug() {
  // Datum: bottom-centre of the lugs, the face that sits on the undercut floor.
  cylinder(d = plug_body_d, h = plug_body_h);
  wobble_lugs();
  translate([0, 0, plug_body_h - eps]) cylinder(d = plug_knob_d, h = plug_knob_h + eps);
  translate([-plug_knob_d / 2, -1, plug_body_h + plug_knob_h - 1.4])
    cube([plug_knob_d, 2, 1.4]);
}

// ---------------------------------------------------------------------
//  Face cam. Print: shoulder on the bed, ramp upward. Three lobes so
//  the extra plastic is balanced about the shaft.
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
  else if (part == "assembly_wobble") {
    preview_base();
    color("coral") translate([0, 0, shoulder_z]) wobble_rotor();
    color("orange")
      translate([wobble_mass_r, 0, shoulder_z + wobble_pocket_z])
        rotate([0, 0, 90]) wobble_plug();
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
  else if (part == "wobble_rotor") {
    if (orientation == "print") wobble_rotor();
    else translate([0, 0, shoulder_z]) wobble_rotor();
  }
  else if (part == "wobble_plug") wobble_plug();
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
  else if (part == "none") { }
  else echo(str("Unknown part: ", part));
}

show();
