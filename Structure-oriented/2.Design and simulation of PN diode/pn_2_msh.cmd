Title "Untitled"

Controls {
}

IOControls {
	outputFile = "/home/student/STUDENTS/230959200_A3/2/pn_model"
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_P" {
		Species = "BoronActiveConcentration"
		Value = 1e+15
	}
	Constant "ConstantProfileDefinition_n" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+18
	}
	AnalyticalProfile "AnalyticalProfileDefinition_n" {
		Species = "PhosphorusActiveConcentration"
		Function = Gauss(PeakPos = 0, PeakVal = 1e+18, ValueAtDepth = 1e+15, Depth = 0.8)
		LateralFunction = Gauss(Factor = 0.1)
	}
	Refinement "RefinementDefinition_1" {
		MaxElementSize = 0.05
		MinElementSize = 0.01
		RefineFunction = MaxLenInt(Interface("n_region","n_region"), Value=10, factor=0.4, UseRegionNames)
		RefineFunction = MaxLenInt(Interface("cathode","cathode"), Value=10, factor=0.4, UseRegionNames)
		RefineFunction = MaxLenInt(Interface("anode","anode"), Value=10, factor=0.4, UseRegionNames)
		RefineFunction = MaxLenInt(Interface("region_6","region_6"), Value=10, factor=0.4, UseRegionNames)
		RefineFunction = MaxLenInt(Interface("region_7","region_7"), Value=10, factor=0.4, UseRegionNames)
		RefineFunction = MaxLenInt(Interface("region_8","region_8"), Value=10, factor=0.4, UseRegionNames)
	}
}

Placements {
	AnalyticalProfile "AnalyticalProfilePlacement_1" {
		Reference = "AnalyticalProfileDefinition_n"
		ReferenceElement {
			Element = Line [(1 1) (2 1)]
		}
		EvaluateWindow {
			Element = region ["n_region"]
			DecayLength = 0.8
		}
	}
	Refinement "RefinementPlacement_global" {
		Reference = "RefinementDefinition_1"
		RefineWindow = Rectangle [(-0.9235 3.8001) (6.2527 -0.6721)]
	}
}

