"
A ConfigurationOfOrionGenerator enables to load all classes usefull to the generation of Orion classes.
"
Class {
	#name : #ConfigurationOfOrionGenerator,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : 'ConfigurationOfOrionGenerator'
}

{ #category : #private }
ConfigurationOfOrionGenerator class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #private }
ConfigurationOfOrionGenerator class >> ensureMetacello [
	Smalltalk at: #MetacelloProject ifAbsent: [
		Gofer new
				url: 'http://smalltalkhub.com/mc/dkh/metacello/main';
				package: 'ConfigurationOfMetacello';
				load.
		(Smalltalk at: #ConfigurationOfMetacello) loadLatestVersion ]
]

{ #category : #testing }
ConfigurationOfOrionGenerator class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfOrionGenerator class >> load [
	"self load"

	^self project latestVersion load
]

{ #category : #loading }
ConfigurationOfOrionGenerator class >> loadBleedingEdge [
	(self project version: #bleedingEdge) load.
]

{ #category : #loading }
ConfigurationOfOrionGenerator class >> loadDevelopment [
	(self project version: #development) load.
]

{ #category : #accessing }
ConfigurationOfOrionGenerator class >> project [

	^self new project
]

{ #category : #'as yet unclassified' }
ConfigurationOfOrionGenerator >> baseline10: spec [
	<version: '1.0-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec author: 'Anne Etien'.
			spec description: 'work on Pharo 2.0'.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Orion/main'.
			spec package: 'OrionGenerator'.
			spec package: 'OrionCore' ]
]

{ #category : #'as yet unclassified' }
ConfigurationOfOrionGenerator >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'pharo2.x' version: '1.0-baseline'.	
	spec for: #'pharo3.x' version: '1.0-baseline'.
	spec for: #'common' version: '1.0-baseline'.
]

{ #category : #'as yet unclassified' }
ConfigurationOfOrionGenerator >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project]
]
