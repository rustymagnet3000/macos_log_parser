import Foundation
import Cocoa

let consoleIO =  yd_console_IO()

switch CommandLine.argc {
    case 2:
        let user_inputted_filename = CommandLine.arguments[1]
        user_input_do: do {
            guard user_inputted_filename.check_input(regex_pattern: yd_global.filename_regex) else {
                throw Parsing_Errors.NotValidFileName
            }
            /* analysis starts before user input */
            let stream_reader = try yd_read_file.read_plaintext_log_file(filename: user_inputted_filename)
            try yd_analyze_file.generate(stream_reader: stream_reader)

             /* capture user input */
            var user_flag = User_Flag.Waiting_Input
            while user_flag != .Quit {
                user_flag = try yd_get_user_flag.get()
                try yd_handle_user_flag.handle(flag: user_flag)
            }
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
