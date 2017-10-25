class YD_Log_Item: Equatable {
    static func ==(lhs: YD_Log_Item, rhs: YD_Log_Item) -> Bool {
        return lhs === rhs
    }
    
    
    let name: String
    let search_term: String
    var special_value: Bool
    var cut: YD_Cut
    var description_from_log: String = "-- not found --" {
        didSet {
         if let idx = description_from_log.utf16.search(search_term.utf16)?
            .samePosition(in: description_from_log) {

                switch cut {
                case .Last_Six:
                    fallthrough
                case .Last_Eighteen:
                    fallthrough
                case .Last_Three:
                    description_from_log = String(description_from_log.characters.suffix(cut.rawValue))
                default:
                    let range: Range<String.Index> = description_from_log.range(of: search_term)!
                    let index: Int = description_from_log.distance(from: description_from_log.startIndex, to: range.upperBound)
                    let trimmed_desc = String(description_from_log.characters.dropFirst(index))
                    description_from_log = trimmed_desc.condense_whitespace()
                }
            }
        }
    }
    
    convenience init(name: String, search_term: String) {
        self.init(name: name, search_term: search_term, cut: .All, special_value: false)
    }
    
    init(name: String, search_term: String, cut: YD_Cut, special_value: Bool) {
        self.name = name
        self.search_term = search_term
        self.cut = cut
        self.special_value = special_value
    }
    
    func print_me(){
        consoleIO.write_kvp_message(name, message: description_from_log, to: .standard)
    }

    func print_concise(){
        consoleIO.write_message(message: description_from_log, to: .standard)
    }
}
