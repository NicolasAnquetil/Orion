Extension { #name : #ORActionRemoveBehaviouralEntity }

{ #category : #'*OrionFamixJava' }
ORActionRemoveBehaviouralEntity >> runOnJavaExtension: anEntity [
	<toRun>
	<generated: true>
	entity definedAnnotationTypes do: [ :e | e deleteInAction: self ].

]
