import Foundation
extension String {
    func formatPhoneNumber() -> String {
        var cleanNumber:String = ""
        if String(components(separatedBy: CharacterSet.symbols).joined()) == "7 (" {
            return ""
        } else {
            if components(separatedBy: CharacterSet.decimalDigits.inverted).joined().count == 1{
                cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            } else {
                cleanNumber = String(components(separatedBy: CharacterSet.decimalDigits.inverted).joined().dropFirst(1))
            }
            
            let mask = "(XXX) XXX-XX-XX"
            
            var result = ""
            let codeResult = "+7 "
            var startIndex = cleanNumber.startIndex
            let endIndex = cleanNumber.endIndex
            
            for char in mask where startIndex < endIndex {
                if char == "X" {
                    result.append(cleanNumber[startIndex])
                    startIndex = cleanNumber.index(after: startIndex)
                } else {
                    result.append(char)
                }
            }
            
            return codeResult + result
        }
    }
    func formatDate() -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "XX/XX/XXXX"
        var result = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "X" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        
        return result
    }
    func formatPassNumber() -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "XX XXXXXX"
        var result = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "X" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        return result
    }
}
