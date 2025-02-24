//
//	VoiceElementsWalker.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-01-15.
//	Copyright © 2025 Steven Woolgar. All rights reserved.
//

import MusicNotation

extension Measure {
	// Walk the list of VoiceElements of a measure and generate the appropriate
	// MusicNotation elements inside a given measure. WIP
	func walker(
		with interchangeFormat: MuseScoreInterchangeFormat,
		for voiceElement: VoiceElement,
		into measure: MusicNotation.Measure
	) {
		for voiceElement in voiceElements {
			switch voiceElement {
			case .barLine(_):
				print(".barLine")
			case .chord(_):
				print(".chord")
			case .dynamic(_):
				print(".dynamic")
			case .endTuplet(_):
				print(".endTuplet")
			case .fermata(_):
				print(".fermata")
			case .keySignature(_):
				print(".keySignature")
			case .location(_):
				print(".location")
			case .measureRepeat(_):
				print(".measureRepeat")
			case .rehearsalMark(_, _):
				print(".rehearsalMark")
			case .rest(_):
				print(".rest")
			case .spanner(_):
				print(".spanner")
			case .staffText(_):
				print(".staffText")
			case .tempo(_):
				print(".tempo")
			case .timeSignature(_):
				print(".timeSignature")
			case .tuplet(_):
				print(".tuplet")
			}
		}
	}
}
