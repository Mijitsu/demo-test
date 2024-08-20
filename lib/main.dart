import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Этот виджет является корнем вашего приложения.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Это тема вашего приложения.
        //
        // ПОПРОБУЙТЕ ЭТО: Попробуйте запустить ваше приложение с помощью "flutter run". Вы увидите,
        // что приложение имеет фиолетовую панель инструментов. Затем, не закрывая приложение,
        // попробуйте изменить seedColor в colorScheme ниже на Colors.green
        // и затем выполните "горячую перезагрузку" (сохраните ваши изменения или нажмите кнопку "горячей
        // перезагрузки" в поддерживающей Flutter IDE, или нажмите "r", если вы использовали
        // командную строку для запуска приложения).
        //
        // Обратите внимание, что счётчик не сбросился обратно на ноль; состояние приложения
        // не теряется во время перезагрузки. Чтобы сбросить состояние, используйте горячую
        // перезагрузку вместо этого.
        //
        // Это также работает для кода, а не только для значений: Большинство изменений кода
        // можно протестировать с помощью горячей перезагрузки.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Этот виджет является домашней страницей вашего приложения. Он имеет состояние, что означает,
  // что у него есть объект State (определённый ниже), который содержит поля, влияющие на
  // то, как он выглядит.

  // Этот класс — конфигурация для состояния. Он содержит значения (в данном случае заголовок),
  // предоставленные родительским виджетом (в данном случае виджетом App) и
  // используемые методом build состояния. Поля в подклассе Widget всегда
  // помечены как "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Этот вызов setState сообщает фреймворку Flutter, что что-то изменилось в этом состоянии,
      // что вызывает повторный вызов метода build ниже, чтобы отображение могло отразить обновленные значения.
      // Если бы мы изменили _counter без вызова setState(), метод build не был бы вызван снова,
      // и ничего не произошло бы.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Этот метод вызывается снова каждый раз, когда вызывается setState, например, как это сделано
    // методом _incrementCounter выше.
    //
    // Фреймворк Flutter оптимизирован для быстрого повторного вызова методов build,
    // поэтому вы можете просто перестроить всё, что нужно обновить, вместо того, чтобы изменять
    // отдельные экземпляры виджетов.
    return Scaffold(
      appBar: AppBar(
        // ПОПРОБУЙТЕ ЭТО: Попробуйте изменить цвет здесь на определённый цвет (например, на
        // Colors.amber) и выполните горячую перезагрузку, чтобы увидеть изменение цвета AppBar,
        // пока остальные цвета остаются теми же.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Здесь мы берём значение из объекта MyHomePage, который был создан методом
        // App.build, и используем его для установки заголовка нашей панели приложений.
        title: Text(widget.title),
      ),
      body: Center(
        // Center — это виджет компоновки. Он принимает один дочерний элемент и размещает его
        // в середине родительского виджета.
        child: Column(
          // Column — это тоже виджет компоновки. Он принимает список дочерних элементов и
          // располагает их вертикально. По умолчанию он изменяет размер, чтобы поместить его
          // дочерние элементы горизонтально и пытается быть таким высоким, как его родитель.
          //
          // Column имеет различные свойства для управления тем, как он изменяет размер и
          // как он размещает свои дочерние элементы. Здесь мы используем mainAxisAlignment для
          // центрирования дочерних элементов по вертикали; основной осью здесь является вертикальная
          // ось, потому что Columns вертикальны (пересекающая ось будет горизонтальной).
          //
          // ПОПРОБУЙТЕ ЭТО: Включите "debug painting" (выберите действие "Toggle Debug Paint"
          // в IDE или нажмите "p" в консоли), чтобы увидеть
          // каркас для каждого виджета.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Вы нажали кнопку это количество раз:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Увеличить',
        child: const Icon(Icons.add),
      ), // Эта завершающая запятая делает автоформатирование более удобным для методов build.
    );
  }
}
