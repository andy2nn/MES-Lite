import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mes_lite/core/theme/theme_cubit.dart';

class ThemeDemoPage extends StatelessWidget {
  const ThemeDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThemeCubit>();
    final theme = Theme.of(context);
    final mode = cubit.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🎨 Demo UI Kit & Theme'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final next =
              mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
          cubit.setTheme(next);
        },
        child: Icon(
            mode == ThemeMode.dark ? Icons.wb_sunny : Icons.nightlight_round),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionHeader('Текущая тема'),
          Card(
            color: theme.cardColor,
            child: ListTile(
              leading: Icon(
                  mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
                  color: theme.colorScheme.primary),
              title: Text('Текущая тема: ${mode.name}',
                  style: theme.textTheme.titleMedium),
            ),
          ),
          _sectionHeader('Выбор темы'),
          _themeSelector(cubit, mode, theme),
          _sectionHeader('Текстовые стили'),
          _textDemo(theme),
          _sectionHeader('Кнопки'),
          _buttonsDemo(theme),
          _sectionHeader('Поля ввода'),
          _textFieldsDemo(theme),
          _sectionHeader('Карточки'),
          _cardsDemo(theme),
          _sectionHeader('Иконки'),
          _iconsDemo(theme),
          _sectionHeader('Switch, Checkbox, Radio'),
          _switchCheckboxRadioDemo(theme, mode),
          _sectionHeader('Прогресс и слайдеры'),
          _progressDemo(theme),
          _sectionHeader('Чипы'),
          _chipsDemo(theme),
          _sectionHeader('Palette'),
          _paletteDemo(theme),
          _sectionHeader('Код'),
          _codeDemo(theme),
          _sectionHeader('Таблица'),
          _dataTableDemo(theme),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      );

  Widget _themeSelector(ThemeCubit cubit, ThemeMode mode, ThemeData theme) {
    return Column(
      children: [
        RadioListTile<ThemeMode>(
          value: ThemeMode.system,
          groupValue: mode,
          onChanged: (value) => cubit.setTheme(value!),
          title: Text('Системная', style: theme.textTheme.bodyMedium),
        ),
        RadioListTile<ThemeMode>(
          value: ThemeMode.light,
          groupValue: mode,
          onChanged: (value) => cubit.setTheme(value!),
          title: Text('Светлая', style: theme.textTheme.bodyMedium),
        ),
        RadioListTile<ThemeMode>(
          value: ThemeMode.dark,
          groupValue: mode,
          onChanged: (value) => cubit.setTheme(value!),
          title: Text('Тёмная', style: theme.textTheme.bodyMedium),
        ),
      ],
    );
  }

  Widget _textDemo(ThemeData theme) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('BodyMedium', style: theme.textTheme.bodyMedium),
          Text('BodySmall', style: theme.textTheme.bodySmall),
          Text('TitleMedium', style: theme.textTheme.titleMedium),
          Text('LabelLarge (ссылки)', style: theme.textTheme.labelLarge),
        ],
      );

  Widget _buttonsDemo(ThemeData theme) => Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
          TextButton(onPressed: () {}, child: const Text('Text')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
          ActionChip(label: const Text('ActionChip'), onPressed: () {}),
        ],
      );

  Widget _textFieldsDemo(ThemeData theme) => Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Введите текст',
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: theme.inputDecorationTheme.fillColor,
              labelStyle: TextStyle(color: theme.colorScheme.onSurface),
              hintStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.7)),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'С подсказкой',
              hintText: 'Введите данные...',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.edit),
              filled: true,
              fillColor: theme.inputDecorationTheme.fillColor,
              labelStyle: TextStyle(color: theme.colorScheme.onSurface),
              hintStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withOpacity(0.7)),
            ),
          ),
        ],
      );

  Widget _cardsDemo(ThemeData theme) => Column(
        children: [
          Card(
            color: theme.cardColor,
            child: ListTile(
              leading: Icon(Icons.color_lens, color: theme.colorScheme.primary),
              title: const Text('Карточка 1'),
              subtitle: const Text('С демонстрацией цвета и темы'),
            ),
          ),
          Card(
            color: theme.cardColor,
            child: ListTile(
              leading: Icon(Icons.info, color: theme.colorScheme.secondary),
              title: const Text('Карточка 2'),
              subtitle: const Text('Другой пример карточки'),
            ),
          ),
        ],
      );

  Widget _iconsDemo(ThemeData theme) => Wrap(
        spacing: 16,
        children: [
          Icon(Icons.home, color: theme.colorScheme.primary),
          Icon(Icons.favorite, color: theme.colorScheme.secondary),
          Icon(Icons.settings, color: theme.colorScheme.onSurface),
          Icon(Icons.star, color: theme.colorScheme.primary),
          Icon(Icons.person, color: theme.colorScheme.onSurface),
          Icon(Icons.shopping_cart, color: theme.colorScheme.secondary),
        ],
      );

  Widget _switchCheckboxRadioDemo(ThemeData theme, ThemeMode mode) {
    bool switchVal = mode == ThemeMode.dark;
    bool checkboxVal = true;
    ThemeMode radioVal = mode;

    return StatefulBuilder(
      builder: (context, setState) => Row(
        children: [
          Switch(
              value: switchVal,
              activeColor: theme.colorScheme.primary,
              onChanged: (val) => setState(() => switchVal = val)),
          const SizedBox(width: 10),
          Checkbox(
              value: checkboxVal,
              activeColor: theme.colorScheme.primary,
              onChanged: (val) => setState(() => checkboxVal = val!)),
          const SizedBox(width: 10),
          Radio<ThemeMode>(
            value: ThemeMode.light,
            groupValue: radioVal,
            fillColor: MaterialStateProperty.all(theme.colorScheme.primary),
            onChanged: (val) => setState(() => radioVal = val!),
          ),
        ],
      ),
    );
  }

  Widget _progressDemo(ThemeData theme) => Column(
        children: [
          LinearProgressIndicator(value: 0.5, color: theme.colorScheme.primary),
          const SizedBox(height: 10),
          CircularProgressIndicator(color: theme.colorScheme.secondary),
          Slider(
              value: 0.3,
              activeColor: theme.colorScheme.primary,
              onChanged: (_) {}),
        ],
      );

  Widget _chipsDemo(ThemeData theme) => Wrap(
        spacing: 8,
        children: [
          Chip(
              label: const Text('Chip'),
              backgroundColor: theme.colorScheme.surface.withOpacity(0.8),
              labelStyle: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onSurface)),
          ActionChip(
              label: const Text('ActionChip'),
              onPressed: () {},
              backgroundColor: theme.colorScheme.primary,
              labelStyle: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onPrimary)),
          ChoiceChip(
              label: const Text('ChoiceChip'),
              selected: true,
              selectedColor: theme.colorScheme.secondary,
              labelStyle: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onSecondary)),
        ],
      );

  Widget _paletteDemo(ThemeData theme) => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _colorBox(theme.colorScheme.primary, 'Primary', theme),
          _colorBox(theme.colorScheme.secondary, 'Secondary', theme),
          _colorBox(theme.colorScheme.surface, 'Surface', theme),
          _colorBox(theme.colorScheme.error, 'Error', theme),
        ],
      );

  Widget _codeDemo(ThemeData theme) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'void main() {\n  print("Hello GitHub Theme!");\n}',
          style: theme.textTheme.displaySmall,
        ),
      );

  Widget _dataTableDemo(ThemeData theme) => Card(
        color: theme.cardColor,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Имя', style: theme.textTheme.bodyMedium)),
            DataColumn(
                label: Text('Возраст', style: theme.textTheme.bodyMedium)),
            DataColumn(label: Text('Город', style: theme.textTheme.bodyMedium)),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('Иван')),
              DataCell(Text('25')),
              DataCell(Text('Москва'))
            ]),
            DataRow(cells: [
              DataCell(Text('Мария')),
              DataCell(Text('30')),
              DataCell(Text('Санкт-Петербург'))
            ]),
          ],
        ),
      );

  Widget _colorBox(Color color, String label, ThemeData theme) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                    color: theme.brightness == Brightness.dark
                        ? Colors.white12
                        : Colors.black26,
                    blurRadius: 4)
              ],
              border: Border.all(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white24
                      : Colors.black12,
                  width: 0.5),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      );
}
