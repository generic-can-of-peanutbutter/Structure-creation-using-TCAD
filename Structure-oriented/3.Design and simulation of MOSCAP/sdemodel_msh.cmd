Title ""

Controls {
}

IOControls {
	outputFile = "./sdemodel"
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_1" {
		Species = "BoronActiveConcentration"
		Value = 1e+16
	}
	Refinement "RefinementDefinition_1" {
		MaxElementSize = ( 0.05 0.05 )
		MinElementSize = ( 0.01 0.01 )
		RefineFunction = MaxLenInt(Interface("Silicon","Silicon"), Value=0.01, factor=1.5, DoubleSide)
	}
}

Placements {
	Constant "ConstantProfilePlacement_1" {
		Reference = "ConstantProfileDefinition_1"
		EvaluateWindow {
			Element = material ["Silicon"]
		}
	}
	Refinement "RefinementPlacement_1" {
		Reference = "RefinementDefinition_1"
		RefineWindow = Rectangle [(-0.5 -0.05) (3.5 0.65)]
	}
}

