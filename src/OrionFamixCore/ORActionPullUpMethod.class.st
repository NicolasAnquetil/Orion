"
A ORActionPullUpMethod is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionPullUpMethod,
	#superclass : #ORActionMove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionPullUpMethod class >> description [
	^'pull up method'
]

{ #category : #'as yet unclassified' }
ORActionPullUpMethod class >> needs: anElement [
	^anElement parentType superInheritances collect:[:each | each superclass].
]

{ #category : #'as yet unclassified' }
ORActionPullUpMethod class >> scope [
	<ORActionFor: #ORMethod>
	^self
]

{ #category : #'method execution' }
ORActionPullUpMethod >> run [
	| asAction |
	super run.
	
	asAction := ORActionMoveMethod new
					parentAction: self ;
					orionModel: self orionModel;
					entity: self entity;
					newContainer:self newContainer.
	^asAction run.
		


]
