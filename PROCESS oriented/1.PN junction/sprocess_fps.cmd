math coord.ucs
line x location= 0.0 spacing= 500<nm> tag= diodetop
line x location= 0.5<um> spacing= 500.0<nm> tag= diodebot
line y location= 0.0 spacing= 50<nm> tag= diodeleft
line y location= 0.15<um> spacing= 50<nm>
line y location= 0.3<um> spacing= 50.0<nm> tag= dioderight
region Silicon xlo= diodetop xhi= diodebot ylo= diodeleft yhi= dioderight
init concentration= 1.0e+16<cm-3> field= Boron
AdvancedCalibration
deposit material= {Photoresist} type= anisotropic time= 1 rate= {1}
mask name= doping_mask left= 0.1<um> right= 0.2<um> negative
etch material= {Photoresist} type= anisotropic time= 1 rate= {2} mask= doping_mask
struct tdr= d0
refinebox Silicon min= {0.0 0} max= {0.3 0.3} xrefine= {0.001 0.001 0.001} yrefine= {0.01 0.01 0.01} add
grid remesh
implant Phosphorus dose= 5e15<cm-2> energy= 2<keV> tilt=7<degree> rotation= 0<degree>
struct tdr= d1
strip Photoresist
struct tdr= d2
diffuse temperature= 900<C> time= 5<s>
struct tdr= d3
deposit material= {Aluminum} type= anisotropic time= 1 rate= {0.05}
deposit material= {Photoresist} type= anisotropic time= 1 rate= {1}
mask name= contact_mask left= 0.125<um> right= 0.175<um>
etch material= {Photoresist} type= anisotropic time= 1 rate= {2} mask= contact_mask
etch material= {Aluminum} type= anisotropic time= 1 rate= {0.5}
strip Photoresist
contact name="Anode" bottom Silicon
contact name="Cathode" box Aluminum xlo=-0.2 xhi=0.1 ylo= 0 yhi= 1
struct tdr = pn_diode
