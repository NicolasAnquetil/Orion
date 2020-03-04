accessing
model
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