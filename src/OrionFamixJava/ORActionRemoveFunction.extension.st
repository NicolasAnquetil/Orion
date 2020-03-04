Extension { #name : #ORActionRemoveFunction }

{ #category : #'*OrionFamixJava' }
ORActionRemoveFunction >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
