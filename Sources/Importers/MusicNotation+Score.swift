//
//	MusicNotation+Score.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-08.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import Foundation
import MusicNotation

extension MusicNotation.Score {
	init(with interchangeFormat: MuseScoreInterchangeFormat) {
		let parts = MusicNotation.Part.generateParts(with: interchangeFormat)
		self.init(
			parts: parts,
			title: interchangeFormat.score.title(),
			subtitle: interchangeFormat.score.subtitle(),
			artist: interchangeFormat.score.composer(),
			album: "Unknown Album",
			words: interchangeFormat.score.lyricist(),
			wordsAndMusic: "\(interchangeFormat.score.composer()), \(interchangeFormat.score.lyricist())",
			transcriber: "Unknown transcriber",
			instructions: "",
			notices: interchangeFormat.score.copyright()
		)
	}
}
