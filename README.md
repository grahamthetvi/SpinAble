# SpinAble Platform: Base (sketch v0.3)

This is a one-switch motor base with swappable 3D-printed tops. A student presses their switch and the base turns one motor shaft. The top that's dropped onto the shaft decides what the student sees and feels:

| Top | What it does | Needs the locking ring? |
|---|---|---|
| Plain disc / pinwheel / flag | Spins | No |
| Rumble rotor + lid | Buzzes under the student's hand (felt vibration) | Yes (stationary housing) |
| Cam + follower | Moves up and down, 20 mm | Yes (stationary housing) |
| Toothed rotor + flex tab | Ticks | Yes (stationary housing) |
| Snail cam + spring arm | Slowly lies flat, then snaps upright | Yes (stationary housing) |

This project grows out of the Switch-Compatible Spin Tool (SpinAble). The difference is that the base never changes. New activities are just new tops.

Several tops also have an **add-on hex** on top, the same size as the hub's hex, so a printed accessory can ride on them. See [Add-ons](#add-ons).

---

## Files

| File | What it is |
|---|---|
| `spinable_platform_base.scad` | The base, all five tops and an example add-on. All settings are Customizer drop-downs. |
| `README.md` | This guide. |

Open the `.scad` file in OpenSCAD and go to **Window > Customizer**. Use **Which part** to pick a part, then render (F6) and export as STL, one part at a time. Each setting has a short explanation in the Customizer.

The OpenSCAD console prints a **TOP INTERFACE SPEC** line with the numbers for your current settings. Copy it into your notes before designing tops.

---

## Printing

| Part | Orientation (choose "Print-ready") | Material | Notes |
|---|---|---|---|
| Fit-test coupon | Flat | Same as base | **Print this first.** It's a quick print that checks the motor pocket, screw holes, hex swap feel and the add-on snap. |
| Universal hub | Upright, shaft hole down | PETG preferred | 100% infill or 5+ walls. This part carries all the load. |
| Base shell | Upside down (deck on the bed) | PLA or PETG | No supports needed. Slow the outer walls a little so the braille dots come out clean. |
| Bottom plate | Flat | PLA or PETG | |
| Test spin disc | Disc on the bed | Any | Use a bright color for visual tracking. |
| Rumble rotor | Disc on the bed | PLA or PETG | 48 small ridges on top. |
| Rumble housing | Skirt on the bed | PLA or PETG | No supports. Plain wall with a key notch. |
| Rumble lid | Top face on the bed (Print-ready does this) | **PETG** | The flap in the lid is the spring. PLA is too stiff and may crack. |
| Up-down cam | Shoulder on the bed, ramp upward | PLA or PETG | No supports. One 20 mm lobe. The low crescent on one side is a counterweight that balances the lobe. |
| Lifter foot | Flange on the bed, dome upward | PLA or PETG | The spigot hole bridges shut inside the dome. |
| Lifter post | Cap on the bed | PLA or PETG | |
| Lifter housing | Skirt on the bed | PLA or PETG | Tall print, no supports. The floor flares out at 45°, the three ribs climb out of the guard wall at 45°, and the sleeve's underside is sloped so it grows out of the ribs. |
| Ticker rotor | Shoulder on the bed | PLA or PETG | Ten rounded teeth, add-on hex on top. |
| Ticker housing | Skirt on the bed | PLA or PETG | No supports. Short nubs around the outside. |
| Ticker tab | Root on the bed, leaf standing up | **PETG or TPU** | Do not print this one in PLA. It snaps, or it stalls the motor. |
| Launcher cam | Shoulder on the bed, ramp upward | PLA or PETG | Set **Launcher direction** first. Add-on hex on top. |
| Launcher housing | Skirt on the bed | PLA or PETG | No supports. The tower holds the pivot screw. |
| Launcher arm | Flat, crank pin and boss pointing up | PLA or PETG | Use a bright color. |
| Launcher spring | Flat | **PETG** | The spiral is the spring. PLA cracks. |
| Flag accessory | Socket down, flag standing up | Any | Bright single color. An example add-on. |

The 140 mm base needs a bed of at least 150 x 150 mm.

**Braille labels.** The dots follow your flash-card specs: 0.9 mm high, 1.6 mm base, rod with a hemisphere, 2.5 mm dot spacing and 6.5 mm cell spacing. On this part they stick out sideways from vertical walls, so the lower half of each dot overhangs slightly. Small dots usually print fine this way. If they come out rough, set **Braille labels** to "No labels" and add printed or embossed labels.

| Location | Uncontracted | Contracted UEB |
|---|---|---|
| Front (smart build) | power, mode, speed | p-ow-er, mode, s-p-e-ed |
| Back | switch | s-w-i-t-ch |

Please proofread the contracted versions before printing.

---

## Parts list (exact specs)

### Motor (both builds)
| Spec | Required |
|---|---|
| Recommended part | **Pololu #1098: 50:1 Micro Metal Gearmotor LP 6V** (no encoder) |
| Size | N20 / micro metal gearmotor, 10 × 12 mm gearbox |
| Shaft | 3 mm D-shaft, 10 mm long (Customizer: 10 mm) |
| Speed | 270 RPM no-load at 6 V (about 200 RPM on 3 × AA) |
| Stall | 0.36 A, 0.44 kg·cm. This is the low-power winding, which keeps the motor weak on purpose. |
| Mounting | 2 × M1.6 tapped holes, 9 mm apart |

**Avoid "HP" (high-power) versions.** Same size, but they stall at about 1.6 A.

**Budget option:** a generic 6 V N20 at 200–300 RPM with a 3 mm D-shaft and 10 mm shaft. Generic listings rarely state stall current, so the weakness isn't documented.

### Hardware (both builds)
- 2 × **M1.6 × 3 mm** pan-head screws (motor to deck). Not longer: about 2 mm of thread reaches the gearbox, and longer screws can hit the gears.
- 4 × **M3 × 8 mm countersunk (flat-head) screws** for the bottom plate:
  - **Self-tapping setting:** self-tapping screws for plastic, or #4 × 3/8" flat-head sheet-metal screws.
  - **Insert setting:** machine screws plus 4 × M3 short heat-set inserts sized for a 4.0 mm hole.
- 4 × **10 mm round stick-on rubber bumpers**, 3 mm tall or less
- 2 × small zip ties (3 mm wide or less), double-sided foam tape
- 22 AWG stranded hookup wire (silicone is easiest), heat-shrink
- For the launcher top: 1 × **M3 × 20 mm pan-head screw** and 1 × **M3 flat washer** (the arm's pivot). A self-tapping screw for plastic is best; a machine screw also cuts its own thread in the tower.

### Panel parts (both builds)
| Part | Spec |
|---|---|
| Switch jack | 3.5 mm panel-mount jack, **M6 thread** with nut (PJ-392 style). Stereo is fine; wire only tip and sleeve. |
| Power switch | Mini toggle, **SPDT ON-ON, 6 mm (M6) bushing**, MTS-102 style |

### Simple build (momentary only)
| Part | Spec |
|---|---|
| Battery holder | **4 × AA**, side-by-side flat holder with wire leads, no built-in switch |
| MOSFET | **IRLZ44N** (logic-level N-channel, TO-220) |
| Diode | **1N5819** Schottky |
| Resistors | 1 kΩ and 100 kΩ, ¼ W |
| Capacitor | 0.1 µF ceramic (marked "104") |

### Smart build (momentary + latch/timed + speed knob)
| Part | Spec |
|---|---|
| Battery holder | **3 × AA**, side-by-side flat holder with wire leads, no built-in switch. **Alkaline only**: 3 × NiMH (3.6 V) is too low for the board's regulator. |
| Microcontroller | **Seeed Studio XIAO RP2040** |
| Motor driver | **Pololu #2130 DRV8833 Dual Motor Driver Carrier**: 2.7–10.8 V, 1.2 A per channel, sleep pin already pulled high. Generic DRV8833 boards work if you tie their EEP/SLP pin to 3V3. |
| Mode switch | Second mini toggle, same spec as the power switch |
| Speed knob | **B10K linear potentiometer, 16 mm body, M7 bushing, 6 mm shaft**. Snap off the small locating tab. |
| Knob | Fits a 6 mm shaft, with a raised pointer ridge for touch reading |
| Capacitor | 0.1 µF ceramic ("104"), soldered across the motor terminals |
| Optional | 3 V coin vibration motor on the driver's spare B channel, for a real "buzz" output. Keep its PWM at 65% or less so it sees about 3 V. |

## Wiring

**Why the switch never carries motor current.** Many assistive switches and 3.5 mm jacks are only rated for tiny signal currents. In both builds the student's switch only sends a signal; a MOSFET or driver carries the motor current.

### Simple build
```
Battery + ──> Power toggle ──> +V
+V ──> Motor (+)      Motor (–) ──> MOSFET Drain
MOSFET Source ──> GND (battery –)
1N5819 across motor: stripe to +V
0.1 µF across motor terminals

Jack TIP ──> 1 kΩ ──> MOSFET Gate          Jack SLEEVE ──> +V
MOSFET Gate ──> 100 kΩ ──> GND   (holds motor off when switch is released)
```
Pressing the switch connects +V to the gate through 1 kΩ, which turns the motor on. The switch carries about 6 mA.

### Smart build
```
Battery + ──> Power toggle ──> +V  ──> XIAO 5V pin  and  DRV8833 VIN (VCC on generic boards)
Battery – ──> GND (XIAO GND, DRV8833 GND)

Jack TIP    ──> XIAO D1   (INPUT_PULLUP, pressed = LOW)
Jack SLEEVE ──> GND
Mode toggle ──> XIAO D2 to GND (INPUT_PULLUP, ON = latch mode)
Speed pot   ──> ends to 3V3 and GND, wiper to XIAO A0
DRV8833 AIN1 ──> XIAO D3 (PWM)     DRV8833 AIN2 ──> XIAO D4
DRV8833 AOUT1/AOUT2 ──> Motor     (generic boards: tie EEP/SLP to 3V3)
Optional coin motor: BIN1 ──> XIAO D5 (PWM), BIN2 ──> XIAO D6, BOUT1/BOUT2 ──> coin motor
```
At 4.5 V, the 270 RPM motor runs at about 200 RPM, and the knob trims it further.

**Programming safety:** turn the power switch OFF before plugging USB into the XIAO. Seeed warns against connecting USB-C while a battery is connected.

Leave a little slack in the switch-jack wires so the bottom plate can come off without unsoldering.

### Smart build behavior (spec for the firmware)
- **Momentary (mode toggle OFF):** the motor runs while the switch is held.
- **Latch / timed (mode toggle ON):** one press starts a timed run (default 5 s). A press during a run stops it early. This supports turn-taking and students who can't hold a switch down.
- **Soft start:** ramp up over about 0.3 s so tops don't jump or fly off the hub.
- **Speed knob:** sets the PWM duty from about 30% to 100%.
- **Reverse:** the DRV8833 can reverse the motor. Use it later for a direction-change activity. The launcher only works in one direction and stalls in reverse.

---

## Assembly

1. **Print the fit-test coupon and the hub.**
   - Push the motor into the coupon's pocket. It should slide in snugly with its flats lined up.
   - Press the hub onto the motor shaft. If it slips, reprint with a tighter **Shaft fit**. If it cracks, go looser.
   - Drop the hub into the coupon's hex socket. It should lift out freely. Adjust **Hex clearance** if needed.
2. **Mount the motor.** Push the N20 into the pocket under the deck with the shaft up through the hole. Fasten it with the two M1.6 × 3 mm screws from the top. The heads sit in counterbores below the hub.
3. **Press on the hub** until the shaft bottoms out in the bore. That automatically leaves about 1 mm between the hub and the deck. Check that the hub spins without rubbing. If it's loose, add a drop of CA glue.
4. **Install the controls.** Mount the jack in the back wall, and the power switch, mode switch and speed pot in the front wall. Nuts go on the inside.
5. **Wire it** following the diagram for your build. Mount the electronics to the inside walls with foam tape, toward the front.
6. **Strap the battery holder** to the bottom plate with zip ties through the slots. The battery sits toward the back.
7. **Close it up.** The notch in the bottom plate goes to the front. Use 4 × M3 screws, and stick the rubber feet into the recesses.
8. **Test** with the test spin disc. It drops onto the hex and rests on the hub shoulder.

---

## Top Interface Spec (every top must follow this)

These values use the default settings. Your actual numbers print in the OpenSCAD console.

| Feature | Value |
|---|---|
| Hex drive on the hub | 8 mm across flats, 10 mm tall, top edge chamfered |
| Socket in a top | **8.4 mm across flats** (8 + clearance), **at least 10.5 mm deep** |
| Where a top rests | On the hub shoulder, **9 mm above the deck** |
| Spinning-part radius | Keep it ≤ 40 mm if the top also uses a stationary housing |
| Top weight | Keep it under about 60 g and balanced |
| Add-on hex (on the ticker rotor, up-down cam and launcher cam) | Same as the hub's hex: 8 mm across flats, 10 mm tall, chamfered tip. It rises from the top of the top's boss, 12 mm above the hub shoulder. |
| Add-on snap | 2 rounded bumps on opposite flats, 6 mm up, 0.25 mm (light) or 0.35 mm (firm) proud. Set by **Add-on hold**. |
| Accessory socket | The same socket as a top (8.4 mm, 11 mm deep), plus a 0.5 mm groove 4.8–6 mm in from the mouth for the bumps. Use the `addon_socket()` module. |
| Locking groove | 90 mm centerline diameter, 4 mm wide, 2 mm deep |
| Locking keys | 3 notches at 90°, 210° and 330°, 8 mm wide, reaching 6 mm outward from the groove |
| Stationary housing wall | 3.6 mm thick, ≤ 1.8 mm tall where it drops into the groove, keys 7.6 mm wide |

The socket must be deeper than the hex so a top rests on the shoulder and not on the hex tip. That keeps every top at the same height.

A stationary housing rests on a 1.2 mm flat ring just outside the groove. The skirt only locates it and does not touch the bottom of the groove. Inside the skirt, the housing floor climbs at 45° so it prints without supports.

---

## The tops

Open the `.scad` file, pick the part in **Which part**, render (F6), and export one STL at a time. Every spinning part sits on the hub shoulder. The housings drop into the locking groove and do not spin. The housings feel different on purpose: long ridges (up and down), short nubs (tick), a flat lid (rumble) and a tower (launcher).

### Rumble
`rumble_rotor`, `rumble_housing`, `rumble_lid`. The rotor has 48 rounded ridges. A nub under a flap in the lid rides them, so the lid buzzes where the student's hand rests. That is about 160 buzzes a second at 200 RPM and about 50 at the slow end of the knob, so the speed knob also changes how the buzz feels. The lid covers the spinning part.

1. Print the lid in PETG. **Print-ready** puts it top-down, so the flap is the first layers.
2. Put the rotor on the hex. Set the housing into the locking groove.
3. Line the lid's key up with the notch in the housing wall. Press the lid down until the fingers click into the groove. To take it off, lift the edge firmly.
4. Have the student rest a hand flat on the lid. Pressing hard right on the flap damps the buzz and can stall the motor. That does no harm, and it starts again when the hand lifts.

It hums out loud as well as buzzing. If the buzz is too weak, or the motor slows down, reprint the lid with **Rumble flap** set stronger or lighter.

### Up and down
`cam`, `lifter_foot`, `lifter_post`, `lifter_housing`. One lobe, 20 mm of lift: one slow rise and fall per turn. The follower is off to one side on purpose: a pad in the centre would always sit on the high side and never go down. The foot is a hemisphere, so it rides the ramp on one point.

Only gravity brings the foot back down. With one lobe that keeps working up to about 300 RPM (a little less with sleeve friction), so both builds are fine. The OpenSCAD console prints this limit. The crescent on the cam's low side is a counterweight; without it the lobe would rock the base.

1. Stand the housing on its skirt. Drop the post down through the sleeve from the top, peg first, until the cap rests on the sleeve.
2. Reach in through the open bottom and glue the foot onto the peg. The hole is in the flat face, so the dome points down toward the cam. The foot and the cap are both wider than the sleeve, so once the glue is set the post is captive.
3. Put the cam on the hex. Set the housing into the locking groove, foot on the cam. A dab of grease on the dome helps.
4. At full speed on the smart build (about 200 RPM) the post rises and falls about 3 times a second. At the bottom of the knob it is about once a second, which is easier to watch.

The cam's add-on hex can carry a small accessory. Keep it within 8 mm of the centre, because the foot runs 13 mm from the centre.

### Tick
`ticker_rotor`, `ticker_housing`, `ticker_tab`. Ten rounded teeth. The tab is a separate PETG or TPU reed so a broken one is a small reprint. At 200 RPM that is about 33 ticks a second.

1. Print the tab in PETG or TPU, standing up, so the bend runs along the layers.
2. Drop the tab's block into the slot in the housing. It is a light press. The slot is closed at the back, so the teeth cannot push the tab outward.
3. Put the rotor on the hex. Turn the rotor by hand so the nose of the tab will drop between two teeth, then set the housing into the locking groove. If the nose lands on a tooth, the housing sits high and does not lock. The nose should just reach the teeth. Between teeth there is a clear gap, so each tooth flicks the tab and lets it go.
4. If the motor stalls, reprint the tab with **Ticker tab** set to "Light tick".

The rotor's add-on hex sits 2 mm above the housing wall, so an accessory on it can be any width.

### Launch
`launcher_cam`, `launcher_housing`, `launcher_arm`, `launcher_spring`, plus the M3 × 20 screw and washer. The cam is a ramp that climbs slowly for most of a turn and then drops off a cliff. A crank pin on the arm rides the ramp, which slowly lays the arm flat against the spiral spring. At the cliff the spring snaps the arm upright against a stop and throws whatever is in the cradle toward the back of the base.

1. **Check which way your motor turns.** Put the test disc on, press the switch, and watch the bump from above. Set **Launcher direction** to match, then print all four launcher parts. The cam, arm, spring and housing all change with this setting.
2. Slide the spring onto the hex boss on the arm, against the arm. Its 12-point hole fits in any of 12 positions.
3. Put the washer on the screw. Push the screw through the boss and the arm, then thread it into the hole in the tower. Stop when the arm swings freely without wobbling.
4. Turn the spring's finger up about 30° and let it rest against the block beside the tower. The spring now holds the arm upright against its stop.
5. Put the cam on the hex. Set the housing into the locking groove with the arm upright. The ball on the crank pin should sit just above the low start of the ramp. If it lands on the high part, turn the cam by hand until the ball drops off the cliff.
6. Put a pom-pom or a small soft ball in the cradle while the arm is flat, or just let the student watch the arm snap. At about 200 RPM the arm snaps about 3 times a second. Toward the slow end of the knob it is about once a second, which gives time to see the slow lowering before the snap.

If the motor stalls just as the arm reaches flat, the cam is turning the wrong way. Reprint with the other **Launcher direction**. If the snap is too weak, or the motor labours, reprint the spring with **Launcher spring** set stronger or gentler. The OpenSCAD console estimates the load on the motor.

The housing seats in any of three positions, 120° apart. With the default seating, the arm rests over the front of the base and throws toward the back. The cam's add-on hex can carry a small accessory within 12 mm of the centre.

### Spin
The test disc is the spin top. A single bright color on a plain background is the useful one for CVI. The raised mark near the rim is on the underside once the disc is on the hub. Any add-on also fits straight onto the hub and spins on its own.

---

## Add-ons

The ticker rotor, the up-down cam and the launcher cam each have an add-on hex on top. It is the same 8 mm hex as the hub's, so an accessory made for the hub also fits on these tops and turns with them. The accessory rests on the top of the top's boss.

- **Hold:** **Add-on hold** puts two small bumps on the add-on hex. They click into a groove in the accessory's socket. "Light snap" holds against shaking, and you can still pull the accessory off by hand. Try the peg on the fit-test coupon in the coupon's socket before you choose. The hub's hex has no bumps, so on the hub an accessory just lifts off.
- **Size:**

  | Top | Largest accessory |
  |---|---|
  | Hub, no top | Any width that clears the deck |
  | Ticker | Any width |
  | Up-down cam | Within 8 mm of the centre |
  | Launcher | Within 12 mm of the centre |
  | Rumble | None: the lid covers it |
- **Example:** `accessory_flag` is a bright flag that sweeps round as it turns. It is a good CVI target.
- **Your own:** start from the `addon_socket()` module in the `.scad` file so the socket and the snap groove come out right.

---

## Classroom safety notes
- The hub, the lifter foot, the ticker tab, the launcher spring and its screw, and small add-ons are choking-size parts. Glue the hub and the lifter foot, keep the launcher assembled, and supervise students who mouth objects.
- The launcher arm snaps hard enough to sting a finger. Keep fingers out of its swing while the motor runs, and launch only soft, light things like pom-poms. Seat the housing so it throws away from faces.
- Spinning tops ride 9 mm above the deck. The N20 stalls easily, which keeps the pinch risk low, but keep hair and loose cords away from running tops.
- The battery compartment closes with screws, so students can't open it.
- The rumble lid covers the spinning rotor, and its fingers need a firm pull to unclip.
- This is a classroom-made device for supervised use, not a certified toy.

---

## Known limits of this sketch
- N20 dimensions vary by seller. The fit-test coupon catches this before you print the 140 mm shell.
- The electronics have no printed mounts yet; use foam tape.
- The smart-build firmware isn't written yet. The behavior spec above is ready for it.
- With the 120 mm base or very rounded corners, the front braille labels can crowd each other. OpenSCAD prints a warning when this happens; switch to contracted labels or a larger base.
- The up-and-down housing is a tall print (about 82 mm). The cam is about 34 g solid and balances to within about 3 g·mm. Neither needs support. The only flat overhang on any housing is the 1.2 mm land beside the skirt.
- The rumble and launch tops have only been checked in software (fit, collisions, overhangs). Their spring forces and motor loads are estimates from PETG numbers. Expect to adjust **Rumble flap** or **Launcher spring** after the first print.
- The launcher works with the motor turning one way only.
- The launcher spring flexes on every snap. It is sized to keep the strain around 1% in PETG, but it may still wear out. It's a 10-minute reprint.
- The ticker estimate in the OpenSCAD console assumes PETG. The meshed tooth bites the tab by about 0.6 mm.
