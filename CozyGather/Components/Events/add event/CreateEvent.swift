import SwiftUI

struct CreateEvent: View {
    @State private var eventName: String = "Event name"
    @State private var venueAddress: String = "Address"
    @State private var price: String = "Price"
    @State private var selectedDate = Date()
    @State private var isDateAndTimeVisible = false
    @State private var isConfirmationVisible = false // Add this state variable

    var body: some View {
        NavigationView {
            VStack {
                Text("Create Event")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Event Name")
                    .bold()
                    .font(.system(size: 20))
                    .position(CGPoint(x: 60.0, y: 10.0))

            // Event Name
            TextField("Event Name", text: $eventName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350, height: 100)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

            // Venue Address
                Text("Venue")
                    .bold()
                    .font(.system(size: 20))
                    .position(CGPoint(x: 30.0, y: 10.0))


            TextField("Address", text: $venueAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 100)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

            // Price
                Text("Price")
                    .bold()
                    .font(.system(size: 20))
                    .position(CGPoint(x: 30.0, y: 10.0))


            TextField("Price", text: $price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350, height: 100)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

            // Date and Time
                Text("Date and Time")
                    .bold()
                    .font(.system(size: 20))
                    .position(CGPoint(x: 75.0, y: 10.0))
            HStack {
                Button(action: {
                    isDateAndTimeVisible.toggle()
                }) {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $isDateAndTimeVisible) {
                    DateAndTime()
                }

                TextField("Select Date and Time", value: $selectedDate, formatter: dateFormatter)
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
                NavigationLink(destination: ConfirmEvent(), isActive: $isConfirmationVisible) {
                                    EmptyView()
                                }
                                .hidden()

                                Button("Create Event") {
                                    isConfirmationVisible = true
                                }
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()

                                Spacer() // Leave space for the navigation control bar
                            }
            .padding()
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                Toolbar()
                                    .position(CGPoint(x: 180, y: 40))
                            }
                        }
                    }
                }

                private let dateFormatter: DateFormatter = {
                    let formatter = DateFormatter()
                    formatter.dateStyle = .medium
                    formatter.timeStyle = .short
                    return formatter
                }()
            }

            struct CreateEvent_Previews: PreviewProvider {
                static var previews: some View {
                    CreateEvent()
                }
            }
