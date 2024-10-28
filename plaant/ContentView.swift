import SwiftUI
struct ContentView: View {
    @State private var showingSetReminder = false
    @State private var showingRemindersView = false
    @StateObject private var reminderModel = PplantReminderModel()

    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                    .padding(.top, -80)

                if reminderModel.reminders.isEmpty {
                    // Only show the initial setup if no reminders exist
                    VStack(spacing: 20) {
                        Image("planto") // Replace with your image name
                            .resizable()
                            .frame(width: 164, height: 200)
                            .scaledToFit()

                        Text("Start your plant journey!")
                            .font(.system(size: 25, weight: .semibold))
                            .multilineTextAlignment(.center)

                        Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                            .frame(width: 330, height: 50)
                            .font(.system(size: 16))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)

                        Button(action: {
                            showingSetReminder.toggle()
                        }) {
                            Text("Set Plant Reminder")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .frame(width: 280, height: 40)
                                .background(Color.greeen)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $showingSetReminder) {
                            SetReminderView(reminderModel: reminderModel)
                        }

              
                    }
                 .padding(55)
                } else {
                    // Directly show reminders view if there are existing reminders
                    RemindersView(reminderModel: reminderModel)
                }
            }
            .navigationTitle("My Plants🌱")
        }
    }
}
#Preview {
ContentView()
}
