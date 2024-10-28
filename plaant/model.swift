
import Foundation
import Combine

struct PplantReminder: Identifiable, Codable, Equatable  {
    var id = UUID()
    var name: String
    var room: String
    var light: String
    var wateringDays: String
    var waterAmount: String
    var isCompleted: Bool = false // Add this property
    
}




//class PplantReminderModel: ObservableObject {
//    @Published var reminders: [PplantReminder] = []
//
//    func addReminder(_ reminder: PplantReminder) {
//        reminders.append(reminder)
//        saveReminders() // Save to persistent storage
//    }
//
//    private func saveReminders() {
//        // Save reminders to persistent storage
//    }
//
//    private func loadReminders() {
//        // Load reminders from persistent storage
//    }
//}

class PplantReminderModel: ObservableObject {
    @Published var reminders: [PplantReminder] = [] {
        didSet {
            saveReminders() // Automatically save whenever reminders change
        }
    }

    init() {
        loadReminders() // Load reminders on initialization
    }

    func addReminder(_ reminder: PplantReminder) {
        reminders.append(reminder)
    }

    private func saveReminders() {
        if let encoded = try? JSONEncoder().encode(reminders) {
            UserDefaults.standard.set(encoded, forKey: "reminders")
        }
    }

    private func loadReminders() {
        if let data = UserDefaults.standard.data(forKey: "reminders"),
           let decoded = try? JSONDecoder().decode([PplantReminder].self, from: data) {
            reminders = decoded
        }
    }
}










