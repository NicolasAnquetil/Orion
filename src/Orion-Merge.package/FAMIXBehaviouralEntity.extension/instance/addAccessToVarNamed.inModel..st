*Orion-Merge
addAccessToVarNamed: aString inModel: aMooseModel
	| access |
	access := FAMIXAccess new
		variable: (aMooseModel entityNamed: aString);
		accessor: self.
	aMooseModel add: access.
	^ access