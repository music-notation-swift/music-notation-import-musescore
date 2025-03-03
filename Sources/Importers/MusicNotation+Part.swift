//
//	MusicNotation+Part.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2025-01-02.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import MusicNotation

extension MusicNotation.Part {
	static func generate(with interchangeFormat: MuseScoreInterchangeFormat) throws -> [MusicNotation.Part] {
		let parts = try interchangeFormat.score.parts.map { part in
			let staves = try MusicNotation.Staff.generate(with: interchangeFormat, for: part)
			let instrument = try MusicNotation.Instrument(with: part.instrument)
			return MusicNotation.Part(instrument: instrument, staves: staves)
		}

		return parts
	}
}
