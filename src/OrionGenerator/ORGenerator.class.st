"
An ORGenerator is tool to easily create the ORXXX classes and associated traits.

You can use it by providing a collection of OREntities: 
	ORGenerator new  
	makeORForAllClasses: { MyOREntityClass1 . MyOREntityClass2 }

Instance Variables

"
Class {
	#name : #ORGenerator,
	#superclass : #ORAbstractGenerator,
	#category : 'OrionGenerator'
}

{ #category : #running }
ORGenerator class >> makeORForClasses: aCollectionOfClasses [
	^ self new makeORForAllClasses: aCollectionOfClasses
]

{ #category : #running }
ORGenerator class >> runOnOrionExistingClasses [
	^ self
		makeORForClasses:
			(((RPackage organizer packageNamed: 'OrionFamixCore')
				classesForClassTag: 'Class') collect: #superclass)
]

{ #category : #running }
ORGenerator class >> runOnOrionExistingJavaClasses [
	^ self
		makeORForClasses:
			(((RPackage organizer packageNamed: 'OrionFamixJava')
				classesForClassTag: 'Class') collect: #superclass)
]

{ #category : #running }
ORGenerator class >> runOnOrionExistingSourceAnchorClasses [
	^ self
		makeORForClasses: (RPackage organizer packageNamed: 'Famix-SourceAnchor') definedClasses
]

{ #category : #running }
ORGenerator class >> runOnOrionSQLClasses [
	^ self
		makeORForClasses:
			(((RPackage organizer packageNamed: 'Famix-SQL')
				classes select: [ :c | #(#'Famix-SQL-Core' #'Famix-SQL' #'Famix-SQL-Associations') includes: c category ] ) )
]

{ #category : #'creating method' }
ORGenerator >> addAccessorFrom: aFamixClass toTrait: aOrionTrait [
	"add accessors corresponding to the non inherited properties and relations of the Famix Class to the Orion trait "
	(self getPropertiesOf: aFamixClass)
		, (self getExtendedPropertiesOf: aFamixClass)
		do: [ :prop | 
			| extensionCat cat |
			prop compiledMethod isExtension
				ifTrue: [ extensionCat := 'Orion'
						, ('' join: (prop compiledMethod category substrings: '-*')).
					(aOrionTrait category beginsWith: extensionCat)
						ifTrue: [ cat := 'accessing' ]
						ifFalse: [ cat := '*' , extensionCat ] ]
				ifFalse: [ cat := 'accessing' ].
			aOrionTrait compileSilently: (self codeForSelector: prop) classified: cat.
			aOrionTrait compileSilently: (self codeForORSelector: prop) classified: cat ]
]

{ #category : #'creating method' }
ORGenerator >> addExtendedPrivateAccessorsOf: aProp to: aFamixClass [
	"add private accessors corresponding to the property to the Famix Class if it does not already exist and which are as method extension"

	| aMethName cat |
	aMethName := 'private' , aProp name capitalized.
	"(aFamixClass methodDict includesKey: aMethName asSymbol)
		ifFalse: [ "
	cat := '*' , 'Orion' , ('' join: (aProp compiledMethod category substrings: '-*')).
	aFamixClass compileSilently: (self codeForPrivateExtendedGetter: aProp) classified: cat.
	aFamixClass compileSilently: (self codeForPrivateExtendedSetter: aProp) classified: cat	"]"
]

{ #category : #'creating method' }
ORGenerator >> addPrivateAccessorTo: aFamixClass [
	"add private accessors corresponding to the non heritated properties and relations of the Famix Class to it "

	(self getPropertiesOf: aFamixClass)
		do: [ :prop | self addThePrivateAccessorOf: prop to: aFamixClass ].
	(self getExtendedPropertiesOf: aFamixClass)
		do: [ :prop | self addExtendedPrivateAccessorsOf: prop to: aFamixClass ]
]

{ #category : #'creating method' }
ORGenerator >> addThePrivateAccessorOf: aProp to: aFamixClass [
	"add private accessors corresponding to the property to the Famix Class if it does not already exist "

	| aMethName |
	aMethName := 'private' , aProp name capitalized.
	(aFamixClass methodDict includesKey: aMethName asSymbol)
		ifFalse: [ 
			aFamixClass compileSilently: (self codeForPrivateGetter: aProp) classified: '*' , (self createClassCategoryName: aFamixClass).
			aFamixClass compileSilently: (self codeForPrivateSetter: aProp) classified: '*' , (self createClassCategoryName: aFamixClass) ]
]

{ #category : #'creating method' }
ORGenerator >> codeForORSelector: aProperty [
	^ '<1s>OR: aVersion<r><t>^ self private<2s> versionIn: aVersion' expandMacrosWith: aProperty name with: aProperty name capitalized
]

{ #category : #'creating method' }
ORGenerator >> codeForPrivateExtendedGetter: aProperty [
	| defaultValue |
	defaultValue := aProperty isMultivalued
		ifTrue: [ aProperty opposite isMultivalued
				ifTrue: [ "multimulti"
					'FMMultiMultivalueLink on: self opposite: #'
						, aProperty opposite implementingSelector asString ]
				ifFalse: [ "multi1"
					'FMMultivalueLink on: self opposite: #'
						, aProperty opposite implementingSelector asMutator asString ] ]
		ifFalse: [ 'nil' ].
	^ String
		streamContents: [ :stream | 
			stream << 'private'; << aProperty name capitalized; cr.
			stream tab; << '	^ self privateState attributeAt: #'; << aProperty name; << ' ifAbsentPut: [ '; 
					<< defaultValue; << ' ]' ]
]

{ #category : #'creating method' }
ORGenerator >> codeForPrivateExtendedSetter: aProperty [
	^ String
		streamContents: [ :stream | 
			stream << 'private' << aProperty name capitalized asMutator << ' aValue' .
			stream cr tab << 'self privateState attributeAt: #' << aProperty name << ' put: aValue' ]
]

{ #category : #'creating method' }
ORGenerator >> codeForPrivateGetter: aProperty [
	^ String
		streamContents: [ :stream | 
			stream << 'private' << aProperty name capitalized .
			stream cr tab << '^ ' << aProperty name ]
]

{ #category : #'creating method' }
ORGenerator >> codeForPrivateSetter: aProperty [
	| type |
	type := aProperty type name asString capitalized.
	^ String
		streamContents: [ :stream | 
			stream << 'private' << aProperty name capitalized << ': a' << type.
			stream cr tab << aProperty name << ' := a' << type ]
]

{ #category : #'creating method' }
ORGenerator >> codeForSelector: aProperty [
	^ String
		streamContents: [ :stream | 
			stream << aProperty name .
			stream cr tab << '^ self ' << aProperty name << 'OR: self currentContext' ]
]

{ #category : #'creating class and trait' }
ORGenerator >> createClassName: aFamixClass [
	"Create the name of the Orion Class from the FamixClass"

	^ ('OR'
		,
			(aFamixClass mooseDescription package name = 'FAMIX'
				ifTrue: [ aFamixClass mooseDescription name ]
				ifFalse: [ (aFamixClass mooseDescription name beginsWith: aFamixClass mooseDescription package name)
						ifTrue: [ aFamixClass mooseDescription name ]
						ifFalse: [ aFamixClass mooseDescription package name , aFamixClass mooseDescription name ] ]))
		asSymbol
]

{ #category : #'creating class and trait' }
ORGenerator >> createClassName: aFamixClass inPackage: aString [
	"Create the name of the Orion Class from the FamixClass"

	^ ('OR'
		,
			(aFamixClass mooseDescription package name = aString
				ifTrue: [ aFamixClass mooseDescription name ]
				ifFalse: [ aFamixClass mooseDescription implementingClass name ])) asSymbol
]

{ #category : #'creating class and trait' }
ORGenerator >> createCommentToAClass: anORClass [
	anORClass
		classComment:
			(String
				streamContents: [ :aStream | aStream << 'A ' << anORClass name << ' is a generated class useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class.' ])
]

{ #category : #'creating class and trait' }
ORGenerator >> createCommentToATrait: anORTrait [
	anORTrait
		comment:
			(String
				streamContents: [ :aStream | 
					aStream << 'A ' << anORTrait name
						<<
							' is a generated trait useful to Orion. All the methods are also generated from the instance variables of the corresponding famix class. The use links between the Orion traits follow the hierarchy of the Famix classes. ' ])
]

{ #category : #'creating class and trait' }
ORGenerator >> createTraitCategoryName: aFamixClass [
	^ String
		streamContents: [ :stream |  
			stream << 'Orion'.
			($- split: aFamixClass category) asStringOn: stream delimiter: ''.
			stream << '-Trait' ]
]

{ #category : #'creating class and trait' }
ORGenerator >> createTraitName: aFamixClass [
	"Create the name of the Orion Class from the FamixClass"

	^ ('T' , aFamixClass name) asSymbol
]

{ #category : #'creating class and trait' }
ORGenerator >> ensureInheritFromMooseEntity: aFamixClass [
	^ aFamixClass inheritsFrom: MooseEntity 
]

{ #category : #'creating class and trait' }
ORGenerator >> ensureORClass: aFamixClass [
	"Create an Orion Class corresponding to the FamixClass and inheriting from it"

	| name |
	name := self createClassName: aFamixClass .
	
	^Smalltalk globals at: name ifAbsent: [
		aFamixClass  subclass: name
		uses: (self ensureORTrait: aFamixClass)
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: (self createClassCategoryName: aFamixClass)]
]

{ #category : #'creating class and trait' }
ORGenerator >> ensureORClass: aFamixClass fromPackage: aString [
	"Create an Orion Class corresponding to the FamixClass and inheriting from it"

	| name |
	name := self createClassName: aFamixClass inPackage: aString.
	
	^Smalltalk globals at: name ifAbsent: [
		aFamixClass  subclass: name
		uses: (self ensureORTrait: aFamixClass)
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: (self createClassCategoryName: aFamixClass)]
]

{ #category : #'creating class and trait' }
ORGenerator >> ensureORTrait: aFamixClass [
	"Create a trait corresponding to the FamixClass "

	^ (self ensureInheritFromMooseEntity: aFamixClass)
		ifTrue: [ | name |
			name := self createTraitName: aFamixClass.
			Smalltalk globals
				at: name
				ifPresent: [ :trait | trait ]
				ifAbsent: [ | aTrait |
					aTrait := Trait
						named: name
						uses: (self ensureORTrait: aFamixClass superclass)
						category: (self createTraitCategoryName: aFamixClass).
					self createCommentToATrait: aTrait.
					aTrait ] ]
		ifFalse: [ TMooseEntity ]
]

{ #category : #initialization }
ORGenerator >> initialize [
	super initialize .
	MooseModel resetMeta
]

{ #category : #generator }
ORGenerator >> makeOR: aFamixClass [
	"Create the ORClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	| anORClass |
	self addAccessorFrom: aFamixClass toTrait: (self ensureORTrait: aFamixClass).
	anORClass := self ensureORClass: aFamixClass.
	self createCommentToAClass: anORClass. 
	self addPrivateAccessorTo: aFamixClass
]

{ #category : #generator }
ORGenerator >> makeOR: aFamixClass fromPackage: aString [
	"Create the ORClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	| anORClass |
	self addAccessorFrom: aFamixClass toTrait: (self ensureORTrait: aFamixClass).
	anORClass := self ensureORClass: aFamixClass fromPackage: aString.
	self createCommentToAClass: anORClass. 
	self addPrivateAccessorTo: aFamixClass
]

{ #category : #generator }
ORGenerator >> makeORForAllClasses: aColl [
	"For all the class of the collection, Create the ORClass corresponding to the FamixClass, add accessors to the trait and accessors to the FamixClass"
	
	aColl select: [ :aClass | aClass inheritsFrom: FAMIXEntity ] thenDo: [ :c | self makeOR: c ]
]

{ #category : #accessing }
ORGenerator >> typeOfGeneratedObject [
	^ 'Class'
]
