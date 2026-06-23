# Mindful Bharat

A wellness companion app with task management, mood tracking, and mental health resources.

## Features

- **Authentication** -- Email/password login via Firebase Auth
- **Dashboard** -- Overview of task count, mood entries, and streak
- **Planner** -- Create, complete, and delete tasks with due dates. Filter by status
- **AI Schedule** -- Auto-schedule pending tasks into user-defined free time slots
- **Mood Tracker** -- Log daily mood (Happy, Neutral, Stressed) and view the last 7 days
- **Help Hub** -- Searchable directory of Indian mental health helplines and crisis resources
- **Dark Mode** -- Toggleable theme, persisted to localStorage, defaults to system preference
- **Responsive** -- Mobile-friendly layout with collapsible navigation

## Tech Stack

- Plain HTML, CSS, JavaScript (no framework)
- Firebase Auth (email/password)
- IndexedDB for offline-first data storage
- Static single-page application (no build step)

## Data

All user data (tasks, moods) is stored locally in IndexedDB. Helplines are seeded on first visit. Authentication is handled by Firebase; no user data is stored on Firebase beyond credentials.
