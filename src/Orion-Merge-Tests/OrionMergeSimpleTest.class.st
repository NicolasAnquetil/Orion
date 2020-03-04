"
NB: tests discarded should be corrected and reinserted
"
Class {
	#name : #OrionMergeSimpleTest,
	#superclass : #OrionMergeAbstractTest,
	#traits : 'TOrionMergeTest - {#testCreateAddType. #testCreateAddScopingEntity. #testCreateAddReference. #testCreateMoveClass. #testCreateMoveExtendedMethod. #testCreateRemove. #testCreateRename. #testCreateRenameMethod. #testCreateRenamePackage. #testSetOfAddMethodChanges. #testSetOfRenamePackageChanges. #testSetOfRenameMethodChanges. #testSetOfRenameAttributeChanges. #testSetOfMoveClassChanges. #testSetOfMoveMethodChanges}',
	#classTraits : 'TOrionMergeTest classTrait',
	#category : 'Orion-Merge-Tests'
}

{ #category : #running }
OrionMergeSimpleTest >> setUp [
	self skip.
	model1 := self
		importModelNamed: 'base'
		fromPackages:
			#(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3').
	model1 := model1 convertToOrion.
	model1 install.	"required by convertToOrion, otherwise useless"
	model2 := self
		importModelNamed: 'target'
		fromPackages:
			#(#'Moose-TestResources-ModelDiff-P4' #'Moose-TestResources-ModelDiff-P3').
	modelMerger := FXDiff
		baseModel: model1
		targetModel: model2
		diffTransformers: {OrionMerge}
]

{ #category : #'tests-create' }
OrionMergeSimpleTest >> testAddAllFromStModel [

	self model1: MooseModel new.
	self model1 name: 'baseEmpty'.
	modelMerger := FXDiff baseModel: self model1 convertToOrion targetModel: self model2 diffTransformers: {OrionMerge}.
	modelMerger run.
	self assert: modelMerger baseModel system orionModels size equals: 2
]
