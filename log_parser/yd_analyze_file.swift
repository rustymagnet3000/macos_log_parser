import Foundation

var count = 0
var specific_logs_arry: [YD_Log_Item] = []
var network_logs_arry: [YD_Log_Item] = []
var count_logs_arry: [YD_Log_Item] = []
var count_of_results: [String: Int] = [:]

class yd_analyze_file {

    static func generate(stream_reader: StreamReader) throws {
        
        do {
            let start = yd_time_helper(raw_date: Date())
            yd_helper.header()
            
            for z in stream_reader {
                
                count += 1
                
                search_term_loop: for i in search_terms {
                    let log_item = YD_Log_Item(name: i.key, search_term: i.value.search_term, cut: i.value.cut, special_value: i.value.special)
               //     let network_item = YD_Network_Item(name: i.key, search_term: i.value.search_term, cut: i.value.cut, special_value: i.value.special)
                    
                    if find_substring(str: z, substring: log_item.search_term) == true {
                        
                        switch (i.key, i.value.count) {
                            
                            case (i.key, true):
                                count_logs_arry.append(log_item)
                            
                            case ("Network Request", _):
                                log_item.description_from_log = z
                                network_logs_arry.append(log_item)
                            
                            case (i.key, false):
                                log_item.description_from_log = z
                                specific_logs_arry.append(log_item)
                                search_terms.removeValue(forKey: i.key)
                                break search_term_loop
                            
                            default:
                                print("in default")
                            }
                    }
                }
            }
            
            let end = yd_time_helper(raw_date: Date())
            let analysis_time = try yd_time_helper.start_minus_finish_epoch(start_time_epoch: start.epoch_time, end_time_epoch: end.epoch_time)
            consoleIO.write_kvp_message("Success", message: "Finished in \(analysis_time ) seconds", to: .standard)
            consoleIO.write_kvp_message("lines counted", message: String(count), to: .standard)
 
        }
        catch {
                throw Parsing_Errors.ErrorDuringAnalysis
        }
    }
}
