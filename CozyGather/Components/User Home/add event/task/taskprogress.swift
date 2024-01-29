import SwiftUI

struct TaskProgress: View {
    @State private var isTaskSelected = false
    @State private var isAddSelected = false
    @State private var isCompletedSelected = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        // Add action for the back button
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.blue)
                    }.padding(.leading, 16)

                    Label("Tasks", systemImage: "")
                        .font(Font.custom("AirbnbCereal_W_Md", size: 24))
                        .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))

                    Spacer()
                }
                .background(Color.white)
                .navigationBarHidden(true)

                HStack(spacing: 20) {
                    Toggle(isOn: $isTaskSelected) {
                        Text("Task")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .toggleStyle(CustomToggleStyle())

                    Toggle(isOn: $isAddSelected) {
                        Text("Add")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .toggleStyle(CustomToggleStyle())

                    Toggle(isOn: $isCompletedSelected) {
                        Text("Completed")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .toggleStyle(CustomToggleStyle())
                }
                .padding(.top, 20)
                .padding(.horizontal)

                VStack(spacing: 20) {
                    NavigationLink(destination: TaskView(), isActive: $isTaskSelected) {
                        EmptyView()
                    }

                    NavigationLink(destination: AddView(), isActive: $isAddSelected) {
                        EmptyView()
                    }

                    NavigationLink(destination: CompletedView(), isActive: $isCompletedSelected) {
                        EmptyView()
                    }

                    Box(imageName: "vendr3", date: "January 25, 2024", description: "Hi.", timeButtonText: "View")
                        .frame(width: 400, height: 100)

                    Box(imageName: "vendr4", date: "February 2, 2024", description: "Hello.", timeButtonText: "View")
                        .frame(width: 400, height: 100)
                }
                .padding()
                .background(Color.white)
                .frame(maxWidth: .infinity)
                .position(x: UIScreen.main.bounds.width / 2, y: -220)
            }
        }
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            Text(configuration.isOn ? "On" : "Off")
                .padding()
                .foregroundColor(.white)
                .background(configuration.isOn ? Color.blue : Color.gray)
                .cornerRadius(8)
        }
    }
}

struct TaskView: View {
    var body: some View {
        Text("Task View")
    }
}

struct AddView: View {
    var body: some View {
        Text("Add View")
    }
}

struct CompletedView: View {
    var body: some View {
        Text("Completed View")
    }
}



struct TaskProgress_Previews: PreviewProvider {
    static var previews: some View {
        TaskProgress()
    }
}

