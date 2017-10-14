enum YD_Cut : Int {
    case    Last_Three = 3
    case    Last_Six = 6
    case    Last_Eighteen = 18
    case    All
}


enum User_Flag : String {
    case    Summary
    case    Count
    case    Help
    case    Unknown
    
    init(flag: String){
        switch flag {
        case "-a":
            self = .Summary
        case "-c":
            self = .Count
        case "-h":
            self = .Help
        default:
            self = .Unknown
        }
    }
}
