visiting
visitRemovalChange: aFamixAddChange
	famixAddVisitor currentEntity: aFamixAddChange.
	aFamixAddChange entity accept: famixAddVisitor