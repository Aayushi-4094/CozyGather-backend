import SwiftUI
import Firebase
import FirebaseAuth

struct User: Identifiable {
    var id: String
    var fullName: String
    var userName: String
    // Add other user properties as needed
}

struct SignUpPage: View {
    @State private var color = Color.black.opacity(0.7)
    @State private var fullName = ""
    @State private var userName = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var pass = ""
    @State private var repass = ""
    @State private var visible = false
    @State private var revisible = false
    @State private var isSignInPageActive = false
    @State private var alert = false
    @State private var error = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(self.color)
                .padding(.top, 35)

            TextField("Full name", text: self.$fullName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(self.fullName != "" ? Color.blue : self.color, lineWidth: 2))
                .padding(.horizontal, 20)
                .frame(height: 50)
                .autocapitalization(.words)
                .keyboardType(.default)

            TextField("User Name", text: self.$userName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(self.userName != "" ? Color.blue : self.color, lineWidth: 2))
                .padding(.horizontal, 20)
                .frame(height: 50)
                .autocapitalization(.none)
                .keyboardType(.default)

            TextField("Phone Number", text: self.$phoneNumber)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(self.phoneNumber != "" ? Color.blue : self.color, lineWidth: 2))
                .padding(.horizontal, 20)
                .frame(height: 50)
                .keyboardType(.phonePad)

            TextField("Email", text: self.$email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(self.email != "" ? Color.blue : self.color, lineWidth: 2))
                .padding(.horizontal, 20)
                .frame(height: 50)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            HStack(spacing: 15) {
                VStack {
                    if self.visible {
                        TextField("Password", text: self.$pass)
                    } else {
                        SecureField("Password", text: self.$pass)
                    }
                }
                Button(action: {
                    self.visible.toggle()
                }) {
                    Image(systemName: self.visible ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(self.color)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(self.pass != "" ? Color.blue : self.color, lineWidth: 2))
            .padding(.horizontal, 20)
            .frame(height: 50)

            HStack(spacing: 15) {
                VStack {
                    if self.revisible {
                        TextField("Password", text: self.$repass)
                    } else {
                        SecureField("Password", text: self.$repass)
                    }
                }
                Button(action: {
                    self.revisible.toggle()
                }) {
                    Image(systemName: self.revisible ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(self.color)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(self.repass != "" ? Color.blue : self.color, lineWidth: 2))
            .padding(.horizontal, 20)
            .frame(height: 50)

            Button(action: {
                self.signUp()
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .fullScreenCover(isPresented: $isSignInPageActive) {
                SignInPage()
            }

            HStack {
                Text("Already have an account?")
                Button(action: {
                    withAnimation {
                        isSignInPageActive.toggle()
                    }
                }) {
                    Text("Sign In")
                        .foregroundColor(.blue)
                        .font(.subheadline)
                }
                .fullScreenCover(isPresented: $isSignInPageActive) {
                    SignInPage()
                }
            }
            .padding(.top)
        }
    }

    func signUp() {
            if pass == repass {
                Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
                    if let error = error {
                        self.error = error.localizedDescription
                        self.alert.toggle()
                    } else {
                        let newUser = User(id: result?.user.uid ?? "", fullName: self.fullName, userName: self.userName)
                        // Store the user information in Firestore or another database
                        // Replace the placeholder comment with the actual code
                        FirestoreManager.shared.createUser(newUser)
                        print("Sign-up successful")
                        isSignInPageActive.toggle()
                    }
                }
            } else {
                self.error = "Passwords do not match"
                self.alert.toggle()
            }
        }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
