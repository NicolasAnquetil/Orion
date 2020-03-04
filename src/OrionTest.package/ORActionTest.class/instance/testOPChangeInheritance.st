testing
testOPChangeInheritance
	| asM2 |
	"
	Not managed by generated version
	self assert: (orionModel entityNamed: 'Smalltalk::Class1') superclass equals: (orionModel entityNamed: 'Smalltalk::Object').
	asM2 := (ORModel withParent: orionModel) name: 'OrionModel2'.
	(orionModel entityNamed: 'Smalltalk::Class1') changeSuperClassTo: (orionModel entityNamed: 'Smalltalk::Class2') inModel: asM2.
	self assert: (asM2 entityNamed: 'Smalltalk::Class1') superclass equals: (asM2 entityNamed: 'Smalltalk::Class2').
	self assert: (asM2 entityNamed: 'Smalltalk::Class1') superInheritances size equals: 1"