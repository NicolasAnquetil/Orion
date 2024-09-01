Class {
	#name : #ORChainTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'orion1',
		'orion2'
	],
	#category : #OrionTest
}

{ #category : #running }
ORChainTest >> inheritanceRoot: aClass [

	^aClass superclass
	ifNil: [ aClass ]
	ifNotNil: [ :superC | self inheritanceRoot: superC ]
]

{ #category : #running }
ORChainTest >> rename: entity to: newName [

	(ORActionRenameClass new
			orionModel: orion2 ;
			entity: entity ;
			newName: newName )
		run
]

{ #category : #running }
ORChainTest >> setUp [

	| importer system |
	model := MooseModel new.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer candidateClass: CandidateListOperator.
	importer importerClass: SmalltalkImporter.
	importer factory: SmalltalkFAMIXMetamodelFactory.
	importer
		model: model ;
		addFromPackagesNamed: #(#'Orion-TestModel-Chain');
		run.

	system := ORSystem new.
	system sourceModel: model.

	orion1 := (ORConverter convertFromMooseModel: model)
		name: 'Orion-v1' ;
		system: system.

	orion2 := (ORModel withParent: orion1)
		name: 'Orion-v2' ;
		system: system.

]

{ #category : #tests }
ORChainTest >> testChain [

	| leaf root |

	leaf := model entityNamed: 'Smalltalk::Chain4'.
	self assert: (leaf versionIn: orion1) == (leaf versionIn: orion2).
	self rename: leaf to: 'Chain4-2'.
	self deny: (leaf versionIn: orion1) == (leaf versionIn: orion2).

	root := model entityNamed: 'Smalltalk::Chain1'.
	self assert: (root versionIn: orion1) == (root versionIn: orion2).
	self rename: root to: 'Chain1-2'.
	self deny: (root versionIn: orion1) == (root versionIn: orion2).

	self assert: (self inheritanceRoot: (leaf versionIn: orion2)) == ((model entityNamed: 'Smalltalk::Chain2') versionIn: orion2)
]
