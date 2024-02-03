import SwiftUI

struct DateAndTime: View {
    @State private var selectedDate = Date()

    var body: some View {
        ZStack {
          

            VStack {
                VStack {
                    Text("Select Date")
                        .font(.headline)
                        .padding(.top)

                    DatePicker(" ", selection: $selectedDate, in: Date()..., displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                }

                Divider()

                VStack {
                    Text("Select Time")
                        .font(.headline)
                        .padding(.bottom)
                    Spacer()

                    DatePicker(" ", selection: $selectedDate, in: Date()..., displayedComponents: [.hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                }

                Spacer()

                Button("Done") {
                    // Add action for when the user is done selecting date and time
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
            .padding()
        }
    }
}

struct DateAndTime_Previews: PreviewProvider {
    static var previews: some View {
        DateAndTime()
    }
}
