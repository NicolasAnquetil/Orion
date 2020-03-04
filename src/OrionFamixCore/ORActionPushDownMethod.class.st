"
A ORActionPushDownMethod is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionPushDownMethod,
	#superclass : #ORActionMove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionPushDownMethod class >> description [
	^'push down method'
]

{ #category : #'as yet unclassified' }
ORActionPushDownMethod class >> needs: anElement [
	^anElement parentType subInheritances collect:[:each | each subclass].
]

{ #category : #'as yet unclassified' }
ORActionPushDownMethod class >> scope [
	<ORActionFor: #ORMethod>
	^self
]

{ #category : #'method execution' }
ORActionPushDownMethod >> run [
	| asAction |
	super run.
	
	asAction := ORActionMoveMethod new
					parentAction: self ;
					orionModel: self orionModel;
					entity: self entity;
					newContainer:self newContainer.
	^asAction run.
		


]
