# Style Guide - WeSales

## Design Reference

The design style guide for this project is inspired by **[bonjourcactus.com](https://www.bonjourcactus.com/)**.

The logo files are available in `app/assets/images/`:
- `logo_long.png` - Full logo with text
- `logo_short.png` - Icon/symbol only

The complete style guide HTML reference is available in `style_guide/style_guide.html`.

---

## Color Palette

### Primary Colors

#### Dark Purple (Primary - 60% usage)
- **HEX**: `#2B0E5D`
- **RGB**: `43/14/93`
- **Tailwind Class**: `bg-dark-purple`, `text-dark-purple`
- **Usage**: Main backgrounds, primary text, headers

#### Flash Purple (Secondary - 20% usage)
- **HEX**: `#6625CC`
- **RGB**: `102/37/204`
- **Tailwind Class**: `bg-flash-purple`, `text-flash-purple`
- **Usage**: Call-to-actions, buttons, highlights, links

#### Light Orange (Accent - 10% usage)
- **HEX**: `#FF9A65`
- **RGB**: `255/154/101`
- **Tailwind Class**: `bg-light-orange`, `text-light-orange`
- **Usage**: Success states, positive metrics, accents

#### Cream Orange (Accent - 10% usage)
- **HEX**: `#FCDFC9`
- **RGB**: `252/223/201`
- **Tailwind Class**: `bg-cream-orange`, `text-cream-orange`
- **Usage**: Subtle backgrounds, cards, sections

### Secondary Colors

#### Noir (Text)
- **HEX**: `#110624`
- **RGB**: `17/6/36`
- **Tailwind Class**: `bg-noir`, `text-noir`
- **Usage**: Body text, dark elements

#### White Tints
- **Pure White**: `#FFFFFF` (100%)
- **White 60%**: `rgba(255, 255, 255, 0.6)`
- **White 30%**: `rgba(255, 255, 255, 0.3)`
- **White 15%**: `rgba(255, 255, 255, 0.15)`

---

## Typography

### Font Family
- **System Font Stack**: `-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif`

### Hierarchy

#### Headline 1
- **Size**: 64px (4rem)
- **Weight**: Black (900)
- **Letter Spacing**: 0%
- **Line Height**: 100%
- **Usage**: Hero titles, main page headers
- **Tailwind Classes**: `text-6xl font-black leading-none`

#### Headline 2
- **Size**: 42px (2.625rem)
- **Weight**: Bold (700)
- **Letter Spacing**: -4%
- **Line Height**: 70px
- **Usage**: Section titles, important headings
- **Tailwind Classes**: `text-4xl font-bold leading-tight tracking-tight`

#### Headline 3
- **Size**: 28px (1.75rem)
- **Weight**: Medium (500)
- **Letter Spacing**: -3%
- **Line Height**: 39px
- **Usage**: Subsection titles, card headers
- **Tailwind Classes**: `text-3xl font-medium leading-normal tracking-tight`

#### Subtitle
- **Size**: 20px (1.25rem)
- **Weight**: Regular (400)
- **Letter Spacing**: -4%
- **Line Height**: 28px
- **Usage**: Secondary headings, lead paragraphs
- **Tailwind Classes**: `text-xl font-normal leading-7 tracking-tight`

#### Overline
- **Size**: 8px (0.5rem)
- **Weight**: Medium (500)
- **Letter Spacing**: 3%
- **Line Height**: 19px
- **Text Transform**: Uppercase
- **Usage**: Labels, category tags
- **Tailwind Classes**: `text-xs font-medium uppercase tracking-wider`

#### Body 1
- **Size**: 14px (0.875rem)
- **Weight**: Regular (400)
- **Letter Spacing**: -3%
- **Line Height**: 19px
- **Usage**: Standard body text, descriptions
- **Tailwind Classes**: `text-sm font-normal leading-5 tracking-tight`

#### Body 2
- **Size**: 12px (0.75rem)
- **Weight**: Regular (400)
- **Letter Spacing**: 0%
- **Line Height**: 16px
- **Usage**: Small text, captions, metadata
- **Tailwind Classes**: `text-xs font-normal leading-4`

---

## UI Components Style

### Buttons

#### Primary Button
```html
<button class="bg-flash-purple hover:bg-dark-purple text-white font-medium py-3 px-6 rounded-lg transition-colors duration-200">
  Button Text
</button>
```

#### Secondary Button
```html
<button class="bg-cream-orange hover:bg-light-orange text-dark-purple font-medium py-3 px-6 rounded-lg transition-colors duration-200">
  Button Text
</button>
```

#### Outline Button
```html
<button class="border-2 border-flash-purple text-flash-purple hover:bg-flash-purple hover:text-white font-medium py-3 px-6 rounded-lg transition-colors duration-200">
  Button Text
</button>
```

### Cards

```html
<div class="bg-white rounded-lg shadow-md p-6 border border-gray-100 hover:shadow-lg transition-shadow duration-200">
  <!-- Card content -->
</div>
```

### Input Fields

```html
<input 
  type="text" 
  class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-flash-purple focus:border-transparent"
  placeholder="Enter text..."
>
```

### Badges/Tags

```html
<!-- Success -->
<span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-light-orange text-white">
  Success
</span>

<!-- Info -->
<span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-flash-purple text-white">
  Info
</span>

<!-- Neutral -->
<span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-cream-orange text-dark-purple">
  Neutral
</span>
```

---

## Layout Guidelines

### Spacing Scale
- **xs**: 0.25rem (4px)
- **sm**: 0.5rem (8px)
- **md**: 1rem (16px)
- **lg**: 1.5rem (24px)
- **xl**: 2rem (32px)
- **2xl**: 3rem (48px)
- **3xl**: 4rem (64px)

### Container Max Width
- **Desktop**: 1280px (max-w-7xl)
- **Padding**: 2rem (px-8)

### Border Radius
- **Small**: 0.375rem (rounded-md)
- **Medium**: 0.5rem (rounded-lg)
- **Large**: 0.75rem (rounded-xl)
- **Full**: 9999px (rounded-full)

### Shadows
- **Small**: `shadow-sm` - Subtle cards
- **Medium**: `shadow-md` - Standard cards
- **Large**: `shadow-lg` - Elevated elements
- **Extra Large**: `shadow-xl` - Modals, popovers

---

## Icons

Use **Lucide Icons** for all interface icons:
- Consistent style
- Optimized SVG
- Large icon library
- Installation: Already configured in project

**Common Icons to Use:**
- `Home` - Dashboard
- `Phone` - Calls
- `Users` - Team/Managers
- `BarChart` - Analytics
- `Settings` - Configuration
- `Upload` - File upload
- `Play`/`Pause` - Recording controls
- `CheckCircle` - Success states
- `AlertCircle` - Warnings
- `TrendingUp` - Progress/Growth

---

## Accessibility Guidelines

### Color Contrast
- Ensure WCAG AA compliance (4.5:1 for normal text)
- Test all text/background color combinations
- Provide alternative indicators beyond color alone

### Focus States
- Visible focus indicators on all interactive elements
- Use `focus:ring-2 focus:ring-flash-purple` for consistency

### Alternative Text
- Provide descriptive alt text for all images
- Use aria-labels for icon-only buttons

### Keyboard Navigation
- All functionality accessible via keyboard
- Logical tab order
- Clear focus indicators

---

## Responsive Design

### Breakpoints
- **Mobile**: < 640px (sm)
- **Tablet**: 640px - 1024px (sm to lg)
- **Desktop**: ≥ 1024px (lg and above)

### Mobile-First Approach
- Design for mobile first
- Progressively enhance for larger screens
- Use Tailwind responsive prefixes: `sm:`, `md:`, `lg:`, `xl:`, `2xl:`

---

## Custom Tailwind Configuration

Add custom colors to `tailwind.config.js`:

```javascript
module.exports = {
  theme: {
    extend: {
      colors: {
        'dark-purple': '#2B0E5D',
        'flash-purple': '#6625CC',
        'light-orange': '#FF9A65',
        'cream-orange': '#FCDFC9',
        'noir': '#110624',
        'white-custom': '#FCF4FF',
      }
    }
  }
}
```

---

## French Language Interface

All user-facing text must be in French:
- Button labels
- Form fields
- Error messages
- Success notifications
- Navigation items
- Page titles

**Examples:**
- "Dashboard" → "Tableau de bord"
- "Upload" → "Télécharger"
- "Settings" → "Paramètres"
- "Team" → "Équipe"
- "Analytics" → "Analyses"
