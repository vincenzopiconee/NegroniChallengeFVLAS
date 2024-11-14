import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account Settings")) {
                    NavigationLink(destination: AccountSettingsView()) {
                        Text("Account Settings")
                    }
                }
                
                Section(header: Text("Security")) {
                    NavigationLink(destination: SecuritySettingsView()) {
                        Text("Security")
                    }
                }
                
                Section(header: Text("Notifications")) {
                    NavigationLink(destination: NotificationsSettingsView()) {
                        Text("Notifications")
                    }
                }
                
                Section(header: Text("Assistance").foregroundColor(.red)) {
                    NavigationLink(destination: HelpView()) {
                        Text("Help")
                            .foregroundColor(.red)
                    }
                    
                    NavigationLink(destination: SupportView()) {
                        Text("Support")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct AccountSettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                TextField("Name", text: .constant(""))
                TextField("Email", text: .constant(""))
            }
            
            Section(header: Text("Account Actions")) {
                Button(action: { /* Change Password */ }) {
                    Text("Change Password")
                }
                
                Button(action: { /* Log Out */ }) {
                    Text("Log Out")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Account Settings")
    }
}

struct SecuritySettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("Health Data Access")) {
                Toggle("Allow HealthKit Access", isOn: .constant(true))
                
                Button(action: { /* Manage Health Data Permissions */ }) {
                    Text("Manage Health Data Permissions")
                }
            }
            
            Section(header: Text("Data Management")) {
                Button(action: { /* Delete Health Data */ }) {
                    Text("Delete Health Data")
                        .foregroundColor(.red)
                }
                
                Button(action: { /* Export Health Data */ }) {
                    Text("Export Health Data")
                }
            }
        }
        .navigationTitle("Security")
    }
}

struct NotificationsSettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("Notification Preferences")) {
                Toggle("Push Notifications", isOn: .constant(true))
            }
        }
        .navigationTitle("Notifications")
    }
}

struct HelpView: View {
    var body: some View {
        Form {
            Section(header: Text("Common Issues")) {
                Button(action: { /* FAQ */ }) {
                    Text("FAQ")
                }
                
                Button(action: { /* Contact Support */ }) {
                    Text("Contact Support")
                }
            }
            
            Section(header: Text("Guides")) {
                Button(action: { /* User Guide */ }) {
                    Text("User Guide")
                }
            }
        }
        .navigationTitle("Help")
    }
}

struct SupportView: View {
    var body: some View {
        Form {
            Section(header: Text("Contact Us")) {
                Button(action: { /* Email Support */ }) {
                    Text("Email Support")
                }
                
                Button(action: { /* Call Support */ }) {
                    Text("Call Support")
                }
            }
            
            Section(header: Text("Feedback")) {
                Button(action: { /* Send Feedback */ }) {
                    Text("Send Feedback")
                }
            }
        }
        .navigationTitle("Support")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
