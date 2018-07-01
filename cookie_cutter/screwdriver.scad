
// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

			
			    /// Global parameters
grid = false ;   //Use grid for multi elements cutters
full= false ;  //For build full or empty objects (see instuctables for details)
borderThick = 1.20000004768  ;    //border thickness (mm)
h=   12.0  ;    //total height of the cookie cutter (mm)
borderType=  1   ;    //type of border, 0 none, 1-classic, 2-cone
Lreb = 3.0;     //Width of border (en mm)
Hreb = 1.20000004768 ;    //Thickness of border (mm)




                /// Grid parameters
gridX=300;      //Maximum X dimension Change only if you build cookies bigger than 30cm
gridY=300;      //Maximum Y dimension Change only if you build cookies bigger than 30cm
meshSolid=1.20000004768;    //width of solid part of grid
meshSpace=8.0;    //width of blank part of grid 
gridThickness=Hreb; //thickness of grid
moveGridX=0;    //X shift for adujustments
moveGridY=0;    //Y shift for adjustments
rotateGridZ=45.0;  //Z rotation for adjtments
$fn = 0.1;



module poly_path21(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-86.738047,77.472593],[-87.714445,76.271133],[-87.976726,75.631932],[-87.948216,74.955859],[-86.679530,72.138133],[-85.116610,69.026173],[-43.614171,29.930083],[-13.728434,1.605267],[-2.285520,-9.618905],[-4.207388,-12.890265],[-5.916057,-16.437524],[-6.549233,-20.406215],[-4.507905,-22.298435],[-2.466267,-23.693127],[-0.450960,-24.492785],[2.564932,-25.485005],[5.401806,-26.840492],[8.048600,-28.548767],[10.494256,-30.599352],[12.727713,-32.981768],[14.737911,-35.685537],[16.513790,-38.700181],[18.044290,-42.015221],[19.190910,-44.842131],[42.650630,-67.183994],[63.007009,-86.388885],[66.425113,-89.267030],[68.025160,-90.089339],[71.052677,-90.510110],[74.135698,-90.085948],[77.164608,-88.903150],[80.029795,-87.048016],[82.621644,-84.606844],[84.830542,-81.665932],[86.546875,-78.311577],[87.661030,-74.630080],[87.976726,-72.393690],[87.908370,-70.793522],[86.899201,-69.308529],[83.447060,-65.649334],[64.549630,-47.071591],[44.797496,-28.025936],[41.216605,-24.891836],[39.517430,-23.871235],[34.322301,-21.517837],[29.362800,-18.745145],[26.981437,-16.911764],[24.516226,-14.563141],[22.351970,-12.099290],[20.873470,-9.920225],[19.183500,-5.393645],[18.394814,-3.092775],[16.618910,-1.093217],[14.604800,0.833643],[11.818380,0.629383],[9.032633,0.180426],[6.250410,-1.535087],[3.468870,-3.495297],[-2.957610,2.652783],[-44.187749,41.931873],[-78.991405,75.062873],[-82.191956,76.385793],[-85.332526,77.551776],[-86.738047,77.472593]]);
    linear_extrude(height=h)
      polygon([[-39.677476,26.732323],[-60.461926,81.156035],[-63.802283,89.902703],[-64.034253,90.510110],[-63.431132,88.930851],[-39.677476,26.732323]]);
  }
}


module shape(h){ poly_path21(h);

}

//-------------------------------------------------

/// Module grid have been imported from the Openscad grid creator by Glyn
/// Orininaly published on http://www.thingiverse.com/thing:29211
/// Under the terms of Creative Commons By-Sa (08.26.2012)

module grid(meshSolid, meshSpace, gridThickness, gridX, gridY){

meshX=gridX;
meshY=gridY;
nX=meshX/(meshSolid+meshSpace);
nY=meshY/(meshSolid+meshSpace);

for (i=[0:nX]) {
	 	 translate([-(meshX/2)+i*(meshSolid+meshSpace),-meshY/2,-gridThickness/2]) cube(size=[meshSolid,meshY,gridThickness],center=false);
}

for (i=[0:nY]) {
	 	translate([-meshX/2,-(meshY/2)+i*(meshSolid+meshSpace),-gridThickness/2]) cube(size=[meshX,meshSolid,gridThickness],center=false);
    }
}


module rebords(borderType,borderThick,Lreb,Hreb){
if (borderType==0){}
if (borderType==1){
    cylinder(h = Hreb, r=(borderThick+Lreb));} 
if (borderType==2) {
    cylinder(h = Hreb, r1=(borderThick+Lreb),r2=(borderThick));}
}


module borders(h){
cylinder(r=borderThick,h=h);
}



module fullVolume (borderType,borderThick,Lreb,Hreb,h) {
minkowski(){
    shape(0.001);
    union(){
       borders(h);
       rebords(borderType,borderThick,Lreb,Hreb);
    }}}


module finalShape(){
if (full == false){
    difference(){
      fullVolume(borderType,borderThick,Lreb,Hreb,h);
      translate([0,0,(-0.5*h)]) shape(3*h);
}}
else{
          fullVolume(borderType,borderThick,Lreb,Hreb,h);
}
}


if (grid==true){
union (){
  finalShape();
  intersection() {
   translate([moveGridX,moveGridY,(0.5*gridThickness)]) rotate([0,0,rotateGridZ]) grid(meshSolid, meshSpace, gridThickness, gridX, gridY);
    shape();
}}
}
else{
    finalShape();
}

// Enjoy your cookies ! :)

