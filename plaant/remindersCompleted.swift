import SwiftUI
struct remindersCompleted: View {
    @ObservedObject var reminderModel: PplantReminderModel

    var body: some View {
        NavigationView {
            VStack {
                Text("My Plants🌱")
                    .bold()
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                    .padding(.bottom, 90)

                Image("planto2") // Replace with your image name
                    .resizable()
                    .frame(width: 250, height: 260)
                    .scaledToFit()

                Text("All Done!🎉")
                    .font(.system(size: 25, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom,-10)

                Text("All Reminders Completed")
                    .frame(width: 330, height: 50)
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)

                Spacer()

                NavigationLink(destination: SetReminderView(reminderModel: reminderModel)) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255))
                            .font(.largeTitle)

                        Text("New Reminder")
                            .foregroundColor(Color(red: 41/255, green: 223/255, blue: 168/255))
                    }
                    .padding(.trailing, 140)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.bottom)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(22)
            .navigationTitle("")
        }
    }
}
