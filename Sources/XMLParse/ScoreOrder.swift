//
//	ScoreOrder.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-10.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

//<Order id="orchestral">
//  <name>Orchestral</name>
//  <instrument id="electric-guitar-tablature">
//	<family id="guitars">Guitars</family>
//  </instrument>
//  <section id="woodwind" brackets="true" barLineSpan="true" thinBrackets="true">
//	<family>flutes</family>
//	<family>oboes</family>
//	<family>clarinets</family>
//	<family>saxophones</family>
//	<family>bassoons</family>
//	<unsorted group="woodwinds" />
//  </section>
//  <section id="brass" brackets="true" barLineSpan="true" thinBrackets="true">
//	<family>horns</family>
//	<family>trumpets</family>
//	<family>cornets</family>
//	<family>flugelhorns</family>
//	<family>trombones</family>
//	<family>tubas</family>
//	<unsorted group="brass" />
//  </section>
//  <section id="timpani" brackets="true" barLineSpan="true" thinBrackets="true">
//	<family>timpani</family>
//  </section>
//  <section id="percussion" brackets="true" barLineSpan="true" thinBrackets="true">
//	<family>keyboard-percussion</family>
//	<unsorted group="pitched-percussion" />
//	<family>drums</family>
//	<family>unpitched-metal-percussion</family>
//	<family>unpitched-wooden-percussion</family>
//	<family>other-percussion</family>
//	<unsorted group="unpitched-percussion" />
//  </section>
//  <family>keyboards</family>
//  <family>harps</family>
//  <family>organs</family>
//  <family>synths</family>
//  <unsorted />
//  <soloists />
//  <section id="voices" brackets="true" barLineSpan="false" thinBrackets="true">
//	<family>voices</family>
//	<family>voice-groups</family>
//  </section>
//  <section id="strings" brackets="true" barLineSpan="true" thinBrackets="true">
//	<family>orchestral-strings</family>
//  </section>
//</Order>

public struct ScoreOrder: XMLObjectDeserialization {
	static let nodeKey = "Order"

	var id: String
	var name: String

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		ScoreOrder(
			id: try node.value(ofAttribute: "id"),
			name: try node["name"].value()
		)
	}
}
