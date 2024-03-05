//
//  FirestoreManager_createuser.swift
//  CozyGather
//
//  Created by user2 on 03/03/24.
//

import FirebaseFirestore

class FirestoreManager {
    static let shared = FirestoreManager()

    private let db = Firestore.firestore()

    func createUser(_ user: User) {
        // Replace "users" with your actual Firestore collection name
        db.collection("users").document(user.id).setData([
            "fullName": user.fullName,
            "userName": user.userName,
            
            // Add other user properties as needed
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(user.id)")
            }
        }
    }
    
    
    func createEvent(_ event: Event) {
        // Replace "events" with your actual Firestore collection name for events
        db.collection("events").addDocument(data: [
            "eventName": event.eventName,
            "venueAddress": event.venueAddress,
            "price": event.price,
            "selectedDate": Timestamp(date: event.selectedDate), // Convert Date to Timestamp
            "selectedCoHosts": event.selectedCoHosts,
            // Add other event properties as needed
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Event added to Firestore successfully")
            }
        }
    }

    // Add additional functions as needed for fetching user information
}


