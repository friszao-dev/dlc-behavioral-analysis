# DLC Behavioral Analysis

Ambiente de análise comportamental com DeepLabCut para rastreamento de camundongos em pesquisa neurocientífica.

Projeto desenvolvido em colaboração com trabalho de pesquisa em neurociência na UNIFESP, com foco na extração automatizada de métricas comportamentais a partir de vídeos de testes padronizados.

---

## Contexto

Este projeto apoia pesquisa experimental em neurociência comportamental, utilizando o DeepLabCut (DLC) para rastreamento de pontos corporais de camundongos em testes validados na literatura científica.

Os vídeos são gerados pelo software AnyMaze (câmera fixa superior de baixa resolução) e reprocessados pelo DLC para obter rastreamento multi-ponto com maior precisão.

### Testes comportamentais analisados

- **Campo Aberto (Open Field)** — atividade locomotora e ansiedade
- **Interação Social** — sociabilidade e preferência por novidade social
- **Elevated Plus Maze (EPM)** — ansiedade tipo estado

---

## Ambiente Técnico

| Componente | Especificação |
|---|---|
| Sistema Operacional | Ubuntu 22.04 LTS |
| Processador | AMD Ryzen 5 5600 3.50 GHz |
| Memória RAM | 32 GB |
| GPU | NVIDIA GeForce RTX 3070 8 GB |
| Driver NVIDIA | 580.126.09 |
| CUDA | 12.1 (PyTorch) |
| Python | 3.10 |
| DeepLabCut | 3.0.0rc13 (PyTorch engine) |
| napari | 0.6.6 |
| napari-deeplabcut | 0.2.1.8 |
| Conda | 26.1.1 |

---

## Instalação — Versões Validadas

> ⚠️ O DeepLabCut é sensível a versões específicas de drivers e ferramentas.
> Este passo a passo foi testado e validado no Ubuntu 22.04 LTS.

### 1. Instalar o Miniconda
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
source ~/miniconda/bin/activate && conda init bash
```

Feche e reabra o terminal após a instalação.

### 2. Criar e ativar o ambiente virtual
```bash
conda create -n DEEPLABCUT python=3.10 -y
conda activate DEEPLABCUT
```

### 3. Instalar PyTorch com CUDA 12.1
```bash
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121
```

Verificar se a GPU está sendo reconhecida:
```bash
python -c "import torch; print(torch.cuda.is_available()); print(torch.cuda.get_device_name(0))"
```

Resultado esperado:
```
True
NVIDIA GeForce RTX 3070
```

### 4. Instalar o DeepLabCut com GUI
```bash
pip install --pre "deeplabcut[gui]"
```

### 5. Instalar dependência do sistema para a GUI
```bash
sudo apt-get install libxcb-cursor0 -y
```

### 6. Verificar instalação
```bash
python -c "import deeplabcut; import napari; print('DLC:', deeplabcut.__version__); print('napari:', napari.__version__)"
```

Resultado esperado:
```
Loading DLC 3.0.0rc13...
DLC: 3.0.0rc13
napari: 0.6.6
```

### 7. Abrir o DLC
```bash
conda activate DEEPLABCUT && python -m deeplabcut
```

---

## Estrutura do Projeto
```
dlc-behavioral-analysis/
├── videos/
│   └── raw/
│       ├── Open-Field/          # 15 vídeos .mp4 do AnyMaze
│       ├── Interacao-Social/    # 4 vídeos .mp4 do AnyMaze
│       └── EPM/                 # 4 vídeos .mp4 do AnyMaze
├── dlc_projects/                # Projetos criados pelo DeepLabCut
│   ├── openfield-giulia-YYYY-MM-DD/
│   ├── social-giulia-YYYY-MM-DD/
│   └── epm-giulia-YYYY-MM-DD/
├── outputs/
│   ├── csv/                     # Coordenadas extraídas frame a frame
│   ├── metrics/                 # Métricas comportamentais calculadas
│   └── videos_annotated/        # Vídeos com pontos sobrepostos
├── scripts/                     # Scripts Python de análise
└── docs/                        # Documentação e referências
```

---

## Projetos DLC

Foram criados 3 projetos DLC separados, um para cada tipo de experimento.

| Projeto | Experimento | Vídeos | Tipo | Bodyparts |
|---|---|---|---|---|
| openfield | Campo Aberto | 15 | Single animal | nose, head, body, tail_base |
| social | Interação Social | 4 | Single animal | nose, head, body, tail_base |
| epm | Elevated Plus Maze | 4 | Single animal | nose, head, body, tail_base |

> **Nota sobre Interação Social:** Embora haja 2 animais no vídeo, a análise é realizada apenas sobre o animal teste.

---

## Fluxo de Trabalho
```
Vídeos RAW (.mp4 do AnyMaze)
  → DeepLabCut (anotação + treinamento + inferência)
  → CSV (coordenadas x,y por ponto por frame)
  → Scripts Python (cálculo de métricas comportamentais)
  → Dataset analítico estruturado
  → Análise estatística
```

---

## Status do Projeto

| Etapa | Status |
|---|---|
| Instalação do ambiente (Ubuntu + DLC 3.0) | ✅ Concluído |
| Configuração da GPU (RTX 3070 + CUDA 12.1) | ✅ Concluído |
| Criação do projeto Open Field | ✅ Concluído |
| Teste piloto (2 vídeos, 50 epochs) | ✅ Concluído |
| Treinamento completo Open Field (15 vídeos, 200 epochs) | ⬜ Pendente |
| Criação e treinamento projeto Social Interaction | ⬜ Pendente |
| Criação e treinamento projeto EPM | ⬜ Pendente |
| Extração de coordenadas CSV | ⬜ Pendente |
| Cálculo de métricas comportamentais | ⬜ Pendente |
| Análise estatística | ⬜ Pendente |

---

## Colaboração

Projeto desenvolvido em suporte à pesquisa de neurociência — UNIFESP.
