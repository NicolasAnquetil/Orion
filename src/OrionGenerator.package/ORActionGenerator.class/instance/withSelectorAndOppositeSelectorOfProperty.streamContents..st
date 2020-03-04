helper
withSelectorAndOppositeSelectorOfProperty: property streamContents: aBlock
	| selector oppositeSelector |
	selector := property implementingSelector.
	oppositeSelector := property opposite implementingSelector.
	^ String streamContents: [ :stream | aBlock value: selector value: oppositeSelector value: stream ]