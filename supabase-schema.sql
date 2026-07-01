-- Mindful Bharat: Supabase Schema Migration
-- Run this in the Supabase SQL Editor (https://supabase.com -> SQL Editor)

-- 1. Tasks
CREATE TABLE IF NOT EXISTS tasks (
    id BIGSERIAL PRIMARY KEY,
    user_id TEXT NOT NULL,
    title TEXT NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    due_date DATE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_tasks_user_id ON tasks(user_id);

-- 2. Moods
CREATE TABLE IF NOT EXISTS moods (
    id BIGSERIAL PRIMARY KEY,
    user_id TEXT NOT NULL,
    mood TEXT NOT NULL,
    date DATE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_moods_user_id ON moods(user_id);
CREATE INDEX IF NOT EXISTS idx_moods_date ON moods(date);

-- 3. Helplines
CREATE TABLE IF NOT EXISTS helplines (
    id BIGSERIAL PRIMARY KEY,
    category TEXT NOT NULL,
    name TEXT NOT NULL,
    phone TEXT,
    description TEXT,
    website TEXT
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_helplines_name ON helplines(name);

-- 4. Journal
CREATE TABLE IF NOT EXISTS journal (
    id BIGSERIAL PRIMARY KEY,
    user_id TEXT NOT NULL,
    text TEXT NOT NULL,
    date DATE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_journal_user_id ON journal(user_id);

-- 5. Gamification
CREATE TABLE IF NOT EXISTS gamification (
    user_id TEXT PRIMARY KEY,
    points INTEGER DEFAULT 0,
    badges JSONB DEFAULT '[]'::jsonb
);

-- 6. RLS: Since Firebase handles auth, allow anon key access to all tables.
--     The app already filters rows by user_id at the query level.
ALTER TABLE tasks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "anon_all_tasks" ON tasks FOR ALL USING (true) WITH CHECK (true);

ALTER TABLE moods ENABLE ROW LEVEL SECURITY;
CREATE POLICY "anon_all_moods" ON moods FOR ALL USING (true) WITH CHECK (true);

ALTER TABLE helplines ENABLE ROW LEVEL SECURITY;
CREATE POLICY "anon_all_helplines" ON helplines FOR ALL USING (true) WITH CHECK (true);

ALTER TABLE journal ENABLE ROW LEVEL SECURITY;
CREATE POLICY "anon_all_journal" ON journal FOR ALL USING (true) WITH CHECK (true);

ALTER TABLE gamification ENABLE ROW LEVEL SECURITY;
CREATE POLICY "anon_all_gamification" ON gamification FOR ALL USING (true) WITH CHECK (true);

-- 7. Seed helplines
INSERT INTO helplines (category, name, phone, description, website) VALUES
('Mental Health', 'Vandrevala Foundation', '1860-266-2345', '24/7 mental health helpline', 'vandrevalafoundation.com'),
('Mental Health', 'iCall Helpline', '022-25521111', 'Free counselling', 'icallhelpline.org'),
('Mental Health', 'Snehi Foundation', '011-41036474', 'Emotional support', 'snehifoundation.org'),
('Mental Health', 'Sumaitri', '011-23389090', 'Emotional support (Mon-Sat 2-8PM)', 'sumaitri.org'),
('Mental Health', 'Parivarthan', '080-55554444', 'Counselling helpline (Mon-Fri 10AM-6PM)', 'parivarthan.org'),
('Mental Health', 'Fortis Mental Health', '8376804102', 'Mental health support', 'fortishealthcare.com'),
('Mental Health', 'COOJ Mental Health', '0832-2252525', 'Mental health support (Goa)', 'cooj.org'),
('Mental Health', 'Lifeline Foundation', '033-40447437', 'Emotional support (Kolkata)', 'lifelinefoundation.in'),
('Mental Health', 'Roshni', '040-66202000', 'Counselling (Hyderabad, 11AM-9PM)', 'roshnicounselling.com'),
('Mental Health', 'Sahai', '080-25497777', 'Emotional support (Bangalore, 10AM-8PM)', 'sahaifoundation.com'),
('Mental Health', 'Maithri', '0484-2540530', 'Counselling (Kochi, 10AM-6PM)', 'maithrikochi.org'),
('Mental Health', 'Samaritans Mumbai', '022-23094545', 'Emotional support (Mon-Fri 5-8PM)', 'samaritansmumbai.com'),
('Crisis', 'KIRAN Helpline', '1800-599-0019', '24/7 crisis support (Ministry of Social Justice)', 'kirannationalhelpline.in'),
('Crisis', 'AASRA', '9820466726', '24/7 suicide prevention', 'aasra.info'),
('Crisis', 'S.A.A.S. Helpline', '1800-123-4321', 'Suicide prevention', 'saashelpline.org'),
('Crisis', 'Jeevan Aastha', '1800-233-3330', 'Crisis intervention', 'jeevanaastha.in'),
('Crisis', 'Connecting India', '1800-209-4353', 'Mental health & crisis support', 'connectingindia.org'),
('Crisis', 'Sukoon Health', '1800-120-8200', '24/7 mental health crisis', 'sukoonhealth.com'),
('Women & Child', 'Women''s Helpline', '181', 'National women''s distress helpline', 'wcd.nic.in'),
('Women & Child', 'Child Helpline', '1098', '24/7 child protection (CHILDLINE)', 'childlineindia.org.in'),
('Women & Child', 'Domestic Violence', '1800-102-2900', 'Domestic violence support', 'ncw.nic.in'),
('Women & Child', 'National Commission for Women', '7827170170', 'Women''s rights & complaints', 'ncw.nic.in'),
('Women & Child', 'Shakti Shalini', '10920', 'Women''s crisis support', 'shaktishalini.org'),
('Women & Child', 'RAHI Foundation', '011-47194900', 'Recovery from sexual abuse', 'rahifoundation.org'),
('Medical', 'National Emergency', '112', 'All-in-one emergency (police/fire/ambulance)', NULL),
('Medical', 'Ambulance', '108', 'Emergency ambulance (most states)', NULL),
('Medical', 'National Health Helpline', '1800-180-1104', 'Health information & support (Ministry of Health)', NULL),
('Medical', 'Poison Helpline', '011-26593655', '24/7 poison information (AIIMS Delhi)', NULL),
('Medical', 'Quit Tobacco', '1800-11-2356', 'Tobacco cessation support', NULL),
('General', 'Senior Citizens Helpline', '14567', 'Elder care support (Elder Line)', 'elderline.nic.in'),
('General', 'Tourist Helpline', '1363', '24/7 tourist assistance (Ministry of Tourism)', NULL),
('General', 'Railway Helpline', '139', 'Railway enquiries & assistance (Indian Railways)', NULL),
('General', 'Anti-Corruption', '1800-11-8800', 'Anti-corruption helpline (CVC)', NULL),
('General', 'Election Helpline', '1950', 'Voter assistance (Election Commission)', NULL),
('General', 'LPG Leak / Emergency', '1906', 'Gas leak emergency helpline', NULL)
ON CONFLICT (name) DO NOTHING;
