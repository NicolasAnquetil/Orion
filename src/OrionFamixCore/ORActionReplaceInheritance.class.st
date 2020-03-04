"
A ORActionReplaceInheritance is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionReplaceInheritance,
	#superclass : #ORActionReplaceLink,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionReplaceInheritance class >> description [
	^'replace superclass'
]

{ #category : #accessing }
ORActionReplaceInheritance >> child [
	^from
]

{ #category : #accessing }
ORActionReplaceInheritance >> child: anObject [
	from := anObject
]

{ #category : #accessing }
ORActionReplaceInheritance >> parent [
	^ to
]

{ #category : #accessing }
ORActionReplaceInheritance >> parent: anObject [
	to := anObject
]

{ #category : #'method execution' }
ORActionReplaceInheritance >> run [
	"This is a replacement, so remove the existing inheritance if it exists
	If there are several, defaults to removing the frst one"

	super run.
	
	from superInheritances ifNotEmpty: [
		ORActionRemoveInheritance new 
			parentAction: self ;
			orionModel: orionModel; 
			entity: from superInheritances first; 
			run
		].

	"Add the new inheritance"
	^ ORActionAddInheritance new 
			parentAction: self ;
			orionModel: orionModel; 		
			subclass: (orionModel retrieveEntity: self from) ;
			superclass: (orionModel retrieveEntity: self to) ;
			run.

]
