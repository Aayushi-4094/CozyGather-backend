import SwiftUI

struct addTask: View {
    @State private var taskName: String = "Task name"
    @State private var venueAddress: String = "Address"
    @State private var price: String = "Price"
    @State private var selectedDate = Date()
    @State private var isDateAndTimeVisible = false
    @State private var isConfirmationVisible = false // Add this state variable

    var body: some View {
        NavigationView {
            VStack {
                Text("Create Task")
                    .font(.largeTitle)
                    .bold()
                    .padding()

            // Event Name
            TextField("Task", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Venue Address
            Text("Venue Address")
                .font(.headline)
                .padding(.top)

            TextField("Address", text: $venueAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Price
            Text("Price")
                .font(.headline)
                .padding(.top)

            TextField("Price", text: $price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Date and Time
            Text("Date and Time")
                .font(.headline)
                .padding(.top)

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

            struct addTask_Previews: PreviewProvider {
                static var previews: some View {
                    addTask()
                }
            }
