method execution
runExtendedPropertiesForEntity: anOREntity
	(Pragma allNamed: #toRun in: self class)
		do: [ :pragma | self perform: pragma methodSelector with: anOREntity ]