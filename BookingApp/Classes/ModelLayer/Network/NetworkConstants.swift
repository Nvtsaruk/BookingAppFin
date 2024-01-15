import Foundation
enum NetworkConstants {
    static let baseUrl = "https://run.mocky.io/v3/"
    static let hotelScreen = "d144777c-a67f-4e35-867a-cacc3b827473"
    static let hotelRoom = "8b532701-709e-4194-a41c-1a903af00195"
    static let bookingScreen = "63866c74-d593-432c-af8e-f279d1a8d2ff"
}

enum APIUrls: CaseIterable {
    case hotelInfo
    case roomInfo
    case booking
    
    var url: String {
        switch self {
            case .hotelInfo:
                return NetworkConstants.baseUrl + NetworkConstants.hotelScreen
            case .roomInfo:
                return NetworkConstants.baseUrl + NetworkConstants.hotelRoom
            case .booking:
                return NetworkConstants.baseUrl + NetworkConstants.bookingScreen
        }
    }
}

