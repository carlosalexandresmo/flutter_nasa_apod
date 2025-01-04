# Flutter Nasa APOD

Projeto Flutter Nasa APOD desenvolvido utilizando Flutter. Neste arquivo README, você encontrará um guia passo a passo para abrir o projeto em seu ambiente local.

## Pré-requisitos

- ✅ Dart 3.5.3 ou superior
- ✅ Flutter 3.24.3  ou superior
- ✅ Xcode 16.1 ou superior
- ✅ Android Studio 2023.1 ou superior
- ✅ CocoaPods version 1.15.2 ou superior

## ▶️ Como Executar o Projeto

## Passo 1️⃣: Clonar o repositório

Para clonar o repositório, clique no botão "Clone" acima ou execute o seguinte comando no terminal:

```bash
git clone https://github.com/carlosalexandresmo/flutter_nasa_apod.git 
```

Isso criará uma cópia local do repositório em seu ambiente.

## Passo 2️⃣: Checagem e atualização dos pacotes

Navegue até o diretório raiz do projeto e execute o seguinte comando para iniciar:

O comando abaixo permite verificar o estado da instalação dele, e se há algum erro:

```bash
flutter doctor -v
```

O comando abaixo permite atualizar as dependências relacionadas ao projeto:

```bash
flutter pub get
```

## Passo 3️⃣: Comandos para rodar o projeto

O comando abaixo executa o projeto:

```bash
flutter run
```

Para verificar os dispositivos disponíveis:

```bash
flutter devices
```

OBS: Caso queira especificar o dispositivo:

```bash
flutter run -d {id do dispositivo}
```

Para limpar um build

```bash
flutter clean
```

Para excluir o cache

```bash
flutter pub cache clean
```

## Passo 4️⃣: Buildar o projeto e versão release

O comando abaixo cria build para Android

```bash
flutter build appbundle
```

O comando abaixo cria um build para iOS

```bash
flutter build ios
```