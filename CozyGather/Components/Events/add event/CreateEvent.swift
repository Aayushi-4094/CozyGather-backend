import SwiftUI

struct CreateEvent: View {
    @State private var eventName: String = "Event name"
    @State private var venueAddress: String = "Address"
    @State private var price: String = "Price"
    @State private var selectedDate = Date()
    @State private var isDateAndTimeVisible = false
    @State private var isConfirmationVisible = false
    @State private var isSelectCoHostVisible = false
    @State private var coHostName: String = "Cohost"
    @State private var eventDate = Date()
    @State private var showInvite = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Button(action: {
                            // Add action for the back button
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        
                        Spacer()
                        
                        Text("Create Event")
                            .font(.title2)
                            .foregroundColor(Color(.label))
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    
                    ZStack(alignment: .bottom) {
                        Image("nametheevent")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Event Name")
                            .font(.headline)
                            .padding(.leading)
                        
                        TextField("Event Name", text: $eventName)
                            .foregroundColor(.secondary)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Venue Address")
                            .font(.headline)
                            .padding(.leading)
                        
                        TextField("Venue Address", text: $venueAddress)
                            .foregroundColor(.secondary)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Price")
                            .font(.headline)
                            .padding(.leading)
                        
                        TextField("Price", text: $price)
                            .foregroundColor(.secondary)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    Button(action: {
                        /* Add co-host functionality */
                        isSelectCoHostVisible.toggle()
                    }) {
                        HStack {
                            Image(systemName: "person.fill")
                            Text("Add a Co-host")
                                .font(.headline)
                            Spacer()
                            Text("Sam Aiden as the co-host")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    }
                    .sheet(isPresented: $isSelectCoHostVisible) {
                        SelectCoHost()
                    }
                    
                    Button(action: {
                        /* Add date and time functionality */
                        isDateAndTimeVisible.toggle()
                    }) {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Add date and time")
                                .font(.headline)
                            Spacer()
                            Text("Date and time")
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    }
                    .sheet(isPresented: $isDateAndTimeVisible) {
                        DateAndTime()
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Location")
                            .font(.headline)
                            .padding(.leading)
                        
                        HStack {
                            Image(systemName: "mappin")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            TextField("Mapping", text: .constant(""))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Budget")
                            .font(.headline)
                            .padding(.leading)
                        
                        HStack {
                            Image(systemName: "dollarsign")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            TextField("Budget", text: .constant(""))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    
                    VStack {
                        Button(action: { self.showInvite.toggle() }) {
                            HStack {
                                Text("Generate e-Invite")
                                    .font(.headline)
                                Image(systemName: "arrow.clockwise.circle")
                            }
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                        }
                        .sheet(isPresented: $showInvite) {
                            // Your e-invite view goes here
                            ScrollView {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                    ForEach(0..<5) { _ in
                                        Image("invite")
                                            .resizable()
                                            .frame(width: 150, height: 250) // Adjust the size as needed
                                            .cornerRadius(10)
                                            .shadow(radius: 1)
                                    }
                                }
                                .padding()
                            }

                        }
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
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding()
                            .shadow(radius: 1)
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true) // Hide navigation bar
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Toolbar()
                        .position(CGPoint(x: 180, y: 40))
                }
            }
        }
    }
}

struct CreateEvent_Previews: PreviewProvider {
    static var previews: some View {
        CreateEvent()
    }
}
