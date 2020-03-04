Extension { #name : #ORActionRemoveAnnotationType }

{ #category : #'*OrionFamixJava' }
ORActionRemoveAnnotationType >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
