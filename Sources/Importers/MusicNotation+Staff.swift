//
//	MusicNotation+Staff.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-01-14.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import MusicNotation

extension MusicNotation.Staff {
	// Given the overall data for a parsed MuseScore file format, as well as the parsed
	// `part` we want the staves for, return a MusicNotation Staff populated with the parsed data.
	static func generate(
		with interchangeFormat: MuseScoreInterchangeFormat,
		for part: Part
	) throws -> [MusicNotation.Staff] {
		let staves = try part.staves.map { staff in
			let measures = try MusicNotation.Measure.generate(with: interchangeFormat, for: staff)
			return MusicNotation.Staff(
				instrument: MusicNotation.Instrument(),
				measure: measures
			)
		}

		return staves
	}
}
