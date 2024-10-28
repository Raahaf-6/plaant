import SwiftUI

struct RemindersView: View {
    @ObservedObject var reminderModel: PplantReminderModel
    @State private var showCompletedView = false

    var body: some View {
        VStack {
            // Title of the navigation
            Text("My Plants 🌱")
                .font(.largeTitle)
                .fontWeight(.bold)
               // .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, 140)

            // Thin gray rectangle
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 1)

            // Today label
            Text("Today")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 200, height: 100)
                .padding(.trailing, 250)

            List {
                ForEach(reminderModel.reminders) { reminder in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(reminder.isCompleted ? .greeen : .gray)
                                .onTapGesture {
                                    toggleCompletion(for: reminder)
                                }

                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "location")
                                        .foregroundColor(.gray)
                                    Text("\(reminder.room)")
                                        .foregroundColor(Color.gray)
                                }
                                
                                Text("\(reminder.name)")
                                    .foregroundColor(Color.white)
                                    .font(.title)

                                HStack {
                                    HStack {
                                        Image(systemName: "sun.max")
                                            .foregroundColor(.yelloww)
                                        Text(reminder.light)
                                            .foregroundColor(.yelloww)
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(12)

                                    HStack {
                                        Image(systemName: "drop")
                                            .foregroundColor(.bluee)
                                        Text(reminder.waterAmount)
                                            .foregroundColor(.bluee)
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(12)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .onDelete(perform: deleteReminder)
            }
            .onChange(of: reminderModel.reminders) { _ in
                checkForCompletedReminders()
            }

            // New Reminder Button
            HStack {
                NavigationLink(destination: SetReminderView(reminderModel: reminderModel)) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.greeen)
                            .font(.title)

                        Text("New Reminder")
                            .foregroundColor(Color.greeen)
                    }
                    .padding(.vertical, 10)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 145)
                .padding()
            }
        }
        .navigationTitle("") // Empty to hide default title in NavigationBar
    }

    private func toggleCompletion(for reminder: PplantReminder) {
        if let index = reminderModel.reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminderModel.reminders[index].isCompleted.toggle()
            checkForCompletedReminders()
        }
    }

    private func deleteReminder(at offsets: IndexSet) {
        reminderModel.reminders.remove(atOffsets: offsets)
    }

    private func checkForCompletedReminders() {
        if reminderModel.reminders.allSatisfy({ $0.isCompleted }) {
            // Navigate to remindersCompleted view
            showCompletedView = true
        }
    }
}