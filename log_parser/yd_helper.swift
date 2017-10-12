import Foundation

let BANNER_MAX: Int = 1

class yd_helper {
    
    static func version() {
        let version = "0.01"
        consoleIO.write_kvp_message("Version", message: version)
    }

    static func help() {
        header()
        consoleIO.write_kvp_message("Usage", message: "cyborg [-a] [-v] file_to_analyze")
        footer()
    }
    
    static func header() {
        let test = yd_time_helper(raw_date: Date())
        consoleIO.write_message("**************   \(test.readable_date)   **************\n", to: .standard)
    }
    
    static func divider() {
        for _ in (1...BANNER_MAX){
            consoleIO.write_message("************************************************", to: .standard)
        }
    }
    
    static func footer() {
        for _ in (1...BANNER_MAX){
            consoleIO.write_message("************************************************", to: .standard)
        }
    }
}
