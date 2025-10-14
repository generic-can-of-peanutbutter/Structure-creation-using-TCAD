Title "Untitled"

Controls {
}

IOControls {
	outputFile = "/home/student/STUDENTS/230959200_A3/Model_1"
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_P" {
		Species = "BoronActiveConcentration"
		Value = 1e+18
	}
	Constant "ConstantProfileDefinition_N" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+18
	}
	Refinement "RefinementDefinition_Global" {
		RefineFunction = MaxLenInt(Interface("p_region","n_region"), Value=1, factor=0.8, UseRegionNames)
	}
}

Placements {
	Constant "ConstantProfilePlacement_P" {
		Reference = "ConstantProfileDefinition_P"
		EvaluateWindow {
			Element = region ["p_region"]
		}
	}
	Constant "ConstantProfilePlacement_N" {
		Reference = "ConstantProfileDefinition_N"
		EvaluateWindow {
			Element = region ["n_region"]
		}
	}
	Refinement "RefinementPlacement_Global" {
		Reference = "RefinementDefinition_Global"
		RefineWindow = Rectangle [(-0.5 1.5) (2.5 -0.5)]
	}
}

