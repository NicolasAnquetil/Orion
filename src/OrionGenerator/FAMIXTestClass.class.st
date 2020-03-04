Class {
	#name : #FAMIXTestClass,
	#superclass : #FAMIXEntity,
	#instVars : [
		'kind',
		'test'
	],
	#category : 'OrionGenerator-TestModel'
}

{ #category : #meta }
FAMIXTestClass class >> annotation [
	<MSEClass: #TestClass super: #MooseEntity>
	<package: #FAMIX>
	^self
]

{ #category : #testing }
FAMIXTestClass >> isSetter [
	<MSEProperty: #isSetter type: #Boolean>
	<derived>
	<MSEComment: 'for testing'>
	^ true
]

{ #category : #accessing }
FAMIXTestClass >> kind [
	<MSEProperty: #kind type: #String>
	<MSEComment: 'for testing'>
	
	^ kind
]

{ #category : #accessing }
FAMIXTestClass >> test [
	<MSEProperty: #test type: #String>
	<MSEComment: 'for testing'>
	
	^ test
]
