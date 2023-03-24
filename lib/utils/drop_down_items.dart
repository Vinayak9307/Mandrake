import 'package:flutter/material.dart';

// List<String> categories = [
//   "Administration",
//   "Gymkhana",
//   "General",
//   "Campus",
//   "Proctor",
//   "Tilak Hostel",
//   "Patel Hostel",
//   "Malviya Hostel",
//   "Tandon Hostel",
//   "P.G. Hostel",
//   "S.V.B.H",
//   "Raman Hostel",
//   "Tagore Hostel",
//   "D.J. Hostel",
//   "I.H-B Hostel",
//   "I.H-A Hostel",
//   "K.N.G.H",
// ];
List<DropdownMenuItem<String>>? categories = const [
  DropdownMenuItem(
    value: "Administration",
    child: Text("Administration"),
  ),
  DropdownMenuItem(value: "Gymkhana", child: Text("Gymkhana")),
  DropdownMenuItem(value: "General", child: Text("General")),
  DropdownMenuItem(value: "Campus", child: Text("Campus")),
  DropdownMenuItem(value: "Proctor", child: Text("Proctor")),
  DropdownMenuItem(value: "Tilak Hostel", child: Text("Tilak Hostel")),
  DropdownMenuItem(value: "Patel Hostel", child: Text("Patel Hostel")),
  DropdownMenuItem(value: "Malviya Hostel", child: Text("Malviya Hostel")),
  DropdownMenuItem(value: "Tandon Hostel", child: Text("Tandon Hostel")),
  DropdownMenuItem(value: "P.G. Hostel", child: Text("P.G. Hostel")),
  DropdownMenuItem(value: "S.V.B.H", child: Text("S.V.B.H")),
  DropdownMenuItem(value: "Raman Hostel", child: Text("Raman Hostel")),
  DropdownMenuItem(value: "Tagore Hostel", child: Text("Tagore Hostel")),
  DropdownMenuItem(value: "D.J. Hostel", child: Text("D.J. Hostel")),
  DropdownMenuItem(value: "I.H-B Hostel", child: Text("I.H-B Hostel")),
  DropdownMenuItem(value: "I.H-A Hostel", child: Text("I.H-A Hostel")),
  DropdownMenuItem(value: "K.N.G.H", child: Text("K.N.G.H")),
];

List<DropdownMenuItem<String>>? hostelChoice = const [
  DropdownMenuItem(value: "Tilak ", child: Text("Tilak")),
  DropdownMenuItem(value: "Patel ", child: Text("Patel")),
  DropdownMenuItem(value: "Malviya", child: Text("Malviya")),
  DropdownMenuItem(value: "Tandon ", child: Text("Tandon")),
  DropdownMenuItem(value: "P.G. ", child: Text("P.G.")),
  DropdownMenuItem(value: "Raman ", child: Text("Raman")),
  DropdownMenuItem(value: "Tagore ", child: Text("Tagore")),
  DropdownMenuItem(value: "D.J. ", child: Text("D.J.")),
  DropdownMenuItem(value: "I.H-B ", child: Text("I.H-B")),
  DropdownMenuItem(value: "I.H-A ", child: Text("I.H-A")),
  DropdownMenuItem(value: "S.V.B.H", child: Text("S.V.B.H")),
  DropdownMenuItem(value: "K.N.G.H", child: Text("K.N.G.H")),
];
List<DropdownMenuItem<String>>? tierChoice = const [
  DropdownMenuItem(value: "tier1 ", child: Text("Tier 1")),
  DropdownMenuItem(value: "tier2 ", child: Text("Tier 2")),
  DropdownMenuItem(value: "tier3", child: Text("Tier 3")),
];