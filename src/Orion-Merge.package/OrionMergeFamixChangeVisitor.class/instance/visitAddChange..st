visiting
visitAddChange: aFamixAddChange
	famixAddVisitor currentEntity: aFamixAddChange.
	aFamixAddChange entity accept: famixAddVisitor