import Foundation
import Cocoa

let consoleIO =  yd_console_IO()

switch CommandLine.argc {
    case 2:
        let user_inputted_filename = CommandLine.arguments[1]
        user_input_do: do {
            guard user_inputted_filename.check_input(regex_pattern: "^[a-z0-9_-]{1,20}.txt$") else {
                throw Parsing_Errors.NotValidFileName
            }
            try yd_read_file.read_plaintext_log_file(filename: user_inputted_filename)
            let user_flag = try yd_get_user_flag.get()
            print("user flag was: \(user_flag)")
            // try yd_analyze_file.generate(stream_reader: stream_reader)
        }
        catch Parsing_Errors.ErrorReadingFile{
            consoleIO.write_message(message: "Error reading file", to: .error)
        }
        catch {
            yd_helper.help_file()
        }
    default:
        yd_helper.help_file()
}
exit(EXIT_SUCCESS)
