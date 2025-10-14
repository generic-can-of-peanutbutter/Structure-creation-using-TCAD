Title ""

Controls {
}

IOControls {
	outputFile = "pmos"
	EnableSections
}

Definitions {
	Constant "ConstantProfileDefinition_substrate" {
		Species = "BoronActiveConcentration"
		Value = 1e+17
	}
	Constant "ConstantProfileDefinition_source" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+20
	}
	Constant "ConstantProfileDefinition_drain" {
		Species = "PhosphorusActiveConcentration"
		Value = 1e+20
	}
	Refinement "RefinementDefinition.all" {
		MaxElementSize = ( 0.02 0.02 )
		MinElementSize = ( 0.01 0.01 )
	}
	Multibox "MultiboxDefinition.channel"
	{
		MaxElementSize = ( 0.01 0.01 )
		MinElementSize = ( 0.005 0.005 )
		Ratio = ( 1 1.25 )
	}
}

Placements {
	Constant "ConstantProfilePlacement_substrate" {
		Reference = "ConstantProfileDefinition_substrate"
		EvaluateWindow {
			Element = region ["region_1_substrate"]
		}
	}
	Constant "ConstantProfilePlacement_source" {
		Reference = "ConstantProfileDefinition_source"
		EvaluateWindow {
			Element = region ["region_2_source"]
		}
	}
	Constant "ConstantProfilePlacement_drain" {
		Reference = "ConstantProfileDefinition_drain"
		EvaluateWindow {
			Element = region ["region_3_drain"]
		}
	}
	Refinement "RefinementPlacement.all" {
		Reference = "RefinementDefinition.all"
		RefineWindow = Rectangle [(-0.0555 -0.029) (1.5507 0.7345)]
	}
	Multibox "MultiboxPlacement.channel" {
		Reference = "MultiboxDefinition.channel"
		RefineWindow = Rectangle [(0.15 -0.005) (1.35 0.1)]
	}
}

