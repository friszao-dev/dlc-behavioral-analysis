# DLC Behavioral Analysis — FarmoLab

Ambiente de análise comportamental com DeepLabCut para rastreamento de camundongos em pesquisa neurocientífica.

Projeto desenvolvido em colaboração com o FarmoLab, com foco na extração automatizada de métricas comportamentais a partir de vídeos de testes padronizados.

---

## Contexto

Este projeto apoia pesquisa experimental em neurociência comportamental, utilizando o DeepLabCut (DLC) para rastreamento de pontos corporais de camundongos em testes validados na literatura científica.

### Testes comportamentais analisados

- **Campo Aberto** — atividade locomotora e ansiedade
- **Interação Social** — sociabilidade e preferência por novidade social
- **Elevated Plus Maze (EPM)** — ansiedade tipo estado
- **Inibição de Pré-pulso (PPI)** — filtragem sensório-motora
- **Reconhecimento de Objeto** — aprendizado visual e memória

---

## Ambiente Técnico

| Componente | Especificação |
|---|---|
| Sistema Operacional | Windows 10 Pro 64-bit |
| Processador | AMD Ryzen 5 5600 3.50 GHz |
| Memória RAM | 32 GB |
| Driver NVIDIA | 591.86 |
| GPU | NVIDIA GeForce RTX 3070 8 GB |
| CUDA | 13.1 |
| Python | 3.10.19 |
| DeepLabCut | 2.3.11 |
| Conda | 25.11.1 |

---

## Como Configurar o Ambiente

### Pré-requisitos
- [Miniconda](https://docs.anaconda.com/miniconda/) instalado
- Driver NVIDIA atualizado com suporte a CUDA 13.1

### Instalação
```bash
# Criar ambiente virtual
conda create -n deeplabcut python=3.10 -y

# Ativar ambiente
conda activate deeplabcut

# Instalar DeepLabCut com TensorFlow e GUI
pip install "deeplabcut[tf]"
pip install "deeplabcut[gui]"
```

### Verificar instalação
```bash
python -c "import deeplabcut; print(deeplabcut.__version__)"
```

---

## Como Executar

Para facilitar a abertura do DLC sem usar o terminal manualmente, foi criado um atalho `.bat`:
```bat
@echo off
call conda activate deeplabcut
python -c "import deeplabcut; deeplabcut.launch_dlc()"
```

Salve como `abrir_deeplabcut.bat` e execute direto pela área de trabalho.

---

## Status do Projeto

🎥 **Fase atual:** Filmagem dos animais nos testes comportamentais

⏳ **Próximos passos:**
- Anotação manual dos pontos corporais no DLC
- Treinamento do modelo com GPU
- Extração automática de métricas
- Análise estatística dos dados comportamentais

---

## Colaboração

Projeto desenvolvido em suporte à pesquisa do FarmoLab.
