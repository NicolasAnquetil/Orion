creating method
addAccessorFrom: aFamixClass toTrait: aOrionTrait
	"add accessors corresponding to the non inherited properties and relations of the Famix Class to the Orion trait "
	(self getPropertiesOf: aFamixClass)
		, (self getExtendedPropertiesOf: aFamixClass)
		do: [ :prop | 
			| extensionCat cat |
			prop compiledMethod isExtension
				ifTrue: [ extensionCat := 'Orion'
						, ('' join: (prop compiledMethod category substrings: '-*')).
					(aOrionTrait category beginsWith: extensionCat)
						ifTrue: [ cat := 'accessing' ]
						ifFalse: [ cat := '*' , extensionCat ] ]
				ifFalse: [ cat := 'accessing' ].
			aOrionTrait compileSilently: (self codeForSelector: prop) classified: cat.
			aOrionTrait compileSilently: (self codeForORSelector: prop) classified: cat ]