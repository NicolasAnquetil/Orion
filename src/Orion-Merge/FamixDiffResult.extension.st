Extension { #name : #FamixDiffResult }

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddAccessChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isAddition and: [ chg entity isAccess ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddAnnotationInstanceChanges [
	^ self select: [ :chg | chg isAddition and: [ chg entity isAnnotationInstance ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddAnnotationTypeChanges [
	^ self select: [ :chg | chg isAddition and: [ chg entity isAnnotationType ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddAttributeChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isAddition and: [ chg entity isAttribute ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddClassChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	"Only the classes that are neither inner nor anonymous classes are considered"

	^ self select: [ :chg | chg isAddition and: [ chg entity isClass and: [ chg entity isInnerClass not and: [ chg entity isAnonymousClass not ] ] ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddInheritanceChanges [
	^ self select: [ :chg | chg isAddition and: [ chg entity isInheritance ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddInvocationChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isAddition and: [ chg entity isInvocation ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddMethodChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isAddition and: [ chg entity isMethod ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddReferenceChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isAddition and: [ chg entity isReference and: [ chg entity target isClass and: [ chg entity target isInnerClass not and: [ chg entity target isAnonymousClass not ] ] ] ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfAddScopingEntityChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isAddition and: [ chg isForScopingEntity ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfMoveAttributeChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isMove and: [ chg entity isAttribute ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfMoveClassChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isMove and: [ chg entity isClass and: [ (chg entity isKindOf: FAMIXParameterizableClass) not ] ] ] 
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfMoveMethodChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isMove and: [ chg entity isMethod ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfMoveNamespaceChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isMove and: [ chg isForScopingEntity ] ] 
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveAccessChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isRemoval and: [ chg entity isAccess ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveAnnotationInstanceChanges [
	^ self select: [ :chg | chg isRemoval and: [ chg entity isAnnotationInstance ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveAnnotationTypeChanges [
	^ self select: [ :chg | chg isRemoval and: [ chg entity isAnnotationType ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveAttributeChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isRemoval and: [ chg entity isAttribute ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveChanges [
	"select the FamixChanges of the dictionnary according to their type"

	^ self select: [ :chg | chg isRemoval ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveClassChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isRemoval and: [ chg entity isClass ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveInvocationChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isRemoval and: [ chg entity isInvocation ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveMethodChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isRemoval and: [ chg entity isMethod ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemovePackageChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isRemoval and: [ chg entity isNamespace ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRemoveReferenceChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self select: [ :chg | chg isRemoval and: [ chg entity isReference ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRenameAttributeChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isRename and: [ chg entity isAttribute ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRenameChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isRename ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRenameClassChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isRename and: [ chg entity isClass ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRenameMethodChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isRename and: [ chg entity isMethod ] ]
]

{ #category : #'*Orion-Merge' }
FamixDiffResult >> setOfRenamePackageChanges [
	"select the FamixChanges of the dictionnary according to their type and the type of the entity on which they occur"

	^ self selectAsSet: [ :chg | chg isRename and: [ chg entity isPackage ] ]
]
