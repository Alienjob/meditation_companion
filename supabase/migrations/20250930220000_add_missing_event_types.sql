-- Add missing event types to valid_event_type constraint
-- Drop the existing constraint
ALTER TABLE events DROP CONSTRAINT IF EXISTS valid_event_type;

-- Recreate the constraint with the missing event types
ALTER TABLE events ADD CONSTRAINT valid_event_type CHECK (
    event_type IN (
        'meditation.session.start',
        'meditation.session.complete',
        'meditation.session.pause',
        'meditation.session.resume',
        'meditation.session.stop',
        'audio.volume.change',
        'audio.sound.toggle',
        'ui.screen.view',
        'ui.button.click'
    )
);