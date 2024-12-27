//
//	ScoreOrderTests.swift
//	music-notation-import-musescore-tests
//
//	Created by Steven Woolgar on 2024-12-19.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

@testable import MusicNotationImportMuseScore
import SWXMLHash
import Testing

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

@Suite final class ScoreOrderTests {
	@Test func orderID1() async throws {
		let xmlString = #"""
<Order id="orchestral">
  <name>Orchestral</name>
  <instrument id="electric-guitar-tablature">
	<family id="guitars">Guitars</family>
  </instrument>
  <section id="woodwind" brackets="true" barLineSpan="true" thinBrackets="true">
	<family>flutes</family>
	<family>oboes</family>
	<family>clarinets</family>
	<family>saxophones</family>
	<family>bassoons</family>
	<unsorted group="woodwinds" />
  </section>
  <section id="brass" brackets="true" barLineSpan="true" thinBrackets="true">
	<family>horns</family>
	<family>trumpets</family>
	<family>cornets</family>
	<family>flugelhorns</family>
	<family>trombones</family>
	<family>tubas</family>
	<unsorted group="brass" />
  </section>
  <section id="timpani" brackets="true" barLineSpan="true" thinBrackets="true">
	<family>timpani</family>
  </section>
  <section id="percussion" brackets="true" barLineSpan="true" thinBrackets="true">
	<family>keyboard-percussion</family>
	<unsorted group="pitched-percussion" />
	<family>drums</family>
	<family>unpitched-metal-percussion</family>
	<family>unpitched-wooden-percussion</family>
	<family>other-percussion</family>
	<unsorted group="unpitched-percussion" />
  </section>
  <family>keyboards</family>
  <family>harps</family>
  <family>organs</family>
  <family>synths</family>
  <unsorted />
  <soloists />
  <section id="voices" brackets="true" barLineSpan="false" thinBrackets="true">
	<family>voices</family>
	<family>voice-groups</family>
  </section>
  <section id="strings" brackets="true" barLineSpan="true" thinBrackets="true">
	<family>orchestral-strings</family>
  </section>
</Order>
"""#
		let xmlParser = XMLHash.parse(xmlString)
		let scoreOrder: ScoreOrder = try xmlParser[ScoreOrder.nodeKey].value()
		#expect(scoreOrder.id == "orchestral")
	}
}
