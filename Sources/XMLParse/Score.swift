//
//	Score.swift
//	music-notation-import-musescore
//
//	Created by Steven Woolgar on 2024-10-09.
//	Copyright © 2024 Steven Woolgar. All rights reserved.
//

import SWXMLHash

public struct Score: XMLObjectDeserialization {
	static let nodeKey = "Score"

	var division: Int
	var showInvisible: Bool
	var showUnprintable: Bool
	var showFrames: Bool
	var showMargins: Bool
	var open: Int
	var metaTags: [MetaTag]
	var order: ScoreOrder
	var parts: [Part]
	var staves: [Staff]

	public static func deserialize(_ node: XMLIndexer) throws -> Self {
		try Score(
			division: node["Division"].value(),
			showInvisible: node["showInvisible"].value(),
			showUnprintable: node["showUnprintable"].value(),
			showFrames: node["showFrames"].value(),
			showMargins: node["showMargins"].value(),
			open: node["open"].value(),
			metaTags: node[MetaTag.nodeKey].value(),
			order: node[ScoreOrder.nodeKey].value(),
			parts: node[Part.nodeKey].value(),
			staves: node[Staff.nodeKey].value()
		)
	}
}

// MARK: -- MetaTag Access Helpers

extension Score {
	public func title() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .workTitle(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .workTitle(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func subtitle() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .subtitle(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .subtitle(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func arranger() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .arranger(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .arranger(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func composer() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .composer(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .composer(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func copyright() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .copyright(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .copyright(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func creationDate() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .creationDate(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .creationDate(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func lyricist() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .lyricist(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .lyricist(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func movementNumber() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .movementNumber(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .movementNumber(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func movementTitle() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .movementTitle(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .movementTitle(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func platform() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .platform(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .platform(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func source() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .source(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .source(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func translator() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .translator(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .translator(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func workNumber() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .workNumber(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .workNumber(string) = title {
			return string
		} else {
			return ""
		}
	}

	public func workTitle() -> String {
		guard let title = metaTags.first(where: {
			switch $0 {
			case .workTitle(_):
				return true
			default:
				return false
			}
		}) else { return "" }

		if case let .workTitle(string) = title {
			return string
		} else {
			return ""
		}
	}
}
