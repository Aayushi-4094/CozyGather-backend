import SwiftUI

struct ConfirmEvent: View {
    @State private var isSelectCoHostVisible = false
    @State private var isDateAndTimeVisible = false
    @State private var coHostName: String = "Cohost"
    @State private var eventDate = Date()

    var body: some View {
        VStack {
            HStack {


                Spacer()

                Text("Confirm Event")
                    .font(Font.custom("AirbnbCereal_W_Md", size: 24))
                    .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
                    .padding(.bottom, 20)

                Spacer()
            }
            .padding()
            .background(Color.white)

            Image("nametheevent")
                .resizable()
                .frame(width: 390, height: 280)

            HStack {
                FilterButton(imageName: "person", label: "Select Co-Host", isSelected: false) {
                    isSelectCoHostVisible.toggle()
                }
                .sheet(isPresented: $isSelectCoHostVisible) {
                    SelectCoHost()
                }
            
                
                .padding()


                     

                TextField("Cohost", text: $coHostName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            .padding()

            HStack {
                FilterButton(imageName: "calendar", label: "Select Date and Time", isSelected: false) {
                    isDateAndTimeVisible.toggle()
                }
                .sheet(isPresented: $isDateAndTimeVisible) {
                    DateAndTime()
                }

                TextField("Select Date and Time", value: $eventDate, formatter: dateFormatter)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            .padding()

            HStack {
                Image(systemName: "location.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.5)
                            .foregroundColor(Color.gray.opacity(0.1)) // Set your desired color and opacity here
                    )
                Spacer()

                TextField("Location", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            .padding()

            Spacer()
            
            Button(action: {
                            // Add action for the Confirm button
                            // Handle the logic to confirm the event
                        }) {
                            Text("Confirm")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.purple)
                                .cornerRadius(10)
                                .padding()
                        }
        }
        .padding(.horizontal)
        
 
                
        
    }
    

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}

struct FilterButton: View {
    var imageName: String
    var label: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.title)
                .foregroundColor(isSelected ? .blue : .gray)
            Text(label)
                .foregroundColor(isSelected ? .blue : .black)
        }
        .padding()
        .background(isSelected ? Color.blue.opacity(0.2) : Color.clear)
        .cornerRadius(10)
        .onTapGesture(perform: action)
        
        
    }
}


struct ConfirmEvent_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmEvent()
    }
}
