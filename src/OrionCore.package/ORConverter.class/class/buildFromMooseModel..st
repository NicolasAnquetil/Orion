initialize-release
buildFromMooseModel: aMooseModel
	"make all necessary to convert a model"

	| model system |
	model := ORConverter convertFromMooseModel: aMooseModel.
	system := ORSystem new.
	system sourceModel: model.
	model system: system.
	system name: 'Orion ' , model name.
	ORSystem add: system.
	(MooseModel root includes: aMooseModel)
		ifTrue: [ MooseModel root remove: aMooseModel ].
	^ model