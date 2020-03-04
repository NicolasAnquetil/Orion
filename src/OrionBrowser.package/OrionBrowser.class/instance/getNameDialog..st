gui
getNameDialog: aString
	
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