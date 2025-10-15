# Project Specifications - WeSales

## 1. General Description

Development of a web application for analyzing commercial conversations, allowing sales representatives to refine their skills and improve progressively through their practice. The application will provide detailed analysis of sales calls, highlight strengths and areas for improvement, and track sales representatives' progression over time.

The platform implements the **Better Call Sales methodology**, a structured framework for B2B sales cycle analysis covering:
- Cold Calls (CRONOS method)
- Discovery Calls (SYNTHÉON method)
- Negotiation Calls (FERMION method)
- Closing Calls (FERMION method)
- RFP/Tender Calls (SYNTHÉON method)

It is recommended to use Eleven Labs as the speech-to-text model to ensure quality transcription with diarization.

## 2. Features to Develop

### Brick 1: Web Application (5,000€ HT)

#### [Sales Representative Access]

**Personal Dashboard**
- Display personal scores and progression by call type and methodology step
- Overview of recent calls with analysis breakdown by Better Call Sales stages
- Quick access to personalized recommendations based on weakest methodology steps
- Progress trends per methodology (CRONOS, SYNTHÉON, FERMION)

**Call History**
- Visualization of all past calls with their analyses
- Filtering by call type (Cold Call, Discovery, Negotiation, Closing, RFP)
- Filtering by methodology and specific steps
- Sorting capabilities (by date, score, client, call type, etc.)
- Search functionality

**Audio/Transcription Upload**
- Manual upload of audio files
- Call type selection during upload (Cold Call, Discovery, Negotiation, Closing, RFP)
- Upload of existing transcriptions
- Support for multiple audio formats (MP3, WAV, M4A, etc.)

**Detailed Analysis Consultation**
- Access to complete analyses of each call
- Analysis structured by Better Call Sales methodology stages
- Score per methodology step (0-15 scale with 5 criteria per step)
- Detailed evaluation of each criterion (0-3 scale)
- Display of specific posture recommendations per stage
- Personalized recommendations for improvement based on methodology

**Structured Call Reports**
- Automatic generation of meeting summaries
- Key points extraction aligned with methodology stages
- Action items and follow-ups
- Methodology-specific insights

**Progress Tracking**
- Evolution tracking per call type
- Improvement trends per methodology step
- Identification of consistently strong/weak stages
- Comparison to personal best scores

#### [Manager Access]

**Team Performance Dashboard**
- Consolidated view of commercial team performance
- Team-wide metrics by call type and methodology
- Comparative analysis across team members
- Identification of collective strengths/weaknesses per methodology step

**Collective Strengths & Weaknesses**
- Identification of team-wide patterns across methodologies
- Common areas of excellence by call type
- Areas requiring collective improvement
- Methodology-specific coaching opportunities

**Individual Progression Tracking**
- Monitor each sales representative's evolution per methodology
- Compare performance over time by call type
- Identify coaching opportunities based on methodology gaps
- Stage-by-stage performance comparison

**Team Call History Access**
- Access to all team members' calls
- Filter by team member, date, client, call type, methodology stage
- View detailed analyses with methodology breakdown

**Filtering and Comparative Analysis Tools**
- Advanced filtering options by methodology components
- Side-by-side comparison of team members per call type
- Methodology step comparison across team
- Export capabilities for reporting

**Coaching Tools**
- Identify team members struggling with specific methodology steps
- Access to methodology reference material
- Recommend targeted training based on gaps

#### [Administrator Access]

**Complete User Management**
- Create, edit, and delete user accounts
- Assign roles and permissions (Admin, Manager, Sales Rep)
- Manage team structures

**Analysis Criteria Configuration**
- Configure Better Call Sales methodology criteria
- Customize evaluation criteria per call type and methodology step
- Set scoring parameters aligned with 0-3 scale per criterion
- Define the 5 criteria per methodology step
- Configure weight of different criteria (if needed for overall scoring)

**Methodology Configuration**
- Define call types (Cold Call, Discovery, Negotiation, Closing, RFP)
- Configure methodology steps per call type
- Set evaluation prompts per step for AI analysis
- Configure posture recommendations per step

**Platform Parameters**
- Global application settings
- API configuration (Eleven Labs or Praxi)
- Notification settings
- Methodology display preferences

**Full Platform Access**
- Access to all features available to Managers and Sales Reps
- System monitoring and health checks

**General Administration Dashboard**
- Overview of platform usage
- User statistics
- System performance metrics
- Analysis distribution by call type

#### [Common Features]

**Conversation Processing & Analysis**
- Integration with transcription API (Praxi OR Eleven Labs - latter recommended)
- Automatic speaker diarization
- Conversation segmentation

**Structured Call Report Generation**
- Automatic summary creation
- Key points extraction
- Action items identification
- Methodology-aligned insights

**Qualitative Call Analysis Based on Better Call Sales Methodology**
- Evaluation based on call type-specific methodologies
- Scoring system aligned with Better Call Sales (0-15 per step, 5 criteria × 3 points)
- Analysis structured by methodology stages (CRONOS, SYNTHÉON, FERMION)
- Trend analysis over time per methodology step
- Identification of posture alignment

**Call Type Detection & Analysis**
- Automatic or manual call type identification (Cold Call, Discovery, Negotiation, Closing, RFP)
- Methodology-specific analysis workflow:
  - **Cold Call (CRONOS)**: Preparation, Permission Opener, Value Statement, Micro-qualification, Objection Handling, Calendar CTA, Live Confirmation
  - **Discovery Call (SYNTHÉON)**: Ice-breaker, Moral Contract, BEBEDC/MEDDIC Grid, SPIN Questions, Active Listening, Summary & Vision, Action Plan
  - **Negotiation Call (FERMION)**: Reconnection, Open Objections, Price Discussion, Legal & Procurement, Verbal Agreement
  - **Closing Call (FERMION)**: Reconnection, Open Objections, Price Discussion, Legal & Procurement, Post-Agreement Verbal
  - **RFP/Tender Call (SYNTHÉON)**: Intro Shock, Live Micro-POC, Solution Presentation, 30-60-90d ROI, Success Stories, Objection Management, Pricing & Conditions, Next Steps, Q&A

**AI-Powered Analysis per Methodology Step**
- Detailed evaluation of each of the 5 criteria per step (0-3 scale)
- Total score per step (/15)
- Interpretation according to Better Call Sales scale:
  - 13-15: Optimal execution
  - 9-12: Good execution, improvable
  - 5-8: Partial execution
  - 0-4: Insufficient execution
- Factual justification for each criterion score
- 2 concrete recommendations per step for improvement
- Posture assessment per stage

---

### Brick 2: Browser Extension and API (2,500€ HT)

#### Chrome Extension Features

**User Authentication**
- Secure login system
- Session management
- Token-based authentication

**Recording Control**
- Simple start/stop recording button
- Visual recording indicator
- Recording timer

**Call Type Selection**
- Quick selection of call type before/during recording
- Default call type preferences

**Automatic Upload**
- Automatic sending of audio file to platform after recording stop
- Progress indicator during upload
- Error handling and retry mechanism

**Automatic Meeting Creation**
- Automatic creation of meeting record in the application
- Pre-filled meeting information (date, duration, call type)
- Link to full analysis once processed

**Minimalist Interface**
- Non-intrusive design
- Integration with meeting windows
- Quick access to essential functions

#### API Development

**Authentication Endpoints**
- User login/logout
- Token generation and validation
- Session management

**Audio File Upload Endpoints**
- Secure file upload
- File validation (format, size)
- Progress tracking
- Call type specification

**Meeting Creation Endpoints**
- Create meeting records with call type
- Associate audio files with meetings
- Update meeting status

**Security Features**
- HTTPS/TLS encryption
- Rate limiting
- Input validation and sanitization

---

## 3. Explicitly Excluded Features

The following elements are explicitly excluded from the scope:

❌ **Auto-join Bot for Meetings** (planned for future phase)
- Automatic bot connection to online meetings
- Real-time meeting participation

❌ **Real-time Analysis During Calls** ("live analysis")
- Analysis while the call is ongoing
- Real-time feedback during conversations

❌ **Direct CRM Integration** (planned for future phase)
- Automatic synchronization with Salesforce, HubSpot, etc.
- Automatic contact and opportunity updates

❌ **Coach Matching Features**
- Connection with external coaches
- Coach marketplace

❌ **Participant Labeling System** (planned for future phase)
- Automatic identification of participants
- Client/prospect tagging system

❌ **Complete Design Overhaul**
- A functional design is provided
- Advanced customization will require future designer intervention

❌ **Custom Methodology Creation**
- Users cannot create their own methodologies
- Better Call Sales methodology is the standard framework

---

## 4. Technical Specifications

### Recommended Tech Stack
- **Backend**: Ruby on Rails 8
- **Database**: SQLite with Solid libraries (Rails 8 way)
- **Frontend**: Hotwire (Turbo & Stimulus), Tailwind CSS
- **Speech-to-Text**: Eleven Labs (recommended) or Praxi
- **Browser Extension**: Chrome Extension with JavaScript
- **AI Analysis**: OpenAI GPT or similar for methodology-based analysis

### Key Technical Requirements
- RESTful API design
- Responsive design (mobile, tablet, desktop)
- Secure file upload and storage
- Background job processing for transcription and analysis
- Real-time notifications for analysis completion
- Performance optimization for large audio files
- Data privacy and security compliance
- Structured data storage for methodology-specific scores

### User Roles & Permissions
1. **Admin**: Full access to all features including methodology configuration
2. **Manager**: Team management, overview, and coaching tools
3. **Sales Representative**: Personal dashboard and history

### Analysis Workflow Integration
1. **Upload**: User uploads call with call type selection
2. **Transcription**: Audio processed with speaker diarization
3. **Call Type Confirmation**: System confirms or adjusts call type
4. **Methodology Application**: Appropriate methodology applied (CRONOS/SYNTHÉON/FERMION)
5. **Step-by-Step Analysis**: Each methodology step analyzed with 5 criteria
6. **Scoring**: 0-3 per criterion, total /15 per step
7. **Recommendations**: 2 actionable recommendations per step
8. **Report Generation**: Complete analysis with methodology breakdown
9. **Notification**: User notified of completed analysis

---

## 5. Better Call Sales Methodology Integration

### Call Types and Methodologies

**1. Cold Call - CRONOS Method**
- 7 steps analyzed
- Focus: efficiency, respect, qualification
- Total possible score: 105 points (7 steps × 15)

**2. Discovery Call - SYNTHÉON Method**
- 7 steps analyzed
- Focus: qualification, understanding, alignment
- Total possible score: 105 points (7 steps × 15)

**3. Negotiation Call - FERMION Method**
- 5 steps analyzed
- Focus: value, objections, conditions
- Total possible score: 75 points (5 steps × 15)

**4. Closing Call - FERMION Method**
- 5 steps analyzed
- Focus: commitment, formalization, momentum
- Total possible score: 75 points (5 steps × 15)

**5. RFP/Tender Call - SYNTHÉON Method**
- 9 steps analyzed
- Focus: differentiation, proof, structure
- Total possible score: 135 points (9 steps × 15)

### Scoring System

**Per Criterion (5 criteria per step):**
- **0**: Element absent or off-topic
- **1**: Element present but weak, imprecise, or generic
- **2**: Clear element but partial or improvable execution
- **3**: Perfectly executed, precise, contextualized, impactful

**Per Step (5 criteria × 3 points):**
- **13-15**: Optimal execution, objective fully achieved
- **9-12**: Good execution but improvable on one or more levers
- **5-8**: Partial execution, lacking impact or structure
- **0-4**: Insufficient execution, high risk of step failure

**Overall Call:**
- Aggregation of all step scores
- Identification of strongest/weakest steps
- Comparison to previous calls of same type
- Progress trends

### AI Analysis Requirements

For each methodology step, AI must:
1. Identify presence of step execution
2. Evaluate each of 5 criteria (0-3)
3. Provide factual justification from call transcript
4. Calculate total step score (/15)
5. Interpret score according to Better Call Sales scale
6. Provide 2 concrete, actionable recommendations
7. Assess posture alignment

---

## 6. Success Criteria

✅ Sales reps can upload audio files with call type selection and receive detailed methodology-based analyses  
✅ Analysis respects Better Call Sales framework with accurate step-by-step scoring  
✅ Managers can track team performance per methodology and identify coaching opportunities  
✅ Admins can configure criteria aligned with Better Call Sales methodology  
✅ Chrome extension successfully records and uploads calls with call type tagging  
✅ Transcription quality is high with proper speaker diarization  
✅ Analysis provides actionable insights and recommendations aligned with methodology  
✅ Platform is intuitive and clearly displays methodology structure  
✅ System is secure and performant  
✅ Progress tracking shows evolution per methodology step and call type  

---

## 7. Reference Documentation

- **Better Call Sales Methodology**: See `doc/Better_Call_Sales_Methodologie_Complete.md`
- **Data Models**: See `doc/models.md` (updated to reflect methodology structure)
- **Routes**: See `doc/routes.md`
- **Style Guide**: See `doc/style_guide.md`

---

This specification document constitutes the contractual scope of developments to be realized, integrating the Better Call Sales methodology as the core analysis framework.
