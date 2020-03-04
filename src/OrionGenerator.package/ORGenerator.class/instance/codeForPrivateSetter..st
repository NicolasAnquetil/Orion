creating method
codeForPrivateSetter: aProperty
	| type |
	type := aProperty type name asString capitalized.
	^ String
		streamContents: [ :stream | 
			stream << 'private' << aProperty name capitalized << ': a' << type.
			stream cr tab << aProperty name << ' := a' << type ]