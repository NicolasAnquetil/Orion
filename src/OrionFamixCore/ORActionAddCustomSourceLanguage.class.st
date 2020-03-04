"
A ORActionAddCustomSourceLanguage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddCustomSourceLanguage,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'sourcedEntities',
		'name'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddCustomSourceLanguage >> name [
	^ name
]

{ #category : #'accessing - generated' }
ORActionAddCustomSourceLanguage >> name: aValue [
	name := aValue
]

{ #category : #'method execution - generated' }
ORActionAddCustomSourceLanguage >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORCustomSourceLanguage new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	self name ifNotNil: [ :e | 
		newEntity privateName: e orionCopy ].

	"Set complex not derived properties of the entity"
	self sourcedEntities
		ifNotNil: [ | theNewEntities |
			theNewEntities := OrderedCollection withAll: (self sourcedEntities collect: [:e | self orionModel retrieveEntity: e ]).
			newEntity privateSourcedEntities: theNewEntities orionCopy.
			theNewEntities do: [:e | e privateDeclaredSourceLanguage: newEntity ] ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]

{ #category : #'accessing - generated' }
ORActionAddCustomSourceLanguage >> sourcedEntities [
	^ sourcedEntities
]

{ #category : #'accessing - generated' }
ORActionAddCustomSourceLanguage >> sourcedEntities: aValue [
	sourcedEntities := aValue
]
