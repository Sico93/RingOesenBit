// version 1.5
// Variablen für die Anpassung des Modells
uebergang_hoehe = 2; // Höhe des Übergangs

bit_durchmesser = 7.5; // Durchmesser des 6-Kant Bits
bit_laenge = 15 + uebergang_hoehe; // Länge des 6-Kant Bits

kerben_breite = 2.1; // Breite der Kerbe
kerben_laenge = 8; // Länge der Kerbe
kerben_tiefe = 4; // Tiefe der Kerbe

oesenhalter_durchmesser = kerben_laenge + 1; // Durchmesser des Ösenhalters
oesenhalter_hoehe = kerben_tiefe; // Tiefe des Ösenhalters

translate([0, 0, -oesenhalter_hoehe - uebergang_hoehe]) {
  // Der Ösenhalter
  difference() {
    cylinder(d=oesenhalter_durchmesser, h=oesenhalter_hoehe + uebergang_hoehe, $fn=360);
    translate([0, 0, uebergang_hoehe - kerben_tiefe/150]) {
      rotate([90, 0, 0]) {
        cylinder(d=kerben_laenge, h=kerben_breite, $fn=360, center=true);
      }
    }
  }

  translate([0, 0, oesenhalter_hoehe + uebergang_hoehe]) {
    // Das 6-Kant Bit
    cylinder(d=bit_durchmesser, h=bit_laenge - uebergang_hoehe, $fn=6);
  }

  translate([0, 0, oesenhalter_hoehe + uebergang_hoehe]) {
    // Der Übergang
    cylinder(d1=oesenhalter_durchmesser, d2=bit_durchmesser, h=uebergang_hoehe, $fn=360);
  }
}