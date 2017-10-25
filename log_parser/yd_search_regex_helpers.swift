import Foundation

public func find_substring(str: String, substring: String) -> Bool {
    if str.range(of:substring) != nil {
        return true
    }
    return false
}

public func find_pattern(str: String, regex: String) -> Bool {
    let range = str.range(of:regex, options:.regularExpression)
    if range != nil {
        return true
    }
    return false
}

extension String {
    func check_input(regex_pattern: String) -> Bool {
        do {
            let regex = try! NSRegularExpression(pattern: regex_pattern,
                                                 options: [.caseInsensitive])
            return regex.firstMatch(in: self, options:[], range: NSMakeRange(0, utf16.count)) != nil
        }
    }
}

extension String {
    func condense_whitespace() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}

public extension Array where Element : Equatable {
    var unique: [Element] {
        var unique_values: [Element] = []
        forEach { item in
            if !unique_values.contains(item) {
                unique_values += [item]
            }
        }
        return unique_values
    }
}

extension Collection
    where Iterator.Element: Equatable,
    SubSequence.Iterator.Element == Iterator.Element,
    Indices.Iterator.Element == Index
{
    func search<S: Sequence>(_ pattern: S) -> Index?
        where S.Iterator.Element == Iterator.Element
    {
        return indices.first { idx in
            self[idx..<endIndex].starts(with: pattern)
        }
    }
}
