# 📇 Contacts Manager in SwiftUI

A clean and modern **Contacts Manager** built with **SwiftUI** using Apple's **Contacts Framework**. This project demonstrates how to request permissions, fetch, create, search, and delete contacts while following the **MVVM architecture** and SwiftUI best practices.

> Perfect for developers learning the Contacts Framework or looking for a reusable contact management implementation.

---

## ✨ Features

- 📱 SwiftUI Interface
- 👤 Fetch Device Contacts
- ➕ Add New Contact
- 🔍 Search Contacts
- 🗑️ Delete Contacts
- 🔒 Contacts Permission Handling
- 🏗️ MVVM Architecture
- 📂 Clean Project Structure
- 🚀 Easy to Extend

---

## 📸 Screenshots

> Add screenshots here

| Contacts List | Add Contact | Search |
|---------------|-------------|---------|
| ![](Screenshots/list.png) | ![](Screenshots/add.png) | ![](Screenshots/search.png) |

---

## 🏛 Project Structure

```
ContactsManager
│
├── App
│   └── ContactsManagerApp.swift
│
├── Models
│   └── ContactModel.swift
│
├── Managers
│   ├── ContactManager.swift
│   └── PermissionManager.swift
│
├── ViewModels
│   └── ContactsViewModel.swift
│
├── Views
│   ├── HomeView.swift
│   ├── ContactsListView.swift
│   ├── ContactRow.swift
│   └── AddContactView.swift
│
└── Assets
```

---

## 🧰 Technologies

- Swift 6
- SwiftUI
- Contacts Framework
- MVVM
- Xcode 26+
- iOS 26+

---

## 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/yourusername/ContactsManager.git
```

Open the project in **Xcode**.

---

### Configure Permissions

Add the following key to **Info.plist**

```
Privacy - Contacts Usage Description
```

Example value:

```
This app requires access to your contacts to manage them.
```

---

## 📚 What You'll Learn

- Request Contacts Permission
- Access Device Contacts
- Save New Contacts
- Delete Contacts
- Search Contacts
- SwiftUI Navigation
- MVVM Architecture
- Building Reusable Managers
- SwiftUI State Management

---

## 📱 Demo

### Fetch Contacts

```swift
vm.loadContacts()
```

### Save Contact

```swift
try ContactManager.shared.saveContact(
    firstName: "Steve",
    lastName: "Jobs",
    phone: "9999999999"
)
```

### Delete Contact

```swift
try ContactManager.shared.deleteContact(identifier: contact.id)
```

---

## 📂 Architecture

```
View
   ↓
ViewModel
   ↓
ContactManager
   ↓
Contacts Framework
```

---

## 🔐 Permission Flow

```
App Launch
      │
      ▼
Check Permission
      │
 ┌────┴────┐
 │         │
Granted   Denied
 │         │
 ▼         ▼
Load      Show
Contacts  Settings Button
```

---

## 🔮 Future Improvements

- ✏️ Edit Contact
- 📧 Email Support
- 🖼️ Contact Image
- ⭐ Favorite Contacts
- 👥 Group Contacts
- ☁️ iCloud Sync
- 🔄 Pull to Refresh
- 📞 Multiple Phone Numbers
- 🌙 Dark Mode Enhancements
- 🧪 Unit Tests

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create a new feature branch

```
git checkout -b feature/new-feature
```

3. Commit your changes

```
git commit -m "Add new feature"
```

4. Push to GitHub

```
git push origin feature/new-feature
```

5. Open a Pull Request

---

## ⭐ Support

If you found this project useful, consider giving it a ⭐ on GitHub.

It helps others discover the project and motivates future improvements.

---

## 📖 Medium Article

Read the complete step-by-step tutorial on Medium:

**Building a Clean Contacts Manager in iOS with Swift: Save, Search, Delete & Permissions**

*(Add your Medium article link here after publishing.)*

---

## 👨‍💻 Author

**Gaurav Tak**

- Medium: [https://medium.com/gauravtakjaipur](https://medium.com/@gauravtakjaipur)
- LinkedIn: [https://linkedin.com/in/gauravtakjaipur](https://www.linkedin.com/in/gaurav-kumar-tak-977753348/)
- GitHub: [https://github.com/YOUR_USERNAME](https://github.com/gauravtakdev)

---

## 📄 License

This project is licensed under the MIT License.

Feel free to use it for learning, personal projects, and commercial applications.

---

Made with ❤️ using SwiftUI
