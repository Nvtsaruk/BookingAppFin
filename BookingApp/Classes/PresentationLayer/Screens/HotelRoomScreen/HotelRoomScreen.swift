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

struct RoomView: View {
    @EnvironmentObject private var coordinator: Coordinator
    let images: [String]
    let roomName: String
    let peculiarities: [String]
    let price: String
    let pricePer: String
    var body: some View {
        Group {
            VStack {
                ImageSliderView(imageArray: images)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                Text(roomName)
                    .font(.system(size: 22, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                WrappingHStack(alignment: .leading) {
                    ForEach(0..<(peculiarities.count ), id: \.self) { index in
                        HStack {
                            Text(peculiarities[index])
                                .foregroundStyle(Color.tagsTextColor)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .font(.system(size: 16, weight: .medium))
                        }.background(Color.tagsBackgroundColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                HStack {
                    Button {
                        
                    } label: {
                        HStack {
                            HStack {
                                Text("Подробнее о номере")
                                    .font(.system(size: 16, weight: .medium))
                                Image(systemName: "chevron.right")
                            }.padding(.horizontal, 10)
                                .padding(.vertical, 5)
                        }.background(Color.lightBlueButtonColor)
                    }
                    Spacer()
                }
                HStack(alignment: .bottom) {
                    Text(price)
                        .font(.system(size: 30, weight: .semibold))
                    Text(pricePer.lowercased() )
                        .font(.system(size: 16))
                        .foregroundStyle(Color.tagsTextColor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    coordinator.push(.bookingScreen)
                } label: {
                    Text("Выбрать номер")
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
