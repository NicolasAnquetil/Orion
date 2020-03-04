visiting
visitRenameChange: aRenameChange 
	famixAddVisitor currentEntity: aRenameChange.
	aRenameChange entity accept: famixAddVisitor