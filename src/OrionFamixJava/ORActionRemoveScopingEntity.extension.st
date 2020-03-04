Extension { #name : #ORActionRemoveScopingEntity }

{ #category : #'*OrionFamixJava' }
ORActionRemoveScopingEntity >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
