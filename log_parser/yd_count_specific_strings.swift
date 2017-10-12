


class yd_count_specific_strings {

    static func print_summary(stream_reader: StreamReader) {
        for z in count_search_terms {
            let log_search_item = YD_Log_Counter(name: z.key, search_term: z.value)
            stream_reader.rewind()
            for i in stream_reader {
                
                if yd_parse_specific_strings.find_substring(str: i, substring: log_search_item.search_term) == true {
                    
                    if log_search_item.found_in_logs == false {
                        log_search_item.found_in_logs = true
                    }
                    log_search_item.count += 1
                    
                }
            }
            log_search_item.print_me()
        }
    }
}
