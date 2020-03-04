as yet unclassified
needs: anElement
	^anElement parentType superInheritances collect:[:each | each superclass].