Extension { #name : #ORActionAdd }

{ #category : #'*OrionGenerator' }
ORActionAdd classSide >> generateRequiredMethodsFor: aClass generator: anORActionGenerator [
	^ anORActionGenerator generateRequiredMethods: self forAnAddEntity: aClass
]
