# My Game 3D

![Godot](https://img.shields.io/badge/Godot-4.7-478CBF?style=flat&logo=godotengine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-3D-355570?style=flat&logo=godotengine&logoColor=white)

Protótipo de RPG de ação e sobrevivência em 3D, construído do zero no Godot Engine.

## Sobre

Um RPG de sobrevivência inspirado em jogos como Enshrouded e Valheim: personagem em terceira pessoa, câmera orbital controlada pelo mouse e uma base sólida de movimentação física, pensada pra ser expandida com coleta de recursos, sobrevivência e combate.

## Funcionalidades

- **Movimentação em terceira pessoa**: andar, correr e pular com física real via `CharacterBody3D`
- **Câmera orbital relativa ao mouse**: gira em torno do personagem, com limite vertical pra evitar inversão de ângulo
- **Movimento relativo à câmera**: a direção do personagem é sempre calculada a partir de para onde a câmera está olhando, não de um eixo fixo do mundo
- **Cena base com iluminação e céu**: `DirectionalLight3D` simulando luz de fim de tarde e `WorldEnvironment` com céu procedural

## Como funciona o movimento relativo à câmera

Como o personagem não gira sozinho (quem gira é a câmera), a direção do movimento é calculada usando o ângulo (`yaw`) do `CameraRig`:

```gdscript
var yaw = camera_rig.rotation.y
var direction = Vector3(input_dir.x, 0, input_dir.y).rotated(Vector3.UP, yaw)
```

Isso garante que apertar "frente" sempre leve o personagem pra onde a câmera está apontando, independente de quantas voltas você já deu com o mouse.

## Stack

- Godot Engine 4.7
- GDScript
- Nodes nativos 3D (`CharacterBody3D`, `Camera3D`, `WorldEnvironment`, `DirectionalLight3D`)

---

## Como rodar localmente

1. Baixa o [Godot Engine 4.7](https://godotengine.org/download) (versão Standard, sem precisar da .NET)
2. Abre o Godot → **Import** → seleciona a pasta do projeto (`project.godot`)
3. Clica em **Run** (▶️) ou aperta `F5`

## Estrutura do projeto

```
my-game-3d/
├── main.tscn          # Cena principal (chão, luz, ambiente, player)
├── player.gd          # Script de movimentação do personagem
├── camera_rig.gd       # Script da câmera orbital em terceira pessoa
└── project.godot      # Configurações do projeto
```

## Roadmap

- [x] Cena base (chão, luz, céu)
- [x] Movimentação em terceira pessoa + câmera orbital
- [ ] Coleta de recursos (madeira, pedra)
- [ ] Inventário simples
- [ ] Sistema de sobrevivência (fogueira, status)
- [ ] Combate básico (inimigo com IA simples)
- [ ] Assets visuais e exportação para web
