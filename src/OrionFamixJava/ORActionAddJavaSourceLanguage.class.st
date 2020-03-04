"
A ORActionAddJavaSourceLanguage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddJavaSourceLanguage,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'sourcedEntities'
	],
	#category : 'OrionFamixJava-Action'
}

{ #category : #'method execution - generated' }
ORActionAddJavaSourceLanguage >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORJavaSourceLanguage new.
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
ORActionAddJavaSourceLanguage >> sourcedEntities [
	^ sourcedEntities
]

{ #category : #'accessing - generated' }
ORActionAddJavaSourceLanguage >> sourcedEntities: aValue [
	sourcedEntities := aValue
]
