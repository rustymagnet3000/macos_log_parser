import Foundation

class yd_parse_specific_strings {
    
  
    static func print_summary(stream_reader: StreamReader) {
        var line_count = 0
        
        for z in search_terms {
            
            let log_search_item = YD_Log_Item(name: z.key, search_term: z.value)
            stream_reader.rewind()
            for i in stream_reader {
                line_count = line_count + 1
                if find_substring(str: i, substring: log_search_item.search_term) == true {
                    
                    log_search_item.found_in_logs = true
                    log_search_item.description_from_log = i
                    
                    break
                }
            }
            
            log_search_item.print_me()
            
        }
        consoleIO.write_kvp_message("line count", message: String(line_count), to: .standard)
    }
}

extension yd_parse_specific_strings {
    static func find_substring(str: String, substring: String) -> Bool {
        if str.range(of:substring) != nil {
            return true
        }
        return false
    }
}

