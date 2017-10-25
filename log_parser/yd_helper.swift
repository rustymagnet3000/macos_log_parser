import Foundation

let BANNER_MAX: Int = 1

class yd_helper {
    
    static func version() {
        let version = "0.01"
        consoleIO.write_kvp_message("Version", message: version)
    }

    static func help_file() {
        divider()
        consoleIO.write_menu("Usage:", "log_parser [filename.txt]", .standard)
        footer()
    }

    static func help_flags() {
        divider()
        consoleIO.write_menu("a", "Summary of all items",.standard)
        consoleIO.write_menu("c", "Count of specific items",.standard)
        consoleIO.write_menu("n", "Show host+path of requests",.standard)
        consoleIO.write_menu("f", "Show certs loaded into PIN list",.standard)
        consoleIO.write_menu("s", "Search for specific term - NOT BUILT",.standard)
        consoleIO.write_menu("v", "Version",.standard)
        footer()
    }
    
    static func header() {
        let test = yd_time_helper(raw_date: Date())
        
        consoleIO.write_menu("**************", "\(test.readable_date) \t **************\n", .standard)
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
