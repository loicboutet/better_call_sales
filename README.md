# WeSales - Sales Call Analysis Platform

A web application for analyzing commercial conversations, helping sales representatives refine their skills and improve progressively through practice.

---

## 🎯 Project Overview

WeSales provides detailed analysis of sales calls, highlights strengths and areas for improvement, and tracks sales representatives' progression over time. The platform uses AI-powered transcription (Eleven Labs recommended) and qualitative analysis to provide actionable insights.

### Key Features

- **Sales Representative Access**: Personal dashboard, call upload, detailed analysis, progress tracking
- **Manager Access**: Team performance overview, individual tracking, comparative analysis
- **Administrator Access**: User management, analysis criteria configuration, platform settings

---

## 📚 Documentation

All project documentation is located in the `doc/` directory:

- **[`doc/Better_Call_Sales_Methodologie_Complete.md`](doc/Better_Call_Sales_Methodologie_Complete.md)** ⭐ - Complete Better Call Sales methodology (foundation of the analysis system)
- **[`doc/specifications.md`](doc/specifications.md)** - Complete project specifications including features and requirements
- **[`doc/models.md`](doc/models.md)** - Data models, attributes, associations, and database schema
- **[`doc/routes.md`](doc/routes.md)** - Complete route structure organized by user role
- **[`doc/style_guide.md`](doc/style_guide.md)** - Design system, colors, typography, and UI components

### Additional Resources

- **Style Guide Reference**: `style_guide/style_guide.html` - Visual style guide
- **Design Inspiration**: [bonjourcactus.com](https://www.bonjourcactus.com/)
- **Logo Assets**: Available in `app/assets/images/` (`logo_long.png`, `logo_short.png`)

---

## 🎨 Current Phase: Mockup Development

### Objective

**Update the existing mockups to adapt them for the WeSales project.**

All mockups must respect the specifications defined in our documentation:
- Follow the data models from `doc/models.md`
- Implement all routes from `doc/routes.md`
- Apply the style guide from `doc/style_guide.md`
- Follow the specifications from `doc/specifications.md`
- **Respect the Better Call Sales methodology structure** from `doc/Better_Call_Sales_Methodologie_Complete.md`

### Requirements

#### ✅ Mockup Structure
- All mockup controllers must inherit from `MockupsController` or be within the `Mockups` namespace
- All routes must start with `/mockups`
- **NO database migrations or model creation** - mockups only
- Focus on views and user interface

#### ✅ Complete Coverage
- **Every route in `doc/routes.md` must have a corresponding mockup view**
- All views must load properly without errors
- Views should display realistic placeholder data

#### ✅ Frontend Stack
- **Tailwind CSS** for styling
- **Lucide Icons** for iconography
- **Stimulus** for interactive components (when necessary)
- Interface text in **French**

#### ✅ User Journeys
Routes are organized by user role for clear navigation:
- `/mockups/commercial/*` - Sales Representative journeys
- `/mockups/manager/*` - Manager journeys
- `/mockups/admin/*` - Administrator journeys

#### ✅ Methodology Integration
Views must reflect the Better Call Sales methodology:
- **Call type selection** in upload forms (Appel à froid, Découverte, Négociation, Closing, Soutenance AO)
- **Step-by-step analysis display** showing methodology stages (CRONOS, SYNTHÉON, FERMION)
- **Scoring breakdown** with 5 criteria per step (0-3 each, total /15 per step)
- **Performance level indicators** (Optimal 13-15, Good 9-12, Partial 5-8, Insufficient 0-4)
- **Recommendations per step** (2 concrete recommendations)
- **Posture assessment** per methodology stage

---

## 🚀 Deployment

The application automatically deploys to a subdomain when pushing to the `main` branch.

- **Deployment Platform**: Kamal 2.0
- **Target Server**: 195.201.116.228
- **Public URL**: [better-call-sales.5000.dev](https://better-call-sales.5000.dev)
- **Deployment Config**: See `.github/workflows/deploy.yml`

### Deployment Process

1. Push to `main` branch
2. GitHub Actions triggers automatic deployment
3. Application is built and deployed via Kamal
4. Check progress and results at the public URL

---

## 💻 Tech Stack

- **Ruby**: 3.3.0
- **Rails**: 8.0+
- **Database**: SQLite with Solid libraries (Rails 8 way)
- **Frontend**: Hotwire (Turbo & Stimulus), Tailwind CSS
- **Icons**: Lucide Icons
- **Authentication**: Devise (configured)
- **Deployment**: Kamal 2.0
- **CI/CD**: GitHub Actions

---

## 🏗️ Project Structure

```
.
├── app/
│   ├── controllers/
│   │   └── mockups/          # All mockup controllers
│   ├── views/
│   │   ├── mockups/
│   │   │   ├── commercial/   # Sales rep views
│   │   │   ├── manager/      # Manager views
│   │   │   └── admin/        # Admin views
│   │   └── layouts/
│   │       └── mockups/      # Role-specific layouts
│   └── assets/
│       └── images/           # Logo files
├── doc/                      # Project documentation
│   ├── Better_Call_Sales_Methodologie_Complete.md  # Methodology ⭐
│   ├── specifications.md     # Full specifications
│   ├── models.md            # Data models
│   ├── routes.md            # Routes structure
│   └── style_guide.md       # Design system
├── style_guide/
│   └── style_guide.html     # Visual style reference
└── config/
    ├── routes.rb            # Application routes
    └── deploy.yml           # Kamal deployment config
```

---

## 🎨 Design System

### Color Palette

- **Dark Purple** `#2B0E5D` - Primary (60% usage)
- **Flash Purple** `#6625CC` - Secondary (20% usage)
- **Light Orange** `#FF9A65` - Accent (10% usage)
- **Cream Orange** `#FCDFC9` - Accent (10% usage)
- **Noir** `#110624` - Text

### Typography

- **Headline 1**: 64px, Black weight
- **Headline 2**: 42px, Bold weight
- **Headline 3**: 28px, Medium weight
- **Subtitle**: 20px, Regular weight
- **Body 1**: 14px, Regular weight
- **Body 2**: 12px, Regular weight

See [`doc/style_guide.md`](doc/style_guide.md) for complete design system details.

---

## 📊 Better Call Sales Methodology

The platform is built around the **Better Call Sales methodology**, a structured B2B sales framework:

### Call Types & Methodologies

| Call Type | Methodology | Steps | Max Score | French Name |
|-----------|------------|-------|-----------|-------------|
| Cold Call | CRONOS | 7 | 105 | Appel à froid |
| Discovery | SYNTHÉON | 7 | 105 | Appel découverte |
| Negotiation | FERMION | 5 | 75 | Appel négociation |
| Closing | FERMION | 5 | 75 | Appel closing |
| RFP/Tender | SYNTHÉON | 9 | 135 | Soutenance AO |

### Scoring Structure

**Per Step:**
- 5 criteria evaluated
- Each criterion scored 0-3
- Total per step: 0-15

**Performance Levels:**
- **13-15**: Exécution optimale (Optimal)
- **9-12**: Bonne exécution (Good)
- **5-8**: Exécution partielle (Partial)
- **0-4**: Exécution insuffisante (Insufficient)

See [`doc/Better_Call_Sales_Methodologie_Complete.md`](doc/Better_Call_Sales_Methodologie_Complete.md) for complete methodology details.

---

## 📋 Development Checklist

### Phase 1: Mockups (Current)

- [ ] All authentication views (`/mockups/connexion`, password reset)
- [ ] Sales Representative views (11 views)
  - [ ] Dashboard (with methodology metrics)
  - [ ] Calls (index, show with methodology breakdown, new with call type, edit, analysis, transcription)
  - [ ] Progress (per methodology)
  - [ ] Profile (show, edit)
  - [ ] Settings
- [ ] Manager views (13 views)
  - [ ] Dashboard (team methodology performance)
  - [ ] Team (show, members, member detail with methodology)
  - [ ] Calls (index, show, member calls)
  - [ ] Analytics (index with methodology, comparison, criteria)
  - [ ] Profile (show, edit)
  - [ ] Settings
- [ ] Administrator views (21 views)
  - [ ] Dashboard
  - [ ] Users (index, show, new, edit)
  - [ ] Teams (index, show, new, edit)
  - [ ] Criteria (index with methodology structure, show, new, edit)
  - [ ] Settings (index, API, notifications)
  - [ ] Analytics (index, usage, performance)
  - [ ] Calls (index, show)
- [ ] Common views (3 views)
  - [ ] Notifications
  - [ ] Help (index, show)
- [ ] Layouts (3 role-specific layouts)

### Phase 2: Backend Implementation (Future)
- [ ] Create all models from `doc/models.md`
- [ ] Implement MethodologyTemplate with Better Call Sales data
- [ ] Implement authentication and authorization
- [ ] Integrate transcription API (Eleven Labs/Praxi)
- [ ] Build methodology-based analysis engine
- [ ] Implement step-by-step scoring logic
- [ ] Implement background jobs

### Phase 3: Chrome Extension (Brick 2 - Future)
- [ ] Chrome extension development with call type selection
- [ ] API endpoints for extension
- [ ] Recording functionality

---

## 🔧 Local Development

```bash
# Install dependencies
bundle install

# Setup database (when models are implemented)
rails db:setup

# Start the development server
bin/dev

# Run tests
rails test

# Lint code
rubocop
```

### Important Notes

- Do NOT run long-running commands like `bin/dev` in automated processes
- To restart the server: `touch tmp/restart.txt`
- Never commit directly - propose changes for review
- Keep view files under 400-500 lines

---

## 📝 Contributing

### Code Style
- Follow Ruby Style Guide
- Use idiomatic Ruby
- Keep code DRY
- Follow Rails naming conventions

### Testing
- Limit test output to avoid context overflow
- Always run tests after changes

### Git Workflow
1. Create feature branch
2. Implement changes
3. Test thoroughly
4. Push to trigger deployment
5. Review on [better-call-sales.5000.dev](https://better-call-sales.5000.dev)

---

## 🔐 Security

- User authentication via Devise
- Role-based access control (Admin, Manager, Sales Rep)
- Secure file upload and storage
- API authentication for Chrome extension (Phase 3)

---

## 📞 Support

For questions or issues related to the mockups or specifications, refer to the documentation in the `doc/` directory.

---

## 📄 License

This project is proprietary and confidential.

---

**Current Status**: Mockup Phase  
**Last Updated**: January 2025  
**Deployment**: [better-call-sales.5000.dev](https://better-call-sales.5000.dev)
