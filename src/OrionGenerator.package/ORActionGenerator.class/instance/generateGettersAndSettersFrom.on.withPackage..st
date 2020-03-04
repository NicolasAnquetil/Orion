creating method
generateGettersAndSettersFrom: aCollectionOfFameProperties on: aClass withPackage: aFamePackage
	| selector |
	aCollectionOfFameProperties
		do: [ :e | 
			| cat |
			selector := e implementingSelector.
			self addInstanceVariable: selector on: aClass.
			cat := self catNameFor: aFamePackage defaultName: 'accessing'.
			self createGetterFor: selector on: aClass classified: cat.
			self createSetterFor: selector on: aClass classified: cat ]