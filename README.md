# DLC Behavioral Analysis

Ambiente de análise comportamental com DeepLabCut para rastreamento de camundongos em pesquisa neurocientífica.

Projeto desenvolvido em colaboração com um trabalho de pesquisa em neurociência, com foco na extração automatizada de métricas comportamentais a partir de vídeos de testes padronizados.

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

## Instalação — Versões Validadas

> ⚠️ O DeepLabCut é sensível a versões específicas de drivers e ferramentas.
> Este passo a passo foi testado e validado — siga exatamente as versões indicadas para evitar erros de compatibilidade.
>
> **Nota:** O CUDA 13.1 exibido pelo `nvidia-smi` indica a versão máxima suportada pelo driver. O CUDA Toolkit 11.2 é a versão específica exigida pelo TensorFlow usado pelo DeepLabCut.

### 1. Instalar a GPU e CUDA

- Instalar o driver atualizado da GPU
- Instalar o **CUDA Toolkit 11.2**
- Copiar os arquivos do **cuDNN** para:
  `C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.2`

### 2. Instalar o Miniconda

- Baixar e instalar o [Miniconda](https://docs.anaconda.com/miniconda/)
- Verificar a instalação no Anaconda Prompt:
```bash
conda --version
```

### 3. Criar e ativar o ambiente virtual
```bash
conda create -n deeplabcut python=3.10 -y
conda activate deeplabcut
```

### 4. Instalar o DeepLabCut
```bash
# Instalar DLC com TensorFlow
pip install "deeplabcut[tf]"

# Verificar instalação
python -c "import deeplabcut; print(deeplabcut.__version__)"

# Instalar GUI
pip install "deeplabcut[gui]"

# Testar abertura da interface
python -c "import deeplabcut; deeplabcut.launch_dlc()"
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

**Fase atual:** Filmagem dos animais nos testes comportamentais

**Próximos passos:**
- Anotação manual dos pontos corporais no DLC
- Treinamento do modelo com GPU
- Extração automática de métricas
- Análise estatística dos dados comportamentais

---

## Fluxo de Dados Planejado

Vídeos RAW  
→ DeepLabCut (extração de coordenadas)  
→ Arquivos CSV (coordenadas frame a frame)  
→ Processamento e cálculo de métricas comportamentais  
→ Dataset analítico estruturado  
→ Análise estatística

A ideia é manter separação entre dados brutos, dados intermediários e dados analíticos, garantindo rastreabilidade.

---

## Colaboração

Projeto desenvolvido em suporte à pesquisa de neurociência.
