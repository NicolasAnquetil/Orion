creating method
setLinksFrom: aFM3MetaDescription
	^ aFM3MetaDescription
		collect: [ :property | 
			| result |
			property opposite
				ifNil: [ self halt.
					nil ]
				ifNotNil: [ (property isMultivalued not and: [ property opposite isMultivalued ])
						ifTrue: [ result := self generate1ToNSetterFrom: property ].
					(property isMultivalued and: [ property opposite isMultivalued ])
						ifTrue: [ result := self generateNToNSetterFrom: property ].
					(property isMultivalued and: [ property opposite isMultivalued not ])
						ifTrue: [ result := self generateNTo1SetterFrom: property ].
					(property isMultivalued not and: [ property opposite isMultivalued not ])
						ifTrue: [ result := self generate1To1SetterFrom: property ].
					result ] ]
		thenSelect: #isNotNil