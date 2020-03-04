creating method
createGetterFor: aMethodName on: aClass classified: aCat
	aClass compileSilently: aMethodName , String cr , String tab , '^ ' , aMethodName classified: aCat