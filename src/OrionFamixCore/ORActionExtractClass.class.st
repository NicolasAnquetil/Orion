"
An ORActionExtractClass is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionExtractClass,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'selectedAttributes'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #initialization }
ORActionExtractClass >> initialize [
	super initialize.
	self entity: nil.
	selectedAttributes := OrderedCollection new.
	newName := 'newExtractClass'.
]

{ #category : #accessing }
ORActionExtractClass >> printWorkspace [ 
	^ '>', self class description , '>> ', ' to ', self newName
]

{ #category : #'method execution' }
ORActionExtractClass >> run [
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
]

{ #category : #accessing }
ORActionExtractClass >> selectedAttributes [
	^ selectedAttributes
]

{ #category : #accessing }
ORActionExtractClass >> selectedAttributes: anObject [
	selectedAttributes := anObject
]
