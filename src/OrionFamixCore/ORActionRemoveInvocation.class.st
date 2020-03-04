"
A ORActionRemoveInvocation is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionRemoveInvocation,
	#superclass : #ORActionRemove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionRemoveInvocation class >> description [
	^'remove invocation'
]

{ #category : #'as yet unclassified' }
ORActionRemoveInvocation class >> scope [
	<ORActionFor: #ORInvocation>
	^self
]

{ #category : #'method execution - generated' }
ORActionRemoveInvocation >> run [
	<generated: true>
	super run.
	entity := self orionModel retrieveEntity: entity.
	entity sender
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity sender.
			theEntity privateOutgoingInvocations: (theEntity privateOutgoingInvocations orionCopy orionRemove: entity) ].
	entity receiver
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity receiver.
			theEntity privateReceivingInvocations: (theEntity privateReceivingInvocations orionCopy orionRemove: entity) ].
	entity declaredSourceLanguage
		ifNotNil: [ | theEntity |
			theEntity := self orionModel retrieveEntity: entity declaredSourceLanguage.
			theEntity privateSourcedEntities: (theEntity privateSourcedEntities orionCopy orionRemove: entity) ].
	self runExtendedPropertiesForEntity: entity.
	self orionModel remove: entity
]
