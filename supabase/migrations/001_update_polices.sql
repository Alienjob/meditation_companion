-- Drop existing policies
DROP POLICY IF EXISTS "Events are insertable by user" ON events;
DROP POLICY IF EXISTS "Parameters are insertable by event owner" ON event_parameters;
DROP POLICY IF EXISTS "Sessions are insertable by user" ON app_sessions;

-- Create new permissive policies
CREATE POLICY "Events are insertable" ON events
    FOR INSERT
    WITH CHECK (true);

CREATE POLICY "Parameters are insertable" ON event_parameters
    FOR INSERT
    WITH CHECK (true);

CREATE POLICY "Sessions are insertable" ON app_sessions
    FOR INSERT
    WITH CHECK (true);

-- Update viewing policies if needed
DROP POLICY IF EXISTS "Events are viewable by user" ON events;
CREATE POLICY "Events are viewable by user" ON events
    FOR SELECT
    USING (auth.uid() = user_id OR user_id IN (
        SELECT user_id FROM app_sessions WHERE end_time IS NULL
    ));

DROP POLICY IF EXISTS "Parameters are viewable by event owner" ON event_parameters;
CREATE POLICY "Parameters are viewable by event owner" ON event_parameters
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM events
            WHERE events.id = event_parameters.event_id
            AND (events.user_id = auth.uid() OR events.user_id IN (
                SELECT user_id FROM app_sessions WHERE end_time IS NULL
            ))
        )
    );
