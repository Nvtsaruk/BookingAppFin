import Foundation

final class HotelRoomViewModel: ObservableObject {
    @Published var hotelRoomModel: HotelRooms?
    @Published var images: [String] = []
    
    func getData() {
        APIService.getData(HotelRooms.self, url: APIUrls.roomInfo.url) { result in
            switch result {
                case .success(let data):
                    self.hotelRoomModel = data
                case .failure(let error):
                    ErrorHandler.shared.handleError(error: error)
            }
        }
    }
    func formatCurrency(string: Int) -> String {
        return StringFormatter.shared.formatCurrency(string: string)
    }
}
