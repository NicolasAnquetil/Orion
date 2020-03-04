Class {
	#name : #OrionMergeWithVisitor,
	#superclass : #FamixDiffAbstractPostOperator,
	#instVars : [
		'orionVersionedModel',
		'actions',
		'visitor'
	],
	#category : 'Orion-Merge'
}

{ #category : #accessing }
OrionMergeWithVisitor >> orionVersionedModel [
	^ orionVersionedModel
]

{ #category : #accessing }
OrionMergeWithVisitor >> orionVersionedModel: anObject [
	orionVersionedModel := anObject
]

{ #category : #accessing }
OrionMergeWithVisitor >> run [
	"create the new version of the OrionModel by successively calling all message creating ORActions"

	"self result should be sorted propertly in order to have the model rightly generated.."

	orionVersionedModel := self baseModel createNewChildVersion.
	visitor := OrionMergeFamixChangeVisitor new.
	visitor orionVersionedModel: orionVersionedModel.
	self result do: [ :aResult | aResult accept: visitor ]
]
