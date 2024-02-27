import SwiftUI


struct FilterScreen: View {
    var body: some View {
        VStack {
            Text("Filter")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            FilterOptionsView()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding()
    }
}


struct VFilterOptionsView: View {
    var body: some View {
        VStack {
            HStack {
                VFilterOptionButtonView(label: "Completed orders", icon: "checkmark.circle.fill")
                VFilterOptionButtonView(label: "Pending orders", icon: "clock.fill")
            }
            .padding(.bottom)
            
            VFilterDateSelectionView()
            
            VFilterLocationSelectionView()
            
//            VFilterCategorySelectionView()
            
            VFilterPriceRangeView()
            
            VFilterActionButtonsView()
        }
        .padding()
    }
}

struct VFilterOptionButtonView: View {
    var label: String
    var icon: String
    
    var body: some View {
        Button(action: {}) {
            VStack {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text(label)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        //.background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}



struct VFilterDateSelectionView: View {
    var body: some View {
        HStack {
//            DateSelectionButtonView(label: "Today")
//            DateSelectionButtonView(label: "Tomorrow")
            Text("Date")
                .font(.caption)
            Spacer()
            VDateSelectionButtonView(label: "Select from Calendar")
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct VDateSelectionButtonView: View {
    var label: String
    
    var body: some View {
        Button(action: {}) {
            Text(label)
                .font(.caption)
                .foregroundColor(.blue)
        }
        
//        .padding()
//        .frame(maxWidth: .infinity)
//        .background(Color.gray.opacity(0.2))
//        .cornerRadius(10)
    }
}

struct VFilterLocationSelectionView: View {
    var body: some View {
        HStack {
            Text("Location")
                .font(.caption)
            Spacer()
            Text("Choose")
                .font(.caption)
                .foregroundColor(.blue)
            Image(systemName: "chevron.right")
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct VFilterPriceRangeView: View {
    @State private var lowerPrice = 20.0
    @State private var upperPrice = 100.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select price range")
                .font(.caption)
            HStack {
                Text("$\(Int(lowerPrice))")
                Slider(value: $lowerPrice, in: 0...upperPrice, step: 1.0)
                Text("$\(Int(upperPrice))")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct VFilterActionButtonsView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Text("RESET")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            Button(action: {}) {
                Text("APPLY")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
}
//struct VFilterCategorySelectionView: View {
//    var body: some View {
//        HStack {
//            Text("Categories")
//            Image("noti1")
//        }
//    }
//}

struct FilterScreen_Previews: PreviewProvider {
    static var previews: some View {
        FilterScreen1()
    }
}


