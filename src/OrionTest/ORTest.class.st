Class {
	#name : #ORTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : 'OrionTest'
}

{ #category : #accessing }
ORTest >> model [
	model
		ifNil: [ | importer mod system |
			mod := MooseModel new.
			importer := MoosePharoImporterTask new.
			importer importingContext mergeClassAndMetaclass.
			importer candidateClass: CandidateListOperator.
			importer importerClass: SmalltalkImporter.
			importer
				model: mod;
				addFromPackagesNamed: #(#'Orion-TestModel-Constellation2' 'Orion-TestModel-Constellation1');
				run.
			model := ORConverter convertFromMooseModel: mod.
			model name: 'Parent Model'.
			system := ORSystem new.
			system sourceModel: model.
			model system: system.
			^ model ]
		ifNotNil: [ ^ model ]
]

{ #category : #accessing }
ORTest >> modelNetwork [

		| importer mod system as|
		
	mod := MooseModel new.
	mod name: 'Network'.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer model: mod; addFromPackagesNamed: (MooseScripts packageNamesFor: 'Network*') ; runWithProgress .
		
		as := ORConverter convertFromMooseModel: mod.
		system := ORSystem new.
		system sourceModel: as.
		as system: system.
		^as
]
