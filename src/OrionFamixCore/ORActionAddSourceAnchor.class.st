"
A ORActionAddSourceAnchor is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element. See OrionGenerator in Moose/Orion on SmalltalkHub for more information.
"
Class {
	#name : #ORActionAddSourceAnchor,
	#superclass : #ORActionAddEntity,
	#instVars : [
		'element'
	],
	#category : 'OrionFamixCore-Action'
}

{ #category : #'accessing - generated' }
ORActionAddSourceAnchor >> element [
	^ element
]

{ #category : #'accessing - generated' }
ORActionAddSourceAnchor >> element: aValue [
	element := aValue
]

{ #category : #'method execution - generated' }
ORActionAddSourceAnchor >> run [
	<generated: true>
	| newEntity |
	super run.
	newEntity := ORSourceAnchor new.
	self orionModel add: newEntity.
	"Set primitive not derived properties of the entity"
	"Set complex not derived properties of the entity"
	self element
		ifNotNil: [ | theNewEntity |
			theNewEntity := self orionModel retrieveEntity: self element.
			newEntity privateElement: theNewEntity orionCopy.
			theNewEntity privateSourceAnchor: newEntity orionCopy ].
	self runExtendedPropertiesForEntity: newEntity.
	entity := newEntity.
	^ entity
]
