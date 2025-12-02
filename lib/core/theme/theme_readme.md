# GitHub Theme Documentation

## Цветовая схема (Color Scheme)

### Light Theme:

- **primary** (0xFF0969DA): Синий GitHub — основной цвет для гиперссылок, активных элементов
- **onPrimary** (white): Текст на primary фоне
- **secondary** (0xFF238636): Зелёный GitHub — для кнопок действия (Sign in, Create account)
- **onSecondary** (white): Текст на зелёной кнопке
- **surface** (0xFFF6F8FA): Светлый серый фон для карточек
- **onSurface** (0xFF24292F): Основной чёрный текст
- **error** (0xFFD73A49): Красный для ошибок, опасных действий
- **onError** (white): Текст на красной кнопке

### Dark Theme:

- **primary** (0xFF58A6FF): Светлый синий для текста/ссылок в тёмной теме
- **onPrimary** (0xFF0D1117): Тёмный текст на синем (редко используется)
- **secondary** (0xFF56D364): Ярко-зелёный для тёмной темы
- **onSecondary** (0xFF0D1117): Тёмный текст на зелёной кнопке
- **surface** (0xFF1B222B): Контейнер/карточка в тёмной теме
- **onSurface** (0xFFC9D1D9): Основной светлый текст
- **error** (0xFFF85149): Красный для ошибок
- **onError** (0xFF0D1117): Тёмный текст на красном

## Использование в компонентах:

1.  **Кнопки действий**: GHButton(variant: GHButtonVariant.green) — использует secondary/onSecondary
2.  **Вторичные кнопки**: GHButton(variant: GHButtonVariant.gray) — использует серый фон
3.  **Основной текст**: textTheme.bodyMedium — используйте для основного содержимого
4.  **Второстепенный текст**: textTheme.bodySmall — для подсказок, меньше внимания
5.  **Заголовки**: textTheme.titleMedium — для названий секций
6.  **Ссылки**: labelLarge или primary цвет
7.  **Ошибки**: error colorScheme для опасных операций

## Как выбрать цвет текста:

- На **primary** фоне: используйте **onPrimary** (обычно white)
- На **secondary** (зелёном) фоне: используйте **onSecondary** (обычно white)
- На **surface** фоне: используйте **onSurface** (основной текст)
- На **error** фоне: используйте **onError** (обычно white/dark)
- На белом/светлом фоне: используйте **onSurface** (0xFF24292F в light)
- На тёмном фоне: используйте **onSurface** (0xFFC9D1D9 в dark)

## Переключение темы (ThemeCubit)

### Инициализация в main.dart:

```dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lib/core/theme/app_theme.dart';
import 'lib/core/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(prefs),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          title: 'MES Lite',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          home: const HomePage(),
        );
      },
    );
  }
}
```

### Как переключать тему в любом месте приложения:

```dart
// Переключить на светлую тему
context.read<ThemeCubit>().setTheme(ThemeMode.light);

// Переключить на тёмную тему
context.read<ThemeCubit>().setTheme(ThemeMode.dark);

// Переключить на системную тему (автоматически)
context.read<ThemeCubit>().setTheme(ThemeMode.system);
```

### Пример кнопки переключения темы в AppBar:

```dart
AppBar(
  actions: [
    BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return IconButton(
          icon: Icon(
            themeMode == ThemeMode.dark
              ? Icons.light_mode
              : Icons.dark_mode,
          ),
          onPressed: () {
            final newMode = themeMode == ThemeMode.dark
              ? ThemeMode.light
              : ThemeMode.dark;
            context.read<ThemeCubit>().setTheme(newMode);
          },
        );
      },
    ),
  ],
)
```

### Зависимости в pubspec.yaml:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.0.0
  shared_preferences: ^2.0.0
```

### Как это работает:

1. **ThemeCubit** — управляет состоянием темы (light/dark/system)
2. **SharedPreferences** — сохраняет выбранную тему при перезагрузке приложения
3. **BlocBuilder** — перестраивает UI когда тема меняется
4. **MaterialApp.themeMode** — применяет выбранную тему ко всему приложению
