class YD_Log_Item {
    let name: String
    let search_term: String
    var found_in_logs: Bool
    var cut: YD_Cut
    var description_from_log: String = "<default>" {
        didSet {
            if let idx = description_from_log.utf16.search(search_term.utf16)?
                .samePosition(in: description_from_log)
            {
                switch cut {
                case .Last_Six:
                    fallthrough
                case .Last_Eighteen:
                    fallthrough
                case .Last_Three:
                    description_from_log = String(description_from_log.characters.suffix(cut.rawValue))
                default:
                    description_from_log = String(description_from_log[idx..<description_from_log.endIndex])
                }
            }
        }
    }
    convenience init(name: String, search_term: String, cut: YD_Cut) {
        self.init(name: name, search_term: search_term, cut: cut, found_in_logs: false)
    }

    convenience init(name: String, search_term: String) {
        self.init(name: name, search_term: search_term, cut: .All, found_in_logs: false)
    }
    
    init(name: String, search_term: String, cut: YD_Cut, found_in_logs: Bool) {
        self.name = name
        self.search_term = search_term
        self.cut = cut
        self.found_in_logs = found_in_logs
    }
    
    func print_me(){
        consoleIO.write_kvp_message(name, message: description_from_log, to: .standard)
    }
}

class YD_Log_Counter: YD_Log_Item {
    var count: Int = {
        return 0
    }()
    
    override func print_me(){
        consoleIO.write_kvp_message(name, message: String(count), to: .standard)
    }
}

