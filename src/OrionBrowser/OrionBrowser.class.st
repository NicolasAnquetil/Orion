"
An OrionBrowser is a browser like the MoosePanel dedicated to Orion.

Instance Variables
	actionDict:		<Object>
	browser:		<Object>
	entityInBuffer:		buffered entity
	entityInSummary:		selected entity
	selectedVersion:		version of the model


"
Class {
	#name : #OrionBrowser,
	#superclass : #Object,
	#instVars : [
		'selectedVersion',
		'actionDict',
		'browser',
		'entityInSummary',
		'entityInBuffer'
	],
	#category : 'OrionBrowser'
}

{ #category : #opening }
OrionBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Orion')
		order: 10.0; 
		parent: #Moose;
		label: 'Orion Panel';
		action:[OrionBrowser open];
		withSeparatorAfter 
]

{ #category : #opening }
OrionBrowser class >> open [ 

	self new browser openOn: ORSystem root
]

{ #category : #gui }
OrionBrowser >> browser [

	browser := GLMTabulator new.
	
	browser
		title: 'Orion Browser' ;
		column: [:c | c
				row:  #models ;
				row: #buffer size: 60 ]  span: 2 ;
		column: #packages  span: 2 ;
		column: #classes  span: 2 ;
		column: [:c | c
				row:  #attributes ;
				row:  #methods ]   span: 2 ;
		column: #links  span: 2 ;
		column: #summary span: 3.

	self
		browserModels ;
		browserBuffer ;
		browserPackages ;
		browserClasses ;
		browserAttributes ;
		browserMethods ;
		browserLinks ;
		browserSummary.
	
	browser subscribe: ORAnnouncement do: [browser update].
	browser subscribe: GLMBrowserClosing do: [self unsubscribeSelectedVersion].
	^ browser
]

{ #category : #gui }
OrionBrowser >> browserAttributes [
	(browser transmit) to: #attributes; from: #classes; andShow: [:b | | gmlList |
		gmlList := b list.
		gmlList
			display: [:anEntity | (anEntity attributes )  sorted: [:c1 :c2 | c1 name < c2 name] ];
			title: [ :each | ' Attributes'] ;
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;
		
			selectionAct:  [:list | list selection rename: (self getNameDialog:  'New attribute name') inModel: selectedVersion]  entitled: 'Rename' ;
			selectionAct: [:list | list selection deleteInModel: selectedVersion] entitled: 'Remove' ;
			selectionAct: [:list | [list selection moveTo: entityInBuffer inModel: selectedVersion] orBrowserExceptionsUIManager] entitled: 'Move to buffered class'.
	].

]

{ #category : #gui }
OrionBrowser >> browserBuffer [

	(browser transmit) to: #buffer; from: #packages port: #strongSelection; when: #notNil; andShow: [:a |
		a list
			display: [:anEntity | entityInBuffer := anEntity. {anEntity} ];
			title: 'Buffered'
	].

	(browser transmit) to: #buffer; from: #classes port: #strongSelection; when: #notNil; andShow: [:a |
		a list
			display: [:anEntity | entityInBuffer := anEntity. {anEntity} ];
			title: 'Buffered'
	].

	(browser transmit) to: #buffer; from: #methods port: #strongSelection; when: #notNil; andShow: [:a |
		a list
			display: [:anEntity | entityInBuffer := anEntity. {anEntity} ];
			title: 'Buffered'
	].

]

{ #category : #gui }
OrionBrowser >> browserClasses [
	browser transmit
		to: #classes;
		from: #packages;
		andShow: [ :b | 
					| gmlList |
					gmlList := b list.
					gmlList
						display: [ :anEntity | anEntity classes sorted: [ :c1 :c2 | c1 name < c2 name ] ];
						title: [ :each | ' Classes' ];
						selectionAct: [ :list | list selection inspect ] entitled: 'Inspect';
						selectionAct: [ :list | list selection rename: (self getNameDialog: 'New class name') inModel: selectedVersion ]
							entitled: 'Rename';
						selectionAct: [ :list | [ list selection addSuperClass: entityInBuffer inModel: selectedVersion ] orBrowserExceptionsUIManager ]
							entitled: 'Add inheritance from the buffered class';
						selectionAct: [ :list | [ list selection changeSuperClassTo: entityInBuffer inModel: selectedVersion ] orBrowserExceptionsUIManager ]
							entitled: 'Change super class for the buffered class';
						selectionAct: [ :list | list selection addAttributeNamed: (self getNameDialog: 'New attribute name') inModel: selectedVersion ]
							entitled: 'Add attribute';
						selectionAct: [ :list | list selection addMethodNamed: (self getNameDialog: 'New method name') inModel: selectedVersion ]
							entitled: 'Add method';
						selectionAct: [ :list | [list selection extractClassFromClass: 'FFF' selectedAttributes:  list selection attributes inModel: selectedVersion] orBrowserExceptionsUIManager]
							entitled: 'Extract Class';	
						selectionAct: [ :list | list selection deleteInModel: selectedVersion ] entitled: 'Remove';
						selectionAct: [ :list | [list selection moveTo: entityInBuffer inModel: selectedVersion] orBrowserExceptionsUIManager ]
							entitled: 'Move to buffered package' ]
]

{ #category : #gui }
OrionBrowser >> browserLinks [

	"{#classes . #methods . #attributes} do: [:srcPanel |"

	(browser transmit) to: #links ; from: #classes ; andShow: [:b | | gmlList |
		gmlList := b list.
		gmlList
			title: 'Links' ;
			display: [ :anObject | (((anObject incomingReferences) union: (anObject superInheritances  )) union: (anObject subInheritances) ) sorted: [:x :y | x mooseName < y mooseName]] ;
			 
			format: [:aProp | (aProp asString)];
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;

			selectionAct:  [:list | list selection deleteInModel: selectedVersion]  entitled: 'Remove the Link'.
		].
	

	
	(browser transmit) to: #links ; from: #methods ; andShow:[:b | | gmlList |
		gmlList := b list.
		gmlList
			title: 'Links' ;
			display: [ :anObject | (anObject outgoingReferences ) 
					union: ((anObject incomingInvocations) union: (anObject outgoingInvocations  )) ] ;
			sorted: [:x :y | x mooseName < y mooseName] ;
			format: [:aProp | (aProp asString)];
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;
			
			selectionAct:  [:list | list selection deleteInModel: selectedVersion]  entitled: 'Remove the Link'.
		].

]

{ #category : #gui }
OrionBrowser >> browserMethods [
	(browser transmit) to: #methods; from: #classes; andShow: [:b | | gmlList |
		gmlList := b list.
		gmlList
			display: [:anEntity | (anEntity methods)  sorted: [:c1 :c2 | c1 name < c2 name] ];
			title: [ :each | 'Methods'] ;
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;

			selectionAct:  [:list | list selection rename: (self getNameDialog:  'New method name') inModel: selectedVersion]  entitled: 'Rename' ;
			 selectionAct: [:list | list selection deleteInModel: selectedVersion] entitled: 'Remove' ;
			selectionAct: [:list | [list selection moveTo: entityInBuffer inModel: selectedVersion] orBrowserExceptionsUIManager] entitled: 'Move to the buffered class' ;
			selectionAct: [:list | [list selection addReferenceTo: entityInBuffer inModel: selectedVersion] orBrowserExceptionsUIManager] entitled: 'Add reference to the buffered class' ;
			selectionAct: [:list | [list selection addInvocationTo: entityInBuffer asOrderedCollection inModel: selectedVersion] orBrowserExceptionsUIManager] entitled: 'Add invocation to the buffered method'.
	].

]

{ #category : #gui }
OrionBrowser >> browserModels [

	(browser transmit) to: #models; andShow: [:b | | gmlTree |
		gmlTree := b tree.
		gmlTree
			allExpanded;
			display: [:systems | systems flatCollect: [:aSystem | aSystem orionModels select:[:versions | versions parentModel isNil]]];
			format:[:aVersion | aVersion name];
			children: [:aVersion | aVersion childrenModel] ;

			selectionAct: [:list | list selection inspect] entitled:  'Inspect';

			selectionAct: [:theList | 
						theList selection createNewChildVersion.
						browser announce: ORAnnouncement]
				entitled: 'Create a child version' ;

			selectionAct: [:theList | 
						theList selection delete.
						browser announce: ORAnnouncement]
				entitled: 'Delete version'  ;

			selectionAct: [:list | list selection addPackageNamed: (self getNameDialog:  'New package name')] entitled: 'Add a package'.	

		self	versionChangesPane: gmlTree.
	].

]

{ #category : #gui }
OrionBrowser >> browserPackages [

	(browser transmit) to: #packages ; from:#models; andShow: [:b | | gmlList |
		gmlList := b list.
		gmlList
			display: [:model |
				self selectedVersion: model.
				((model allWithType: ORPackage) union: (model allWithType: ORNamespace)) sorted: [:c1 :c2 | c1 name < c2 name] ] ;
			title: [ :each | ' Packages'] ;
			selectionAct: [:list | list selection inspect] entitled:  'Inspect' ;
			selectionAct:  [:list | list selection rename: (self getNameDialog:  'New package name') inModel: selectedVersion]  entitled: 'Rename' ;
			selectionAct: [:list |  list selection addClassNamed: (self getNameDialog:  'New class name') inModel: selectedVersion]  entitled: 'Add a class' ;
			selectionAct: [:list | list selection deleteInModel: selectedVersion] entitled: 'Remove' ;
			selectionAct: [:list | list selection mergePackage: entityInBuffer inModel: selectedVersion] entitled: 'Merge with buffered package' .		
	].

]

{ #category : #gui }
OrionBrowser >> browserSummary [

	{#models . #packages .  #classes . #methods} do: [:srcPanel |

	(browser transmit) to: #summary ; from: srcPanel ; andShow: [:b |
		b  list
			noSelection ;
			title: 'Properties' ;
			display: [ :anObject | entityInSummary := anObject. anObject mooseInterestingEntity mooseDescription allPrimitiveAttributes ] ;
			sorted: [:x :y | x name < y name] ;
			format: [:aProp | aProp name ,  '= ' ,  ([(entityInSummary mooseInterestingEntity mmGetProperty: aProp) asString] on: Error do: ['error']) ]  ;
			when: [ :anObject | 
				(anObject mooseInterestingEntity isKindOf: MooseEntity) and: [
					anObject mooseInterestingEntity mooseDescription allPrimitiveAttributes notEmpty ]]]
		].

]

{ #category : #gui }
OrionBrowser >> displayFor: anObject [
	| entity pragmaValueAssociations |
	entity := anObject mooseInterestingEntity.
	pragmaValueAssociations := entity complexPropertyPragmas collect: [ :pragma | 
		pragma -> (anObject mooseInterestingEntity perform: pragma selector) mooseInterestingEntity ].
	^ (pragmaValueAssociations
		reject: [ :association | 
			association value isNil or: [ 
				association value isCollection and: [ 
					association value isEmpty ] ] ])
		sorted: [:a :b | 
			(a key argumentAt: 1) asLowercase asString < (b key argumentAt: 1) asLowercase asString ]
]

{ #category : #gui }
OrionBrowser >> formatFor: each [
	^ (' ' join: ((each key argumentAt: 1) piecesCutWhereCamelCase collect: #capitalized)) , ' - ' , (each value mooseDisplayString contractTo: 50)
]

{ #category : #gui }
OrionBrowser >> getNameDialog: aString [
	
	| wizardControl  wizardPane textFieldPart defaultText |

	defaultText :=  '--Enter name--'.
	
	wizardControl := WizardControl new.
	wizardControl renderer: MerlinMorphicWizardRenderer new.
	
	wizardPane := WizardSinglePane new.
	
	textFieldPart := TextFieldPart  new
									inGroupboxNamed: aString;
									defaultValue: defaultText ;
									yourself.
	
	wizardPane row: textFieldPart associatedTo: #textFieldValue.
		
	wizardControl 
		addPane: wizardPane.
		
	wizardControl open. 
	((wizardControl wizardInformations at: #textFieldValue) = defaultText)
		ifTrue: [^ nil]
		ifFalse: [^ wizardControl wizardInformations at: #textFieldValue]
]

{ #category : #accessing }
OrionBrowser >> selectedVersion [
	^ selectedVersion
]

{ #category : #accessing }
OrionBrowser >> selectedVersion: anObject [
	self unsubscribeSelectedVersion.
	selectedVersion := anObject.
	self selectedVersion system announcer subscribe: ORAnnouncement send: #update to: browser
]

{ #category : #accessing }
OrionBrowser >> unsubscribeSelectedVersion [
	self selectedVersion ifNotNil: [ self selectedVersion system announcer unsubscribe: browser ].

]

{ #category : #gui }
OrionBrowser >> versionChangesPane: gmlTree [

		gmlTree
			selectionSpawn: [:theList |
				|tmpBrowser| 
				tmpBrowser := GLMTabulator new row: #one; "initialExtent: 100@100 ;" yourself.
				tmpBrowser
					transmit to: #one ; andShow: [:brows | 
						brows tree
							display: [:aVersion | aVersion changes select: [:chg | chg parentAction isNil]] ;
							children: [:aChange | aChange childrenActions];
							format:[:aChange | aChange printWorkspace];
							title: [ :aVersion | ' Changes in ' , (aVersion name)] ].
				tmpBrowser startOn: theList selection
				] entitled: 'List changes' .
]
