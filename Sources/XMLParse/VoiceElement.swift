//
//	VoiceElement.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-11.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

// These appears in the <voice> (see MeasureVoice) tag.
public enum VoiceElement: XMLObjectDeserialization {
	static let nodeKey = "voice"

	case barLine(Int)
	case chord(Chord?)
	case dynamic(Dynamic)
	case endTuplet(Bool?)
	case fermata(Fermata)
	case keySignature(KeySignature)
	case location(Location)
	case measureRepeat(MeasureRepeat)
	case rehearsalMark(Int, String)
	case rest(Rest)
	case spanner(Spanner)
	case staffText(StaffText)
	case tempo(Tempo)
	case timeSignature(TimeSignature)
	case tuplet(Tuplet)

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		guard let element = node.element else { throw VoiceElementError.elementParseError }
		switch element.name {
		case "BarLine":
			return .barLine(try node["eid"].value())
		case Chord.nodeKey:
			return .chord(try node.value())
		case Dynamic.nodeKey:
			return .dynamic(try node.value())
		case "endTuplet":
			return .endTuplet(try node.value(found: true, notFound: false))
		case Fermata.nodeKey:
			return .fermata(try node.value())
		case KeySignature.nodeKey:
			return .keySignature(try node.value())
		case Location.nodeKey:
			return .location(try node.value())
		case MeasureRepeat.nodeKey:
			return .measureRepeat(try node.value())
		case "RehearsalMark":
			return .rehearsalMark(try node["eid"].value(), try node["text"].value())
		case Rest.nodeKey:
			return .rest(try node.value())
		case Spanner.nodeKey:
			return .spanner(try node.value())
		case StaffText.nodeKey:
			return .staffText(try node.value())
		case Tempo.nodeKey:
			return .tempo(try node.value())
		case TimeSignature.nodeKey:
			return .timeSignature(try node.value())
		case Tuplet.nodeKey:
			return .tuplet(try node.value())
		default:
			throw VoiceElementError.unknownVoiceElementError
		}
	}
}

// Case Equality. In this case it means the enums are equal, but the associated values are ignored
extension VoiceElement: NearEquatable {
	public func isNearEqual(to: VoiceElement) -> Bool {
		switch (self, to) {
		case (.barLine(_), .barLine(_)):
			return true
		case (.chord(_), .chord(_)):
			return true
		case (.dynamic(_), .dynamic(_)):
			return true
		case (.endTuplet(_), .endTuplet(_)):
			return true
		case (.keySignature(_), .keySignature(_)):
			return true
		case (.location(_), .location(_)):
			return true
		case (.measureRepeat(_), .measureRepeat(_)):
			return true
		case (.rehearsalMark(_, _), .rehearsalMark(_, _)):
			return true
		case (.rest(_), .rest(_)):
			return true
		case (.spanner(_), .spanner(_)):
			return true
		case (.staffText(_), .staffText(_)):
			return true
		case (.tempo(_), .tempo(_)):
			return true
		case (.timeSignature(_), .timeSignature(_)):
			return true
		case (.tuplet(_), .tuplet(_)):
			return true
		default:
			return false
		}
	}
}

public enum VoiceElementError: Error {
	case unknownVoiceElementError
	case elementParseError
}
