Extension { #name : #ORActionMove }

{ #category : #'*OrionGenerator' }
ORActionMove classSide >> generateRequiredMethodsFor: aClass generator: anORActionGenerator [ 
		^ anORActionGenerator generateRequiredMethods: self forAMovedEntity: aClass
]
