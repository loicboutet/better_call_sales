# Routes - WeSales

## Overview

This document defines all the routes for the WeSales application, organized by user role for clear user journeys. All routes follow REST principles and Rails conventions.

**Important**: All routes are scoped under `/mockups` and handled by controllers inheriting from `MockupsController` for the initial mockup phase.

---

## Authentication Routes (Public)

These routes are available to non-authenticated users.

```ruby
# Login/Logout
GET    /mockups/connexion           mockups/auth#new              # Login form
POST   /mockups/connexion           mockups/auth#create           # Process login
DELETE /mockups/deconnexion         mockups/auth#destroy          # Logout

# Password Reset
GET    /mockups/mot-de-passe-oublie mockups/passwords#new         # Password reset request
POST   /mockups/mot-de-passe-oublie mockups/passwords#create      # Send reset email
GET    /mockups/reinitialiser/:token mockups/passwords#edit       # Reset password form
PATCH  /mockups/reinitialiser/:token mockups/passwords#update     # Update password
```

**Views Required:**
- `mockups/auth/new.html.erb` - Login form
- `mockups/passwords/new.html.erb` - Password reset request
- `mockups/passwords/edit.html.erb` - Password reset form

---

## Sales Representative Routes

Scoped under `/mockups/commercial` for sales representative user journey.

### Dashboard

```ruby
GET /mockups/commercial/tableau-de-bord  mockups/commercial/dashboard#index
```

**View**: `mockups/commercial/dashboard/index.html.erb`

**Should Display:**
- Personal performance metrics (overall score, recent trend)
- Recent calls summary (last 5-10 calls with quick stats)
- Progress chart/graph over time
- Quick stats cards (total calls, avg score, improvement rate)
- Recent notifications
- Quick action buttons (upload new call, view history)

---

### Calls Management

```ruby
# List all calls
GET    /mockups/commercial/appels            mockups/commercial/calls#index

# View single call
GET    /mockups/commercial/appels/:id        mockups/commercial/calls#show

# Upload new call
GET    /mockups/commercial/appels/nouveau    mockups/commercial/calls#new
POST   /mockups/commercial/appels            mockups/commercial/calls#create

# Edit call metadata
GET    /mockups/commercial/appels/:id/editer mockups/commercial/calls#edit
PATCH  /mockups/commercial/appels/:id        mockups/commercial/calls#update

# Delete call
DELETE /mockups/commercial/appels/:id        mockups/commercial/calls#destroy
```

**Views Required:**
- `mockups/commercial/calls/index.html.erb` - List of all calls with filters (date, client, score, status)
- `mockups/commercial/calls/show.html.erb` - Single call detail with full analysis
- `mockups/commercial/calls/new.html.erb` - Upload form (audio file or transcription)
- `mockups/commercial/calls/edit.html.erb` - Edit call metadata

**Index View Should Display:**
- Filterable/sortable table of calls
- Search functionality
- Status indicators (pending, processing, analyzed)
- Quick score view
- Date, client name, duration
- Pagination

**Show View Should Display:**
- Call metadata (date, client, duration)
- Overall score with visual indicator
- Full transcription with speaker labels
- Detailed analysis by criteria
- Strengths and areas for improvement
- Specific recommendations
- Action items
- Audio player (if audio available)

---

### Analysis & Reports

```ruby
# View call analysis detail
GET /mockups/commercial/appels/:id/analyse  mockups/commercial/calls#analysis

# View call transcription
GET /mockups/commercial/appels/:id/transcription  mockups/commercial/calls#transcription
```

**Views Required:**
- `mockups/commercial/calls/analysis.html.erb` - Detailed analysis breakdown
- `mockups/commercial/calls/transcription.html.erb` - Full transcription with timestamps

**Analysis View Should Display:**
- Overall score (large, prominent)
- Score breakdown by criteria with visual indicators
- Detailed comments per criterion
- Examples from the call
- Comparison to previous calls
- Progress indicators
- Downloadable report option

---

### Progress & Statistics

```ruby
GET /mockups/commercial/progression  mockups/commercial/progress#index
```

**View**: `mockups/commercial/progress/index.html.erb`

**Should Display:**
- Historical performance chart
- Trend analysis (improving, stable, declining)
- Criteria-specific progress
- Comparison to personal best
- Achievements/milestones
- Areas of consistent strength
- Areas needing focus

---

### Profile & Settings

```ruby
# View profile
GET   /mockups/commercial/profil        mockups/commercial/profile#show

# Edit profile
GET   /mockups/commercial/profil/editer mockups/commercial/profile#edit
PATCH /mockups/commercial/profil        mockups/commercial/profile#update

# Settings
GET   /mockups/commercial/parametres    mockups/commercial/settings#index
PATCH /mockups/commercial/parametres    mockups/commercial/settings#update
```

**Views Required:**
- `mockups/commercial/profile/show.html.erb` - Profile information
- `mockups/commercial/profile/edit.html.erb` - Edit profile form
- `mockups/commercial/settings/index.html.erb` - User settings

**Profile View Should Display:**
- Personal information (name, email, phone, avatar)
- Team affiliation
- Account statistics
- Edit button

**Settings View Should Display:**
- Notification preferences
- Password change
- Display preferences
- Language settings (future)

---

## Manager Routes

Scoped under `/mockups/manager` for manager user journey.

### Dashboard

```ruby
GET /mockups/manager/tableau-de-bord  mockups/manager/dashboard#index
```

**View**: `mockups/manager/dashboard/index.html.erb`

**Should Display:**
- Team overview metrics
- Individual team member performance summary
- Recent team calls
- Team trends (improving, needs attention)
- Top performers
- Areas needing team-wide improvement
- Quick access to team members

---

### Team Management

```ruby
# View team
GET /mockups/manager/equipe           mockups/manager/team#show

# Team member list
GET /mockups/manager/equipe/membres   mockups/manager/team#members

# Individual team member view
GET /mockups/manager/equipe/membres/:id  mockups/manager/team#member
```

**Views Required:**
- `mockups/manager/team/show.html.erb` - Team overview
- `mockups/manager/team/members.html.erb` - List of team members
- `mockups/manager/team/member.html.erb` - Individual member detail

**Team Show View Should Display:**
- Team name and description
- Team statistics
- Manager information
- Member count
- Recent team activity

**Members View Should Display:**
- List of all team members
- Individual performance indicators
- Quick stats per member
- Filter/sort options
- Link to detailed member view

**Member Detail View Should Display:**
- Member profile information
- Performance metrics
- Call history
- Progress over time
- Comparison to team average
- Coaching recommendations

---

### Team Calls & Analysis

```ruby
# View all team calls
GET /mockups/manager/appels           mockups/manager/calls#index

# View specific team member's call
GET /mockups/manager/appels/:id       mockups/manager/calls#show

# Team member's calls
GET /mockups/manager/membres/:id/appels  mockups/manager/members#calls
```

**Views Required:**
- `mockups/manager/calls/index.html.erb` - All team calls
- `mockups/manager/calls/show.html.erb` - Single call detail
- `mockups/manager/members/calls.html.erb` - Specific member's calls

**Team Calls Index Should Display:**
- All team calls with filters (member, date, score, client)
- Sortable columns
- Status indicators
- Quick access to analyses
- Export options

---

### Team Analytics

```ruby
# Team performance analytics
GET /mockups/manager/analyses         mockups/manager/analytics#index

# Comparative analysis
GET /mockups/manager/analyses/comparaison  mockups/manager/analytics#comparison

# Criteria breakdown
GET /mockups/manager/analyses/criteres  mockups/manager/analytics#criteria
```

**Views Required:**
- `mockups/manager/analytics/index.html.erb` - Overall team analytics
- `mockups/manager/analytics/comparison.html.erb` - Compare team members
- `mockups/manager/analytics/criteria.html.erb` - Criteria-specific analysis

**Analytics Index Should Display:**
- Team performance trends
- Collective strengths and weaknesses
- Criteria-specific team performance
- Time-based comparisons
- Distribution charts (score distribution across team)
- Improvement opportunities

**Comparison View Should Display:**
- Side-by-side comparison of selected team members
- Multi-member performance charts
- Relative strengths and weaknesses
- Filtering and selection tools

---

### Manager Profile & Settings

```ruby
GET   /mockups/manager/profil        mockups/manager/profile#show
GET   /mockups/manager/profil/editer mockups/manager/profile#edit
PATCH /mockups/manager/profil        mockups/manager/profile#update
GET   /mockups/manager/parametres    mockups/manager/settings#index
PATCH /mockups/manager/parametres    mockups/manager/settings#update
```

**Views Required:**
- `mockups/manager/profile/show.html.erb`
- `mockups/manager/profile/edit.html.erb`
- `mockups/manager/settings/index.html.erb`

---

## Administrator Routes

Scoped under `/mockups/admin` for administrator user journey.

### Dashboard

```ruby
GET /mockups/admin/tableau-de-bord  mockups/admin/dashboard#index
```

**View**: `mockups/admin/dashboard/index.html.erb`

**Should Display:**
- Platform-wide statistics
- User count by role
- Total calls processed
- System health indicators
- Recent activity
- Platform usage trends
- Quick admin actions

---

### User Management

```ruby
# List users
GET    /mockups/admin/utilisateurs            mockups/admin/users#index

# View user
GET    /mockups/admin/utilisateurs/:id        mockups/admin/users#show

# Create user
GET    /mockups/admin/utilisateurs/nouveau    mockups/admin/users#new
POST   /mockups/admin/utilisateurs            mockups/admin/users#create

# Edit user
GET    /mockups/admin/utilisateurs/:id/editer mockups/admin/users#edit
PATCH  /mockups/admin/utilisateurs/:id        mockups/admin/users#update

# Delete user
DELETE /mockups/admin/utilisateurs/:id        mockups/admin/users#destroy
```

**Views Required:**
- `mockups/admin/users/index.html.erb` - User list with filters
- `mockups/admin/users/show.html.erb` - User detail
- `mockups/admin/users/new.html.erb` - Create user form
- `mockups/admin/users/edit.html.erb` - Edit user form

**Index View Should Display:**
- Searchable/filterable user table
- Role badges
- Status indicators
- Team affiliation
- Last login
- Quick actions (edit, activate/deactivate)

**Show View Should Display:**
- Complete user information
- Activity history
- Performance stats (if sales rep)
- Team information
- Permissions
- Action buttons

---

### Team Management

```ruby
# List teams
GET    /mockups/admin/equipes            mockups/admin/teams#index

# View team
GET    /mockups/admin/equipes/:id        mockups/admin/teams#show

# Create team
GET    /mockups/admin/equipes/nouveau    mockups/admin/teams#new
POST   /mockups/admin/equipes            mockups/admin/teams#create

# Edit team
GET    /mockups/admin/equipes/:id/editer mockups/admin/teams#edit
PATCH  /mockups/admin/equipes/:id        mockups/admin/teams#update

# Delete team
DELETE /mockups/admin/equipes/:id        mockups/admin/teams#destroy
```

**Views Required:**
- `mockups/admin/teams/index.html.erb` - Team list
- `mockups/admin/teams/show.html.erb` - Team detail
- `mockups/admin/teams/new.html.erb` - Create team form
- `mockups/admin/teams/edit.html.erb` - Edit team form

---

### Analysis Criteria Configuration

```ruby
# List criteria
GET    /mockups/admin/criteres            mockups/admin/criteria#index

# View criterion
GET    /mockups/admin/criteres/:id        mockups/admin/criteria#show

# Create criterion
GET    /mockups/admin/criteres/nouveau    mockups/admin/criteria#new
POST   /mockups/admin/criteres            mockups/admin/criteria#create

# Edit criterion
GET    /mockups/admin/criteres/:id/editer mockups/admin/criteria#edit
PATCH  /mockups/admin/criteres/:id        mockups/admin/criteria#update

# Delete criterion
DELETE /mockups/admin/criteres/:id        mockups/admin/criteria#destroy

# Reorder criteria
PATCH  /mockups/admin/criteres/ordre      mockups/admin/criteria#reorder
```

**Views Required:**
- `mockups/admin/criteria/index.html.erb` - Criteria list with drag-drop reordering
- `mockups/admin/criteria/show.html.erb` - Criterion detail
- `mockups/admin/criteria/new.html.erb` - Create criterion form
- `mockups/admin/criteria/edit.html.erb` - Edit criterion form

**Index View Should Display:**
- List of all criteria (active and inactive)
- Category grouping
- Weight indicators
- Active/inactive toggle
- Drag-drop reordering interface
- Quick edit actions

**Form Views Should Include:**
- Name, description
- Category selection
- Weight slider
- Active/inactive toggle
- Evaluation prompt (for AI)
- Position/order

---

### Platform Settings

```ruby
GET   /mockups/admin/parametres            mockups/admin/settings#index
PATCH /mockups/admin/parametres            mockups/admin/settings#update

# API Configuration
GET   /mockups/admin/parametres/api        mockups/admin/settings#api
PATCH /mockups/admin/parametres/api        mockups/admin/settings#update_api

# Notification Settings
GET   /mockups/admin/parametres/notifications  mockups/admin/settings#notifications
PATCH /mockups/admin/parametres/notifications  mockups/admin/settings#update_notifications
```

**Views Required:**
- `mockups/admin/settings/index.html.erb` - General settings
- `mockups/admin/settings/api.html.erb` - API configuration
- `mockups/admin/settings/notifications.html.erb` - Notification settings

**Settings Views Should Display:**
- Platform name and branding
- Default settings
- Email configuration
- API keys and endpoints (Eleven Labs / Praxi)
- Notification templates
- Feature flags

---

### Platform Analytics

```ruby
GET /mockups/admin/analyses            mockups/admin/analytics#index
GET /mockups/admin/analyses/utilisation  mockups/admin/analytics#usage
GET /mockups/admin/analyses/performance  mockups/admin/analytics#performance
```

**Views Required:**
- `mockups/admin/analytics/index.html.erb` - Overall analytics
- `mockups/admin/analytics/usage.html.erb` - Usage statistics
- `mockups/admin/analytics/performance.html.erb` - System performance

**Analytics Views Should Display:**
- User activity trends
- Calls processed over time
- Platform performance metrics
- API usage statistics
- Storage usage
- Error rates

---

### All Calls (Admin Access)

```ruby
GET /mockups/admin/appels           mockups/admin/calls#index
GET /mockups/admin/appels/:id       mockups/admin/calls#show
DELETE /mockups/admin/appels/:id    mockups/admin/calls#destroy
```

**Views Required:**
- `mockups/admin/calls/index.html.erb` - All platform calls
- `mockups/admin/calls/show.html.erb` - Call detail

---

## Common/Shared Routes

These routes are accessible to all authenticated users.

```ruby
# Notifications
GET   /mockups/notifications          mockups/notifications#index
PATCH /mockups/notifications/:id/lu   mockups/notifications#mark_read
PATCH /mockups/notifications/tout-lu  mockups/notifications#mark_all_read

# Help/Documentation
GET /mockups/aide                   mockups/help#index
GET /mockups/aide/:topic            mockups/help#show
```

**Views Required:**
- `mockups/notifications/index.html.erb` - Notification center
- `mockups/help/index.html.erb` - Help center home
- `mockups/help/show.html.erb` - Help topic detail

---

## API Routes (Future - Brick 2)

These routes will be used by the Chrome extension.

```ruby
POST   /api/v1/auth/login              api/v1/auth#login
DELETE /api/v1/auth/logout             api/v1/auth#logout
POST   /api/v1/auth/validate           api/v1/auth#validate

POST   /api/v1/calls                   api/v1/calls#create
POST   /api/v1/calls/:id/upload        api/v1/calls#upload
GET    /api/v1/calls/:id/status        api/v1/calls#status

POST   /api/v1/extension/sessions      api/v1/extension/sessions#create
PATCH  /api/v1/extension/sessions/:id  api/v1/extension/sessions#update
```

**No views required** - JSON responses only

---

## Route Namespacing Structure

```ruby
# config/routes.rb

Rails.application.routes.draw do
  # Public/Authentication routes
  scope '/mockups' do
    get  'connexion', to: 'mockups/auth#new', as: :login
    post 'connexion', to: 'mockups/auth#create'
    delete 'deconnexion', to: 'mockups/auth#destroy', as: :logout
    
    resource :passwords, only: [:new, :create, :edit, :update], 
             controller: 'mockups/passwords',
             path: 'mot-de-passe'
  end

  # Sales Representative namespace
  namespace :mockups do
    namespace :commercial do
      get 'tableau-de-bord', to: 'dashboard#index', as: :dashboard
      
      resources :appels, path: 'appels' do
        member do
          get 'analyse'
          get 'transcription'
        end
      end
      
      get 'progression', to: 'progress#index'
      resource :profil, only: [:show, :edit, :update]
      resource :parametres, only: [:index, :update], controller: 'settings'
    end

    # Manager namespace
    namespace :manager do
      get 'tableau-de-bord', to: 'dashboard#index', as: :dashboard
      
      resource :equipe, only: [:show], path: 'equipe' do
        get 'membres', on: :member
        get 'membres/:id', to: 'team#member', on: :member
      end
      
      resources :appels, only: [:index, :show]
      resources :membres, only: [] do
        get 'appels', on: :member
      end
      
      namespace :analyses do
        get '/', to: 'analytics#index'
        get 'comparaison'
        get 'criteres'
      end
      
      resource :profil, only: [:show, :edit, :update]
      resource :parametres, only: [:index, :update], controller: 'settings'
    end

    # Admin namespace
    namespace :admin do
      get 'tableau-de-bord', to: 'dashboard#index', as: :dashboard
      
      resources :utilisateurs
      resources :equipes
      resources :criteres do
        collection do
          patch 'ordre', to: 'criteria#reorder'
        end
      end
      
      resource :parametres, only: [:index, :update], controller: 'settings' do
        get 'api', on: :member
        patch 'api', to: 'settings#update_api', on: :member
        get 'notifications', on: :member
        patch 'notifications', to: 'settings#update_notifications', on: :member
      end
      
      namespace :analyses do
        get '/', to: 'analytics#index'
        get 'utilisation'
        get 'performance'
      end
      
      resources :appels, only: [:index, :show, :destroy]
    end

    # Common routes
    resources :notifications, only: [:index] do
      member do
        patch 'lu', to: 'notifications#mark_read'
      end
      collection do
        patch 'tout-lu', to: 'notifications#mark_all_read'
      end
    end
    
    resource :aide, only: [:index, :show], controller: 'help' do
      get ':topic', to: 'help#show', on: :member
    end
  end

  # API routes (Brick 2)
  namespace :api do
    namespace :v1 do
      # API routes here (future)
    end
  end

  # Root route - redirects based on role
  root 'mockups/home#index'
end
```

---

## Summary of All Views Needed

### Authentication (3 views)
- `mockups/auth/new.html.erb`
- `mockups/passwords/new.html.erb`
- `mockups/passwords/edit.html.erb`

### Sales Representative (10 views)
- `mockups/commercial/dashboard/index.html.erb`
- `mockups/commercial/calls/index.html.erb`
- `mockups/commercial/calls/show.html.erb`
- `mockups/commercial/calls/new.html.erb`
- `mockups/commercial/calls/edit.html.erb`
- `mockups/commercial/calls/analysis.html.erb`
- `mockups/commercial/calls/transcription.html.erb`
- `mockups/commercial/progress/index.html.erb`
- `mockups/commercial/profile/show.html.erb`
- `mockups/commercial/profile/edit.html.erb`
- `mockups/commercial/settings/index.html.erb`

### Manager (12 views)
- `mockups/manager/dashboard/index.html.erb`
- `mockups/manager/team/show.html.erb`
- `mockups/manager/team/members.html.erb`
- `mockups/manager/team/member.html.erb`
- `mockups/manager/calls/index.html.erb`
- `mockups/manager/calls/show.html.erb`
- `mockups/manager/members/calls.html.erb`
- `mockups/manager/analytics/index.html.erb`
- `mockups/manager/analytics/comparison.html.erb`
- `mockups/manager/analytics/criteria.html.erb`
- `mockups/manager/profile/show.html.erb`
- `mockups/manager/profile/edit.html.erb`
- `mockups/manager/settings/index.html.erb`

### Administrator (20 views)
- `mockups/admin/dashboard/index.html.erb`
- `mockups/admin/users/index.html.erb`
- `mockups/admin/users/show.html.erb`
- `mockups/admin/users/new.html.erb`
- `mockups/admin/users/edit.html.erb`
- `mockups/admin/teams/index.html.erb`
- `mockups/admin/teams/show.html.erb`
- `mockups/admin/teams/new.html.erb`
- `mockups/admin/teams/edit.html.erb`
- `mockups/admin/criteria/index.html.erb`
- `mockups/admin/criteria/show.html.erb`
- `mockups/admin/criteria/new.html.erb`
- `mockups/admin/criteria/edit.html.erb`
- `mockups/admin/settings/index.html.erb`
- `mockups/admin/settings/api.html.erb`
- `mockups/admin/settings/notifications.html.erb`
- `mockups/admin/analytics/index.html.erb`
- `mockups/admin/analytics/usage.html.erb`
- `mockups/admin/analytics/performance.html.erb`
- `mockups/admin/calls/index.html.erb`
- `mockups/admin/calls/show.html.erb`

### Common (3 views)
- `mockups/notifications/index.html.erb`
- `mockups/help/index.html.erb`
- `mockups/help/show.html.erb`

### Shared Layouts (3 layouts)
- `layouts/mockups/commercial.html.erb`
- `layouts/mockups/manager.html.erb`
- `layouts/mockups/admin.html.erb`

**Total: ~51 views + 3 layouts**

---

## Navigation Structure

Each role should have a consistent navigation:

### Sales Rep Navigation
- Tableau de bord (Dashboard)
- Mes Appels (My Calls)
- Ma Progression (My Progress)
- Télécharger un appel (Upload Call)
- Mon Profil (Profile)
- Paramètres (Settings)

### Manager Navigation
- Tableau de bord (Dashboard)
- Mon Équipe (My Team)
- Appels de l'équipe (Team Calls)
- Analyses (Analytics)
- Mon Profil (Profile)
- Paramètres (Settings)

### Admin Navigation
- Tableau de bord (Dashboard)
- Utilisateurs (Users)
- Équipes (Teams)
- Critères d'analyse (Analysis Criteria)
- Tous les appels (All Calls)
- Analyses (Analytics)
- Paramètres (Settings)

All roles should have:
- Notifications bell icon
- User menu dropdown
- Aide (Help)
- Déconnexion (Logout)
