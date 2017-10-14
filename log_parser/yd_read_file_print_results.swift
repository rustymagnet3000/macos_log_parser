import Foundation

class yd_file_parser {

    
    static func read_plaintext_log_file(filename: String, flag: User_Flag) {
        
        let consoleIO =  yd_console_IO()
        labelpoint: do {

            let path = FileManager.default.currentDirectoryPath + "/" + filename
            
            guard let stream_reader = StreamReader(path: path, delimiter: "\n", encoding: .utf8, chunkSize: 4096) else {
                consoleIO.write_menu("!!", "failed to open file", .error)
                exit(89)
            }
            yd_helper.header()
            switch flag {
                case .Summary:
                    yd_parse_specific_strings.print_summary(stream_reader: stream_reader)
                case .Count:
                    yd_count_specific_strings.print_summary(stream_reader: stream_reader)
                default:
                    yd_helper.help()
            }
            yd_helper.footer()
        }
    }
}
