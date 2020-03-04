*Orion-Merge
unsafeAdd: element
	(self includes: element) not
		ifTrue: [ self add: element ]