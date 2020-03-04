creating method
generateRequiredMethods: anAction forARenamedEntity: anOREntity
	| stream |
	(anOREntity mooseDescription inheritsFrom: FAMIXNamedEntity mooseDescription)
		ifFalse: [ ^ self ].
	stream := WriteStream on: ''.
	stream << 'run'; cr.
	stream tab; << '<generated: true>'; cr.
	stream tab; << '| theEntity |'; cr.
	stream tab; << 'super run.'; cr.
	stream tab; << 'theEntity := (self orionModel retrieveEntity: entity).'; cr.
	stream tab; << 'theEntity name: newName.'; cr.
	stream tab; << 'entity := theEntity.'; cr.
	stream tab; << '^ entity'.
	anAction compileSilently: stream contents classified: 'method exectution - generated'