# Redcat Shock Mount
 OpenSCAD Design file(s) for 3D-printed replacement shock mount for Redcat RC car Big Bore Shock.

Replacement part: Shock/Spring mounting cup, which is a single plastic piece of the Redcat Racing "Big Bore Shock" item ([PN: BS214-011](https://www.redcatracing.com/products/bs214-011?variant=30993755799642)). Redcat does NOT sell this part separately, but does include it in a kit containing 2 springs and 2 plastic cups ([Redcat PN: BS214-020-RR](https://www.redcatracing.com/products/bs214-020-rr?variant=32429344850010)). However, I only needed to replace the plastic cup. Additionally, Redcat Racing and resellers seem to be consistently out of stock on this part.

RC car enthusiasts realize quickly that one lost or broken shock/spring cup can make the car pretty useless ... so it is nice to be able to just print a replacement part on your own (and modify as desired too) to get back to racing (or robotics) in no time!

I did my best to mimic the factory version of this part, but it is not exact, so use at your own risk or modify as necessary. I have verified functionality on my RC car - it seems to fit and work fine. In particular, the main functional/critical interfaces (to the spring itself, the collar which holds itself onto the lower piston shaft mounting point and the side installation 'notch') are all good! Here is the 3D rendering of model:

<img src="assets/rendered_shock_mount_cup.png?raw=true" width="500px">

The overall height of the finished model was a little taller than the factory version of the cup, and a little beefier (thicker walls), but this suits my purposes just fine. I also did not replicate the 'cutout' holes in the conical section of the cup as these seemed to be mostly asthetic and weren't required for full function of the part.
Photo of original Redcat shock mount cup along side of this model:

<img src="assets/3d_print_vs_original.jpg?raw=true" width="500px">

... and, Original vs. Replacement Shock Mount Cup installed in vehicle:

<img src="assets/Original_cup_installed.jpg?raw=true" height="500px"> <img src="assets/Replacement_cup_installed.jpg?raw=true" height="500px">

Notes:
1) All units in mm.
2) Reference level Z=0 is the surface that the spring interfaces with the cup (wide end of the cone).
3) Tested using OpenSCAD v. 2021-01

## License
Creative Commons Attribution-NonCommercial-ShareAlike 4.0. Please see accompanying
license.txt file for details.
