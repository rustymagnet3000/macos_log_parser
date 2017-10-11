class YD_Log_Item {
    
    let name: String
    let search_term: String
    var found_in_logs: Bool
    var description_from_log: String = "---" {
        didSet {
            if let idx = description_from_log.utf16.search(search_term.utf16)?
                .samePosition(in: description_from_log)
            {
                description_from_log = String(description_from_log[idx..<description_from_log.endIndex])
            }
        }
    }
    
    convenience init(name: String) {
        self.init(name: name, search_term: name, found_in_logs: false)
    }
    
    convenience init(name: String, search_term: String) {
        self.init(name: name, search_term: search_term, found_in_logs: false)
    }
    
    init(name: String, search_term: String, found_in_logs: Bool) {
        self.name = name
        self.search_term = search_term
        self.found_in_logs = found_in_logs
    }
    
    func print_me(){
        consoleIO.write_kvp_message(name, result: found_in_logs, cutting: description_from_log, to: .standard)
    }
}

class YD_Log_Counter: YD_Log_Item {
    var count: Int = {
        return 99
    }()
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

