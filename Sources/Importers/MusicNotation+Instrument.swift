//
//	MusicNotation+Instrument.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-17.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import MusicNotation

extension MusicNotation.Instrument {
	init(with: Part.Instrument) throws {
		self.init(chromaticTransposition: 1, diatonicTransposition: 1)
	}
}
