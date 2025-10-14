File {
Grid = "pmos_msh.tdr"
Plot = "IdVg_MOSFET_exp4"
* Parameter = "IdVg_MOSFET_exp4"
Current = "IdVg_MOSFET_exp4"
}
Electrode {
{ Name="gate" Voltage= 0.0 Workfunction= 4.5 }
{ Name="drain" Voltage=0.0 }
{ Name="source" Voltage=0.0 }
{ Name="body" Voltage=0.0 }
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
Solve {
Coupled ( Iterations= 100 LineSearchDamping= 1e-8 ){ Poisson }
Coupled ( Iterations= 100 LineSearchDamping= 1e-8 ){ Poisson electron hole}
Quasistationary(
DoZero
InitialStep= 1e-3 Increment= 1.5
MinStep= 1e-6 MaxStep= 0.025
Goal { Name= "drain" Voltage= -1 }
){ Coupled { Poisson electron hole} }
NewCurrentPrefix= "IdVg_"
Quasistationary(
InitialStep= 1e-3 Increment= 1.5
MinStep= 1e-6 MaxStep= 0.025
Goal { Name= "gate" Voltage= -1 }
){ Coupled { Poisson electron hole} }
}
