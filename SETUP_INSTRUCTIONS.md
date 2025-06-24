# Yoga Trainer App Setup Instructions

## Issues Resolved

The app screens were showing loading states because:

1. **Missing Database Setup** - Supabase database wasn't initialized
2. **Missing Authentication Flow** - No test user accounts
3. **Missing Database Views** - Dashboard stats view wasn't created

## Setup Steps

### 1. Database Setup

**Run the following in your Supabase SQL Editor:**

```sql
-- Copy and paste the entire content of supabase_setup.sql
-- This creates all tables, views, and policies needed
```

The updated `supabase_setup.sql` now includes the missing `trainer_dashboard_stats` view.

### 2. Create Test User Account

**Option A: Via App**
1. Run the app
2. Click "Sign Up" on the login screen
3. Create a trainer account with:
   - Email: `trainer@example.com`
   - Password: `password123`
   - Full Name: `Test Trainer`

**Option B: Via Supabase Dashboard**
1. Go to Authentication > Users in Supabase Dashboard
2. Create a new user manually
3. Add metadata: `{"full_name": "Test Trainer", "is_trainer": true}`

### 3. Storage Buckets (Optional)

If using image uploads:
1. Go to Storage in Supabase Dashboard
2. Create bucket: `profile-images`
3. Create bucket: `class-materials`
4. Set appropriate public policies

### 4. Test the App

1. Run: `flutter run`
2. Sign in with your test account
3. Dashboard should now load with default data
4. Create your first class to see real data

## App Features

- **Dashboard**: Overview of classes, students, and earnings
- **Classes**: Create and manage yoga classes
- **Students**: View enrolled students
- **Profile**: Manage trainer profile

## Troubleshooting

- **Still showing loading?** Check Supabase logs for errors
- **Authentication issues?** Verify Supabase URL and keys in `app_constants.dart`
- **Database errors?** Ensure all SQL from `supabase_setup.sql` was executed

The app will now handle missing data gracefully and show appropriate welcome messages for new trainers. 