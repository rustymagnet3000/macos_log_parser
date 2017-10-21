import Foundation

class yd_analyze_file {

    static func generate(stream_reader: StreamReader) throws {
        
        var count = 0
        var specific_logs_arry: [YD_Log_Item] = []
        var network_logs_arry: [YD_Log_Item] = []
        var count_logs_arry: [YD_Log_Item] = []
        var count_of_results: [String: Int] = [:]
        
        do {
            for z in stream_reader {
                
                count += 1
                
                for i in search_terms {
                    let log_item = YD_Log_Item(name: i.key, search_term: i.value.search_term, cut: i.value.cut, special_value: i.value.special)
                    if find_substring(str: z, substring: log_item.search_term) == true {
                        
                        switch (i.value.count, i.key) {
                        case (true, _):
                            count_logs_arry.append(log_item)
                        case (_, "Networks Requests"):
                            log_item.description_from_log = z
                            network_logs_arry.append(log_item)
                        default:
                            specific_logs_arry.append(log_item)
                        }
                    }
                }
            }
            
            print("count of total counts \(count_logs_arry.count)")
            for x in count_logs_arry {
                count_of_results[x.name] = (count_of_results[x.name] ?? 0) + 1
            }
            
            for (key, value) in count_of_results {
                print("\(key) occurs \(value) time(s)")
            }
        }
        catch {
                print("error in do")
        }

            print("lines = \(count)")
            print("end of analysis")
    }
}
