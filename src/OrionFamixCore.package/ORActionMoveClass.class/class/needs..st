as yet unclassified
needs: anElement
	^anElement currentContext allModelPackages reject:[:ea | ea = anElement parentPackage]