
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



module poly_path74(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-70.592150,86.940083],[-72.755407,86.281590],[-74.878200,85.090253],[-81.342534,79.012201],[-87.687790,72.352803],[-89.316400,69.414184],[-89.832940,66.218083],[-89.678120,64.402440],[-89.203848,62.573380],[-87.238090,58.704563],[-84.443448,55.066159],[-79.815160,50.258333],[-71.371364,42.402495],[-63.768820,36.459773],[-54.078977,29.315063],[-45.943236,22.234921],[-35.317114,11.917893],[-10.084296,-14.254247],[6.594403,-32.234867],[11.310618,-37.151239],[15.088073,-40.697427],[19.156653,-43.470707],[18.926413,-44.336267],[18.544739,-46.351005],[18.537161,-48.395928],[18.896430,-50.387803],[19.615293,-52.243397],[20.270189,-54.069572],[20.475483,-56.226294],[20.332848,-58.158322],[19.788063,-60.112596],[18.875774,-62.173270],[17.601871,-64.237054],[14.073063,-68.275184],[9.409325,-72.029447],[3.818343,-75.302300],[-0.026174,-77.015744],[-3.702164,-78.259943],[-7.223543,-79.038808],[-10.604230,-79.356250],[-13.336397,-79.283390],[-15.477266,-78.826470],[-16.304135,-78.562660],[-21.097239,-79.518600],[-21.828636,-79.772676],[-22.116725,-80.115661],[-21.789289,-80.918877],[-20.504183,-81.947911],[-18.963827,-82.648923],[-15.682327,-83.813270],[-6.545233,-85.990504],[2.139673,-87.024980],[10.338009,-86.914814],[14.243969,-86.429901],[18.015393,-85.658120],[23.173078,-84.064899],[28.043533,-81.899565],[32.663000,-79.143321],[37.067723,-75.777370],[61.513873,-51.407283],[64.483847,-47.952662],[66.815710,-44.789664],[68.757697,-41.546187],[70.558043,-37.850127],[72.743403,-33.530297],[75.497423,-29.763217],[76.470133,-29.887217],[78.655749,-30.315370],[80.843295,-30.236075],[82.979830,-29.657388],[85.012413,-28.587367],[86.561165,-27.333437],[87.866055,-25.826581],[88.885102,-24.124761],[89.576323,-22.285937],[89.832940,-19.854832],[89.625623,-17.466927],[88.127243,-14.322067],[73.654243,0.359593],[71.610751,1.434219],[69.337569,1.956873],[66.960716,1.914537],[64.606213,1.294193],[62.847563,0.397976],[61.264680,-0.806117],[59.911323,-2.269253],[58.841253,-3.942597],[57.857535,-6.742705],[57.719698,-9.573221],[58.411998,-12.277037],[59.918693,-14.697047],[60.579233,-15.681577],[59.152223,-17.463737],[55.188829,-21.651706],[53.536770,-22.782590],[51.964463,-23.386777],[50.328661,-23.495064],[48.519303,-23.222537],[45.441111,-22.727490],[42.560313,-22.850067],[41.420333,-23.056337],[41.079649,-22.960007],[40.571243,-22.000097],[38.604809,-18.852265],[34.928923,-14.760257],[29.346893,-9.375147],[-2.131301,20.119310],[-14.655928,32.366116],[-23.905989,41.857313],[-31.454216,50.396636],[-37.858598,58.911833],[-41.620064,64.051322],[-45.447495,68.773696],[-54.613945,78.503133],[-58.464026,82.108756],[-61.550940,84.420773],[-63.913625,85.747519],[-66.250667,86.621524],[-68.498160,87.024980],[-70.592200,86.940083]]);
  }
}


module shape(h){ poly_path74(h);

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

