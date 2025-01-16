//
//	MusicNotation+Meaure.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-01-14.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import MusicNotation

extension MusicNotation.Measure {
	static func generate(
		with interchangeFormat: MuseScoreInterchangeFormat,
		for staff: Part.Staff
	) throws -> [MusicNotation.Measure] {
		let staff = try interchangeFormat.score.staff(for: staff.id)
		return staff.measures.map { _ in 
			MusicNotation.Measure(
				timeSignature: MusicNotation.TimeSignature(numerator: 4, denominator: 4, tempo: 120)
			)
		}
	}
}
