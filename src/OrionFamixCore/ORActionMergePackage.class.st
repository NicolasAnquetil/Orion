"
A ORActionMergePackage is a generated class useful to Orion. It corresponds to an action that can be performed on a type of model element 
"
Class {
	#name : #ORActionMergePackage,
	#superclass : #ORActionMove,
	#category : 'OrionFamixCore-Action'
}

{ #category : #'as yet unclassified' }
ORActionMergePackage class >> description [
	^'merge package with'
]

{ #category : #'as yet unclassified' }
ORActionMergePackage class >> scope [
	<ORActionFor: #ORPackage>
	^self
]

{ #category : #'method execution' }
ORActionMergePackage >> run [
	| thePackage theNewPackage |
	super run.
	thePackage := self orionModel retrieveEntity: entity.
	theNewPackage := self orionModel retrieveEntity: newContainer.
	theNewPackage name: theNewPackage name , thePackage name.
	thePackage allClasses
		do: [ :aClass | 
			| asAction |
			asAction := ORActionMoveClass new
				parentAction: self;
				orionModel: self orionModel;
				entity: aClass;
				newContainer: theNewPackage.
			asAction run ].
	thePackage extensionMethods
		do: [ :aMethod | 
			| asAction |
			asAction := ORActionExtendMethod new
				parentAction: self;
				orionModel: self orionModel;
				entity: aMethod.
			aMethod parentType parentPackage = theNewPackage
				ifFalse: [ asAction newContainer: theNewPackage ].
			asAction run ].
	self orionModel remove: thePackage
]
