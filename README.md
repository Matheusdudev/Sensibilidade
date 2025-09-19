
# MTS_SENSI.sh 🎮


**Script de otimização Android para máxima precisão em jogos**

Desenvolvido após **6 anos de estudo** em programação Android, Kernel Linux, C++, C# e Java. Este script configura automaticamente a **sensibilidade perfeita** para dispositivos Android, eliminando tremores e maximizando a precisão em jogos.

## 🚀 Recursos

- ✅ **DPI Físico Automático** - Detecta e aplica o DPI real da tela
- ✅ **Mouse Speed Otimizado** - Configuração ideal para responsividade
- ✅ **GPU Rendering Forçado** - Performance máxima em jogos
- ✅ **60Hz Refresh Rate** - Fluidez total
- ✅ **Detecção Inteligente** - Funciona em todas as marcas e versões Android
- ✅ **Interface Interativa** - Animações e feedback visual

## 📱 Compatibilidade

- **Android:** 5.0+ (API 21+)
- **Marcas:** Samsung, Xiaomi, OnePlus, Huawei, LG, Motorola, etc.
- **Arquitetura:** ARM, ARM64, x86, x86_64
- **Root:** Não necessário (funcionalidades extras com root)

## 📋 Pré-requisitos

1. **Termux** instalado no Android
2. **Depuração USB** habilitada
3. **Depuração Wi-Fi ou Cabo USB** para conexão PC/Android
4. **ADB** instalado no PC ou Termux

## 🛠️ Instalação no Termux

### 1. Instalar Termux
```bash
# Baixe do F-Droid (recomendado)
# https://f-droid.org/repo/com.termux_1022.apk
```

### 2. Instalar ADB
```bash
# Atualize os repositórios
pkg update && pkg upgrade -y
pkg install android-tools wget -y

```
### 3. Conectar via WIFI
```bash
adb pair SEU_IP:PORTA
COLOQUE O CÒDIGO DE 6 DIGITOS
adb connect SEU_IP:PORTA
adb devices
# Deve aparecer algo como:
#List of devices attached
# ABC123DEF456    device
```
### 4. Baixar e Instalar MTS_SENSI.sh
```bash
# Baixe o Script
wget https://github.com/Matheusdudev/Sensibilidade/archive/refs/heads/main.zip

#Descompacte
unzip main.zip
# Entre na pasta
cd Sensibilidade-main

# Dê permissão de execução
chmod +x MTS_SENSI.sh

# Execute o script
./MTS_SENSI.sh
```

## 📲 Preparando o Dispositivo Android

### 1. Habilitar Opções do Desenvolvedor
1. Vá em **Configurações** → **Sobre o telefone**
2. Toque **7 vezes** em "Número da compilação"
3. Volte para **Configurações** → **Opções do desenvolvedor**

### 2. Habilitar Depuração USB
1. Em **Opções do desenvolvedor**
2. Ative **"Depuração USB"**
3. Ative **"Instalação via USB"** (se disponível)

### 3. Conectar via ADB
```bash
# Conecte o cabo USB
# Execute no Termux:
adb devices

# Deve aparecer algo como:
# List of devices attached
# ABC123DEF456    device
```

## ⚡ Como Usar

1. **Execute o script:**
   ```bash
   ./MTS_SENSI.sh
   ```

2. **O script irá:**
   - Detectar automaticamente o DPI físico da sua tela
   - Aplicar configurações otimizadas
   - Adiciona a melhor configuração de FurfaceFlinger
   - Exibir progresso com animação interativa
  

3. **Resultado:**
   - Sensibilidade perfeita sem tremores
   - Performance maximizada em jogos
   - Responsividade otimizada

## 🎯 O que o Script Configura

| Configuração | Valor | Descrição |
|-------------|-------|-----------|
| **DPI** | Auto (Físico) | Precisão máxima de input |
| **Mouse Speed**  | Responsividade otimizada |
| **GPU Rendering** | Forçado | Performance em jogos |
| **Refresh Rate** | 60Hz | Fluidez máxima |
| **Overlays** | Desabilitado | Latência reduzida |

## 🔧 Solução de Problemas

### ADB não encontrado
```bash

### Dispositivo não detectado
```bash
# Verifique conexões
adb kill-server
adb start-server
adb devices
```

### Permissão negada
```bash
# Dê permissões corretas
chmod +x MTS_SENSI.sh
```

### UI ficou estranha após DPI
```bash
# Reverta o DPI
adb shell wm density reset
```

## 📞 Suporte e Contato

- **ID:** 197516950
- **WhatsApp:** +55(24)99857-3367
- **Instagram:** [@mts__b3](https://www.instagram.com/mts__b3?igsh=d2hmaTJleHU5OXk5)

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se livre para:

1. Fazer fork do projeto
2. Criar uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abrir um Pull Request

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## ⭐ Avaliação

Se este script te ajudou, considere dar uma ⭐ no repositório!

## 📊 Status do Projeto

- ✅ **Estável** - Versão 1.0
- ✅ **Testado** - Samsung, Xiaomi, OnePlus
- ✅ **Atualizado** - Android 5.0 até 14
- ✅ **Suportado** - Suporte ativo

---

**Desenvolvido com dedicação por MTS_B3** ⚡

*6 anos de estudo em programação Android, Kernel Linux, C++, C# e Java*
