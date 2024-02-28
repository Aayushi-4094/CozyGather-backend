////import SwiftUI
////
////struct taskview: View {
////    @State private var selectedTab: EventsTab = .upcoming
////    @State private var isAddingTask = false
////    @State private var newTaskImageName = ""
////    @State private var newTaskDescription = ""
////
////    enum EventsTab {
////        case upcoming, past, cancelled
////    }
////
////    var body: some View {
////        VStack(spacing: 20) {
////            HStack {
////                Spacer()
////                Spacer()
////
////
////                Label("Tasks", systemImage: "")
////                    .font(Font.custom("AirbnbCereal_W_Md", size: 24))
////                    .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
////                    .position(CGPoint(x: 170.0, y: 40.0))
////
////                Spacer()
////
////                Button(action: {
////                    isAddingTask = true
////                }) {
////                    Image(systemName: "plus")
////                        .font(.title)
////                        .foregroundColor(.blue)
////                }
////                .position(CGPoint(x: 150.0, y: 40.0))
////                .sheet(isPresented: $isAddingTask) {
////                    AddTaskView(imageName: $newTaskImageName, description: $newTaskDescription)
////                }
////            }
////            .background(Color.white)
////            .navigationBarHidden(true)
////
////
////
////
////            HStack(spacing: 20) {
////                CustomButton2(title: "All", isSelected: selectedTab == .upcoming) {
////                    selectedTab = .upcoming
////                }
////                .frame(width: 120)
////
////                CustomButton2(title: "Completed", isSelected: selectedTab == .past) {
////                    selectedTab = .past
////                }
////                .frame(width: 120)
////
////                CustomButton2(title: "Incomplete", isSelected: selectedTab == .cancelled) {
////                    selectedTab = .cancelled
////                }
////                .frame(width: 120)
////
////            }
////            .padding(.top, 20)
////            .padding(.horizontal)
////            .position(CGPoint(x: 190, y: -70))
////
////
////            Divider()
////                .background(Color.black)
////                .position(CGPoint(x: 180, y: -205))
////
////
////            VStack(spacing: 20) {
////                taskBox(imageName: "venrd1",  description: "hi")
////
////                Spacer()
////                taskBox(imageName: "venrd1",  description: "hi")
////            }
////            .padding()
////            .background(Color.white)
////            .padding(.top, 0)
////            .frame(maxWidth: .infinity)
////            .position(CGPoint(x: 190.0, y: -240.0))
////
////
////            Spacer() // Add spacer to push content to the top
////
////            Toolbar()
////        }
////        .edgesIgnoringSafeArea(.bottom) // Allow content to extend below safe area
////    }
////}
////
////
////struct CustomButton2: View {
////    var title: String
////    var isSelected: Bool
////    var action: () -> Void
////
////    var body: some View {
////        Button(action: action) {
////            Text(title)
////                .foregroundColor(isSelected ? .white : .black)
////                .padding()
////                .background(isSelected ? Color.blue : Color.white)
////                .cornerRadius(8)
////        }
////    }
////}
////
////struct AddTaskView: View {
////    @Binding var imageName: String
////    @Binding var description: String
////
////    var body: some View {
////        VStack {
////            TextField("Image Name", text: $imageName)
////                .padding()
////
////            TextField("Description", text: $description)
////                .padding()
////
////            Button("Add Task") {
////                // Add logic to create a new task instance with the provided data
////            }
////            .padding()
////        }
////        .padding()
////    }
////}
////
////struct taskBox: View {
////    var imageName: String
////
////    var description: String
////
////    var body: some View {
////        HStack {
////            Image(imageName) // Use the custom image name
////                .resizable()
////                .frame(width: 70, height: 70)
////                .aspectRatio(contentMode: .fill)
////                .clipShape(Circle())
////                .overlay(Circle().stroke(Color.white, lineWidth: 4))
////                .shadow(radius: 10)
////
////            Spacer()
////
////
////            Text(description)
////                .foregroundColor(.gray)
////
////
////
////        }
////
////    }
////}
////
////
////struct taskview_Previews: PreviewProvider {
////    static var previews: some View {
////        taskview()
////    }
////}
//
//
//import SwiftUI
//import UIKit
//
//struct taskview: View {
//    @State private var selectedTab: EventsTab = .upcoming
//    @State private var isAddingTask = false
//    @State private var newTaskDescription = ""
//
//    enum EventsTab {
//        case upcoming, past, cancelled
//    }
//
//    var body: some View {
//        VStack(spacing: 20) {
//            HStack {
//                Spacer()
//                Spacer()
//
//                Label("Tasks", systemImage: "")
//                    .font(Font.custom("AirbnbCereal_W_Md", size: 24))
//                    .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
//                    .position(CGPoint(x: 170.0, y: 40.0))
//
//                Spacer()
//
//                Button(action: {
//                    isAddingTask = true
//                }) {
//                    Image(systemName: "plus")
//                        .font(.title)
//                        .foregroundColor(.blue)
//                }
//                .position(CGPoint(x: 150.0, y: 40.0))
//            }
//            .background(Color.white)
//            .navigationBarHidden(true)
//
//            HStack(spacing: 20) {
//                CustomButton2(title: "All", isSelected: selectedTab == .upcoming) {
//                    selectedTab = .upcoming
//                }
//                .frame(width: 120)
//
//                CustomButton2(title: "Completed", isSelected: selectedTab == .past) {
//                    selectedTab = .past
//                }
//                .frame(width: 120)
//
//                CustomButton2(title: "Incomplete", isSelected: selectedTab == .cancelled) {
//                    selectedTab = .cancelled
//                }
//                .frame(width: 120)
//
//            }
//            .padding(.top, 20)
//            .padding(.horizontal)
//            .position(CGPoint(x: 190, y: -70))
//
//            Divider()
//                .background(Color.black)
//                .position(CGPoint(x: 180, y: -205))
//
//            VStack(spacing: 20) {
//                taskBox(imageName: "venrd1", description: "hi")
//
//                Spacer()
//
//                taskBox(imageName: "venrd1", description: "hi")
//            }
//            .padding()
//            .background(Color.white)
//            .padding(.top, 0)
//            .frame(maxWidth: .infinity)
//            .position(CGPoint(x: 190.0, y: -240.0))
//
//            Spacer() // Add spacer to push content to the top
//
//            Toolbar()
//        }
//        .edgesIgnoringSafeArea(.bottom) // Allow content to extend below safe area
//        .sheet(isPresented: $isAddingTask) {
//            AddTaskView(description: $newTaskDescription)
//        }
//    }
//}
//
//struct CustomButton2: View {
//    var title: String
//    var isSelected: Bool
//    var action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            Text(title)
//                .foregroundColor(isSelected ? .white : .black)
//                .padding()
//                .background(isSelected ? Color.blue : Color.white)
//                .cornerRadius(8)
//        }
//    }
//}
//
//struct taskBox: View {
//    var imageName: String
//    var description: String
//
//    var body: some View {
//        HStack {
//            Image(imageName) // Use the custom image name
//                .resizable()
//                .frame(width: 70, height: 70)
//                .aspectRatio(contentMode:.fill)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth:0.4))
//
//            Spacer()
//
//            Text(description)
//                .foregroundColor(.gray)
//
//        }
//
//    }
//}
//struct AddTaskView: View {
//    @Binding var description: String
//    @State private var selectedImage: UIImage?
//    @State private var isShowingImagePicker = false
//    @State private var taskBoxes: [taskBox] = []
//
//    var body: some View {
//        VStack {
//            if let image = selectedImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 100, height: 100)
//            } else {
//                Button("Select Image") {
////                    self.isShowingImagePicker = true
//                }
//            }
//
//            TextField("Description", text: $description)
//                .padding()
//
//            Button("Add Task") {
//                guard let image = selectedImage else { return }
//                let newTaskBox = taskBox(imageName: "customImageName", description: description)
//                taskBoxes.append(newTaskBox)
//            }
//            .padding()
//        }
////        .sheet(isPresented: $isShowingImagePicker) {
////            ImagePicker(selectedImage: $selectedImage)
////        }
//        .padding()
//    }
//}
//
////struct ImagePicker: UIViewControllerRepresentable {
////    @Binding var selectedImage: UIImage?
////    @Environment(\.presentationMode) var presentationMode
////
////    func makeUIViewController(context: Context) -> UIImagePickerController {
////        let picker = UIImagePickerController()
////        picker.delegate = context.coordinator
////        return picker
////    }
////
////    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
////
////    func makeCoordinator() -> Coordinator {
////        return Coordinator(parent: self)
////    }
////
////    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
////        let parent: ImagePicker
////
////        init(parent: ImagePicker) {
////            self.parent = parent
////        }
////
////        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
////            if let uiImage = info[.originalImage] as? UIImage {
////                parent.selectedImage = uiImage
////            }
////
////            parent.presentationMode.wrappedValue.dismiss()
////        }
////    }
////}
//struct taskview_Previews: PreviewProvider {
//    static var previews: some View {
//        taskview()
//    }
//}


import SwiftUI

struct taskview: View {
    
    @State private var presentTask = false
    @State private var showDate = false
    @State private var showTime = false
    @State private var showAlert = false
    @State private var newTaskTitle = ""
    @State private var newTaskDescription = ""
    @State private var selectedDate: Date = Date()
    @State private var selectedTime: Date = Date()
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedSegment, label: Text("")) {
                    Text("All").tag(0)
                    Text("Completed").tag(1)
                    Text("Incomplete").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List {
                    
                    TaskView()
                    TaskView()
                    
                        .navigationTitle("Your tasks")
                        .navigationBarItems(trailing: Button {
                            presentTask.toggle()
                        } label: {
                            Image(systemName: "plus")
                        })
                        .sheet(isPresented: $presentTask) {
                            NavigationView {
                                Form {
                                    Section(header: Text("Task Details")) {
                                        TextField("Title", text: $newTaskTitle)
                                        TextField("Description", text: $newTaskDescription)
                                    }
                                    
                                    Section(header: Text("Due Date")) {
                                        Toggle(isOn: $showDate) {
                                            Text("Include Date")
                                        }
                                        if showDate {
                                            DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                                        }
                                    }
                                    
                                    Section(header: Text("Due Date and Time")) {
                                        Toggle(isOn: $showTime) {
                                            Text("Include Time")
                                        }
                                        if showTime {
                                            DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                        }
                                    }
                                }
                                .navigationBarTitle("Add Task", displayMode: .inline)
                                .navigationBarItems(trailing: Button(action: {
                                    if newTaskTitle.isEmpty {
                                        showAlert = true
                                    } else {
                                        // Add task logic goes here
                                        presentTask.toggle()
                                        newTaskTitle = ""
                                        newTaskDescription = ""
                                        selectedDate = Date()
                                        selectedTime = Date()
                                    }
                                }) {
                                    Text("Add")
                                })
                                .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Error"), message: Text("Add Title for your task"))
                                }
                            }
                            .presentationDetents([.medium])
                        }
                }
            }
        }
    }
}

struct TaskView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer(minLength: 1)
            Text("Untitled Task")
                .font(.headline)
            
            Spacer(minLength: 1)
            
            Text("No description")
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer(minLength: 1)
            }
        }
    }

struct taskview_Previews: PreviewProvider {
    static var previews: some View {
        taskview()
    }
}
