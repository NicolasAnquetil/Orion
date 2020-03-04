"
These tests should apply on only 2 orion models. They are skipped for now.


For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #OrionMergeOnlyOrionModelsTest,
	#superclass : #OrionMergeTest,
	#traits : 'TOrionMergeTest - {#testSetOfRenamePackageChanges. #testSetOfRenameMethodChanges. #testCreateRename. #testCreateRenamePackage. #testCreateRenameMethod}',
	#classTraits : 'TOrionMergeTest classTrait',
	#category : 'Orion-Merge-Tests'
}

{ #category : #running }
OrionMergeOnlyOrionModelsTest >> setUp [
	super setUp.
	model2 := model2 convertToOrion.
	self modelMerger: (FXDiff baseModel: model1 targetModel: model2 diffTransformers: {OrionMergeWithVisitor})
]
