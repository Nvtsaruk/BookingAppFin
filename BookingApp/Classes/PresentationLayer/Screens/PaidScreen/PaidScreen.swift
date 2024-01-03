import SwiftUI

struct PaidScreen: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = PaidViewModel()
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
        GeometryReader { geometry in
            VStack {
                Spacer()
                VStack {
                    Image("Congrats")
                    Text("Ваш заказ принят в работу")
                        .font(.system(size: 22, weight: .medium))
                        .padding(.top, 32)
                    Text("Подтверждение заказа \(viewModel.getOrderNumber()) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color.tagsTextColor)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                        .padding(.horizontal, 8)
                }
                .padding()
                .navigationTitle("Заказ оплачен")
                .navigationBarTitleDisplayMode(.inline)
                Spacer()
                Group {
                    Button {
                        coordinator.popToRoot()
                    } label: {
                        Text("Супер!")
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
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
        }
    }
}

#Preview {
    PaidScreen()
}

