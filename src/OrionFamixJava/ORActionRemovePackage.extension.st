Extension { #name : #ORActionRemovePackage }

{ #category : #'*OrionFamixJava' }
ORActionRemovePackage >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
