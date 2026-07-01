# Mindful Bharat

A wellness companion PWA with task management, mood tracking, journaling, pomodoro, breathing exercises, gamification, and Indian mental health resources.

## Features

- **Authentication** -- Email/password login via Firebase Auth with error handling and password visibility toggle
- **Dashboard** -- Overview of tasks count, mood entries, streak, daily affirmation, wellness points, and badge progress
- **Planner** -- Create, complete, and delete tasks with due dates. Filter by All/Pending/Completed
- **Smart Schedule** -- Paste tasks in natural language; auto-schedule via client-side Quick Sort or Groq AI (Llama 3.3-70B) with timeline visualization
- **Mood Tracker** -- Log daily mood (Happy, Neutral, Stressed), view 7-day history, and stress streak detection with self-care prompts
- **Breathing Exercise** -- Guided 4-7-8 breathing technique with animated circle and cycle counter
- **Pomodoro Timer** -- Configurable focus (25/15/45 min) and break sessions with progress bar and auto-transition
- **Wellness Journal** -- Write, save, and browse journal entries with 2000-char limit and Ctrl+Enter shortcut
- **CPS Test** -- Clicks-per-second game with configurable duration and Supabase-persisted history
- **Gamification** -- Earn wellness points and unlock 8 achievement badges with confetti animations
- **Help Hub** -- Searchable directory of 31 Indian mental health helplines and crisis resources, categorized and click-to-call enabled
- **Data Export** -- Export tasks, moods, journal, or all data as JSON
- **Dark Mode** -- Toggleable theme, persisted to localStorage, defaults to system preference
- **Responsive** -- Mobile-friendly layout with collapsible hamburger navigation
- **PWA** -- Installable with service worker for offline caching

## Tech Stack

- Plain HTML, CSS, JavaScript (no framework, no build step)
- Firebase Auth (email/password)
- Supabase (PostgreSQL) for persistent data storage
- Groq AI (Llama 3.3-70B) for AI-powered scheduling
- Service Worker + Web App Manifest for PWA support

## Data

All user data (tasks, moods, journals, gamification, CPS results) is stored in Supabase with per-user isolation. Helplines are auto-seeded on first visit. Firebase handles authentication only; no user data is stored on Firebase beyond credentials.
