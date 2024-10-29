import SwiftUI

struct EDPlant: View {
    @ObservedObject var reminderModel: PplantReminderModel // Add reminderModel here
    var reminder: PplantReminder?

    @Environment(\.dismiss) var dismiss
    @State private var taskName: String = ""
    @State private var selectedRoom: String = "Bedroom"
    @State private var selectedLight: String = "Full Sun"
    @State private var selectedWateringDays: String = "Every day"
    @State private var selectedWater: String = "20-50 ml"
    
    var body: some View {
        NavigationView {
            List {
                // Text Field for Plant Name
                Section {
                    HStack {
                        Text("Plant Name")
                            .foregroundColor(.white)
                        TextField("Pothos", text: $taskName)
                            .frame(height: 36)
                    }
                    .padding(.vertical, 4)
                }

                // First Section: Room and Light
                Section {
                    PickerRowView(icon: "location", title: "Room", selection: $selectedRoom, options: ["Living Room", "Bedroom", "Kitchen", "Bathroom", "Balcony"])
                    
                    PickerRowView(icon: "sun.max", title: "Light", selection: $selectedLight, options: ["Full Sun", "Partial Sun", "Low Light"])
                }

                // Second Section: Watering Days and Water
                Section {
                    PickerRowView(icon: "drop", title: "Watering Days", selection: $selectedWateringDays, options: ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"])
                    PickerRowView(icon: "drop", title: "Water", selection: $selectedWater, options: ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"])
                }

                // Delete Button Section
                Section {
                    Button(action: {
                        // Action to delete the reminder
                        // Implement deletion logic as needed
                    }) {
                        Text("Delete Reminder")
                            .foregroundColor(.reeed)
                            .frame(width: 300, height: 11)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .listRowBackground(Color.clear) // Make the background clear for this row
            }
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255)),
                trailing: Button("Save") {
                    saveReminder()
                }
                .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255))
            )
        }
        .navigationBarBackButtonHidden(true)
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
        dismiss() // Dismiss the view after saving
    }
}

struct PickerRowView: View {
    var icon: String
    var title: String
    @Binding var selection: String
    var options: [String]

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
            Picker(selection: $selection, label: Text("")) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                        .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                        .tag(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .accentColor(.gray)
        }
    }
}

struct EDPlant_Previews: PreviewProvider {
    static var previews: some View {
        EDPlant(reminderModel: PplantReminderModel()) // Pass reminderModel here
    }
}
