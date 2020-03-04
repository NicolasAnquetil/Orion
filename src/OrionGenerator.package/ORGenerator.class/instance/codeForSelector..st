creating method
codeForSelector: aProperty
	^ String
		streamContents: [ :stream | 
			stream << aProperty name .
			stream cr tab << '^ self ' << aProperty name << 'OR: self currentContext' ]