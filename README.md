# SpinAble Platform: Base (sketch v0.1)

This is a one-switch motor base with swappable 3D-printed tops. A student presses their switch and the base turns one motor shaft. The top that's dropped onto the shaft decides what the student sees and feels:

| Top | What it does | Needs the locking ring? |
|---|---|---|
| Plain disc / pinwheel | Spins | No |
| Offset-weight rotor | Wobbles and rocks the base | No |
| Cam + follower | Moves up and down | Yes (stationary housing) |
| Toothed rotor + flex tab | Ticks and buzzes (felt vibration) | Yes (stationary housing) |

This project grows out of the Switch-Compatible Spin Tool (SpinAble). The difference is that the base never changes. New activities are just new tops.

---

## Files

| File | What it is |
|---|---|
| `spinable_platform_base.scad` | The base and all four tops. All settings are Customizer drop-downs. |
| `README.md` | This guide. |

Open the `.scad` file in OpenSCAD and go to **Window > Customizer**. Use **Which part** to pick a part, then render (F6) and export as STL, one part at a time. Each setting has a short explanation in the Customizer.

The OpenSCAD console prints a **TOP INTERFACE SPEC** line with the numbers for your current settings. Copy it into your notes before designing tops.

---

## Printing

| Part | Orientation (choose "Print-ready") | Material | Notes |
|---|---|---|---|
| Fit-test coupon | Flat | Same as base | **Print this first.** It's a quick print that checks the motor pocket, screw holes and hex swap feel. |
| Universal hub | Upright, shaft hole down | PETG preferred | 100% infill or 5+ walls. This part carries all the load. |
| Base shell | Upside down (deck on the bed) | PLA or PETG | No supports needed. Slow the outer walls a little so the braille dots come out clean. |
| Bottom plate | Flat | PLA or PETG | |
| Test spin disc | Disc on the bed | Any | Use a bright color for visual tracking. |
| Wobble rotor | Disc on the bed, pocket open upward | PLA or PETG | Five bumps on top. |
| Wobble plug | Flat | Same as the rotor | The bar is the grip for twisting it. |
| Up-down cam | Shoulder on the bed, ramp upward | PLA or PETG | No supports. Three lobes, so it stays balanced. |
| Lifter foot | Flange on the bed, dome upward | PLA or PETG | The spigot hole bridges shut inside the dome. |
| Lifter post | Cap on the bed | PLA or PETG | |
| Lifter housing | Skirt on the bed | PLA or PETG | Tall print. The sleeve is held by three ribs. |
| Ticker rotor | Shoulder on the bed | PLA or PETG | Ten rounded teeth. |
| Ticker housing | Skirt on the bed | PLA or PETG | Short nubs around the outside. |
| Ticker tab | Root on the bed, leaf standing up | **PETG or TPU** | Do not print this one in PLA. It snaps, or it stalls the motor. |

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
- **Reverse:** the DRV8833 can reverse the motor. Use it later for a direction-change activity.

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
| Top weight | Keep it under about 60 g and balanced, except wobble tops |
| Locking groove | 90 mm centerline diameter, 4 mm wide, 2 mm deep |
| Locking keys | 3 notches at 90°, 210° and 330°, 8 mm wide, reaching 6 mm outward from the groove |
| Stationary housing wall | 3.6 mm thick, ≤ 1.8 mm tall where it drops into the groove, keys 7.6 mm wide |

The socket must be deeper than the hex so a top rests on the shoulder and not on the hex tip. That keeps every top at the same height.

---

## The tops

Open the `.scad` file, pick the part in **Which part**, render (F6), and export one STL at a time. Every spinning part sits on the hub shoulder. The two housings drop into the locking groove and do not spin. Bumps, long ridges, and short nubs are there so a student can tell the tops apart by touch.

### Wobble
`wobble_rotor` and `wobble_plug`. The pocket takes **two M8 nuts** (13 mm across the flats, 6.5 mm thick), about 10 g together, centered 24 mm off the shaft. That is a rock at 2–4 turns a second, not a buzz.

1. Set the rotor pocket-up. Drop in the two nuts.
2. Line the plug's bar up with the two notches, press it in, and twist it a quarter turn until it stops. The lugs are then under the lip. Pulling straight up will not release it.
3. Drop the rotor onto the hex. The pocket stays on top.

If the base walks, use a non-slip mat. The empty rotor is already a little off-balance; the nuts are what you feel.

### Up and down
`cam`, `lifter_foot`, `lifter_post`, `lifter_housing`. Three lobes, 8 mm of lift. The follower is off to one side on purpose: a pad in the centre would rest on all three lobes at once and never go down. The foot is a hemisphere, so it rides the ramp on one point.

1. Glue the post's peg into the foot. The hole is the flat face, not the dome. The dome faces the cam.
2. Slide the post up into the housing until the foot is below the sleeve. The foot is wider than the sleeve, so once the glue is set the post cannot be pulled out the top.
3. Put the cam on the hex. Set the housing into the locking groove, foot on the cam. A dab of grease on the dome helps.
4. Use the speed knob toward the slow end. At full speed this is about 10 bounces a second; at the bottom of the knob it is about 3, which is easier to watch.

### Tick
`ticker_rotor`, `ticker_housing`, `ticker_tab`. Ten rounded teeth. The tab is a separate PETG or TPU reed so a broken one is a small reprint. At 200 RPM that is about 33 ticks a second.

1. Print the tab in PETG or TPU, standing up, so the bend runs along the layers.
2. Drop the tab's block into the slot in the housing. It is a light press.
3. Put the rotor on the hex, then the housing into the locking groove. The nose of the tab should just reach the teeth. Between teeth there is a clear gap, so each tooth flicks the tab and lets it go.
4. If the motor stalls, reprint the tab with **Ticker tab** set to "Light tick".

### Spin
The test disc is the spin top. A single bright color on a plain background is the useful one for CVI. The raised mark near the rim is on the underside once the disc is on the hub.

---

## Classroom safety notes
- The hub, the plug, the lifter foot, and the ticker tab are choking-size parts. Glue the hub and the lifter foot, twist the wobble plug in before class, and supervise students who mouth objects.
- Spinning tops ride 9 mm above the deck. The N20 stalls easily, which keeps the pinch risk low, but keep hair and loose cords away from running tops.
- The battery compartment closes with screws, so students can't open it.
- This is a classroom-made device for supervised use, not a certified toy.

---

## Known limits of this sketch
- N20 dimensions vary by seller. The fit-test coupon catches this before you print the 140 mm shell.
- The electronics have no printed mounts yet; use foam tape.
- The smart-build firmware isn't written yet. The behavior spec above is ready for it.
- With the 120 mm base or very rounded corners, the front braille labels can crowd each other. OpenSCAD prints a warning when this happens; switch to contracted labels or a larger base.
- The up-and-down housing is a tall print, and the cam is close to the 60 g guide even though it is balanced. Neither needs support.
- The ticker estimate in the OpenSCAD console assumes PETG. The meshed tooth bites the tab by about 0.6 mm.
