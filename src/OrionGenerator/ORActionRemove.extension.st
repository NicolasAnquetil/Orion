Extension { #name : #ORActionRemove }

{ #category : #'*OrionGenerator' }
ORActionRemove classSide >> generateRequiredMethodsFor: aClass generator: anORActionGenerator [
	^ anORActionGenerator generateRequiredMethods: self forARemovedEntity: aClass
]
