import SwiftUI

struct CreateEvent: View {
    @State private var eventName: String = "Event name"
    @State private var venueAddress: String = "Address"
    @State private var price: String = "Price"
    @State private var selectedDate = Date()
    @State private var isDateAndTimeVisible = false
    @State private var isEventDetailViewVisible = false
    @State private var isSelectCoHostVisible = false
    @State private var eventDate = Date()
    @State private var showInvite = false
    @Binding var selectedCoHosts: [String]
    @State private var searchText: String = ""
    @State private var isConfirmEventVisible = false
    @State private var isCoHostSheetPresented = false // Add this state variable

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Title Section
                    HStack {
                        Text("Create Event")
                            .font(.title)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                    }
                    .cornerRadius(10)

                    // Image Section
                    Image("nametheevent")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .shadow(radius: 5)

                    // Event Name Section
                    SectionBox {
                        HStack {
                            Text("Event Name")
                                .font(.headline)
                                .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))

                            Spacer()

                            TextField("Event Name", text: $eventName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                    }

                    // Co-host Section
                    SectionBox {
                                            HStack {
                                                Text("Co-host")
                                                    .font(.headline)
                                                    .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                                                Spacer()

                                                Button(action: {
                                                    isCoHostSheetPresented.toggle()
                                                }) {
                                                    Text("Select Co-host")
                                                        .foregroundColor(.primary)
                                                        .padding()
                                                        .background(Color.white)
                                                        .cornerRadius(10)
                                                        .shadow(radius: 1)
                                                }
                                                .sheet(isPresented: $isCoHostSheetPresented) {
                                                    SelectCoHost(onCoHostsSelected: { selectedCoHosts in
                                                        self.selectedCoHosts = selectedCoHosts
                                                        isCoHostSheetPresented = false // Dismiss the sheet here
                                                    })
                                                }
                                            }
                                        }

                    }

                    // Date and Time Section
                    SectionBox {
                        HStack {
                            Text("Date and Time")
                                .font(.headline)
                                .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                            Spacer()

                            Button(action: {
                                isDateAndTimeVisible.toggle()
                            }) {
                                Text("Select Date and Time")
                                    .foregroundColor(.primary)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 1)
                            }
                            .sheet(isPresented: $isDateAndTimeVisible) {
                                DateAndTime(selectedDate: $selectedDate) { date in
                                    // Handle Date and Time selection
                                    // Update the selected date
                                    selectedDate = date
                                }
                            }

                        }
                    }

                    // Location Section
                    SectionBox {
                        HStack {
                            Text("Location")
                                .font(.headline)
                                .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                            Spacer()

                            TextField("Location", text: $venueAddress)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                    }

                    // Budget Section
                    SectionBox {
                        HStack {
                            Text("Budget")
                                .font(.headline)
                                .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                            Spacer()

                            TextField("Budget", text: $price)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                    }

                    // Generate e-Invite Section
                    SectionBox {
                        HStack {
                            Text("Generate e-Invite")
                                .font(.headline)
                                .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                            Spacer()

                            Button(action: {
                                self.showInvite.toggle()
                            }) {
                                Text("Generate")
                                    .foregroundColor(.primary)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 1)
                            }
                            .sheet(isPresented: $showInvite) {
                                ScrollView {
                                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                        ForEach(0..<5) { _ in
                                            Image("invite")
                                                .resizable()
                                                .frame(width: 150, height: 250)
                                                .cornerRadius(10)
                                                .shadow(radius: 1)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }

                    // Confirm Button Section
                Button(action: {
                    // Handle the logic to confirm the event
                }) {
                    Text("Confirm")
                        .foregroundColor(Color(red: 150/225, green: 100/225, blue: 200/225))
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 82/225, green: 72/255, blue: 159/255))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(radius: 1)
                }

                Spacer()
            }
            .padding()
        }
        .background(Color(red: 250/225, green: 244/255, blue: 250/255))
        .navigationBarHidden(true)
    }
}


struct SectionBox<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
                .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

struct CreateEvent_Previews: PreviewProvider {
    static var previews: some View {
        CreateEvent(selectedCoHosts: .constant([]))
    }
}
