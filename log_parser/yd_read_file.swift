import Foundation

class yd_read_file {
    
    static func read_plaintext_log_file(filename: String) throws {
        let start = yd_time_helper(raw_date: Date())

        labelpoint: do {

            let path = FileManager.default.currentDirectoryPath + "/" + filename
            
            guard let stream_reader = StreamReader(path: path, delimiter: "\n", encoding: .utf8, chunkSize: 4096) else {
                throw Parsing_Errors.ErrorReadingFile
            }

            do {
                yd_helper.header()
                let end = yd_time_helper(raw_date: Date())
                let analysis_time = try yd_time_helper.start_minus_finish_epoch(start_time_epoch: start.epoch_time, end_time_epoch: end.epoch_time)
                consoleIO.write_kvp_message("Success", message: "Finished in \(analysis_time ) seconds", to: .standard)
                yd_helper.footer()
            }
            catch {
                throw Parsing_Errors.ErrorReadingFile
            }
        }
    }
}
