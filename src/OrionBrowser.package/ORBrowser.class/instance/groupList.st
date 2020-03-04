as yet unclassified
groupList
	^ GLMListPresentation new
			beMultiple;
			showOnly: 50;
			display: [:e | e mooseInterestingEntity];
			send: [:each | each isNil ifTrue: [nil] ifFalse: [each asMooseGroup]];
			format: #mooseName;
			title: [ :each | each mooseInterestingEntity size asString, ' items'];
			when: [:input | (input mooseInterestingEntity isKindOf: MooseGroup) or:[
					(input mooseInterestingEntity isKindOf: Collection) and:[(input mooseInterestingEntity isKindOf: ByteSymbol)not]]];
			dynamicActionsOnSelection: [ :list | OrderedCollection new 
					addAll: list selection mooseInterestingEntity mooseFinderActions;
					addAll: (self actionsFor: list);
					yourself].
				
	