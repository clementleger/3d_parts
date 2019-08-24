include <../common/roundedcube.scad>

kenwooddisc = 151;
kenwoodouter = 159;
kenwoodthin = 1.2;
kenwoodthick = 3.4;
baseheight = 18;
baselower = 1;
spacing = 22;
number = 7;

difference() {
translate ([-(spacing*(number))/2, -kenwoodouter/3,0]) roundedcube([spacing*(number),kenwoodouter/1.5,baseheight], false, 4, "z");

union() {
translate ([-(number+1)/2*spacing-(kenwoodthick/2),0,kenwoodouter/2+baselower]) rotate ([0,90,0])
for (i = [1:number])
{
translate ([0,0,i*spacing]) {
cylinder (r=kenwoodouter/2, h=kenwoodthick-kenwoodthin);
cylinder (r=kenwooddisc/2, h=kenwoodthick);
}
}
}
}