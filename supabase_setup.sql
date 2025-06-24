-- Trainer Manager Pro Database Setup
-- Run this SQL in your Supabase SQL Editor

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create custom types
CREATE TYPE class_type AS ENUM ('group', 'personal');
CREATE TYPE class_level AS ENUM ('beginner', 'intermediate', 'advanced');
CREATE TYPE class_status AS ENUM ('scheduled', 'active', 'completed', 'cancelled');
CREATE TYPE enrollment_status AS ENUM ('pending', 'confirmed', 'cancelled', 'completed');

-- Trainers table
CREATE TABLE IF NOT EXISTS public.trainers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    profile_image_url TEXT,
    bio TEXT,
    phone_number TEXT,
    specializations TEXT[],
    rating DECIMAL(2,1) DEFAULT 0.0,
    total_classes INTEGER DEFAULT 0,
    total_students INTEGER DEFAULT 0,
    monthly_earnings DECIMAL(10,2) DEFAULT 0.0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Students table
CREATE TABLE IF NOT EXISTS public.students (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    profile_image_url TEXT,
    phone_number TEXT,
    age INTEGER,
    weight DECIMAL(5,2),
    height DECIMAL(5,2),
    fitness_goal TEXT,
    medical_conditions TEXT[],
    emergency_contact TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Classes table
CREATE TABLE IF NOT EXISTS public.classes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    trainer_id UUID REFERENCES public.trainers(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    type class_type NOT NULL,
    level class_level NOT NULL,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE NOT NULL,
    max_participants INTEGER NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    current_participants INTEGER DEFAULT 0,
    status class_status DEFAULT 'scheduled',
    image_url TEXT,
    tags TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Enrollments table
CREATE TABLE IF NOT EXISTS public.enrollments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student_id UUID REFERENCES public.students(id) ON DELETE CASCADE,
    class_id UUID REFERENCES public.classes(id) ON DELETE CASCADE,
    status enrollment_status DEFAULT 'pending',
    enrolled_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    cancelled_at TIMESTAMP WITH TIME ZONE,
    cancellation_reason TEXT,
    attended BOOLEAN,
    rating DECIMAL(2,1),
    feedback TEXT,
    UNIQUE(student_id, class_id)
);

-- Payments table
CREATE TABLE IF NOT EXISTS public.payments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    enrollment_id UUID REFERENCES public.enrollments(id) ON DELETE CASCADE,
    trainer_id UUID REFERENCES public.trainers(id) ON DELETE CASCADE,
    student_id UUID REFERENCES public.students(id) ON DELETE CASCADE,
    amount DECIMAL(8,2) NOT NULL,
    currency TEXT DEFAULT 'USD',
    payment_method TEXT,
    transaction_id TEXT,
    status TEXT DEFAULT 'pending',
    paid_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Class attendance table
CREATE TABLE IF NOT EXISTS public.class_attendance (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    class_id UUID REFERENCES public.classes(id) ON DELETE CASCADE,
    student_id UUID REFERENCES public.students(id) ON DELETE CASCADE,
    enrollment_id UUID REFERENCES public.enrollments(id) ON DELETE CASCADE,
    attended BOOLEAN DEFAULT FALSE,
    check_in_time TIMESTAMP WITH TIME ZONE,
    check_out_time TIMESTAMP WITH TIME ZONE,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    UNIQUE(class_id, student_id)
);

-- Clients table (for diet plans)
CREATE TABLE IF NOT EXISTS public.clients (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    trainer_id UUID REFERENCES public.trainers(id) ON DELETE CASCADE,
    student_id UUID REFERENCES public.students(id) ON DELETE CASCADE,
    age INTEGER,
    weight DECIMAL(5,2),
    height DECIMAL(5,2),
    activity_level TEXT,
    fitness_goal TEXT,
    dietary_restrictions TEXT[],
    medical_conditions TEXT[],
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    UNIQUE(trainer_id, student_id)
);

-- Diet templates table
CREATE TABLE IF NOT EXISTS public.diet_templates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    trainer_id UUID REFERENCES public.trainers(id) ON DELETE CASCADE,
    client_id UUID REFERENCES public.clients(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    goal TEXT NOT NULL,
    daily_calories INTEGER NOT NULL,
    macros JSONB NOT NULL, -- {protein: 30, carbs: 40, fats: 30}
    meal_plans JSONB NOT NULL, -- Array of meal plans
    restrictions TEXT[],
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_trainers_user_id ON public.trainers(user_id);
CREATE INDEX IF NOT EXISTS idx_students_user_id ON public.students(user_id);
CREATE INDEX IF NOT EXISTS idx_classes_trainer_id ON public.classes(trainer_id);
CREATE INDEX IF NOT EXISTS idx_classes_start_time ON public.classes(start_time);
CREATE INDEX IF NOT EXISTS idx_enrollments_student_id ON public.enrollments(student_id);
CREATE INDEX IF NOT EXISTS idx_enrollments_class_id ON public.enrollments(class_id);
CREATE INDEX IF NOT EXISTS idx_payments_trainer_id ON public.payments(trainer_id);
CREATE INDEX IF NOT EXISTS idx_class_attendance_class_id ON public.class_attendance(class_id);
CREATE INDEX IF NOT EXISTS idx_diet_templates_trainer_id ON public.diet_templates(trainer_id);

-- Set up Row Level Security (RLS)
ALTER TABLE public.trainers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.students ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.classes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.enrollments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.class_attendance ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.diet_templates ENABLE ROW LEVEL SECURITY;

-- RLS Policies for Trainers
CREATE POLICY "Trainers can view own profile" ON public.trainers
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Trainers can insert own profile" ON public.trainers
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Trainers can update own profile" ON public.trainers
    FOR UPDATE USING (auth.uid() = user_id);

-- RLS Policies for Students
CREATE POLICY "Students can view own profile" ON public.students
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Students can insert own profile" ON public.students
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Students can update own profile" ON public.students
    FOR UPDATE USING (auth.uid() = user_id);

-- RLS Policies for Classes
CREATE POLICY "Trainers can manage own classes" ON public.classes
    FOR ALL USING (
        trainer_id IN (
            SELECT id FROM public.trainers WHERE user_id = auth.uid()
        )
    );

CREATE POLICY "Everyone can view classes" ON public.classes
    FOR SELECT USING (true);

-- RLS Policies for Enrollments
CREATE POLICY "Students can view own enrollments" ON public.enrollments
    FOR SELECT USING (
        student_id IN (
            SELECT id FROM public.students WHERE user_id = auth.uid()
        )
    );

CREATE POLICY "Trainers can view enrollments for their classes" ON public.enrollments
    FOR SELECT USING (
        class_id IN (
            SELECT id FROM public.classes WHERE trainer_id IN (
                SELECT id FROM public.trainers WHERE user_id = auth.uid()
            )
        )
    );

CREATE POLICY "Students can enroll in classes" ON public.enrollments
    FOR INSERT WITH CHECK (
        student_id IN (
            SELECT id FROM public.students WHERE user_id = auth.uid()
        )
    );

-- RLS Policies for Payments
CREATE POLICY "Trainers can view their payments" ON public.payments
    FOR SELECT USING (
        trainer_id IN (
            SELECT id FROM public.trainers WHERE user_id = auth.uid()
        )
    );

CREATE POLICY "Students can view their payments" ON public.payments
    FOR SELECT USING (
        student_id IN (
            SELECT id FROM public.students WHERE user_id = auth.uid()
        )
    );

-- RLS Policies for Class Attendance
CREATE POLICY "Trainers can manage attendance for their classes" ON public.class_attendance
    FOR ALL USING (
        class_id IN (
            SELECT id FROM public.classes WHERE trainer_id IN (
                SELECT id FROM public.trainers WHERE user_id = auth.uid()
            )
        )
    );

CREATE POLICY "Students can view their attendance" ON public.class_attendance
    FOR SELECT USING (
        student_id IN (
            SELECT id FROM public.students WHERE user_id = auth.uid()
        )
    );

-- RLS Policies for Clients
CREATE POLICY "Trainers can manage their clients" ON public.clients
    FOR ALL USING (
        trainer_id IN (
            SELECT id FROM public.trainers WHERE user_id = auth.uid()
        )
    );

-- RLS Policies for Diet Templates
CREATE POLICY "Trainers can manage their diet templates" ON public.diet_templates
    FOR ALL USING (
        trainer_id IN (
            SELECT id FROM public.trainers WHERE user_id = auth.uid()
        )
    );

-- Functions to automatically create trainer/student profiles
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.raw_user_meta_data->>'is_trainer' = 'true' THEN
    INSERT INTO public.trainers (user_id, email, full_name)
    VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'full_name', ''));
  ELSE
    INSERT INTO public.students (user_id, email, full_name)
    VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'full_name', ''));
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to automatically create profiles on user signup
CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc'::text, NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create triggers for updated_at
CREATE OR REPLACE TRIGGER update_trainers_updated_at BEFORE UPDATE ON public.trainers FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
CREATE OR REPLACE TRIGGER update_students_updated_at BEFORE UPDATE ON public.students FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
CREATE OR REPLACE TRIGGER update_classes_updated_at BEFORE UPDATE ON public.classes FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
CREATE OR REPLACE TRIGGER update_clients_updated_at BEFORE UPDATE ON public.clients FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
CREATE OR REPLACE TRIGGER update_diet_templates_updated_at BEFORE UPDATE ON public.diet_templates FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- Create storage buckets (Run these in Supabase Storage section)
-- 1. Go to Storage in Supabase Dashboard
-- 2. Create a bucket named 'profile-images'
-- 3. Create a bucket named 'class-materials'
-- 4. Set appropriate policies for public access if needed

-- Create trainer dashboard stats view
CREATE OR REPLACE VIEW public.trainer_dashboard_stats AS
SELECT 
    t.id as trainer_id,
    t.user_id,
    t.full_name,
    t.email,
    t.rating as average_rating,
    COUNT(DISTINCT c.id) as total_classes,
    COUNT(DISTINCT e.student_id) as active_students,
    COALESCE(SUM(p.amount), 0) as monthly_earnings,
    t.total_classes as lifetime_classes,
    t.total_students as lifetime_students
FROM public.trainers t
LEFT JOIN public.classes c ON c.trainer_id = t.id
LEFT JOIN public.enrollments e ON e.class_id = c.id AND e.status = 'confirmed'
LEFT JOIN public.payments p ON p.trainer_id = t.id 
    AND p.created_at >= date_trunc('month', NOW())
    AND p.status = 'completed'
GROUP BY t.id, t.user_id, t.full_name, t.email, t.rating, t.total_classes, t.total_students;

-- Grant access to the view
GRANT SELECT ON public.trainer_dashboard_stats TO authenticated;

-- Add RLS policy for the view
CREATE POLICY "Trainers can view own dashboard stats" ON public.trainer_dashboard_stats
    FOR SELECT USING (auth.uid() = user_id); 