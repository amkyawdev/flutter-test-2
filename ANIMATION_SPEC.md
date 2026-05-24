# 🎬 Personal Website Animation Blueprint

> Animation Design Specification for AMK Developer Personal Website

| Page / Section | UI Element | Animation Type | Duration | Visual Effect / Description |
| :--- | :--- | :--- | :--- | :--- |
| **1. Hero / Landing** | Main Title (ကိုယ့်နာမည်/ရာထူး) | Typewriter Thru FadeIn | 600ms | စာမျက်နှာပွင့်လာလျှင် စာလုံးများ ဘယ်မှညာသို့ တစ်လုံးချင်း ရိုက်နှိပ်သလို ပေါ်လာမည်။ |
|  | Subtitle & CTA Button | FadeIn + SlideUp | 500ms | နာမည်ပေါ်ပြီး (Delay 300ms) မှ အောက်ခြေမှ အပေါ်သို့ ညင်သာစွာ လျှောတက်လာမည်။ |
| **2. Dashboard** | Stats/Analytics Cards | Staggered ScaleIn | 400ms | ကတ်ပြားတစ်ခုချင်းစီသည် တစ်ခုပြီးမှတစ်ခု (Sequential Delay) သုညမှ ပုံမှန်အရွယ်အစားသို့ ပွေ့တက်လာမည်။ |
|  | Progress Bars / Charts | Linear Fill | 800ms | ဒေတာတန်ဖိုးများသည် သုညမှ သတ်မှတ်ရာခိုင်နှုန်းအထိ ညာဘက်သို့ လျှောခနဲ တိုးသွားမည်။ |
| **3. Projects** | Project Card (Idle State) | Default Flutter Animations | 500ms | User က အောက်သို့ Scroll ဆွဲ၍ Project မြင်ကွင်းထဲ ရောက်မှသာ မှိန်ရာမှ လင်းလာမည်။ |
|  | Project Card (Mouse Hover) | ScaleUp + LiftY | 200ms | Mouse တင်လိုက်လျှင် ကတ်သည် အပေါ်သို့ 3px ကြွတက်လာပြီး အရွယ်အစား 2% ခန့် သိသာစွာ ကြီးလာမည်။ |
| **4. About** | Profile Picture | Soft Breathing Glow | 3000ms (Loop) | ကိုယ့်ပုံရိပ်၏ ဘေးပတ်လည်တွင် Neon အလင်းတန်းလေးသည် အသက်ရှူသလို ဖြည်းဖြည်းချင်း လင်းလိုက် မှိန်လိုက် ဖြစ်နေမည်။ |
|  | Skill Badges | Pop Effect | 300ms | Mouse Hover လုပ်လျှင် Badge လေးသည် အတွင်းသို့ အနည်းငယ်ချိုင့်ဝင်ပြီး ပြန်ကန်ထွက်လာမည်။ |
| **5. Global** | Page Transition | Fade Through | 300ms | Menu တစ်ခုမှတစ်ခုသို့ ကူးပြောင်းလျှင် Page အဟောင်းသည် မှိန်သွားပြီး Page အသစ်သည် ညင်သာစွာ အစားထိုးဝင်ရောက်မည်။ |

---

## 🛠️ Implementation Notes

All animations utilize Flutter's built-in animation APIs:
- `AnimatedBuilder` for performance
- `AnimationController` + `Tween` for custom animations
- `MouseRegion` for hover interactions
- Native `AnimatedContainer`, `AnimatedOpacity`, etc.

### A. For Dashboard Cards (Staggered Animation)
```dart
// Controller per card with sequential delay
final controllers = List.generate(4, (index) => 
  AnimationController(vsync: this, duration: Duration(milliseconds: 400 + (index * 100)))
);

// Staggered scale
Transform.scale(
  scale: 0.8 + (0.2 * animation.value),
  child: Opacity(opacity: animation.value, child: card),
)
```

### B. For Project Cards (Hover Lift Effect)
```dart
MouseRegion(
  onEnter: (_) => setState(() => isHovered = true),
  onExit: (_) => setState(() => isHovered = false),
  child: AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    transform: Matrix4.identity()
      ..translate(0, isHovered ? -6.0 : 0.0)
      ..scale(isHovered ? 1.02 : 1.0),
    child: ProjectCardWidget(),
  ),
)
```

### C. For Profile Breathing Glow
```dart
AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 3000),
)..repeat(reverse: true);

AnimatedBuilder(
  animation: glowAnimation,
  builder: (context, child) => Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: primaryAccent.withOpacity(glowAnimation.value),
          blurRadius: 20 + (glowAnimation.value * 10),
        ),
      ],
    ),
    child: child,
  ),
)
```

---

## 🎨 Color Palette Reference

| Role | Color | Hex |
| :--- | :--- | :--- |
| Background (Dark) | Slate Dark | `#0F172A` |
| Primary Accent | Neon Sky Blue | `#38BDF8` |
| Secondary Accent | Vibrant Rose | `#F43F5E` |
| Text | Off-White | `#E2E8F0` |
| Surface | Dark Gray | `#1E293B` |
| Border | Gray | `#334155` |

---

## 📁 File Structure

```
lib/
├── main.dart                    # App entry point
├── app/
│   ├── routes.dart             # GoRouter configuration
│   └── theme.dart            # AppTheme & AppColors
├── core/
│   ├── constants/
│   │   └── text_styles.dart # Typography system
│   └── widgets/
│       ├── navigation_bar.dart    # Top menu bar
│       └── responsive_layout.dart # Responsive wrapper
└── features/
    ├── home/
    │   └── home_page.dart      # Hero with typewriter
    ├── dashboard/
    │   └── dashboard_page.dart # Stats + Progress bars
    ├── projects/
    │   ├── models/
    │   │   └── project_model.dart
    │   ├── widgets/
    │   │   └── project_card.dart
    │   └── projects_page.dart # Grid of projects
    └── about/
        └── about_page.dart   # Profile + Skills
```

---

Built with ❤️ using Flutter for Web