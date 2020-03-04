"
A ORActionAddSourceLanguage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddSourceLanguage,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'sourcedEntities'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'method execution - generated' }
ORActionAddSourceLanguage >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORSourceLanguage new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
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
ORActionAddSourceLanguage >> sourcedEntities [
	^ sourcedEntities
]

{ #category : #'accessing - generated' }
ORActionAddSourceLanguage >> sourcedEntities: aValue [
	sourcedEntities := aValue
]
