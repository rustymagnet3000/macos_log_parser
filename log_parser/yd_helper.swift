import Foundation

let BANNER_MAX: Int = 1

class yd_helper {
    
    static func version() {
        let version = "0.01"
        consoleIO.write_kvp_message("Version", message: version)
    }

    static func help() {
        divider()
        consoleIO.write_menu("Usage", message: "log_parser [-a] [-d] [-c] [-s] file", to: .standard)
        consoleIO.write_menu("-a", message: "Summary of all items", to: .standard)
        consoleIO.write_menu("-d", message: "Dump of found strings", to: .standard)
        consoleIO.write_menu("-c", message: "Count of specific items", to: .standard)
        consoleIO.write_menu("-s", message: "Search for specific term", to: .standard)
        consoleIO.write_menu("-v", message: "Version", to: .standard)
        footer()
    }
    
    static func header() {
        let test = yd_time_helper(raw_date: Date())
        
        consoleIO.write_menu("**************", message: "\(test.readable_date) \t **************\n", to: .standard)
    }
    
    static func divider() {
        for _ in (1...BANNER_MAX){
            consoleIO.write_message(message: "************************************************", to: .standard)
        }
    }
    
    static func footer() {
        for _ in (1...BANNER_MAX){
            consoleIO.write_message(message: "************************************************", to: .standard)
        }
    }
}
