*** Device*****
Device "MOS" {
File {
Grid
= "sdemodel1_msh.tdr"
Plot
= "moscap"
* Parameter = "moscap"
Current = "moscap"
}
Electrode {
{ Name="Gate" Voltage=0.0 }
{ Name="Body" Voltage=0.0 }
}
Physics {
Fermi
EffectiveIntrinsicDensity( OldSlotboom )
Mobility(
DopingDep
eHighFieldsaturation( GradQuasiFermi )
hHighFieldsaturation( GradQuasiFermi )
Enormal
)
Recombination(
SRH( DopingDep TempDependence )
)
}
}
******End of Device ****
Plot {
*--Density and Currents, etc
eDensity hDensity
TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
eMobility hMobility
eVelocity hVelocity
eQuasiFermi hQuasiFermi
*--Temperature
eTemperature Temperature * hTemperature
*--Fields and charges
ElectricField/Vector Potential SpaceCharge
*--Doping Profiles
Doping DonorConcentration AcceptorConcentration
*--Generation/Recombination
SRH Band2BandGeneration * Auger
ImpactIonization eImpactIonization hImpactIonization
*--Driving forces
eGradQuasiFermi/Vector hGradQuasiFermi/Vector
eEparallel hEparallel eENormal hENormal
*--Band structure/Composition
BandGap
BandGapNarrowing
Affinity
ConductionBand ValenceBand
eQuantumPotential
}
Math {
RelErrControl
Digits=5
* (default)
ErrRef(electron)=1.e10 * (default)
ErrRef(hole)=1.e10
* (default)
Iterations=20
Notdamped=100
Method=Blocked
SubMethod=Super
ACMethod=Blocked
ACSubMethod=Super
}
File {
Output = "moscap"
ACExtract = "moscap"
}
System {
*-Physical devices:
MOS nmos1 ( "Body"=b "Gate"=g )
*-Lumped elements:
Vsource_pset vb (b 0) { dc = 0.0 }
Vsource_pset vg (g 0) { dc = 0.0 }
}
Solve {
NewCurrentPrefix="init_"
Coupled(Iterations=100){ Poisson }
Coupled{ Poisson Electron Hole }
Quasistationary (
InitialStep=0.1 Increment=1.3
MaxStep=0.5 Minstep=1.e-5
Goal { Parameter=vg.dc Voltage=-3.0 }
){ Coupled { Poisson Electron Hole } }
NewCurrentPrefix=""
Quasistationary (
InitialStep=0.01 Increment=1.3
MaxStep=0.05 Minstep=1.e-5
Goal { Parameter=vg.dc Voltage=3.0 }
){ ACCoupled (
StartFrequency=500 EndFrequency=500 NumberOfPoints=1 Decade
Node(g b) Exclude(vg vb)
ACCompute (Time = (Range = (0 1) Intervals = 40))
){ Poisson Electron Hole }
}
}
