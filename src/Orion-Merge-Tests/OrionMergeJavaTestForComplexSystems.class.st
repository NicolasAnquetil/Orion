"
ie for systems where sorting of the elements is mandatory: innerclasses, etc...


NB: tests discarded should be corrected and reinserted
"
Class {
	#name : #OrionMergeJavaTestForComplexSystems,
	#superclass : #OrionMergeJavaTest,
	#traits : 'TOrionMergeJavaTest - {#testAddInheritance. #testAddReference2. #testAddReferenceFromMethOfInnerClass. #testAddReferenceToStubClass. #testAddStubClass. #testAddStubClassInNonExistingStubNS. #testAddStubClassInExistingStubNS. #testCreateAddNamespace. #testCreateAddNamespace. #testCreateMoveNamespace}',
	#classTraits : 'TOrionMergeJavaTest classTrait',
	#category : 'Orion-Merge-Tests'
}

{ #category : #initialization }
OrionMergeJavaTestForComplexSystems >> setUp [
	| model1 model2 |
	model1 := MooseModel new.
	model1 importFromMSEStream: self wholeMSE readStream.
	model1 name: 'base01'.
	model2 := MooseModel new.
	model2 importFromMSEStream: self wholeMSE readStream.
	model2 name: 'base02'.
	modelMerger := FXDiff
		baseModel: model1 convertToOrion
		targetModel: model2
		diffTransformers:
			{FamixDiffChangesSorter.
			OrionMergeWithVisitor}
]
