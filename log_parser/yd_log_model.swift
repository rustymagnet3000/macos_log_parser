class YD_Log_Item {
    let name: String
    let search_term: String
    var special_value: Bool
    var cut: YD_Cut
    var description_from_log: String = "-- not found --" {
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
                if special_value == true {
                    description_from_log = refine_log_description(name: name, entire_log: description_from_log)
                }
            }
        }
    }
    
    func refine_log_description(name: String, entire_log: String) -> String {
        switch name {
        case "Keys":
            return "nice keys"
        case "Network request":
            let cut_http_code = String(entire_log.characters.suffix(3))
            return HTTP_Result_Status(result: cut_http_code).rawValue
        case "Sentinel":
            
            if find_pattern(str: entire_log, regex: "Reaction [0-9]{4}") == true {
                if let idx = entire_log.utf16.search(entire_log.utf16)?
                    .samePosition(in: entire_log)
                {
                    let found_reaction = entire_log[idx..<entire_log.endIndex]
                    return found_reaction.description
                }
            }
            return "reaction unhandled"
        default:
            return "not defined"
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
        print("\(name)\t|\t\(special_value) \t\t \(description_from_log)")
    }
}

