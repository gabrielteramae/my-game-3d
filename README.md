# My Game 3D — protótipo 3D no Godot

![Godot](https://img.shields.io/badge/Godot-4.7-478CBF?style=flat&logo=godotengine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-478CBF?style=flat&logo=godotengine&logoColor=white)

Cena 3D pequena: um personagem anda no plano, a câmera orbita com o mouse e uma esfera some ao ser tocada, somando uma pedra no inventário. `project.godot` declara a feature `4.7` e o renderer Forward Plus. Não há corrida, combate, craft nem sobrevivência.

| Entrada | Efeito |
|---|---|
| A D W S | `move_left`, `move_right`, `move_forward`, `move_back` |
| Espaço (`ui_accept`) | Pulo se estiver no chão (`JUMP_VELOCITY` 4,5) |
| Mouse | `CameraRig` gira. O pitch fica entre -0,8 e 0,8. O mouse começa capturado |
| Encostar na esfera | `pedra.gd` chama `Inventory.add_item("pedra", 1)` e remove o nó |

O movimento usa o yaw da câmera, não o eixo fixo do mundo: `Vector3(input_dir.x, 0, input_dir.y).rotated(Vector3.UP, yaw)`. Velocidade 5. Gravidade 9,8. A câmera fica a distância 6 e altura 2.

## Stack

- Godot 4.7 (`config/features` = `4.7`, `Forward Plus`)
- GDScript
- Física 3D: Jolt (`3d/physics_engine`)
- No Windows o driver de render pedido é `d3d12`

## Estrutura

```
my-game-3d/
├── project.godot      nome my-game-3d, cena principal main.tscn
├── main.tscn          chão, luz, céu procedural, player, pedra, HUD
├── player.gd          CharacterBody3D
├── camera_rig.gd      órbita da Camera3D
├── pedra.gd           Area3D em (3, 0,4, 3)
├── inventory.gd       autoload Inventory (dicionário + sinal item_added)
├── hud.gd             label "Pedra: N"
└── icon.svg
```

O player é uma cápsula. A pedra é uma esfera de raio 0,4. O chão é um plano de 30×30. Não há testes.

## Como rodar

Pré-requisito: Godot 4.7, edição padrão (o projeto não usa .NET).

```bash
git clone https://github.com/gabrielteramae/my-game-3d.git
cd my-game-3d
```

No Godot: Import, selecione `project.godot`, depois F5. WASD anda, Espaço pula, o mouse olha em volta. Ande até a esfera à frente e à direita; o HUD passa de `Pedra: 0` para `Pedra: 1` e a esfera some. O script também imprime o dicionário no output do editor.

---

© 2026 Gabriel Teramae Chan
