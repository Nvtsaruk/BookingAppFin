import SwiftUI

struct BookingScreen: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = BookingScreenViewModel()
    @State private var showingAlert = false
    let touristCountArray: [String] = ["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой", "Седьмой",
                                       "Восьмой", "Девятый", "Десятый"]
    @State var tourists: Int = 1 {
        didSet {
            viewModel.addValidation()
        }
    }
    
    
    var buttonBack : some View { Button(action: {
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
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    VStack {
                        HotelInfoView(rating: String(viewModel.bookingModel?.horating ?? 0),
                                  ratingName: (viewModel.bookingModel?.ratingName ?? ""),
                                  hotelName: viewModel.bookingModel?.hotelName ?? "",
                                  HotelAdress: viewModel.bookingModel?.hotelAdress ?? "")
                        TourInfoView(departure: viewModel.bookingModel?.departure ?? "",
                                 arrival: viewModel.bookingModel?.arrivalCountry ?? "",
                                 tourStart: viewModel.bookingModel?.tourDateStart ?? "",
                                 tourEnd: viewModel.bookingModel?.tourDateStop ?? "",
                                 numNights: String(viewModel.bookingModel?.numberOfNights ?? 0),
                                 hotelName: viewModel.bookingModel?.hotelName ?? "",
                                 room: viewModel.bookingModel?.room ?? "",
                                 nutrition: viewModel.bookingModel?.nutrition ?? "")
                        CustomerInfoView(viewModel: viewModel)
                        ForEach(0..<tourists, id: \.self) { index in
                            VStack {
                                TouristView(viewModel: viewModel, touristNumber: touristCountArray[index], index: index)
                            }.tag(index)
                        }
                        Button{
                            if tourists < 10 {
                                tourists = tourists + 1
                            }
                        }label: {
                            HStack{
                                Text("Добавить туриста")
                                    .font(.system(size: 22, weight: .medium))
                                    .padding(.vertical, 12)
                                Spacer()
                                ZStack{
                                    Image(systemName: "plus")
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                }
                                .frame(width: 32, height: 32)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            }
                            .padding(.horizontal, 4)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.white)
                        .foregroundColor(Color.black)
                        TourSummaryView(tourPrice: viewModel.formatCurrency(string: viewModel.bookingModel?.tourPrice ?? 0),
                                    fuelCharge: viewModel.formatCurrency(string: viewModel.bookingModel?.fuelCharge ?? 0),
                                    serviceCharge: viewModel.formatCurrency(string: viewModel.bookingModel?.serviceCharge ?? 0),
                                    summ: viewModel.getResultPrice())
                    }
                    .background(Color.mainBackgroundColor)
                    .navigationTitle("Бронирование")
                    .navigationBarTitleDisplayMode(.inline)
                }
                Spacer()
                Group {
                    Button {
                        if viewModel.getAllValidation() {
                            coordinator.push(.paidScreen)
                        } else {
                            showingAlert = true
                        }
                    } label: {
                        Text("Оплатить \(viewModel.getResultPrice())")
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
                .alert("Данные необходимо заполнить", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: buttonBack)
            .onAppear(perform: {
                viewModel.getData()
                if viewModel.touristsArray.isEmpty {
                    viewModel.addValidation()
                }
            })
        }
        
    }
}

#Preview {
    BookingScreen()
}


