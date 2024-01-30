// SignUpPage.swift
import SwiftUI

struct SignUpPage: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var phoneNumber = ""
    @State private var countryCode = ""
    @State private var isSignInPageActive = false // Add state to control navigation
// Add state to control navigation
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 30) {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    VStack(spacing: 15) {
                        HStack {
                            Image("name")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.leading, 10)
                                .foregroundColor(Color(hex: "747688"))
                            
                            TextField("Full Name", text: $fullName)
                                .padding(.vertical, 12)
                                .padding(.horizontal)
                                .background(Color.white)
                                .cornerRadius(5.0)
                        }
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .shadow(radius: 2.0)
                        
                        HStack {
                                                Image("email")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .padding(.leading, 10)
                                                    .foregroundColor(Color(hex: "747688"))
                                                
                                                TextField("Email", text: .constant(""))
                                                    .padding(.vertical, 12)
                                                    .padding(.horizontal)
                                                    .background(Color.white)
                                                    .cornerRadius(5.0)
                                            }
                                            .background(Color.white)
                                            .cornerRadius(5.0)
                                            .shadow(radius: 2.0)
                                            HStack {
                                                Image("Password")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .padding(.leading, 10)
                                                    .foregroundColor(Color(hex: "747688"))
                                                
                                                SecureField("Password", text: .constant("")) // Use SecureField for passwords
                                                    .padding(.vertical, 12)
                                                    .padding(.horizontal)
                                                    .background(Color.white)
                                                    .cornerRadius(5.0)
                                                
                                                Image("lock")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .padding(.trailing, 10)
                                                    .foregroundColor(Color(hex: "747688"))
                                            }
                                            .background(Color.white)
                                            .cornerRadius(5.0)
                                            .shadow(radius: 2.0)
                                            
                                            
                                            HStack {
                                                Image("Password")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .padding(.leading, 10)
                                                    .foregroundColor(Color(hex: "747688"))
                                                
                                                SecureField("Confirm Password", text: .constant("")) // Use SecureField for passwords
                                                    .padding(.vertical, 12)
                                                    .padding(.horizontal)
                                                    .background(Color.white)
                                                    .cornerRadius(5.0)
                                                
                                                Image("lock")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .padding(.trailing, 10)
                                                    .foregroundColor(Color(hex: "747688"))
                                            }
                                            .background(Color.white)
                                            .cornerRadius(5.0)
                                            .shadow(radius: 2.0)
                                            
                                            HStack {
                                                Image("phone")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .padding(.leading, 10)
                                                    .foregroundColor(Color(hex: "747688"))
                                                
                                                TextField("Phone Number", text: .constant("")) // Use SecureField for passwords
                                                    .padding(.vertical, 12)
                                                    .padding(.horizontal)
                                                    .background(Color.white)
                                                    .cornerRadius(5.0)
                                            }
                                            .background(Color.white)
                                            .cornerRadius(5.0)
                                            .shadow(radius: 2.0)
                                            
                                            
                        Button(action: {}) {
                            Text("SIGN UP")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(5.0)
                                .shadow(radius: 2.0)
                        }
                        
                        Text("OR")
                        
                        VStack(spacing: 15) {
                            Button(action: {}) {
                                HStack {
                                    Image("google_logo")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    
                                    Text("Sign Up with Google")
                                        .font(.subheadline)
                                }
                            }
                            
                            Button(action: {}) {
                                HStack {
                                    Image("apple_logo")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    
                                    Text("Sign Up with Apple")
                                        .font(.subheadline)
                                }
                            }
                        }
                        .foregroundColor(.black)
                        
                        HStack {
                            Text("Already have an account?")
                                .font(.subheadline)
                            
                            Button(action: {
                                withAnimation {
                                    isSignInPageActive.toggle()
                                }
                            }) {
                                Text("Sign In")
                                    .foregroundColor(.blue)
                                    .font(.subheadline)
                            }
                            .fullScreenCover(isPresented: $isSignInPageActive, content: {
                                SignInPage()
                            })
                            .transition(.move(edge: .trailing))
                        }
                    }
                    .padding()
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
