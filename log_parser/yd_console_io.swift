import Foundation

enum OutputType {
    case error
    case standard
}

class yd_console_IO {

    func write_kvp_message(_ label: String, result: Bool, cutting: String, to: OutputType = .standard) {
        
        switch to {
        case .standard:
            print(yd_refined_label(raw_label: label).padded_and_cut_label + yd_refined_label(raw_label: cutting).padded_and_cut_label)
  
        case .error:
            fputs("Error: \(label)\n", stderr)
        }
    }
    
    func write_kvp_message(_ label: String, message: String, to: OutputType = .standard) {

        switch to {
        case .standard:
            print(yd_refined_label(raw_label: label).padded_and_cut_label + yd_refined_label(raw_label: message).padded_and_cut_label)
           
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    
    func write_message(message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
}


