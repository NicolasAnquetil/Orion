"
A ORActionRemoveAccess is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveAccess,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveAccess class >> description [
	^'remove access'
]

{ #category : #'as yet unclassified' }
ORActionRemoveAccess class >> scope [
	<ORActionFor: #ORAccess>
	^self
]

{ #category : #'method execution' }
ORActionRemoveAccess >> printWorkspace [

	^ '>', self class description, '>> ', ' from ', entity accessor mooseName, ' to ', entity variable mooseName
]

{ #category : #'method execution - generated' }
ORActionRemoveAccess >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity accessor
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity accessor.
			theEntity privateAccesses: (theEntity privateAccesses orionCopy orionRemove: entity) ].
	entity variable
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity variable.
			theEntity privateIncomingAccesses: (theEntity privateIncomingAccesses orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
