Extension { #name : #ORActionRename }

{ #category : #'*OrionGenerator' }
ORActionRename classSide >> generateRequiredMethodsFor: aClass generator: anORActionGenerator [ 
	^ anORActionGenerator generateRequiredMethods: self forARenamedEntity: aClass
]
