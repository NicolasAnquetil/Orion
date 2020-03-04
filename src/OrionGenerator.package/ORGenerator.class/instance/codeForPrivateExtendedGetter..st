creating method
codeForPrivateExtendedGetter: aProperty
	| defaultValue |
	defaultValue := aProperty isMultivalued
		ifTrue: [ aProperty opposite isMultivalued
				ifTrue: [ "multimulti"
					'FMMultiMultivalueLink on: self opposite: #'
						, aProperty opposite implementingSelector asString ]
				ifFalse: [ "multi1"
					'FMMultivalueLink on: self opposite: #'
						, aProperty opposite implementingSelector asMutator asString ] ]
		ifFalse: [ 'nil' ].
	^ String
		streamContents: [ :stream | 
			stream << 'private'; << aProperty name capitalized; cr.
			stream tab; << '	^ self privateState attributeAt: #'; << aProperty name; << ' ifAbsentPut: [ '; 
					<< defaultValue; << ' ]' ]