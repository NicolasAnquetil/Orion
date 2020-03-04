creating method
settingOfPropertiesFrom: listOfProperties
	^ listOfProperties
		collect: [ :propertyNotDerived | 
			(propertyNotDerived isMultivalued
				ifTrue: [ '<t>self <1s> isEmptyOrNil ifFalse: [ <r><t><t>newEntity private<2s>: self <1s> orionCopy ].<r>' ]
				ifFalse: [ '<t>self <1s> ifNotNil: [ :e | <r><t><t>newEntity private<2s>: e orionCopy ].<r>' ])
				expandMacrosWith: propertyNotDerived implementingSelector
				with: propertyNotDerived implementingSelector capitalized ]