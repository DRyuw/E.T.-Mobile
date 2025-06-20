import 'package:flutter/material.dart';

void main() {
  runApp(ETApp());
}

class ETApp extends StatelessWidget {
  const ETApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ET - O Jogo',
      home: ETPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ETPage extends StatefulWidget {
  const ETPage({super.key});

  @override
  State<ETPage> createState() => _ETPageState();
}

class _ETPageState extends State<ETPage> {
  int currentStep = 0;

  final List<String> steps = [
    'sinopse',
    'personagens',
    'producao',
    'direcao',
    'galeria',
  ];

  final Map<String, String> content = {
    'sinopse':
        'ET: O Extraterrestre conta a emocionante história de um alienígena perdido na Terra. Ele é encontrado por um garoto chamado Elliott, que decide escondê-lo em sua casa. A amizade entre os dois cresce, enquanto enfrentam o medo dos adultos e do governo. Juntos, eles tentam fazer com que ET consiga voltar para seu planeta, em uma jornada cheia de emoção, descobertas e conexão entre mundos diferentes.',
    'personagens':
        '• Elliott (Henry Thomas): o garoto que encontra e protege o ET.\n'
        '• Gertie (Drew Barrymore): irmã caçula de Elliott, divertida e esperta.\n'
        '• Mary (Dee Wallace): mãe de Elliott, sem saber do segredo.\n'
        '• ET: o simpático alienígena que conquista todos com sua doçura.',
    'producao':
        'O filme foi produzido por Kathleen Kennedy e Steven Spielberg em 1982. '
        'Com um orçamento modesto, a produção surpreendeu o mundo com seus efeitos visuais, trilha sonora icônica e direção sensível. '
        'ET se tornou um marco do cinema, arrecadando mais de 790 milhões de dólares e permanecendo no coração de gerações.',
    'direcao':
        'Steven Spielberg dirigiu ET com maestria. Conhecido por criar histórias emocionantes com crianças e aventuras, Spielberg misturou ficção científica com sentimentos humanos. '
        'Sua direção sensível tornou o filme um clássico eterno, ganhando prêmios e reconhecimento mundial.',
  };

  void nextStep() {
    setState(() {
      if (currentStep < steps.length) {
        currentStep++;
      } else {
        currentStep = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isImage = currentStep == 0;
    final isGallery = currentStep == 5;

    return Scaffold(
      appBar: AppBar(
        title: Text('ET - O Jogo'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: nextStep,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isImage
                ? Image.asset('images/et_app.png')
                : isGallery
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/galeria1.jpg'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('images/galeria2.png'),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            steps[currentStep - 1].toUpperCase(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            content[steps[currentStep - 1]]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
