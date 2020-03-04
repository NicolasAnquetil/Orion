creating method
writeMethodHeaderOn: stream withPackage: aFamePackage
	aFamePackage
		ifNil: [ stream << 'run'; cr ]
		ifNotNil: [ stream << 'runOn'; << aFamePackage name; << 'Extension'; cr; tab; << '<toRun>'; cr ].
	stream tab; << '<generated: true>'; cr.
	aFamePackage ifNil: [ stream tab; << 'super run.'; cr ]