Extension { #name : #MooseEntity }

{ #category : #'*OrionGenerator' }
MooseEntity class >> isRootEntity [
	^ {FAMIXEntity.
	OREntity} includes: self
]
