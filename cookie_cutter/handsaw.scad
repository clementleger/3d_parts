
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



module poly_path172(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[60.407721,74.657168],[59.139561,70.081678],[57.765511,65.133328],[57.295591,63.561078],[56.573141,63.669988],[50.305531,65.146208],[44.642671,66.395828],[43.148421,61.250038],[41.462732,55.178668],[41.153591,54.135388],[40.380061,54.241408],[35.290382,55.414018],[29.520545,56.776828],[28.661447,56.855256],[28.399231,56.668948],[26.805301,51.204038],[25.281140,45.952056],[24.609421,44.659848],[19.114011,45.911998],[13.007591,47.293668],[12.286869,47.258843],[12.044781,46.893268],[10.641861,41.740288],[8.995434,35.823836],[8.696067,35.207110],[8.411591,35.165798],[3.068581,36.414948],[-2.869745,37.769718],[-3.603739,37.813011],[-4.133076,37.153153],[-6.069555,30.190508],[-7.194732,26.096932],[-7.451932,25.651630],[-7.731295,25.658248],[-14.039279,27.190288],[-20.112964,28.479788],[-21.528077,23.527168],[-23.101191,17.803218],[-23.744516,16.331498],[-32.105345,18.198318],[-35.645268,19.062088],[-36.041638,18.887897],[-36.434084,18.188738],[-37.499641,14.495298],[-38.457464,10.896708],[-44.558765,12.404028],[-50.921996,14.048038],[-51.344832,13.539905],[-52.105399,10.789998],[-53.754338,4.622181],[-54.158391,3.569183],[-54.470473,3.271508],[-56.537578,2.910968],[-59.433213,2.233142],[-62.095300,1.083348],[-65.128738,-0.937333],[-68.801259,-4.393582],[-72.208963,-8.241574],[-75.393824,-12.827822],[-79.463523,-18.546040],[-84.315973,-23.350842],[-85.613833,-24.681516],[-86.473126,-26.018745],[-86.949342,-27.478755],[-87.097971,-29.177772],[-86.931493,-31.146903],[-86.422799,-32.913070],[-85.569253,-34.482758],[-84.368221,-35.862452],[-83.049004,-36.949127],[-81.669920,-37.603503],[-76.872602,-38.193702],[-74.019215,-38.354892],[-69.054288,-43.322022],[-62.845537,-49.097912],[-58.495942,-51.426277],[-52.894953,-53.677993],[-49.809612,-54.947373],[-47.832074,-56.287793],[-46.844757,-57.410928],[-46.437945,-58.719235],[-46.579776,-60.595648],[-47.238389,-63.423103],[-47.948633,-66.453235],[-48.082411,-68.959943],[-47.824865,-71.823933],[-47.309868,-72.717150],[-46.383316,-73.679113],[-44.801351,-74.851477],[-43.058668,-75.587971],[-41.267851,-75.856568],[-39.541483,-75.625243],[-37.501701,-74.627051],[-34.736631,-72.758489],[-28.803551,-67.716113],[-25.077316,-63.572279],[-21.964439,-58.831663],[-19.832039,-56.057941],[-16.735248,-54.077413],[-13.092624,-51.846423],[-1.365158,-40.241472],[81.146512,43.374408],[87.097972,49.361908],[80.892832,55.723788],[60.898732,75.856568],[60.407722,74.657168]]);
  }
}


module shape(h){ poly_path172(h);

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

