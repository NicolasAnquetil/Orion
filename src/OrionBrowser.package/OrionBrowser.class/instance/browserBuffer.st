gui
browserBuffer

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
