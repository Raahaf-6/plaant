import SwiftUI

struct SetReminderView: View {
    @ObservedObject var reminderModel: PplantReminderModel
    @State private var taskName: String = ""
    @State private var selectedRoom: String = "Bedroom"
    @State private var selectedLight: String = "Full Sun"
    @State private var selectedWateringDays: String = "Every day"
    @State private var selectedWater: String = "20-50 ml"
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        HStack {
                            Text("Plant Name")
                            TextField("Pothos", text: $taskName)
                                .textFieldStyle(PlainTextFieldStyle()) // Use plain style
                                .padding(8) // Add some padding
                                .background(Color.clear) // Remove the background box
                                .cornerRadius(5)
                                .autocapitalization(.sentences) // Set to none to prevent auto-capitalization

                        }
                        .padding(.vertical, 4)
                    }

                    Section {
                        PickerRow(icon: "location", title: "Room", selection: $selectedRoom, options: ["Living Room", "Bedroom", "Kitchen", "Bathroom", "Balcony"])
                        PickerRow(icon: "sun.max", title: "Light", selection: $selectedLight, options: ["Full Sun", "Partial Sun", "Low Light"])
                    }

                    Section {
                        PickerRow(icon: "drop", title: "Watering Days", selection: $selectedWateringDays, options: ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"])
                        PickerRow(icon: "drop", title: "Water", selection: $selectedWater, options: ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"])
                    }
                }
                .navigationTitle("Set Reminder")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: Button("Cancel") {
                        dismiss() // Dismiss the sheet
                    }
                    .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255)),
                    trailing: Button("Save") {
                        saveReminder()
                    }
                    .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255))
                )
            }
        }
    }

    private func saveReminder() {
    let newReminder = PplantReminder( 
    name: taskName,
    room: selectedRoom,
    light: selectedLight,
    wateringDays: selectedWateringDays,
    waterAmount: selectedWater
    )
        reminderModel.addReminder(newReminder) // Save the new reminder
        dismiss() // Close the view
    }
}
