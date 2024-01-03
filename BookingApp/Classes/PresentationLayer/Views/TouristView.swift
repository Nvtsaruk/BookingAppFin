import SwiftUI

struct TouristView: View {
    
    @ObservedObject var viewModel: BookingScreenViewModel
    
    var touristNumber: String
    var index: Int
    @State var collapsed: Bool = true
    @State var nameEditing: Bool = true
    @State var surnameEditing: Bool = true
    @State var birthEditing: Bool = true
    @State var citizenshipEditing: Bool = true
    @State var passportNumberEditing: Bool = true
    @State var passportValidityEditing: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Text("\(touristNumber) турист ")
                    .font(.system(size: 22, weight: .medium))
                Spacer()
                Button{
                    collapsed = !collapsed
                }label: {
                    if collapsed {
                        Image(systemName: "chevron.up")
                    } else {
                        Image(systemName: "chevron.down")
                    }
                }
                .frame(width:32, height: 32)
                .background(Color.showHideButtonColor)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            .padding()
            if !collapsed {
                Group {
                    VStack(alignment: .leading) {
                        if !viewModel.touristsArray[index].name.isEmpty {
                            Text("Имя")
                                .foregroundStyle(Color.textFieldDescriptionTextColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                        TextField("Имя", text: $viewModel.touristsArray[index].name, onEditingChanged: { (isBegin) in
                            if !isBegin {
                                viewModel.setValidity(index: index, key: "nameValidation", value: viewModel.isValid(name: viewModel.touristsArray[index].name))
                                nameEditing = false
                            } else {
                                nameEditing = true
                            }
                        })
                        .font(.system(size: 16, weight: .regular))
                        .keyboardType(.emailAddress)
                    }
                    .padding()
                }
                .background((viewModel.checkValidation(index: index, key: "nameValidation") || nameEditing) ? Color.inputBackgroundColor : Color.alertFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                Group {
                    VStack(alignment: .leading) {
                        if !viewModel.touristsArray[index].surname.isEmpty {
                            Text("Фамилия")
                                .foregroundStyle(Color.textFieldDescriptionTextColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                        TextField("Фамилия", text: $viewModel.touristsArray[index].surname, onEditingChanged: { (isBegin) in
                            if !isBegin {
                                viewModel.setValidity(index: index, key: "surnameValidation", value: viewModel.isValid(name: viewModel.touristsArray[index].surname))
                                surnameEditing = false
                            } else {
                                surnameEditing = true
                            }
                        })
                        .font(.system(size: 16, weight: .regular))
                        .keyboardType(.emailAddress)
                    }
                    .padding()
                }
                .background((viewModel.checkValidation(index: index, key: "surnameValidation") || surnameEditing) ? Color.inputBackgroundColor : Color.alertFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                Group {
                    VStack(alignment: .leading) {
                        if !viewModel.touristsArray[index].birth.isEmpty {
                            Text("Дата рождения")
                                .foregroundStyle(Color.textFieldDescriptionTextColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                        TextField(!viewModel.touristsArray[index].birth.isEmpty ? "Дата рождения" : "ДД/ММ/ГГГГ", text: $viewModel.touristsArray[index].birth, onEditingChanged: { (isBegin) in
                            if !isBegin {
                                viewModel.setValidity(index: index, key: "birthValidation", value: viewModel.isValidDate(dateToCheck: viewModel.touristsArray[index].birth))
                                birthEditing = false
                            } else {
                                birthEditing = true
                            }
                        })
                        .font(.system(size: 16, weight: .regular))
                        .onChange(of: viewModel.touristsArray[index].birth, perform: { _ in
                            if !viewModel.touristsArray[index].birth.isEmpty {
                                viewModel.touristsArray[index].birth = viewModel.touristsArray[index].birth.formatDate()
                            }
                        })
                    }
                    .padding()
                }
                .background((viewModel.checkValidation(index: index, key: "birthValidation") || birthEditing) ? Color.inputBackgroundColor : Color.alertFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                Group {
                    VStack(alignment: .leading) {
                        if !viewModel.touristsArray[index].citizenship.isEmpty {
                            Text("Гражданство")
                                .foregroundStyle(Color.textFieldDescriptionTextColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                        TextField("Гражданство", text: $viewModel.touristsArray[index].citizenship, onEditingChanged: { (isBegin) in
                            if !isBegin {
                                viewModel.setValidity(index: index, key: "citizenshipValidation", value: viewModel.isValid(name: viewModel.touristsArray[index].citizenship))
                                citizenshipEditing = false
                            } else {
                                citizenshipEditing = true
                            }
                        })
                        .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                }
                .background((viewModel.checkValidation(index: index, key: "citizenshipValidation") || citizenshipEditing) ? Color.inputBackgroundColor : Color.alertFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                Group {
                    VStack(alignment: .leading) {
                        if !viewModel.touristsArray[index].passportNumber.isEmpty {
                            Text("Номер загранпаспорта")
                                .foregroundStyle(Color.textFieldDescriptionTextColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                        TextField("Номер загранпаспорта", text: $viewModel.touristsArray[index].passportNumber, onEditingChanged: { (isBegin) in
                            if !isBegin {
                                if viewModel.touristsArray[index].passportNumber.count < 9 {
                                    viewModel.setValidity(index: index, key: "passportNumberValidation", value: false)
                                } else {
                                    viewModel.setValidity(index: index, key: "passportNumberValidation", value: true)
                                }
                                passportNumberEditing = false
                            } else {
                                passportNumberEditing = true
                            }
                        })
                        .font(.system(size: 16, weight: .regular))
                        .onChange(of: viewModel.touristsArray[index].passportNumber, perform: { _ in
                            if !viewModel.touristsArray[index].passportNumber.isEmpty {
                                viewModel.touristsArray[index].passportNumber = viewModel.touristsArray[index].passportNumber.formatPassNumber()
                            }
                        })
                        
                    }
                    .padding()
                }
                .background((viewModel.checkValidation(index: index, key: "passportNumberValidation") || passportNumberEditing) ? Color.inputBackgroundColor : Color.alertFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                Group {
                    VStack(alignment: .leading) {
                        if !viewModel.touristsArray[index].passportValidityPeriod.isEmpty {
                            Text("Срок действия загранпаспорта")
                                .foregroundStyle(Color.textFieldDescriptionTextColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                        TextField(!viewModel.touristsArray[index].passportValidityPeriod.isEmpty ? "Срок действия загранпаспорта" : "ДД/ММ/ГГГГ", text: $viewModel.touristsArray[index].passportValidityPeriod, onEditingChanged: { (isBegin) in
                            if !isBegin {
                                viewModel.setValidity(index: index, key: "passportValidityPeriodValidation", value: viewModel.isValidDate(dateToCheck: viewModel.touristsArray[index].passportValidityPeriod))
                                passportValidityEditing = false
                            } else {
                                passportValidityEditing = true
                            }
                        })
                        .font(.system(size: 16, weight: .regular))
                        .onChange(of: viewModel.touristsArray[index].passportValidityPeriod, perform: { _ in
                            if !viewModel.touristsArray[index].passportValidityPeriod.isEmpty {
                                viewModel.touristsArray[index].passportValidityPeriod = viewModel.touristsArray[index].passportValidityPeriod.formatDate()
                            }
                        })
                    }
                    .padding()
                }
                .background((viewModel.checkValidation(index: index, key: "passportValidityPeriodValidation") || passportValidityEditing) ? Color.inputBackgroundColor : Color.alertFieldColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


#Preview {
    TouristView(viewModel: BookingScreenViewModel(), touristNumber: "Первый", index: 0, collapsed: false, nameEditing: false, surnameEditing: false, birthEditing: false, citizenshipEditing: false, passportNumberEditing: false, passportValidityEditing: false)
}
