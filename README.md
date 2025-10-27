```wasm
lib/
├── main.dart
├── core/
│ ├── constants/
│ │ ├── app_colors.dart
│ │ ├── app_text_styles.dart
│ │ └── app_icons.dart
│ ├── utils/
│ │ ├── formatters.dart
│ │ └── validators.dart
│ ├── theme/
│ │ ├── app_theme.dart
│ └── errors/
│ └── exceptions.dart
│
├── data/
│ ├── models/
│ │ ├── expense_model.dart
│ │ ├── category_model.dart
│ │ └── account_model.dart
│ ├── datasources/
│ │ ├── local/
│ │ │ └── expense_local_datasource.dart
│ │ └── remote/
│ │ └── expense_remote_datasource.dart
│ └── repositories/
│ └── expense_repository_impl.dart
│
├── domain/
│ ├── entities/
│ │ ├── expense.dart
│ │ └── category.dart
│ ├── repositories/
│ │ └── expense_repository.dart
│ └── usecases/
│ ├── add_expense.dart
│ ├── get_expenses.dart
│ └── delete_expense.dart
│
├── presentation/
│ ├── providers/
│ │ ├── expense_provider.dart
│ │ └── category_provider.dart
│ ├── pages/
│ │ ├── home_page.dart
│ │ ├── add_expense_page.dart
│ │ ├── stats_page.dart
│ │ └── settings_page.dar`
│ ├── widgets/
│ │ ├── expense_card.dart
│ │ ├── category_chip.dart
│ │ └── empty_state.dart
│ └── navigation/
│ └── app_router.dart
│
└── services/
├── local_storage_service.dart
├── notification_service.dart
└── analytics_service.dart
```

## ⚙ ️ Flujo general

- ### UI (presentation/pages & widgets)

  - Las vistas (pages) usan Providers para leer o modificar estado.
  - Ejemplo: context.read<ExpenseProvider>().addExpense(expense)

- ### Providers (presentation/providers)

  - Actúan como ViewModels:
    manejan la lógica de UI, llaman a los use cases del dominio y notifican cambios al UI.

- ### Use cases (domain/usecases)

  - Contienen la lógica de negocio.
  - Ejemplo: AddExpenseUseCase(expenseRepository).execute(expense)

- ### Repository (domain/repositories + data/repositories)

  - El dominio define una interfaz (ExpenseRepository), y la capa data implementa esa interfaz (ExpenseRepositoryImpl).

- ### Data sources (data/datasources)

  - Se encargan de obtener y persistir datos (SQLite, Supabase, API, etc.)
  - Ejemplo: ExpenseLocalDataSource usa sqflite o hive.

- ### Services
  - Servicios globales como almacenamiento local, notificaciones o analíticas.
