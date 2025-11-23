# 📚 BookSwap App

Hey there! This is my book exchange app built for students who are tired of buying overpriced textbooks. Instead of letting your old books collect dust, you can swap them with other students who need them. Win-win!

---

## 💡 What It Does

### Core Features
- **Sign up & Login:** Create your account with email verification to keep things secure
- **List Your Books:** Snap a photo, add the title/author, and pick the condition (New, Like New, Good, or Used)
- **Browse Books:** See what other students are offering - maybe someone has that textbook you need
- **Request Swaps:** Found a book you want? Just hit that swap button
- **Real-time Chat:** Message the book owner directly to arrange the exchange
- **Manage Requests:** Accept or reject swap offers from other students

### The Flow
1. You post a book you don't need anymore
2. Someone sees it and requests a swap
3. You get a notification in Settings
4. Chat opens automatically - discuss the swap
5. Accept the offer and arrange to meet up
6. Both of you get the books you need!

---

## 🚀 How to Run It

### Prerequisites
- Flutter SDK (3.0+)
- A Firebase account (free tier works fine)
- Android Studio or VS Code

### Quick Start

1. **Clone this repo**
2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**
   - Create a project at [console.firebase.google.com](https://console.firebase.google.com/)
   - Enable Authentication (Email/Password)
   - Enable Cloud Firestore
   - Enable Firebase Storage (for book cover images)
   - Download `google-services.json` and put it in `android/app/`

4. **Add your Firebase config**
   - Update `lib/firebase_options.dart` with your project details
   - Get these from Firebase Console → Project Settings → Your apps

5. **Set up Firestore Security Rules**
   
   Copy this into Firebase Console → Firestore Database → Rules:
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /users/{userId} {
         allow read: if request.auth != null;
         allow write: if request.auth.uid == userId;
       }
       match /books/{bookId} {
         allow read: if request.auth != null;
         allow create: if request.auth != null;
         allow update, delete: if request.auth.uid == resource.data.ownerId;
       }
       match /swaps/{swapId} {
         allow read, write: if request.auth != null;
       }
       match /chats/{chatId} {
         allow read, write: if request.auth.uid in resource.data.participants;
         match /messages/{messageId} {
           allow read, create: if request.auth != null;
         }
       }
     }
   }
   ```

6. **Run it!**
   
   # On Android
   flutter run
   ```

---

## 🛠️ Tech Stack

- **Flutter** - For the mobile/web app
- **Firebase Auth** - Handles login and signup
- **Cloud Firestore** - Stores books, swap requests, and chat messages
- **Firebase Storage** - Hosts book cover images
- **StreamBuilder** - Keeps the UI reactive with real-time updates

The app uses a clean architecture approach - models, repositories, and UI screens are all nicely separated.

---

## 📂 Project Structure

```
lib/
├── main.dart              # Entry point + all the app code
└── firebase_options.dart  # Your Firebase config

android/
└── app/
    └── google-services.json  # Firebase Android config
```

Everything's in `main.dart` to keep things simple for this project. In a production app, you'd split this into multiple files.

---

## 🎯 How to Use

### For Book Owners
1. Go to "My Listings"
2. Tap the + button
3. Fill in your book details
4. Upload a cover photo (optional)
5. Hit "Post"
6. Wait for swap requests to come in
7. Check Settings to accept/reject offers

### For Book Seekers
1. Browse the "Home" feed
2. Find a book you need
3. Tap the swap icon
4. Chat opens automatically
5. Message the owner to arrange details
6. Wait for them to accept

---

## 💬 Features Breakdown

### Authentication
- Email/password signup
- Email verification (mobile only)
- Persistent login sessions

### Book Listings (CRUD)
- Create: Post books with photos
- Read: Browse all available books
- Update: Edit your own listings
- Delete: Remove books you've swapped

### Swap System
- Send swap requests
- Real-time status updates (Pending/Accepted/Rejected)
- Books automatically marked as pending
- Track all your offers

### Chat
- One-on-one messaging
- Real-time message delivery
- Color-coded bubbles (you = yellow, them = gray)
- Auto-created when you request a swap

---

## 🐛 Troubleshooting

**Books not showing up?**
- Hit the refresh button (↻) in the app bar
- Check Firebase Console to see if the book was saved

**Chat not working?**
- Make sure you requested a swap first
- Check browser console (F12) for errors

**Can't post a book?**
- Make sure you're logged in
- Check Settings screen to verify your account

**Gradle errors on Android?**
- Try `flutter clean` then `flutter run`

---

## 🧪 Testing with Multiple Users

Want to see the real-time features in action?

1. Open Chrome normally - sign in as User A
2. Open Chrome Incognito - sign in as User B
3. User A posts a book
4. User B requests a swap
5. Watch the magic happen - both see updates instantly!

---

## 📦 Dependencies

```yaml
firebase_core: ^2.24.2
firebase_auth: ^4.16.0
cloud_firestore: ^4.14.0
firebase_storage: ^11.6.0
image_picker: ^1.0.7
```

---

## 🔒 Security

- All Firestore operations require authentication
- Only book owners can edit/delete their listings
- Chat access restricted to conversation participants
- Firestore security rules enforce these policies


## 🎓 Learning Points

This project was built as part of a Mobile App Development course. Key concepts demonstrated:

- CRUD operations with Firebase
- Real-time data synchronization
- User authentication and authorization
- State management with StreamBuilder
- Cross-platform Flutter development
- Clean code organization
