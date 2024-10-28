import SwiftUI

struct PickerRow: View {
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
