creating method
applyGenerationOfActionsOn: aListOfProperties onBlock: block
	| props |
	props := aListOfProperties groupedBy: #package.
	props associationsDo: block