// ThirdView.swift
import SwiftUI

struct ThirdScreen: View {
    var body: some View {
        VStack {
            Text("Choose your Profile")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            Spacer()

            HStack(spacing: 0) {
                VStack {
                    Button(action: {
                        // Add action for the Supplier button
                        print("Supplier Button Tapped")
                    }) {
                        Image("supplier_logo") // Replace with the actual image name for the supplier
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                            .cornerRadius(10)
                    }

                    Text("Supplier")
                        .font(.subheadline)
                        .padding(.top, 5)
                }

                Divider()

                VStack {
                    Button(action: {
                        // Add action for the User button
                        print("User Button Tapped")
                    }) {
                        Image("user_logo") // Replace with the actual image name for the user
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                            .cornerRadius(10)
                    }

                    Text("User")
                        .font(.caption)
                        .padding(.top, 5)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)

            Spacer()
        }
        .navigationBarHidden(true)
    }
}

