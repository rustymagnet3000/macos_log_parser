import Foundation

class yd_read_file {
    
    static func read_plaintext_log_file(filename: String) throws -> StreamReader {
        
        labelpoint: do {

            let path = FileManager.default.currentDirectoryPath + "/" + filename
            
            guard let stream_reader = StreamReader(path: path, delimiter: "\n", encoding: .utf8, chunkSize: 4096) else {
                throw Parsing_Errors.ErrorReadingFile
            }

         return stream_reader

        }
    }
}
