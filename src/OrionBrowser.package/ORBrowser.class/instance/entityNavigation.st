as yet unclassified
entityNavigation
	^ GLMListPresentation new
			title: 'Navigation';
			display: [ :anObject | |entity |
				entity := anObject mooseInterestingEntity.
				(entity mooseInterestingEntity isKindOf: FAMIXEntity) ifFalse:[self selectedVersion: entity] ifTrue:[entity currentContext: self selectedVersion.].
				self displayFor: entity value.
			];
			when: [:input | input mooseInterestingEntity isCollection not or: [input mooseInterestingEntity isKindOf: MooseModel] ];
			dynamicActionsOnSelection: [ :list | list selection mooseInterestingEntity mooseFinderActions ].