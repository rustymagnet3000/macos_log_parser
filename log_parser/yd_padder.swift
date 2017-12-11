extension String {
    
    mutating func right_padding(padding: Int, padding_char: Character) {
        let idx = self.endIndex
        for _ in (1...padding) {
            self.insert(padding_char, at: idx)
        }
    }
}

enum padding_validator: String {
    case LongLabel
    case EmptyLabel = "empty label"
    case NormalLabel
    case UnknownLabel
}

// *********************************************************************//
// padding must accomodate variable length label                        //
// same logic must work for label and value                             //
// also uber long strings must be sanity checked to avoid bounds issues //
// *********************************************************************//

class yd_refined_label {
    let validator: padding_validator
    let padded_and_cut_label: String
    var padding_count: Int
    let delimeter = "|"
    
    convenience init(raw_label: String) {
        
        var modfieid_label = raw_label
        var validator: padding_validator = .UnknownLabel
        let padding_char: Character = " "
        var temp_padding_count = 0
        
        if modfieid_label.isEmpty {
            validator = .EmptyLabel
            modfieid_label = validator.rawValue
        }
        
        if modfieid_label.count > yd_global.boundary {
            validator = .LongLabel
            modfieid_label = String(modfieid_label.dropLast(modfieid_label.count - yd_global.boundary ))
        }
        
        if modfieid_label.count < yd_global.boundary  {
            validator = .NormalLabel
            temp_padding_count = yd_global.boundary  - modfieid_label.count
            modfieid_label.right_padding(padding: temp_padding_count, padding_char: padding_char)
        }
        
        self.init(validator: validator, padded_and_cut_label: modfieid_label, padding_count: temp_padding_count)
    }
    
    init(validator: padding_validator, padded_and_cut_label: String, padding_count: Int){
        self.validator = validator
        self.padded_and_cut_label = padded_and_cut_label + delimeter
        self.padding_count = padding_count
    }
}

