Extension { #name : #ORActionRemoveClass }

{ #category : #'*OrionFamixJava' }
ORActionRemoveClass >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
