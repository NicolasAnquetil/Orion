creating method
codeForPrivateGetter: aProperty
	^ String
		streamContents: [ :stream | 
			stream << 'private' << aProperty name capitalized .
			stream cr tab << '^ ' << aProperty name ]