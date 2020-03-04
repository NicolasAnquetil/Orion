Extension { #name : #ORActionRemoveType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveType >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
