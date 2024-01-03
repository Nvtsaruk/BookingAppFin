import Foundation

final class HotelRoomViewModel: ObservableObject {
    @Published var hotelRoomModel: HotelRooms?
    @Published var images: [String] = []
    
    func getData() {
        APIService.getData(HotelRooms.self, url: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195") { result in
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
