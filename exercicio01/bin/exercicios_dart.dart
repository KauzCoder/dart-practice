import 'dart:io';

void main() {
  while (true) {
    _mostrarMenu();
    final opcao = _lerInt('Escolha uma opção (0 para sair): ');

    print('');
    switch (opcao) {
      case 0:
        print('Encerrando.');
        return;
      case 1:
        atividade1();
      case 2:
        atividade2();
      case 3:
        atividade3();
      case 4:
        atividade4();
      case 5:
        atividade5();
      case 6:
        atividade6();
      case 7:
        atividade7();
      case 8:
        atividade8();
      case 9:
        atividade9();
      case 10:
        atividade10();
      default:
        print('Opção inválida.');
    }

    print('');
    stdout.write('Pressione ENTER para voltar ao menu...');
    stdin.readLineSync();
    print('');
  }
}

void _mostrarMenu() {
  print('========== LISTA DE ATIVIDADES ==========');
  print('1) Fahrenheit para Celsius');
  print('2) Horas, minutos e segundos para segundos');
  print('3) Convites para cobrir custo do espetáculo');
  print('4) Salário com comissão de 12%');
  print('5) Pagamento de encanador com imposto');
  print('6) Tarifa de ligação telefônica');
  print('7) Lanchonete (total simples)');
  print('8) Lanchonete (total e divisão por pessoas)');
  print('9) Aluguel de carro');
  print('10) Sudoku (resolver e imprimir)');
  print('0) Sair');
  print('========================================');
}

void atividade1() {
  final fahrenheit = _lerDouble('Informe a temperatura em Fahrenheit: ');
  final celsius = (fahrenheit - 32) * (5 / 9);
  print('Temperatura em Celsius: ${celsius.toStringAsFixed(2)} °C');
}

void atividade2() {
  final horas = _lerInt('Informe as horas: ');
  final minutos = _lerInt('Informe os minutos: ');
  final segundos = _lerInt('Informe os segundos: ');

  final totalSegundos = (horas * 3600) + (minutos * 60) + segundos;
  print('Tempo total em segundos: $totalSegundos');
}

void atividade3() {
  final custoEspetaculo = _lerDouble('Informe o custo do espetáculo (R\$): ');
  final precoConvite = _lerDouble('Informe o preço do convite (R\$): ');

  if (precoConvite <= 0) {
    print('O preço do convite deve ser maior que zero.');
    return;
  }

  final quantidade = (custoEspetaculo / precoConvite).ceil();
  print('Quantidade mínima de convites: $quantidade');
}

void atividade4() {
  final salarioFixo = _lerDouble('Informe o salário fixo (R\$): ');
  final valorVendas = _lerDouble('Informe o valor total das vendas (R\$): ');

  final comissao = valorVendas * 0.12;
  final salarioFinal = salarioFixo + comissao;

  print('Comissão: R\$ ${comissao.toStringAsFixed(2)}');
  print('Salário final: R\$ ${salarioFinal.toStringAsFixed(2)}');
}

void atividade5() {
  const diaria = 38.0;
  const aliquotaImposto = 0.06;

  final diasTrabalhados = _lerInt('Informe o número de dias trabalhados: ');
  final valorDiaria = diaria;
  final salarioBruto = diasTrabalhados * valorDiaria;
  final imposto = salarioBruto * aliquotaImposto;
  final salarioLiquido = salarioBruto - imposto;

  print('Valor da diária: R\$ ${valorDiaria.toStringAsFixed(2)}');
  print('Salário bruto: R\$ ${salarioBruto.toStringAsFixed(2)}');
  print('Imposto de renda (6%): R\$ ${imposto.toStringAsFixed(2)}');
  print('Salário líquido: R\$ ${salarioLiquido.toStringAsFixed(2)}');
}

void atividade6() {
  const valorBase = 4.59;
  const minutosBase = 3;
  const valorAdicionalPorMinuto = 1.30;

  final duracao = _lerInt('Informe a duração total da chamada (em minutos): ');

  if (duracao <= 0) {
    print('Total a pagar: R\$ 0.00');
    return;
  }

  double total = valorBase;
  if (duracao > minutosBase) {
    final minutosAdicionais = duracao - minutosBase;
    total += minutosAdicionais * valorAdicionalPorMinuto;
  }

  print('Total a pagar: R\$ ${total.toStringAsFixed(2)}');
}

void atividade7() {
  const precoRefrigerante = 8.0;
  const precoSalgado = 12.0;
  const precoSorvete = 9.0;

  final qntRefrigerante = _lerInt('Quantidade de refrigerantes: ');
  final qntSalgado = _lerInt('Quantidade de salgados: ');
  final qntSorvete = _lerInt('Quantidade de sorvetes: ');

  final total =
      (qntRefrigerante * precoRefrigerante) +
      (qntSalgado * precoSalgado) +
      (qntSorvete * precoSorvete);

  print('Total a pagar: R\$ ${total.toStringAsFixed(2)}');
}

void atividade8() {
  const precoRefrigerante = 8.0;
  const precoSalgado = 12.0;
  const precoSorvete = 9.0;

  final qntRefrigerante = _lerInt('Quantidade de refrigerantes: ');
  final qntSalgado = _lerInt('Quantidade de salgados: ');
  final qntSorvete = _lerInt('Quantidade de sorvetes: ');
  final pessoas = _lerInt('Quantidade de pessoas para dividir a conta: ');

  if (pessoas <= 0) {
    print('A quantidade de pessoas deve ser maior que zero.');
    return;
  }

  final total =
      (qntRefrigerante * precoRefrigerante) +
      (qntSalgado * precoSalgado) +
      (qntSorvete * precoSorvete);
  final valorPorPessoa = total / pessoas;

  print('Total a pagar: R\$ ${total.toStringAsFixed(2)}');
  print('Valor por pessoa: R\$ ${valorPorPessoa.toStringAsFixed(2)}');
}

void atividade9() {
  final tipo = _lerTexto(
    'Informe o tipo do carro (popular ou luxo): ',
  ).toLowerCase();
  final dias = _lerInt('Informe a quantidade de dias de aluguel: ');
  final km = _lerDouble('Informe a quantidade de km percorridos: ');

  double diaria;
  double valorKm;

  if (tipo == 'popular') {
    diaria = 90.0;
    valorKm = km <= 100 ? 0.20 : 0.10;
  } else if (tipo == 'luxo') {
    diaria = 150.0;
    valorKm = km <= 200 ? 0.30 : 0.25;
  } else {
    print('Tipo inválido. Digite apenas popular ou luxo.');
    return;
  }

  final total = (dias * diaria) + (km * valorKm);
  print('Preço total do aluguel: R\$ ${total.toStringAsFixed(2)}');
}

void atividade10() {
  final vetor = <int>[
    5,
    3,
    0,
    0,
    7,
    0,
    0,
    0,
    0,
    6,
    0,
    0,
    1,
    9,
    5,
    0,
    0,
    0,
    0,
    9,
    8,
    0,
    0,
    0,
    0,
    6,
    0,
    8,
    0,
    0,
    0,
    6,
    0,
    0,
    0,
    3,
    4,
    0,
    0,
    8,
    0,
    3,
    0,
    0,
    1,
    7,
    0,
    0,
    0,
    2,
    0,
    0,
    0,
    6,
    0,
    6,
    0,
    0,
    0,
    0,
    2,
    8,
    0,
    0,
    0,
    0,
    4,
    1,
    9,
    0,
    0,
    5,
    0,
    0,
    0,
    0,
    8,
    0,
    0,
    7,
    9,
  ];

  final matriz = _vetorParaMatriz(vetor);
  print('Sudoku inicial:');
  _imprimirSudoku(matriz);

  final resolvido = _resolverSudoku(matriz);
  if (!resolvido) {
    print('Não foi possível resolver o Sudoku informado.');
    return;
  }

  print('Sudoku resolvido:');
  _imprimirSudoku(matriz);
}

List<List<int>> _vetorParaMatriz(List<int> vetor) {
  if (vetor.length != 81) {
    throw ArgumentError('O vetor precisa ter exatamente 81 posições.');
  }

  final matriz = List.generate(9, (_) => List.filled(9, 0));
  for (var i = 0; i < 81; i++) {
    matriz[i ~/ 9][i % 9] = vetor[i];
  }
  return matriz;
}

bool _resolverSudoku(List<List<int>> tabuleiro) {
  for (var linha = 0; linha < 9; linha++) {
    for (var coluna = 0; coluna < 9; coluna++) {
      if (tabuleiro[linha][coluna] != 0) {
        continue;
      }

      for (var numero = 1; numero <= 9; numero++) {
        if (_movimentoValido(tabuleiro, linha, coluna, numero)) {
          tabuleiro[linha][coluna] = numero;

          if (_resolverSudoku(tabuleiro)) {
            return true;
          }

          tabuleiro[linha][coluna] = 0;
        }
      }
      return false;
    }
  }
  return true;
}

bool _movimentoValido(
  List<List<int>> tabuleiro,
  int linha,
  int coluna,
  int numero,
) {
  for (var i = 0; i < 9; i++) {
    if (tabuleiro[linha][i] == numero || tabuleiro[i][coluna] == numero) {
      return false;
    }
  }

  final inicioLinha = (linha ~/ 3) * 3;
  final inicioColuna = (coluna ~/ 3) * 3;

  for (var i = inicioLinha; i < inicioLinha + 3; i++) {
    for (var j = inicioColuna; j < inicioColuna + 3; j++) {
      if (tabuleiro[i][j] == numero) {
        return false;
      }
    }
  }

  return true;
}

// Função para imprimir o tabuleiro de Sudoku de forma formatada para o usaurio visualizar melhor o resultado.
void _imprimirSudoku(List<List<int>> matriz) {
  for (var i = 0; i < 9; i++) {
    if (i % 3 == 0) {
      print('+-------+-------+-------+');
    }

    final linhaFormatada = StringBuffer('| ');
    for (var j = 0; j < 9; j++) {
      linhaFormatada.write('${matriz[i][j]} ');
      if ((j + 1) % 3 == 0) {
        linhaFormatada.write('| ');
      }
    }
    print(linhaFormatada.toString());
  }
  print('+-------+-------+-------+');
}


//Funcões auxiliares para leitura de dados do usuário
int _lerInt(String mensagem) {
  while (true) {
    stdout.write(mensagem);
    final entrada = stdin.readLineSync();
    final valor = int.tryParse(entrada ?? '');

    if (valor != null) {
      return valor;
    }

    print('Entrada inválida. Digite um número inteiro válido.');
  }
}

double _lerDouble(String mensagem) {
  while (true) {
    stdout.write(mensagem);
    final entrada = stdin.readLineSync()?.replaceAll(',', '.');
    final valor = double.tryParse(entrada ?? '');

    if (valor != null) {
      return valor;
    }

    print('Entrada inválida. Digite um número válido.');
  }
}

String _lerTexto(String mensagem) {
  while (true) {
    stdout.write(mensagem);
    final entrada = stdin.readLineSync()?.trim();
    if (entrada != null && entrada.isNotEmpty) {
      return entrada;
    }
    print('Entrada inválida. Tente novamente.');
  }
}
