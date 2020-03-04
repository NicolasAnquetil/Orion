as yet unclassified
needs: anElement
	^anElement parentType subInheritances collect:[:each | each subclass].