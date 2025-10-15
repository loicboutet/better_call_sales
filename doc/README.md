# WeSales Documentation

This directory contains all the core documentation for the WeSales project, including the **Better Call Sales methodology** integration.

## 📄 Documents Overview

### 1. [Better Call Sales Methodology](Better_Call_Sales_Methodologie_Complete.md) ⭐
**Complete Better Call Sales methodology** - The foundation of the entire analysis system.

**Contents:**
- 5 call types with specific methodologies (CRONOS, SYNTHÉON, FERMION)
- Detailed breakdown of each methodology step
- Evaluation criteria (5 criteria per step, 0-3 scale each)
- Scoring interpretation (0-15 per step)
- AI analysis prompts for each step
- Recommended postures per stage
- Reference methods (SPIN, MEDDIC, Give-Get)
- Best practices and sources

**This is the cornerstone document** - All analysis features must align with this methodology.

---

### 2. [Specifications](specifications.md)
**Complete project specifications** including all features for Brick 1 (Web Application) and Brick 2 (Chrome Extension), **aligned with Better Call Sales methodology**.

**Contents:**
- General project description
- Features breakdown by user role (Sales Rep, Manager, Admin)
- Methodology-specific features (call type selection, step-by-step analysis)
- Common features (transcription, methodology-based analysis)
- Explicitly excluded features
- Technical specifications
- Analysis workflow integration with methodology
- Success criteria

**Key Integration:**
- Call type selection (Cold Call, Discovery, Negotiation, Closing, RFP)
- Methodology-based analysis (CRONOS, SYNTHÉON, FERMION)
- Step-by-step scoring (5 criteria × 3 points = 15 per step)
- Recommendations aligned with methodology gaps

---

### 3. [Models](models.md)
**Data models and database schema** defining all entities, **structured to support Better Call Sales methodology**.

**Key Models:**
- User (authentication and roles)
- Team (sales team structure)
- Call (with `call_type` and `methodology` fields)
- Transcription (speech-to-text results)
- CallAnalysis (overall analysis with methodology tracking)
- **MethodologyStepScore** (stores score per methodology step with 5 criteria)
- **MethodologyTemplate** (configurable methodology definitions)
- Notification (user notifications)
- ExtensionSession (Chrome extension sessions - Brick 2)

**Methodology Integration:**
- Call type enum: `cold_call`, `discovery_call`, `negotiation_call`, `closing_call`, `rfp_call`
- Methodology enum: `cronos`, `syntheon`, `fermion`
- MethodologyStepScore: 5 criterion scores (0-3 each) + justifications + recommendations
- Scoring structure: 0-15 per step, aggregated for overall score
- Maximum possible scores per call type (105, 75, or 135 based on step count)

**Includes:**
- Model attributes and types
- Associations and relationships
- Validations and constraints
- Scopes and methods
- Database indexes
- Better Call Sales scoring structure

---

### 4. [Routes](routes.md)
**Complete route structure** organized by user role with REST principles.

**Contents:**
- Authentication routes
- Sales Representative routes (11 views)
- Manager routes (13 views)
- Administrator routes (21 views)
- Common/shared routes (3 views)
- API routes (Brick 2 - future)

**Important:**
- All mockup routes are scoped under `/mockups`
- Routes organized by user journey
- Clear view requirements for each route
- Total: ~51 views + 3 layouts needed
- Analysis views must display methodology breakdown

---

### 5. [Style Guide](style_guide.md)
**Design system and UI guidelines** for consistent branding.

**Contents:**
- Color palette (Dark Purple, Flash Purple, Light Orange, Cream Orange)
- Typography hierarchy (Headlines, Body, etc.)
- UI component styles (buttons, cards, inputs, badges)
- Layout guidelines (spacing, containers, borders)
- Icon system (Lucide Icons)
- Accessibility guidelines
- Responsive design breakpoints
- Tailwind configuration

**Reference:**
- Design inspiration: [bonjourcactus.com](https://www.bonjourcactus.com/)
- Visual style guide: `../style_guide/style_guide.html`
- Logo assets: `../app/assets/images/`

---

## 🎯 Current Phase: Mockup Development

The current phase focuses on creating mockups for ALL routes defined in `routes.md`, with **methodology-aware views**.

### Requirements:
✅ All mockup controllers inherit from `MockupsController`  
✅ All routes start with `/mockups`  
✅ NO database migrations or model creation  
✅ All views must load properly  
✅ Use Tailwind CSS + Lucide Icons + Stimulus  
✅ All interface text in French  
✅ **Display methodology structure in analysis views**  
✅ **Show call type selection in upload forms**  
✅ **Present step-by-step scores with criteria breakdown**  

### Methodology-Specific View Requirements:

**Call Upload Views:**
- Call type selection dropdown (Appel à froid, Découverte, Négociation, Closing, Soutenance AO)
- Visual indication of methodology that will be applied

**Analysis Views:**
- Overall score with maximum possible score based on call type
- Methodology name display (CRONOS, SYNTHÉON, FERMION)
- Step-by-step breakdown with scores (/15)
- 5 criteria per step with individual scores (0-3)
- Performance level per step (Optimal, Good, Partial, Insufficient)
- Recommendations per step
- Posture assessment per step

**Dashboard Views:**
- Performance metrics by call type
- Methodology-specific trends
- Strongest/weakest methodology steps
- Progress tracking per call type

**Manager Views:**
- Team performance by call type and methodology
- Collective strengths/weaknesses per methodology step
- Coaching opportunities based on methodology gaps

### View Count:
- **Authentication**: 3 views
- **Sales Rep**: 11 views (with methodology integration)
- **Manager**: 13 views (with methodology analytics)
- **Admin**: 21 views (with methodology configuration)
- **Common**: 3 views
- **Layouts**: 3 role-specific layouts

**Total: ~51 views**

---

## 🔗 Quick Links

- **Main README**: [../README.md](../README.md)
- **Methodology Document**: [Better_Call_Sales_Methodologie_Complete.md](Better_Call_Sales_Methodologie_Complete.md)
- **Style Guide HTML**: [../style_guide/style_guide.html](../style_guide/style_guide.html)
- **Logo Assets**: [../app/assets/images/](../app/assets/images/)
- **Deployment URL**: [better-call-sales.5000.dev](https://better-call-sales.5000.dev)

---

## 📋 Document Checklist

Use this checklist when implementing features:

- [ ] **Read `Better_Call_Sales_Methodologie_Complete.md`** - Understand the methodology foundation
- [ ] **Read `specifications.md`** - Understand what to build with methodology integration
- [ ] **Review `models.md`** - Understand data structure for methodology support
- [ ] **Check `routes.md`** - Know what views to create
- [ ] **Apply `style_guide.md`** - Ensure consistent design

---

## 🎓 Understanding Better Call Sales Methodology

### Call Types & Methodologies

| Call Type | Methodology | Steps | Max Score |
|-----------|------------|-------|-----------|
| Appel à froid (Cold Call) | CRONOS | 7 | 105 |
| Appel découverte (Discovery) | SYNTHÉON | 7 | 105 |
| Appel négociation (Negotiation) | FERMION | 5 | 75 |
| Appel closing (Closing) | FERMION | 5 | 75 |
| Soutenance AO (RFP) | SYNTHÉON | 9 | 135 |

### Scoring Structure

**Per Step:**
- 5 criteria evaluated
- Each criterion scored 0-3
- Total per step: 0-15

**Score Interpretation (per step):**
- **13-15**: Exécution optimale (Optimal)
- **9-12**: Bonne exécution (Good)
- **5-8**: Exécution partielle (Partial)
- **0-4**: Exécution insuffisante (Insufficient)

**Overall Call:**
- Sum of all step scores
- Compare to maximum possible for call type
- Percentage calculation for trend analysis

### AI Analysis Requirements

For each methodology step, AI must:
1. Evaluate each of 5 criteria (0-3)
2. Provide factual justification from transcript
3. Calculate total step score (/15)
4. Interpret according to Better Call Sales scale
5. Provide 2 concrete recommendations
6. Assess posture alignment

---

## 🚀 Next Steps

### Phase 1 (Current): Mockups
1. Create all mockup views with methodology structure
2. Display call type selection
3. Show step-by-step analysis breakdown
4. Present criteria scores and justifications
5. Display recommendations per step

### Phase 2: Backend Implementation
1. Implement models with methodology support
2. Create MethodologyTemplate seeding with Better Call Sales data
3. Build AI analysis engine following methodology prompts
4. Implement step-by-step scoring logic
5. Generate recommendations based on methodology gaps

### Phase 3: Chrome Extension (Brick 2)
1. Add call type selection to extension
2. Pass call type to API during upload
3. Display methodology-based analysis results

---

## 📊 Methodology Data Structure Example

```ruby
# Call
call_type: "cold_call"
methodology: "cronos" # computed

# CallAnalysis
overall_score: 92.0
max_possible_score: 105
score_percentage: 87.6

# MethodologyStepScore (x7 for CRONOS)
{
  step_name: "Préparation",
  step_position: 1,
  methodology: "cronos",
  score: 14.0,
  criterion_1_score: 3.0,
  criterion_1_name: "Rôle & Niveau",
  criterion_1_justification: "Identification précise...",
  # ... 4 more criteria
  performance_level: "optimal",
  recommendations: ["Recommandation 1", "Recommandation 2"],
  posture_expected: "Analytique, factuel",
  posture_observed: "Posture bien alignée..."
}
```

---

## 🔄 Document Updates

When the Better Call Sales methodology evolves:
1. Update `Better_Call_Sales_Methodologie_Complete.md`
2. Review and update `specifications.md` if needed
3. Adjust `models.md` if data structure changes
4. Update MethodologyTemplate seeds in Rails app
5. Revise AI prompts in analysis engine
6. Update mockup views to reflect changes

---

**Version:** 1.0  
**Last Updated:** January 2025  
**Methodology Version:** 1.0 (October 2025)
