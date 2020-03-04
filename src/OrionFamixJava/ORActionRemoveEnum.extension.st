Extension { #name : #ORActionRemoveEnum }

{ #category : #'*OrionFamixJava' }
ORActionRemoveEnum >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
