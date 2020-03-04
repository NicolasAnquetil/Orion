creating method
codeForPrivateExtendedSetter: aProperty
	^ String
		streamContents: [ :stream | 
			stream << 'private' << aProperty name capitalized asMutator << ' aValue' .
			stream cr tab << 'self privateState attributeAt: #' << aProperty name << ' put: aValue' ]