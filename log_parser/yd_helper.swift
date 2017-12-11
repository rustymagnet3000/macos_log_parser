import Foundation

let BANNER_MAX: Int = 1

class yd_helper {
    
    static func version() {
        let version = "0.01"
        consoleIO.write_kvp_message("Version", message: version)
    }

    static func help_file() {
        consoleIO.write_kvp_message("Usage", message: "log_parser [filename.txt]")
    }

    static func help_flags() {
        consoleIO.write_kvp_message("a", message: "Summary of all items")
//        consoleIO.write_menu("c", "Count of specific items",.standard)
//        consoleIO.write_menu("n", "List host+path of requests",.standard)
//        consoleIO.write_menu("f", "List loaded certificates",.standard)
//        consoleIO.write_menu("s", "Search for specific term - NOT BUILT",.standard)
//        consoleIO.write_menu("v", "Version",.standard)

    }
    
    static func header() {
        let day_time = String(repeatElement("-", count: 16) + " " + yd_time_helper(raw_date: Date()).readable_date + " ")
        let size = (yd_global.wide_boundary)  - day_time.count
        consoleIO.write_message(message: String(day_time + repeatElement("-", count: size)), to: .standard)
    }
    
    static func divider() {
        for _ in (1...BANNER_MAX){
            consoleIO.write_message(message: String(repeatElement("-", count: yd_global.wide_boundary)), to: .standard)
        }
    }
    

}
