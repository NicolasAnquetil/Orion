Extension { #name : #SequenceableCollection }

{ #category : #'*Orion-Merge' }
SequenceableCollection >> orionRemove: anElement [
	^ self remove: anElement ifAbsent: [ self ]
]

{ #category : #'*Orion-Merge' }
SequenceableCollection >> unsafeAdd: element [
	(self includes: element) not
		ifTrue: [ self add: element ]
]
