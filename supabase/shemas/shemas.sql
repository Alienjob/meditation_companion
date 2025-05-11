-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Sessions table to track app usage sessions
CREATE TABLE app_sessions (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE,
    device_info TEXT NOT NULL,
    app_version TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create index on user_id for faster user-based queries
CREATE INDEX idx_app_sessions_user_id ON app_sessions(user_id);
CREATE INDEX idx_app_sessions_start_time ON app_sessions(start_time);

-- Events table to store analytics events
CREATE TABLE events (
    id UUID PRIMARY KEY,
    session_id UUID NOT NULL REFERENCES app_sessions(id),
    user_id UUID NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    event_type TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    -- Add constraints for known event types based on the code
    CONSTRAINT valid_event_type CHECK (
        event_type IN (
            'meditation.session.start',
            'meditation.session.complete',
            'audio.volume.change',
            'audio.sound.toggle',
            'ui.screen.view',
            'ui.button.click'
        )
    )
);

-- Create indexes for common query patterns
CREATE INDEX idx_events_session_id ON events(session_id);
CREATE INDEX idx_events_user_id ON events(user_id);
CREATE INDEX idx_events_timestamp ON events(timestamp);
CREATE INDEX idx_events_type ON events(event_type);

-- Event parameters table to store flexible key-value pairs
CREATE TABLE event_parameters (
    id BIGSERIAL PRIMARY KEY,
    event_id UUID NOT NULL REFERENCES events(id),
    param_name TEXT NOT NULL,
    param_value TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for parameter queries
CREATE INDEX idx_event_parameters_event_id ON event_parameters(event_id);
CREATE INDEX idx_event_parameters_name ON event_parameters(param_name);

-- Add RLS policies for security

-- Sessions policies
ALTER TABLE app_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Sessions are viewable by user" ON app_sessions
    FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Sessions are insertable by user" ON app_sessions
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Sessions are updatable by user" ON app_sessions
    FOR UPDATE
    USING (auth.uid() = user_id);

-- Events policies
ALTER TABLE events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Events are viewable by user" ON events
    FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Events are insertable by user" ON events
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- Event parameters policies
ALTER TABLE event_parameters ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Parameters are viewable by event owner" ON event_parameters
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1 FROM events
            WHERE events.id = event_parameters.event_id
            AND events.user_id = auth.uid()
        )
    );

CREATE POLICY "Parameters are insertable by event owner" ON event_parameters
    FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM events
            WHERE events.id = event_parameters.event_id
            AND events.user_id = auth.uid()
        )
    );