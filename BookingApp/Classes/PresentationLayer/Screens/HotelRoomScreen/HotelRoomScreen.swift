import SwiftUI
import WrappingHStack

struct HotelRoomScreen: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = HotelRoomViewModel()
    
    let hotelName: String
    
    var btnBack : some View { Button(action: {
        coordinator.pop()
    }) {
        HStack {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                Group {
                    ForEach(0..<(viewModel.hotelRoomModel?.rooms.count ?? 0 ), id: \.self) { index in
                        RoomView(images: viewModel.hotelRoomModel?.rooms[index].imageUrls ?? [],
                                 roomName: viewModel.hotelRoomModel?.rooms[index].name ?? "",
                                 peculiarities: viewModel.hotelRoomModel?.rooms[index].peculiarities ?? [],
                                 price: viewModel.formatCurrency(string: viewModel.hotelRoomModel?.rooms[index].price ?? 0),
                                 pricePer: viewModel.hotelRoomModel?.rooms[0].pricePer ?? "")
                    }
                }
                .background(Color.mainBackgroundColor)
                .navigationTitle(hotelName)
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .onAppear(perform: {
            viewModel.getData()
        })
    }
}

#Preview {
    HotelRoomScreen(hotelName: "Temp")
}

