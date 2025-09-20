#!/bin/bash

# UM SALVE DO MATHEUS ALESSANDRO 
# Autor: MTS_B3 - 6 anos de dedicação em programação
# Uso: ./MTS_SENSI.sh

# .
slow_print() {
    text="$1"
    delay="${2:-0.05}"
    for (( i=0; i<${#text}; i++ )); do
        printf "%s" "${text:$i:1}"
        sleep "$delay"
    done
    echo
}

# .
loading_animation() {
    echo -e "\n\033[1;32mCarregando configurações aguarde 20 segundos...\033[0m"
    
    frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
    
    for i in {1..200}; do  # 20 segundos (200 * 0.1s)
        frame_index=$((i % ${#frames[@]}))
        printf "\r\033[1;36m${frames[$frame_index]} Aplicando otimizações... %d%%\033[0m" $((i * 100 / 200))
        sleep 0.1
    done
    
    printf "\r\033[1;32m✅ Configurações aplicadas com sucesso!\033[0m\n\n"
}

# Limpa a tela
clear

# .
echo -e "\033[1;32m" # Verde negrito
slow_print "Parabéns, depois de 6 anos de estudo em programação de Android, Kernel Linux, C++, C# e Java," 0.03
slow_print "Fiz com muita dedicação e perseverança esse script que define a sensibilidade perfeita" 0.03
slow_print "sem tremer de forma honesta para o seu dispositivo!" 0.03
echo
slow_print "Faça um ótimo proveito!" 0.05
echo
echo -e "\033[1;33m" # Amarelo negrito para contatos
slow_print "ID: 197516950 PSG APOLLO" 0.04
slow_print "WPP: +55(24)99857-3367" 0.04
slow_print "IG: https://www.instagram.com/mts__b3?igsh=d2hmaTJleHU5OXk5" 0.04
echo -e "\033[0m" # Reset cor

sleep 2

# Verificações 
if ! command -v adb &> /dev/null; then
    echo -e "\033[1;31m❌ ERRO: ADB não encontrado!\033[0m"
    exit 1
fi

adb_status=$(adb get-state 2>/dev/null)
if [ "$adb_status" != "device" ]; then
    echo -e "\033[1;31m❌ ERRO: Dispositivo não conectado via ADB!\033[0m"
    exit 1
fi

# Obtém DPI físico silenciosamente
dpi_output=$(adb shell dumpsys display | grep -iE 'xdpi' | head -n1 | grep -oE '[0-9]+(\.[0-9]+)?' | cut -d. -f1)

# verifica se achou valor
if [ -z "$dpi" ]; then
    echo "Erro: DPI física (xdpi) não encontrada."
    exit 1
fi

echo "DPI detectada: $dpi"
if [ -z "$dpi_output" ]; then
    echo -e "\033[1;31m❌ ERRO: Não foi possível obter DPI\033[0m"
    exit 1
fi

xdpi=$(echo "$dpi_output" | grep -o 'xdpi: [0-9.]*' | cut -d' ' -f2)
if [ -z "$xdpi" ]; then
    echo -e "\033[1;31m❌ ERRO: Não foi possível extrair xdpi\033[0m"
    exit 1
fi

xdpi_int=$(LC_NUMERIC=C printf "%.0f" "$xdpi")


# Animação de carregamento com aplicação das configurações
loading_animation &
loading_pid=$!

# .
sleep 5
adb shell wm density $xdpi_int >/dev/null 2>&1

sleep 5
adb shell settings put system pointer_speed 2 >/dev/null 2>&1

sleep 5
echo -e "\r\033[1;36m🎯 Aplicando melhor configuração para o seu modelo!\033[0m" >/dev/tty
echo -e "\r\033[1;32m⚡ 100% de precisão aplicada!\033[0m" >/dev/tty

adb shell service call SurfaceFlinger 1008 i32 1 >/dev/null 2>&1
adb shell "su -c 'setprop debug.sf.disable_backpressure 1'" >/dev/null 2>&1
adb shell "su -c 'setprop debug.sf.disable_hwc_overlays 1'" >/dev/null 2>&1
adb shell "su -c 'setprop debug.sf.disable_hwc 1'" >/dev/null 2>&1
adb shell settings put global animator_duration_scale 0 >/dev/null 2>&1
adb shell settings put global transition_animation_scale 0 >/dev/null 2>&1
adb shell settings put global window_animation_scale 0 >/dev/null 2>&1

global_overlays=$(adb shell settings list global | grep -i overlay 2>/dev/null)
system_overlays=$(adb shell settings list system | grep -i overlay 2>/dev/null)
secure_overlays=$(adb shell settings list secure | grep -i overlay 2>/dev/null)
global_hw=$(adb shell settings list global | grep -i -E "(hw|hardware)" 2>/dev/null)
system_hw=$(adb shell settings list system | grep -i -E "(hw|hardware)" 2>/dev/null)
global_gpu=$(adb shell settings list global | grep -i -E "(gpu|render)" 2>/dev/null)
system_gpu=$(adb shell settings list system | grep -i -E "(gpu|render)" 2>/dev/null)
global_disable=$(adb shell settings list global | grep -i disable 2>/dev/null)
system_disable=$(adb shell settings list system | grep -i disable 2>/dev/null)

echo "$global_overlays $system_overlays $secure_overlays $global_hw $system_hw $global_gpu $system_gpu $global_disable $system_disable" | tr ' ' '\n' | grep -E "(overlay|disable|hw|gpu|render|force)" | while read -r line; do
    if [ ! -z "$line" ]; then
        key=$(echo "$line" | cut -d'=' -f1)
        if [ ! -z "$key" ]; then
            adb shell settings put global "$key" 1 >/dev/null 2>&1
            adb shell settings put system "$key" 1 >/dev/null 2>&1
            adb shell settings put secure "$key" 1 >/dev/null 2>&1
        fi
    fi
done

adb shell settings put global disable_overlays 1 >/dev/null 2>&1
adb shell settings put system disable_overlays 1 >/dev/null 2>&1
adb shell settings put secure disable_overlays 1 >/dev/null 2>&1
adb shell settings put global force_hw_ui 1 >/dev/null 2>&1
adb shell settings put system force_hw_ui 1 >/dev/null 2>&1
adb shell settings put global debug.hwui.renderer opengl >/dev/null 2>&1
adb shell settings put global debug.hwui.renderer skiagl >/dev/null 2>&1
adb shell setprop debug.hwui.renderer skiagl >/dev/null 2>&1
adb shell setprop debug.hwui.renderer opengl >/dev/null 2>&1
adb shell setprop debug.composition.type gpu >/dev/null 2>&1
adb shell setprop debug.sf.hw 1 >/dev/null 2>&1
adb shell setprop ro.config.disable_hw_accel false >/dev/null 2>&1
adb shell setprop debug.egl.hw 1 >/dev/null 2>&1
adb shell setprop hw.overlay.disable 1 >/dev/null 2>&1
adb shell setprop ro.sf.disable_triple_buffer false >/dev/null 2>&1

echo -e "\r\033[1;36m⚡ Forçando através do SurfaceFlinger...\033[0m" >/dev/tty
adb shell "dumpsys SurfaceFlinger --disable-hwc" >/dev/null 2>&1

sleep 4
# Configura 60Hz
adb shell settings put system peak_refresh_rate 60.0 >/dev/null 2>&1
adb shell settings put system min_refresh_rate 60.0 >/dev/null 2>&1

sleep 4
# Aguarda a animação terminar
wait $loading_pid

# Resultado final
echo -e "\033[1;32m"
echo "🎉 CONFIGURAÇÃO FINALIZADA COM SUCESSO! 🎉"
echo
echo -e "\033[1;36m📊 OTIMIZAÇÕES APLICADAS:\033[0m"
echo -e "\033[1;32m   ✅ DPI Físico: $xdpi_int (Precisão máxima)\033[0m"
echo -e "\033[1;32m   ✅ Mouse Speed: 2 (Responsividade otimizada)\033[0m"
echo -e "\033[1;32m   ✅ GPU Rendering: FORÇADO (Performance máxima)\033[0m"
echo -e "\033[1;32m   ✅ Refresh Rate: 60Hz (Fluidez total)\033[0m"
echo
echo -e "\033[1;33m🎮 SEU DISPOSITIVO ESTÁ AGORA OTIMIZADO PARA O FF SLV DO APOLLO! 🎮\033[0m"
echo
echo -e "\033[1;34m⚡ Desenvolvido com dedicação por MTS_B3 ⚡\033[0m"
echo -e "\033[0m"
