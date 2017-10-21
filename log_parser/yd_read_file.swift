import Foundation

class yd_read_file {
    
    static func read_plaintext_log_file(filename: String) {
        let start = yd_time_helper(raw_date: Date())
        let consoleIO =  yd_console_IO()
        
        labelpoint: do {

            let path = FileManager.default.currentDirectoryPath + "/" + filename
            
            guard let stream_reader = StreamReader(path: path, delimiter: "\n", encoding: .utf8, chunkSize: 4096) else {
                consoleIO.write_menu("!!", "failed to open file", .error)
                exit(89)
            }

            do {
                yd_helper.header()
                let end = yd_time_helper(raw_date: Date())
                let analysis_time = try yd_time_helper.start_minus_finish_epoch(start_time_epoch: start.epoch_time, end_time_epoch: end.epoch_time)
                try yd_analyze_file.generate(stream_reader: stream_reader)
                print("time taken = \(analysis_time ) seconds")
                yd_helper.footer()
            }
            catch {
                print("time issue")
            }
        }
    }
}
