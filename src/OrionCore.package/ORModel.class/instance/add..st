adding/removing
add: anElement 
	super add: anElement. 
	anElement versionIn: self.
	^anElement