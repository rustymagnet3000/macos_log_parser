import Foundation

extension String {
    func check_input(regex_pattern: String) -> Bool {
        do {
            let regex = try! NSRegularExpression(pattern: regex_pattern,
                                                 options: [.caseInsensitive])
            return regex.firstMatch(in: self, options:[], range: NSMakeRange(0, utf16.count)) != nil
        }
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
