// Supabase configuration
// The anon key is safe to commit — Supabase security relies on RLS policies, not key secrecy.
// Override via global __SUPABASE_URL__ / __SUPABASE_ANON_KEY__ for CI/deployment use.

var SUPABASE_URL = (typeof __SUPABASE_URL__ !== 'undefined' ? __SUPABASE_URL__ : 'https://hreprsnzrcffgiwxspzo.supabase.co');
var SUPABASE_ANON_KEY = (typeof __SUPABASE_ANON_KEY__ !== 'undefined' ? __SUPABASE_ANON_KEY__ : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhyZXByc256cmNmZmdpd3hzcHpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIzODA0OTEsImV4cCI6MjA5Nzk1NjQ5MX0.iJhR_t5DfRpBO0nWoO2_7OcOS_M22ijrWLtMD_i8Hpw');
