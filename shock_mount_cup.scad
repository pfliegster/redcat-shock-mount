//////////////////////////////////////////////////////////////////////////
// Shock/Spring Mounting Cup for Redcat Racing "Blackout SC Pro". 
//
// Replacement part: Shock/Spring mounting cup, which is a single plastic
// piece of the Redcat Racing "Big Bore Shock" item (PN: BS214-011). Redcat
// does NOT sell this part separately, but does include it in a kit
// containing 2 springs and 2 plastic cups (Redcat PN: BS214-020-RR).
// However, I only needed to replace the plastic cup. Additionally,
// Redcat Racing seems to be consistently out of stock on this part.
//
// RC car enthusiasts realize quickly that one lost or broken shock/
// spring cup can make the car useless ... so it is nice to be able to
// just print a replacement part on your own (and modify as desired too)
// to get back to racing (or robotics) in no time!
//
// I did my best to mimic the factory version of this part, but it is
// not exact, so use at your own risk or modify as necessary. I have
// verified functionality on my RC car - it seems to fit and work fine.
// In particular, the main functional/critical interfaces (to the spring
// itself, the collar which holds itself onto the lower piston shaft
// mounting point and the side installation 'notch') are all good!
//
// The overall height of my finished model was a little taller than the
// factory version of the cup, and a little beefier (thicker walls),
// but this suits my purposes just fine. I also did not replicate the
// 'cutout' holes in the conical section of the cup as these seemed
// to be mostly asthetic and weren't required for full function of
// the part.
// 
// Notes:
//    1) all units in mm.
//    2) Reference level Z=0 is the surface that the spring interfaces
//       with the cup (wide end of the cone).
//
// Author:        Keith Pflieger
// Creation Date: March 17, 2021
// License: CC BY-NC-SA 4.0
//          (Creative Commons: Attribution-NonCommercial-ShareAlike)
//
// Thingiverse user: RoboticDreams
// github: pfliegster (https://github.com/pfliegster)
//
//////////////////////////////////////////////////////////////////////////

// Overide some global variables for better rendering
//$fn=60;
$fa=2;
$fs=0.1;

//////////////////////////////////////////////////////////////////////////
// Some mechanical notes and measurements used in creation of this cup:
// Spring dimensions:
//    Outer diameter = 21.0 mm
//    Spring metal diameter/thickness = 1.3mm
//    therefore: inner diameter = 18.4 mm
// Shock metal piston:
//    Diameter = 3.4 mm
// Shock mount point to "Lower Suspension Arm" (PN: BS213-007):
//    Diameter = 6.9mm
//////////////////////////////////////////////////////////////////////////

// Main body: conical section of shock spring 'cup'
// Constants used in creation of conical section comprising the main
// cup body:
c1h = 9.0;
c1min = 9.5;
c1max = 22.5;
c1_thick = 2.0;

// Cylindrical section to form the inner wall at wide end of cone
// to keep spring in place:
c2h = 6.0;
c2d = 17.7;
iw_h = 2.0;
iw_thick = 1.0;

// Cylindrical section to form the outer 'lip' at wide end of cone
// to keep spring in place:
c3h = 4.0;
c3d = 9.3;
lip_h = 0.5;
lip_thick = 0.5;

// Cylindrical section forming lower section of shock spring cup which
// fits around shock's center piston arm, above where it meets the
// attachment point on the lower suspension arm:
c4h = 4.5;
c4od = c1min;
// Inner diameter has a slight taper on it, to snugly press fit onto end of mounting point
c4id_max = 7.2;
c4id_min = 6.6;
c4h_offset = c1h;
c4_shoulder_inset = 4.3;
c4_mount_shoulder_thick = 2.5;

// Shock Piston cylindrical dimensions (used as center 'cutout' for final model):
c5h = c1h + iw_h + c4h + 4.0;
c5_offset = -iw_h - 2.0;
c5od = 3.5; // Just slightly bigger than piston dimension = 3.4mm

// Assembly 'Notch' which is used as a cutout on one side of cup. Implemented
// as a cube cutout. Dimension is just slightly smaler than piston diameter iteslf,
// meaning tht the user will have to expand the notch just slightly as it is pressed
// into place around the piston shaft, where it should then snap into place.
assem_notch_w = 3.2;
assem_notch_h = c5h;
assem_notch_l = 1.0 + c1max/2.0;

// Calculate top of hollowed-out cup, based on other dimensions:
c1_cup_hollow_top = c1h - c4_mount_shoulder_thick + c4h - c4_shoulder_inset;

//////////////////////////////////////////////////////////////////////////
//
//         Create Solid Model:
//
//////////////////////////////////////////////////////////////////////////
difference() {
    ShockSpringCupBody();
    union() {
        ShockPistonShaft();
        CupAssemblyNotch();
    }
}

//////////////////////////////////////////////////////////////////////////
//
//         Module definitions:
//
//////////////////////////////////////////////////////////////////////////
module ShockSpringCupBody() {
    union() {
        difference() {
            
            // Combination of main cup's cone, plus regular cylinder forming
            // the body of the inner wall (using intersection() to snip away
            // extraneous parts):
            intersection() {
                union() {
                    cylinder(h=c1h, d1=c1max, d2=c1min);
                    translate([0, 0, -iw_h]) {
                        cylinder(h=c2h, d=c2d);
                    }
                }
                // Create a 'snipping' volume to remove extraneous forms:
                union() {
                    cylinder(h=c1h, d1=c1max, d2=c1min);
                    translate([0, 0, -iw_h]) {
                        cylinder(h=iw_h, d=c1max);
                    }
                }
            
                }
            // Section in center of main cup which will be hollowed out:
            intersection() {
                union() {
                    translate([0, 0, -iw_h]) {
                        cylinder(h=c2h, d=c2d-2.0*iw_thick);
                    }
//                    cylinder(h=c1h-c1_thick, d1=c1max-2*c1_thick, d2=c1min-2*c1_thick);
//                    cylinder(h=c1_cup_hollow_top, d1=c1max-2*c1_thick, d2=c1min-2*c1_thick);
                    cylinder(h=c1_cup_hollow_top, d1=c2d-2.0*iw_thick, d2=c1min-2*c1_thick);
                }
                // Create a 'snipping' volume to remove extraneous forms:
                union() {
                    translate([0, 0, -iw_h]) {
                        cylinder(h=iw_h, d=c1max-2*c1_thick);
                    }
//                    cylinder(h=c1h-c1_thick, d1=c1max-2*c1_thick, d2=c1min-2*c1_thick);
//                    cylinder(h=c1_cup_hollow_top, d1=c1max-2*c1_thick, d2=c1min-2*c1_thick);
                    cylinder(h=c1_cup_hollow_top, d1=c2d-2.0*iw_thick, d2=c1min-2*c1_thick);
                }
            }
        }
        
        // Add outer "Lip' on spring interface plane to help keep spring centered on cup
        translate([0, 0, -lip_h]) {
            difference() {
                cylinder(h=lip_h, d=c1max);
                cylinder(h=lip_h, d=c1max-2.0*lip_thick);
            }
        }
        
        // Cylindrical section to  interface with lower suspension arm mount point
        translate([0, 0, c4h_offset]) {
            difference() {
                cylinder(h=c4h, d=c4od);
                cylinder(h=c4h, d1=c4id_min, d2=c4id_max);
            }
        }
    }
}

module ShockPistonShaft() {
    translate([0, 0, c5_offset]) {
        cylinder(h=c5h, d=c5od);
    }
}

module CupAssemblyNotch() {
    translate([0, -assem_notch_w/2.0, c5_offset]) {
        cube([assem_notch_l, assem_notch_w, assem_notch_h]);
    }
}
