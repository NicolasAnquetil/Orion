"
A ORActionRemoveReference is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveReference,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveReference class >> description [
	^'remove reference'
]

{ #category : #'as yet unclassified' }
ORActionRemoveReference class >> scope [
	<ORActionFor: #ORReference>
	^self
]

{ #category : #'method execution' }
ORActionRemoveReference >> printWorkspace [

	^ '>', self class description, '>> ', ' from ', entity source mooseName, ' to ', entity target mooseName
]

{ #category : #'method execution - generated' }
ORActionRemoveReference >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity source
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity source.
			theEntity privateOutgoingReferences: (theEntity privateOutgoingReferences orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	entity target
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity target.
			theEntity privateIncomingReferences: (theEntity privateIncomingReferences orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
