# 🏋️ Trainer Manager Pro

A comprehensive Flutter application designed specifically for fitness trainers to manage their business, conduct live classes, and track student progress. Built with clean architecture, real-time video calling capabilities, and Supabase backend integration.

## ✨ Features

### 🎯 Core Features
- **Dashboard Analytics** - Real-time stats and insights
- **Class Management** - Schedule, manage, and track fitness classes
- **Student Management** - Comprehensive student profiles and progress tracking
- **Diet Plan Management** - Create and assign personalized nutrition plans
- **Live Video Classes** - Conduct live sessions using Agora RTC
- **Real-time Chat** - In-session messaging and communication
- **Progress Tracking** - Monitor student fitness journey
- **Payment Integration** - Track earnings and payments

### 🎥 Live Session Features
- **Agora Video Integration** - High-quality video calling
- **Zoom Integration** - Alternative video platform support
- **Real-time Chat** - In-session messaging
- **Participant Management** - Track attendance and engagement
- **Session Recording** - Record sessions for later viewing
- **Screen Sharing** - Share content during live sessions

### 📊 Analytics & Reporting
- **Trainer Dashboard** - Comprehensive business overview
- **Student Progress Views** - Track fitness goals and achievements
- **Class Analytics** - Attendance rates and engagement metrics
- **Financial Reports** - Earnings and payment tracking

## 🏗️ Architecture

This project follows **Clean Architecture** principles with the following structure:

```
lib/
├── core/                     # Core functionality
│   ├── constants/           # App constants and configurations
│   ├── errors/             # Error handling and failures
│   └── router/             # Navigation and routing
├── features/               # Feature modules
│   ├── auth/              # Authentication
│   ├── dashboard/         # Main dashboard
│   ├── classes/           # Class management
│   ├── students/          # Student management
│   ├── diet_plans/        # Diet plan management
│   ├── profile/           # User profile
│   └── live_session/      # Live video sessions
│       ├── domain/        # Business logic
│       ├── data/          # Data layer
│       └── presentation/  # UI layer
└── shared/                # Shared components
    └── presentation/      # Reusable widgets
```

## 🛠️ Tech Stack

### Frontend
- **Flutter** - Cross-platform mobile development
- **Riverpod** - State management
- **Freezed** - Code generation for immutable classes
- **Go Router** - Declarative routing
- **Material Design 3** - Modern UI components

### Backend & Database
- **Supabase** - Backend-as-a-Service
- **PostgreSQL** - Relational database
- **Row Level Security (RLS)** - Data security
- **Real-time subscriptions** - Live data updates

### Video & Communication
- **Agora RTC Engine** - Real-time video calling
- **Zoom SDK** - Alternative video platform
- **WebSocket** - Real-time messaging
- **Flutter Chat UI** - Chat interface components

### Additional Packages
- **Supabase Flutter** - Database and auth integration
- **Permission Handler** - Device permissions
- **Image Picker** - Media selection
- **File Picker** - File handling
- **Video Player** - Video playback
- **Local Notifications** - Push notifications

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Supabase account
- Agora account (for video calling)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/trainer-manager-pro.git
   cd trainer-manager-pro
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure Supabase**
   - Create a new Supabase project
   - Copy your project URL and anon key
   - Update `lib/core/constants/app_constants.dart` with your credentials

5. **Configure Agora**
   - Create an Agora account and project
   - Update `lib/features/live_session/data/services/agora_service.dart` with your App ID

6. **Run the app**
   ```bash
   flutter run
   ```

## 🗄️ Database Schema

The app uses a comprehensive database schema with the following main tables:

### Core Tables
- **trainers** - Trainer profiles and business info
- **students** - Student profiles and health data
- **classes** - Class schedules and details
- **enrollments** - Student class registrations
- **payments** - Payment tracking

### Live Session Tables
- **live_sessions** - Video session management
- **session_participants** - Attendance tracking
- **session_recordings** - Recorded session metadata
- **chat_messages** - In-session messaging
- **notifications** - User notifications

### Analytics Views
- **trainer_dashboard_stats** - Comprehensive trainer analytics
- **student_dashboard_stats** - Student progress overview
- **class_analytics** - Class performance metrics

## 🎯 Key Features Implementation

### Live Video Sessions
```dart
// Start a live Agora session
await agoraService.joinChannel(
  channelName: 'yoga_class_123',
  token: 'agora_token',
  uid: userId,
  isTrainer: true,
);
```

### Real-time Data
```dart
// Watch live session updates
final sessionStream = supabase
  .from('live_sessions')
  .stream(primaryKey: ['id'])
  .eq('id', sessionId);
```

### State Management
```dart
// Riverpod provider for dashboard data
@riverpod
Future<TrainerStats> trainerStats(TrainerStatsRef ref) async {
  return await ref.read(dashboardRepositoryProvider).getTrainerStats();
}
```

## 📱 Screenshots

### Dashboard
- Real-time analytics and quick actions
- Upcoming classes overview
- Earnings tracking

### Live Sessions
- Video calling interface
- Participant management
- Real-time chat

### Class Management
- Schedule creation and editing
- Student enrollment tracking
- Session recordings

## 🔧 Configuration

### Environment Setup
Create a `.env` file in the root directory:
```env
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
AGORA_APP_ID=your_agora_app_id
AGORA_APP_CERTIFICATE=your_agora_certificate
```

### Permissions
The app requires the following permissions:
- Camera access (for video calls)
- Microphone access (for audio)
- Storage access (for file uploads)
- Internet access (for real-time features)

## 🧪 Testing

Run tests with:
```bash
flutter test
```

For integration tests:
```bash
flutter test integration_test/
```

## 📦 Building

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team** - For the amazing framework
- **Supabase** - For the powerful backend platform
- **Agora** - For real-time video technology
- **Riverpod** - For excellent state management
- **Material Design** - For beautiful UI components

## 📞 Support

For support and questions:
- Create an issue on GitHub
- Email: support@trainermanagerpro.com
- Documentation: [docs.trainermanagerpro.com](https://docs.trainermanagerpro.com)

---

**Built with ❤️ for fitness trainers worldwide**
