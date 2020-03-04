run
createVersion
	"create the new version of the OrionModel by successively calling all message creating ORActions"

	orionVersionedModel := self baseModel createNewChildVersion.
	self createAddScopingEntity.
	self createAddType.
	self createAddMethod.
	self createRename.
	self createAddAnnotationType.
	self createAddAnnotationInstance.
	self createAddInheritance.
	self createAddAccess.
	self createAddInvocation.
	self createAddAttribute.
	self createAddReference.
	self createMoveClass.
	self createMoveMethod.
	self createRemove