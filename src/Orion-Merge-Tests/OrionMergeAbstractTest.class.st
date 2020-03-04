Class {
	#name : #OrionMergeAbstractTest,
	#superclass : #TestCase,
	#traits : 'TMooseSmalltalkModelImporterForTests',
	#classTraits : 'TMooseSmalltalkModelImporterForTests classTrait',
	#instVars : [
		'modelMerger',
		'model2',
		'model1',
		'diff'
	],
	#category : 'Orion-Merge-Tests'
}

{ #category : #accessing }
OrionMergeAbstractTest >> baseModel [
	^ self model1
]

{ #category : #accessing }
OrionMergeAbstractTest >> diff [
	diff ifNil: [ diff := self modelMerger run result ].
	^ diff
]

{ #category : #accessing }
OrionMergeAbstractTest >> model1 [
	^ model1
]

{ #category : #accessing }
OrionMergeAbstractTest >> model1: aModel [
	model1 := aModel
]

{ #category : #accessing }
OrionMergeAbstractTest >> model2 [
	^ model2
]

{ #category : #accessing }
OrionMergeAbstractTest >> model2: aModel [
	model2 := aModel
]

{ #category : #accessing }
OrionMergeAbstractTest >> modelMerger [
	^ modelMerger
]

{ #category : #accessing }
OrionMergeAbstractTest >> modelMerger: anObject [
	modelMerger := anObject
]

{ #category : #accessing }
OrionMergeAbstractTest >> mooseModelMerge [
	^ self modelMerger diffTransformers first
]

{ #category : #accessing }
OrionMergeAbstractTest >> targetModel [
	^ self model2
]

{ #category : #running }
OrionMergeAbstractTest >> tearDown [
	(ORSystem root notEmpty and: [ modelMerger isNotNil ])
		ifTrue: [ "ORSystem remove: modelMerger orionVersionedModel."
			(ORSystem root last orionModels first = modelMerger targetModel
				and: [ ORSystem root last orionModels last = modelMerger orionVersionedModel ])
				ifTrue: [ ORSystem root remove: ORSystem root last ifAbsent: [  ] ] ]
]
