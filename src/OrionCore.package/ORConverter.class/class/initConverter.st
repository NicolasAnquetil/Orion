initialize-release
initConverter

		association := SmallDictionary new.
		association at: FAMIXClass put: ORClass.
		association at: FAMIXInvocation put: ORInvocation.
		association at: FAMIXMethod put: ORMethod.
		association at: FAMIXNamespace put: ORNamespace.
		association at: FAMIXPackage put: ORPackage.
		association at: FAMIXReference put: ORReference.
		association at: FAMIXInheritance put: ORInheritance.
		association at: FAMIXAccess put: ORAccess.
		association at: FAMIXAttribute put: ORAttribute.
		association at: FAMIXComment put: ORComment.
		association at: FAMIXFunction put: ORFunction.
		association at: FAMIXGlobalVariable put: ORGlobalVariable.
		association at: FAMIXImplicitVariable put: ORImplicitVariable.
		association at: FAMIXLocalVariable put: ORLocalVariable.
		association at: FAMIXParameter put: ORParameter.
		association at: FAMIXParameterType put: ORParameterType.
		association at: FAMIXParameterizableClass put: ORParameterizableClass.
		association at: FAMIXParameterizedType put: ORParameterizedType.
		association at: FAMIXPrimitiveType put: ORPrimitiveType.
		association at: FAMIXUnknownVariable put: ORUnknownVariable.
		association at: FAMIXAnnotationInstance put: ORAnnotationInstance.
		association at: FAMIXAnnotationInstanceAttribute put: ORAnnotationInstanceAttribute.
		association at: FAMIXAnnotationType put: ORAnnotationType.
		association at: FAMIXAnnotationTypeAttribute put: ORAnnotationTypeAttribute.
		association at: FAMIXCaughtException put: ORCaughtException.
		association at: FAMIXDeclaredException put: ORDeclaredException.
		association at: FAMIXEnumValue put: OREnumValue.
		association at: FAMIXEnum put: OREnum.
		association at: FAMIXType put: ORType.
		association at: FAMIXJavaSourceLanguage put: ORJavaSourceLanguage.
		"association at: FAMIXFile put: ORFile.
		association at: FAMIXFolder put: ORFolder."
		association at: FAMIXThrownException put: ORThrownException. 
		association at: FAMIXPharoAnchor put: ORPharoAnchor.
		association at: FAMIXFileAnchor put: ORFileAnchor .
		association at: FAMIXSourceTextAnchor put: ORSourceTextAnchor .
		association at: FAMIXIndexedFileAnchor put: ORIndexedFileAnchor .
		association at: FAMIXMultipleFileAnchor put: ORMultipleFileAnchor .
		association at: FAMIXAbstractFileAnchor put: ORAbstractFileAnchor .
		^association