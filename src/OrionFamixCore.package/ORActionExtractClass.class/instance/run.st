method execution
run
	| packageToPutTheNewClass theNewClass methodsAccessors |
	super run.
	
	methodsAccessors := OrderedCollection new.
	self entity parentPackage ifNotNil: [ packageToPutTheNewClass := self entity parentPackage ].
	 [theNewClass := packageToPutTheNewClass addClassNamed: self newName inAction:  self ] orNoNameExceptionLauncher  .

	" self orionModel entityNamed: self newName.	"
		
	"change to get just the selected attributes"
	self selectedAttributes do: [ :attributeToMove |  attributeToMove moveTo: theNewClass inAction: self  ].
	entity addAttributeNamed: newName inAction: self .	
	
	"get all the accessors"
	self selectedAttributes
		do: [ :selected | 
			entity methods
				do: [ :each | 
					each name = selected name
						ifTrue: [ methodsAccessors add: each ].
					(selected name , ':') = each name
						ifTrue: [ methodsAccessors add: each ] ] ].	
	
	"move the accessors to the new class"				
	methodsAccessors do: [ :each | each moveTo: theNewClass inAction: self ]	