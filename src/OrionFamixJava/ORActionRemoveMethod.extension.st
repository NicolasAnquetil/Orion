Extension { #name : #ORActionRemoveMethod }

{ #category : #'*OrionFamixJava' }
ORActionRemoveMethod >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
