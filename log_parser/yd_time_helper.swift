import Foundation

class yd_time_helper {
    var raw_date: Date
    var readable_date: String
    public var epoch_time: Int
    
    convenience init(raw_date: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "EEEE H:mm"
        let easy_date = formatter.string(from: raw_date)
        let easy_epoch = Int(raw_date.timeIntervalSince1970 * 1000)
        
        self.init(raw_date: raw_date, readable_date: easy_date, epoch_time: easy_epoch)
    }
    
    init(raw_date: Date, readable_date: String, epoch_time: Int) {
        self.raw_date = raw_date
        self.readable_date = readable_date
        self.epoch_time = epoch_time
    }
    
    static func start_minus_finish_epoch(start_time_epoch: Int, end_time_epoch: Int) throws -> Double {
        
        guard let time_taken: Double = Double(end_time_epoch - start_time_epoch) else {
            throw Parsing_Errors.TimeError
        }
        
        guard time_taken > 0 else {
            throw Parsing_Errors.TimeValueError
        }
        
        return time_taken / 1000
    }
}
