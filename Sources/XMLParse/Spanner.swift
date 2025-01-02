//
//	Spanner.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-12-12.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Spanner: XMLObjectDeserialization, Sendable {
	static let nodeKey = "Spanner"

	enum SpannerType: Sendable {
		static let nodeKey = "type"

		case hairpin(Hairpin)
		case ottava(Ottava)
		case pedal(Pedal)
		case slur(Slur)
		case textline(TextLine)
		case tie(Tie?)
		case trill(Trill)
		case volta(Volta)
	}

	var spannerType: SpannerType
	var previous: Location?
	var next: Location?

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		let propertyAttribute: String = try node.value(ofAttribute: SpannerType.nodeKey)
		let spannerType: SpannerType = switch propertyAttribute {
		case Hairpin.nodeKey:
			.hairpin(try node[Hairpin.nodeKey].value())
		case Ottava.nodeKey:
			.ottava(try node[Ottava.nodeKey].value())
		case Pedal.nodeKey:
			.pedal(try node[Pedal.nodeKey].value())
		case Slur.nodeKey:
			.slur(Slur())
		case TextLine.nodeKey:
			.textline(try node[TextLine.nodeKey].value())
		case Tie.nodeKey:
			.tie(try node[Tie.nodeKey].value())
		case Trill.nodeKey:
			.trill(try node[Trill.nodeKey].value())
		case Volta.nodeKey:
			.volta(try node[Volta.nodeKey].value())
		default:
			throw SpannerParseError.unsupportedPropertyAttribute(propertyAttribute)
		}

		return Spanner(
			spannerType: spannerType,
			previous: try node["prev"]["location"].value(),
			next: try node["next"]["location"].value()
		)
	}
}

// MARK: - Spanner Types
extension Spanner {
	//<Spanner type="HairPin">
	//  <HairPin>
	//    <subtype>2</subtype>
	//    <endText></endText>
	//    <lineVisible>0</lineVisible>
	//    <continueText></continueText>
	//  </HairPin>
	//  <next>
	//    <location>
	//      <measures>18</measures>
	//    </location>
	//  </next>
	//</Spanner>
	public struct Hairpin: XMLObjectDeserialization, Sendable {
		static let nodeKey = "HairPin"

		enum HairpinType {
			case crescendoHairpin
			case decrescendoHairpin
			case crescendoLine
			case decrescendoLine
			case invalid
		}

		var subtype: Int
		var endText: String
		var continueText: String

		static func empty() -> Self {
			Hairpin(subtype: 0, endText: "", continueText: "")
		}

		public static func deserialize(_ node: XMLIndexer) throws -> Self {
			Hairpin(
				subtype: try node["subtype"].value(),
				endText: try node["endText"].value(),
				continueText: try node["continueText"].value()
			)
		}
	}

	//<Spanner type="Ottava">
	//  <Ottava>
	//    <subtype>8va</subtype>
	//  </Ottava>
	//  <next>
	//    <location>
	//      <measures>7</measures>
	//      <fractions>-5/16</fractions>
	//    </location>
	//  </next>
	//</Spanner>
	public struct Ottava: XMLObjectDeserialization, Sendable {
		static let nodeKey = "Ottava"

		var subtype: String

		static func empty() -> Self {
			Ottava(subtype: "")
		}

		public static func deserialize(_ node: XMLIndexer) throws -> Self {
			Ottava(subtype: try node["subtype"].value())
		}
	}

	// Don't have an example of this yet.
	public struct Pedal: XMLObjectDeserialization, Sendable {
		static let nodeKey = "Pedal"

		public static func deserialize(_ node: XMLIndexer) throws -> Self {
			Pedal()
		}
	}

	//<Spanner type="Slur">
	//  <prev>
	//    <location>
	//      <fractions>-1/4</fractions>
	//    </location>
	//  </prev>
	//</Spanner>
	public struct Slur: XMLObjectDeserialization, Sendable {
		static let nodeKey = "Slur"
	}

	// Don't have an example of this yet.
	public struct TextLine: XMLObjectDeserialization, Sendable {
		static let nodeKey = "TextLine"

		public static func deserialize(_ node: XMLIndexer) throws -> Self {
			TextLine()
		}
	}

	//<Spanner type="Tie">
	//  <Tie>
	//    <eid>231928234015</eid>
	//    <linkedMain />
	//  </Tie>
	//  <next>
	//    <location>
	//      <fractions>1/4</fractions>
	//    </location>
	//  </next>
	//</Spanner>
	public struct Tie: XMLObjectDeserialization, Sendable {
		static let nodeKey = "Tie"

		var eid: Int
		var linkedMain: Bool?

		public static func deserialize(_ node: XMLIndexer) throws -> Self {
			Tie(
				eid: try node["eid"].value(),
				linkedMain: try node["linkedMain"].value(found: true, notFound: false)
			)
		}
	}

	//<Spanner type="Trill">
	//  <Trill>
	//    <subtype>trill</subtype>
	//	  <lineWidth>0.24765</lineWidth>
	//  </Trill>
	//  <next>
	//    <location>
	//      <measures>4</measures>
	//    </location>
	//  </next>
	//</Spanner>
	public struct Trill: XMLObjectDeserialization, Sendable {
		static let nodeKey = "Trill"

		var subtype: String
		var lineWidth: Double

		public static func deserialize(_ node: XMLIndexer) throws -> Self {
			Trill(
				subtype: try node["subtype"].value(),
				lineWidth: try node["lineWidth"].value()
			)
		}
	}

	//<Spanner type="Volta">
	//  <Volta>
	//    <endHookType>1</endHookType>
	//    <beginText>1.</beginText>
	//    <endings>1</endings>
	//  </Volta>
	//  <next>
	//    <location>
	//    <measures>12</measures>
	//    </location>
	//  </next>
	//</Spanner>
	public struct Volta: XMLObjectDeserialization, Sendable {
		static let nodeKey = "Volta"

		var endHookType: Int
		var beginText: String
		var endings: String

		public static func deserialize(_ node: XMLIndexer) throws -> Self {
			Volta(
				endHookType: try node["endHookType"].value(),
				beginText: try node["beginText"].value(),
				endings: try node["endings"].value()
			)
		}
	}
}

// Case Equality. In this case it means the enums are equal, but the associated values are ignored
extension Spanner.SpannerType: NearEquatable {
	func isNearEqual(to: Spanner.SpannerType) -> Bool {
		switch (self, to) {
		case (.hairpin(_), .hairpin(_)):
			return true
		case (.ottava(_), .ottava(_)):
			return true
		case (.pedal(_), .pedal(_)):
			return true
		case (.slur(_), .slur(_)):
			return true
		case (.textline(_), .textline(_)):
			return true
		case (.tie(_), .tie(_)):
			return true
		case (.trill(_), .trill(_)):
			return true
		case (.volta(_), .volta(_)):
			return true
		default:
			return false
		}
	}
}

// MARK: - Parser Error

public enum SpannerParseError: Error {
	case unsupportedPropertyAttribute(String)
}

