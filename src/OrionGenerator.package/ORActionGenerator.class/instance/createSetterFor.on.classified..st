creating method
createSetterFor: aString on: aClass classified: aCat
	aClass compileSilently: ('<1s>: aValue<r><t><1s> := aValue' expandMacrosWith: aString) classified: aCat