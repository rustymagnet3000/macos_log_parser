import Foundation

class yd_file_parser {

    static func find_substring(str: String, substring: String) -> Bool {
        if str.range(of:substring) != nil {
            return true
        }
        return false
    }
    
    static func find_pattern(str: String, regex: String) -> Bool {
        let range = str.range(of:regex, options:.regularExpression)
        if range != nil {
            return true
        }
        return false
    }

    static func read_plaintext_log_file(filename: String) {
        
        let consoleIO =  yd_console_IO()
        labelpoint: do {

        let path = FileManager.default.currentDirectoryPath + "/" + filename
            guard let stream_reader = StreamReader(path: path, delimiter: "\n", encoding: .utf8, chunkSize: 4096) else {
                consoleIO.write_message("Opening file failed", to: .error)
                exit(89)
            }
            
            yd_helper.header()
            var line_count = 0
            
            for z in search_terms {

                let log = YD_Log_Item(name: z.key, search_term: z.value)
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
            yd_helper.footer()

            consoleIO.write_kvp_message("line count", message: String(line_count), to: .standard)
            yd_helper.footer()
        }
    }
}
