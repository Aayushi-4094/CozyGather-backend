import SwiftUI

struct DateAndTime: View {
    @Binding var selectedDate: Date
    var onDateSelected: (Date) -> Void

    var body: some View {
        VStack(spacing: 20) {
            // Select Date
            VStack {
                Text("Select Date")
                    .font(.headline)
                
                DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            
            Divider()
            
            // Select Time
            VStack {
                Text("Select Time")
                    .font(.headline)
                
                DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: [.hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            
            Spacer()
            
            // Done Button
            Button("Done") {
                onDateSelected(selectedDate)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
        }
        .padding()
    }
}

struct DateAndTime_Previews: PreviewProvider {
    static var previews: some View {
        DateAndTime(selectedDate: .constant(Date()), onDateSelected: { _ in })
    }
}
