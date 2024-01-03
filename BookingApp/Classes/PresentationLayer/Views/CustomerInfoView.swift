import SwiftUI

struct CustomerInfoView: View {
    
    @ObservedObject var viewModel: BookingScreenViewModel
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("Информация о покупателе")
                    .font(.system(size: 22, weight: .medium))
                Group {
                    VStack(alignment: .leading) {
                        if !viewModel.phone.isEmpty {
                            Text("Номер телефона")
                                .foregroundStyle(Color.textFieldDescriptionTextColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                        TextField("Номер телефона", text: $viewModel.phone, onEditingChanged: { (isBegin) in
                            if !isBegin {
                                if viewModel.phone.count < 18 {
                                    viewModel.phoneValidation = false
                                } else {
                                    viewModel.phoneValidation = true
                                }
                            }
                        })
                        .font(.system(size: 16, weight: .regular))
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.phone, perform: { _ in
                            viewModel.phoneValidation = true
                            if !viewModel.phone.isEmpty {
                                viewModel.phone = viewModel.phone.formatPhoneNumber()
                            }
                        })
                    }
                    .padding()
                }
                .background(viewModel.phoneValidation ? Color.inputBackgroundColor : Color.alertFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Group {
                    VStack(alignment: .leading) {
                        if !viewModel.email.isEmpty {
                            Text("Почта")
                                .foregroundStyle(Color.textFieldDescriptionTextColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                        TextField("Почта", text: $viewModel.email, onEditingChanged: { (isBegin) in
                            if !isBegin {
                                if viewModel.isValidEmail(viewModel.email) {
                                    viewModel.emailValidation = true
                                } else {
                                    viewModel.emailValidation = false
                                }
                            }
                        })
                        .font(.system(size: 16, weight: .regular))
                        .keyboardType(.emailAddress)
                        .onChange(of: viewModel.email, perform: { _ in
                            viewModel.emailValidation = true
                        })
                        
                    }
                    .padding()
                }
                .background(viewModel.emailValidation ? Color.inputBackgroundColor : Color.alertFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.descriptionTextColor)
            }.padding()
        }.background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CustomerInfoView(viewModel: BookingScreenViewModel())
}
