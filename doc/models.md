# Data Models - WeSales

## Overview

This document defines the data models required for the WeSales application based on the specifications and **Better Call Sales methodology**. All models follow Rails conventions and best practices.

The data model is structured to support the methodology's call types (Cold Call, Discovery, Negotiation, Closing, RFP) and their respective frameworks (CRONOS, SYNTHÉON, FERMION).

---

## User Model

Manages authentication and user roles across the platform.

### Attributes
- `email` (string, required, unique) - User email address
- `encrypted_password` (string, required) - Devise encrypted password
- `role` (enum, required) - User role: `sales_rep`, `manager`, `admin`
- `first_name` (string, required) - User's first name
- `last_name` (string, required) - User's last name
- `phone` (string, optional) - Contact phone number
- `avatar_url` (string, optional) - Profile picture URL
- `team_id` (integer, optional, foreign_key) - Reference to team (for sales_reps and managers)
- `status` (enum, required, default: 'active') - Account status: `active`, `inactive`, `suspended`
- `last_sign_in_at` (datetime) - Devise tracking
- `reset_password_token` (string) - Devise
- `reset_password_sent_at` (datetime) - Devise
- `remember_created_at` (datetime) - Devise
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :team` (optional)
- `has_many :calls` (as owner)
- `has_many :call_analyses`
- `has_many :notifications`

### Validations
- Email format and uniqueness
- Role inclusion in defined values
- First name and last name presence
- Password complexity (via Devise)

### Scopes
- `active` - Active users only
- `by_role(role)` - Filter by specific role
- `sales_reps` - All sales representatives
- `managers` - All managers

---

## Team Model

Represents a sales team within the organization.

### Attributes
- `name` (string, required) - Team name
- `description` (text, optional) - Team description
- `manager_id` (integer, optional, foreign_key) - Reference to user (manager)
- `status` (enum, required, default: 'active') - `active`, `inactive`
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :manager`, class_name: 'User', optional: true
- `has_many :members`, class_name: 'User', foreign_key: 'team_id'
- `has_many :calls`, through: :members

### Validations
- Name presence and uniqueness
- Manager must have manager or admin role (if present)

### Methods
- `active_members` - Returns active team members
- `performance_metrics` - Calculate team-wide performance
- `performance_by_call_type(call_type)` - Performance metrics per call type
- `methodology_strengths_weaknesses` - Identify team patterns per methodology

---

## Call Model

Represents a sales call/meeting recording and its metadata.

### Attributes
- `user_id` (integer, required, foreign_key) - Owner of the call (sales rep)
- `title` (string, required) - Call title/subject
- `description` (text, optional) - Call description or notes
- `call_date` (datetime, required) - When the call occurred
- `duration` (integer, optional) - Duration in seconds
- `call_type` (enum, required) - Type: `cold_call`, `discovery_call`, `negotiation_call`, `closing_call`, `rfp_call`
- `methodology` (enum, computed) - Methodology: `cronos`, `syntheon`, `fermion` (derived from call_type)
- `client_name` (string, optional) - Client/prospect name
- `client_company` (string, optional) - Client company
- `recording_url` (string, optional) - URL to audio file
- `recording_file_name` (string, optional) - Original file name
- `recording_file_size` (integer, optional) - File size in bytes
- `status` (enum, required, default: 'pending') - `pending`, `processing`, `transcribed`, `analyzed`, `failed`
- `source` (enum, required, default: 'manual') - `manual`, `extension`, `api`
- `transcription_provider` (string, optional) - 'eleven_labs' or 'praxi'
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :user`
- `has_one :transcription`, dependent: :destroy
- `has_one :call_analysis`, dependent: :destroy
- `has_many :call_participants`, dependent: :destroy
- `has_one_attached :audio_file` (Active Storage)

### Validations
- User presence
- Title presence
- Call date presence
- Call type inclusion in defined values
- Status inclusion in defined values
- Source inclusion in defined values

### Scopes
- `by_status(status)` - Filter by status
- `by_call_type(call_type)` - Filter by call type
- `by_methodology(methodology)` - Filter by methodology (CRONOS, SYNTHÉON, FERMION)
- `recent` - Ordered by call_date descending
- `for_user(user)` - Calls for specific user
- `analyzed` - Only analyzed calls
- `pending_analysis` - Calls waiting for analysis

### Methods
- `analyzed?` - Returns true if status is 'analyzed'
- `process_transcription!` - Trigger transcription job
- `duration_formatted` - Returns human-readable duration
- `methodology` - Returns methodology based on call_type
  - `cold_call` → `cronos`
  - `discovery_call` → `syntheon`
  - `negotiation_call` → `fermion`
  - `closing_call` → `fermion`
  - `rfp_call` → `syntheon`
- `expected_steps_count` - Returns expected number of steps based on call_type
- `overall_score` - Aggregated score from all methodology steps

### Call Type to Methodology Mapping
- **cold_call** → CRONOS (7 steps)
- **discovery_call** → SYNTHÉON (7 steps)
- **negotiation_call** → FERMION (5 steps)
- **closing_call** → FERMION (5 steps)
- **rfp_call** → SYNTHÉON (9 steps)

---

## Transcription Model

Stores the transcription of a call with speaker diarization.

### Attributes
- `call_id` (integer, required, foreign_key) - Reference to call
- `full_text` (text, required) - Complete transcription
- `language` (string, optional) - Detected language
- `confidence_score` (decimal, optional) - Overall transcription confidence (0.0 to 1.0)
- `provider` (string, required) - Transcription provider used
- `provider_response` (jsonb, optional) - Raw provider response
- `processing_time` (integer, optional) - Processing time in seconds
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :call`
- `has_many :transcription_segments`, dependent: :destroy

### Validations
- Call presence and uniqueness
- Full text presence
- Provider presence

---

## TranscriptionSegment Model

Represents individual segments/utterances in a transcription with speaker information.

### Attributes
- `transcription_id` (integer, required, foreign_key) - Reference to transcription
- `speaker` (string, required) - Speaker identifier (e.g., "Speaker 1", "Speaker 2")
- `text` (text, required) - Segment text
- `start_time` (decimal, required) - Start time in seconds
- `end_time` (decimal, required) - End time in seconds
- `confidence` (decimal, optional) - Segment confidence score (0.0 to 1.0)
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :transcription`

### Validations
- Transcription presence
- Speaker, text, start_time, end_time presence
- End time must be greater than start time

### Scopes
- `ordered` - Ordered by start_time
- `by_speaker(speaker)` - Filter by speaker

---

## CallAnalysis Model

Contains the qualitative analysis of a call based on Better Call Sales methodology.

### Attributes
- `call_id` (integer, required, foreign_key) - Reference to call
- `overall_score` (decimal, required) - Overall aggregated score from all steps
- `max_possible_score` (integer, required) - Maximum possible score based on call type
- `score_percentage` (decimal, computed) - Percentage score (overall_score / max_possible_score * 100)
- `call_type` (enum, required) - Denormalized from call for performance
- `methodology` (enum, required) - CRONOS, SYNTHÉON, or FERMION
- `summary` (text, optional) - AI-generated call summary
- `key_points` (jsonb, optional) - Array of key points from the call
- `action_items` (jsonb, optional) - Array of action items
- `strengths` (jsonb, optional) - Array of identified strengths (best methodology steps)
- `areas_for_improvement` (jsonb, optional) - Array of improvement areas (weakest steps)
- `recommendations` (text, optional) - Global personalized recommendations
- `analyzed_at` (datetime, required) - When analysis was completed
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :call`
- `has_many :methodology_step_scores`, dependent: :destroy

### Validations
- Call presence and uniqueness
- Overall score presence
- Call type and methodology presence
- Analyzed_at presence

### Methods
- `performance_level` - Returns 'excellent' (>80%), 'good' (60-80%), 'needs_improvement' (<60%)
- `comparison_to_previous` - Compare with user's previous calls of same type
- `strongest_steps` - Returns methodology steps with highest scores
- `weakest_steps` - Returns methodology steps with lowest scores
- `step_score(step_name)` - Get score for specific methodology step
- `progress_vs_baseline` - Compare to user's first call of this type

---

## MethodologyStepScore Model

Stores the score for each methodology step in a call analysis (Better Call Sales framework).

### Attributes
- `call_analysis_id` (integer, required, foreign_key) - Reference to call analysis
- `step_name` (string, required) - Step name from methodology (e.g., "Preparation", "Ice-breaker")
- `step_position` (integer, required) - Order position in methodology sequence
- `methodology` (enum, required) - CRONOS, SYNTHÉON, or FERMION
- `score` (decimal, required) - Total score for this step (0.0 to 15.0)
- `criterion_1_score` (decimal, required) - Score for criterion 1 (0-3)
- `criterion_1_name` (string, required) - Name of criterion 1
- `criterion_1_justification` (text, optional) - Factual justification for score
- `criterion_2_score` (decimal, required) - Score for criterion 2 (0-3)
- `criterion_2_name` (string, required) - Name of criterion 2
- `criterion_2_justification` (text, optional) - Factual justification for score
- `criterion_3_score` (decimal, required) - Score for criterion 3 (0-3)
- `criterion_3_name` (string, required) - Name of criterion 3
- `criterion_3_justification` (text, optional) - Factual justification for score
- `criterion_4_score` (decimal, required) - Score for criterion 4 (0-3)
- `criterion_4_name` (string, required) - Name of criterion 4
- `criterion_4_justification` (text, optional) - Factual justification for score
- `criterion_5_score` (decimal, required) - Score for criterion 5 (0-3)
- `criterion_5_name` (string, required) - Name of criterion 5
- `criterion_5_justification` (text, optional) - Factual justification for score
- `performance_level` (enum, computed) - `optimal` (13-15), `good` (9-12), `partial` (5-8), `insufficient` (0-4)
- `recommendations` (jsonb) - Array of 2 concrete recommendations for improvement
- `posture_expected` (string, optional) - Expected posture for this step
- `posture_observed` (text, optional) - Observed posture assessment
- `examples_from_call` (jsonb, optional) - Specific examples/quotes from call
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :call_analysis`

### Validations
- Call analysis presence
- Step name and position presence
- Methodology inclusion in defined values
- Score presence and range (0-15)
- All criterion scores presence and range (0-3)
- All criterion names presence
- Uniqueness of step_name per analysis

### Scopes
- `ordered` - Ordered by step_position
- `by_methodology(methodology)` - Filter by methodology
- `optimal_execution` - Score 13-15
- `needs_improvement` - Score < 9

### Methods
- `performance_level` - Calculate based on total score
- `criterion_scores_array` - Returns array of 5 criterion scores
- `all_criteria` - Returns structured hash of all criteria with scores and justifications

---

## MethodologyTemplate Model

Defines the Better Call Sales methodology templates (configuration model for admins).

### Attributes
- `call_type` (enum, required, unique) - `cold_call`, `discovery_call`, `negotiation_call`, `closing_call`, `rfp_call`
- `methodology` (enum, required) - `cronos`, `syntheon`, `fermion`
- `name` (string, required) - Display name (e.g., "Appel à froid - CRONOS")
- `description` (text, optional) - Description of the methodology
- `steps_count` (integer, required) - Number of steps in this methodology
- `max_score` (integer, computed) - Maximum possible score (steps_count × 15)
- `is_active` (boolean, required, default: true) - Whether this methodology is active
- `configuration` (jsonb, required) - Full methodology configuration with steps
- `timestamps` - created_at, updated_at

### Configuration JSONB Structure
```json
{
  "steps": [
    {
      "position": 1,
      "name": "Préparation",
      "description": "Consacrez précisément 60 secondes avant...",
      "posture": "Analytique, factuel",
      "criteria": [
        {
          "name": "Rôle & Niveau",
          "description": "Identification précise du rôle et du pouvoir de décision"
        },
        // ... 4 more criteria
      ],
      "evaluation_prompt": "Analyse ce call en te concentrant uniquement sur...",
      "sources": ["Gong Labs - Cold-calling tips"]
    }
    // ... more steps
  ]
}
```

### Associations
- None (configuration model)

### Validations
- Call type uniqueness
- Methodology presence
- Steps count must match configuration
- Configuration structure validation

### Scopes
- `active` - Only active methodologies
- `by_call_type(call_type)` - Filter by call type
- `by_methodology(methodology)` - Filter by methodology

### Methods
- `steps` - Returns array of step configurations
- `step_by_position(position)` - Get step configuration by position
- `step_by_name(name)` - Get step configuration by name
- `criteria_for_step(step_position)` - Get 5 criteria for specific step

---

## CallParticipant Model

Tracks participants in a call (future feature for labeling).

### Attributes
- `call_id` (integer, required, foreign_key) - Reference to call
- `name` (string, optional) - Participant name
- `role` (string, optional) - Participant role (e.g., "client", "sales_rep")
- `email` (string, optional) - Participant email
- `company` (string, optional) - Participant company
- `speaker_label` (string, optional) - Matching speaker label from transcription
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :call`

### Validations
- Call presence

---

## Notification Model

Manages user notifications for various events.

### Attributes
- `user_id` (integer, required, foreign_key) - Recipient user
- `title` (string, required) - Notification title
- `message` (text, required) - Notification message
- `notification_type` (string, required) - Type: `analysis_complete`, `new_recommendation`, `team_update`, `methodology_insight`, etc.
- `read_at` (datetime, optional) - When notification was read
- `action_url` (string, optional) - Link to related resource
- `related_type` (string, optional) - Polymorphic type
- `related_id` (integer, optional) - Polymorphic id
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :user`
- `belongs_to :related`, polymorphic: true, optional: true

### Validations
- User, title, message, notification_type presence

### Scopes
- `unread` - Only unread notifications
- `recent` - Ordered by created_at descending
- `by_type(type)` - Filter by notification type

### Methods
- `mark_as_read!` - Mark notification as read
- `unread?` - Check if unread

---

## ExtensionSession Model (Future - Brick 2)

Tracks browser extension recording sessions.

### Attributes
- `user_id` (integer, required, foreign_key) - User who initiated the session
- `session_token` (string, required, unique) - Unique session identifier
- `call_type` (enum, optional) - Pre-selected call type
- `started_at` (datetime, required) - Session start time
- `ended_at` (datetime, optional) - Session end time
- `status` (enum, required) - `active`, `completed`, `failed`
- `browser` (string, optional) - Browser information
- `extension_version` (string, optional) - Extension version
- `timestamps` - created_at, updated_at

### Associations
- `belongs_to :user`
- `has_one :call` (created from this session)

### Validations
- User presence
- Session token presence and uniqueness
- Started_at presence

---

## Model Relationships Summary

```
User
├── has_many :calls
├── has_many :call_analyses (through: calls)
├── has_many :notifications
└── belongs_to :team (optional)

Team
├── belongs_to :manager (User)
├── has_many :members (User)
└── has_many :calls (through: members)

Call
├── belongs_to :user
├── has_one :transcription
├── has_one :call_analysis
├── has_many :call_participants
└── has_one_attached :audio_file

Transcription
├── belongs_to :call
└── has_many :transcription_segments

TranscriptionSegment
└── belongs_to :transcription

CallAnalysis
├── belongs_to :call
└── has_many :methodology_step_scores

MethodologyStepScore
└── belongs_to :call_analysis

MethodologyTemplate
└── (standalone configuration model)

CallParticipant
└── belongs_to :call

Notification
├── belongs_to :user
└── belongs_to :related (polymorphic)

ExtensionSession (Brick 2)
├── belongs_to :user
└── has_one :call
```

---

## Database Indexes

Recommended indexes for performance:

- `users`: index on `email`, `role`, `team_id`, `status`
- `teams`: index on `manager_id`, `status`
- `calls`: index on `user_id`, `status`, `call_date`, `source`, `call_type`, `methodology`
- `transcriptions`: index on `call_id`
- `transcription_segments`: index on `transcription_id`, `start_time`
- `call_analyses`: index on `call_id`, `overall_score`, `analyzed_at`, `call_type`, `methodology`
- `methodology_step_scores`: index on `call_analysis_id`, `step_position`, `methodology`, `score`
- `methodology_templates`: index on `call_type`, `methodology`, `is_active`
- `call_participants`: index on `call_id`
- `notifications`: index on `user_id`, `read_at`, `created_at`, `notification_type`
- `extension_sessions`: index on `user_id`, `session_token`, `status`

---

## Better Call Sales Integration Notes

### Call Type Enum Values
- `cold_call` - Appel à froid (CRONOS, 7 steps)
- `discovery_call` - Appel découverte (SYNTHÉON, 7 steps)
- `negotiation_call` - Appel négociation (FERMION, 5 steps)
- `closing_call` - Appel closing (FERMION, 5 steps)
- `rfp_call` - Appel soutenance AO (SYNTHÉON, 9 steps)

### Methodology Enum Values
- `cronos` - Cold Call methodology
- `syntheon` - Discovery & RFP methodology
- `fermion` - Negotiation & Closing methodology

### Scoring Structure
- Each methodology step has 5 criteria
- Each criterion scored 0-3
- Total per step: 0-15
- Overall call score: sum of all step scores
- Maximum possible scores:
  - Cold Call (CRONOS): 105 (7 × 15)
  - Discovery (SYNTHÉON): 105 (7 × 15)
  - Negotiation (FERMION): 75 (5 × 15)
  - Closing (FERMION): 75 (5 × 15)
  - RFP (SYNTHÉON): 135 (9 × 15)

### Performance Interpretation
**Per Step (/15):**
- 13-15: Optimal execution
- 9-12: Good execution
- 5-8: Partial execution
- 0-4: Insufficient execution

**Overall (%age of max):**
- >80%: Excellent
- 60-80%: Good
- <60%: Needs improvement

---

## Data Storage Considerations

- All monetary values should be stored as decimals with precision: 10, scale: 2
- All score values should be stored as decimals with precision: 5, scale: 2
- JSON/JSONB columns are used for flexible data structures (recommendations, configuration)
- Active Storage is used for file uploads (audio files, avatars)
- Timestamps (created_at, updated_at) are included on all models
- Soft deletes could be implemented if needed using a `deleted_at` column
- Denormalization used strategically (call_type, methodology in CallAnalysis) for query performance
