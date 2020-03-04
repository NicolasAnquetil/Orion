creating method
codeForORSelector: aProperty
	^ '<1s>OR: aVersion<r><t>^ self private<2s> versionIn: aVersion' expandMacrosWith: aProperty name with: aProperty name capitalized