creating method
writeMethodHeaderOn: stream withPackage: aFamePackage withDeclaredVariable: stringOfVariables
	aFamePackage
		ifNil: [ stream << 'run'; cr ]
		ifNotNil: [ stream << 'runOn'; << aFamePackage name; << 'Extension: '; << (stringOfVariables ifNil: ['anEntity']); cr.
			stream tab; << '<toRun>'; cr ].
	stream tab; << '<generated: true>'; cr.
	(aFamePackage isNil and: [ stringOfVariables isNotNil ])
		ifTrue: [ stream tab; << '| '; << stringOfVariables; << ' |'; cr ].
	aFamePackage ifNil: [ stream tab; << 'super run.'; cr ]