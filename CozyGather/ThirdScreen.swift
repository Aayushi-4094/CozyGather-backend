// ThirdScreen.swift
import SwiftUI

struct ThirdScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose your Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                Spacer()

                HStack(spacing: 0) {
                    VStack {
                        NavigationLink(destination: SignUpPage()) { // Change destination to SignUpPage
                            Image("supplier_logo")
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
                        NavigationLink(destination: SignUpPage()) { // Change destination to SignUpPage
                            Image("user_logo")
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
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
    }
}
