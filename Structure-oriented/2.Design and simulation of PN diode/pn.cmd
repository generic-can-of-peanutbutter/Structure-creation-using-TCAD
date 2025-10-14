File {
Grid = "model_msh.tdr"
Plot = "model_msh"
Current = "model_msh"
Output = "model_msh"
}
Electrode {
{ Name="anode_contact" Voltage= 0.0 } 
{ Name="cathode_contact" Voltage= 0.0 }
}
Physics {
EffectiveIntrinsicDensity( OldSlotboom )
Recombination( SRH(DopingDep) )
Mobility(
PhuMob
eHighFieldsaturation
Enormal
)
}
Plot {
*--Density and Currents, etc
eDensity hDensity
TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
eMobility hMobility
eVelocity hVelocity
eQuasiFermi hQuasiFermi
*--Temperature
eTemperature * Temperature hTemperature
*--Fields and charges
ElectricField/Vector Potential SpaceCharge
*--Doping Profiles
Doping DonorConcentration AcceptorConcentration
*--Generation/Recombination
SRH Band2Band * Auger
ImpactIonization eImpactIonization hImpactIonization
*--Driving forces
eGradQuasiFermi/Vector hGradQuasiFermi/Vector
eEparallel hEparallel eENormal hENormal
*--Band structure/Composition
BandGap
BandGapNarrowing
Affinity
ConductionBand ValenceBand
*--Traps
* eTrappedCharge hTrappedCharge
* eGapStatesRecombination hGapStatesRecombination
}
Math {
Extrapolate
RelErrControl
Digits=8
ErrRef(electron)=1.e10
ErrRef(hole)=1.e10
Notdamped=50
Iterations=20
}
Solve {
NewCurrentPrefix="init"
Coupled(Iterations=100){ Poisson }
Coupled{ Poisson Electron Hole }
Quasistationary(
InitialStep=1e-1 Increment=1.2
Minstep=1e-5 MaxStep=0.1
Goal{ Name="anode" Voltage= 1 }
){ Coupled{ Poisson Electron Hole } }
}
