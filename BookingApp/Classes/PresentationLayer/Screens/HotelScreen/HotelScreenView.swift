import SwiftUI

struct HotelScreenView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = HotelScreenViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    VStack {
                        VStack {
                            ImageSliderView(imageArray: viewModel.hotelModel?.imageUrls ?? [])
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.leading)
                                .padding(.trailing)
                            HotelMainDescription(rating: String(viewModel.hotelModel?.rating ?? 0), ratingName: (viewModel.hotelModel?.ratingName ?? ""),
                                            hotelName: (viewModel.hotelModel?.name ?? ""),
                                            adress: (viewModel.hotelModel?.adress ?? ""),
                                                 minPrice: viewModel.formatCurrency(string: viewModel.hotelModel?.minimalPrice ?? 0),
                                            priceFor: (viewModel.hotelModel?.priceForIt ?? ""))
                            
                        }
                        .background(.white)
                        .clipShape(.rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 12,
                            bottomTrailingRadius: 12,
                            topTrailingRadius: 0
                        ))
                        AboutHotel(peculiarities: viewModel.hotelModel?.aboutTheHotel.peculiarities ?? [],
                        description: viewModel.hotelModel?.aboutTheHotel.description ?? "")
                        Spacer()
                        
                    }
                    .background(Color.mainBackgroundColor)
                    .navigationTitle("Отель")
                    .navigationBarTitleDisplayMode(.inline)
                }
                Spacer()
                Group {
                    Button {
                        coordinator.push(.hotelRoom(hotelName: viewModel.hotelModel?.name ?? ""))
                    } label: {
                        Text("К выбору номера")
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height/14)
                .background(Color.white)
            }
        }
        .onAppear(perform: {
            viewModel.getData()
        })
        .preferredColorScheme(.light)
    }
}

#Preview {
    HotelScreenView()
}

