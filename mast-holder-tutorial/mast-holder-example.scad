$fn = 100;

base_width = 75;
base_thickness = 5;

shaft_length = 50;
outer_shaft_diameter = 20;
inner_shaft_diameter = 15;
inner_shaft_length = shaft_length - 5;

mounting_hole_radius = 2.5;
mounting_hole_distance_from_edge = 10;


// Making the base
difference() {
    union() {
        cube([base_width, base_width, base_thickness]);
        translate([base_width/2, base_width/2, -shaft_length])
        cylinder(d = outer_shaft_diameter, h = shaft_length);
    }
    
    color([1, 0, 0])
    translate([base_width /2 , base_width/2, -inner_shaft_length])
    cylinder(d = inner_shaft_diameter, h = inner_shaft_length + base_thickness);
    
    for(x = [mounting_hole_distance_from_edge : base_width - 2 * mounting_hole_distance_from_edge : base_width]) {
        for(y = [mounting_hole_distance_from_edge : base_width - 2 * mounting_hole_distance_from_edge : base_width]) {
            color([0, 1, 0])
            translate([x, y, 0])
            cylinder(r = mounting_hole_radius, h = base_thickness);
        }
    }
}




