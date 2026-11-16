# Quick Start: Enemy AI (Lite)

Goal: an enemy that chases you and gives up, with no code.
This works in 2D and in 3D. The 3D steps are marked **3D**.

## 1. Install

- Copy `addons/enemy_ai_lite/` into your project.
- Enable **Enemy AI (Lite)** in Project Settings → Plugins.

## 2. Make an enemy (dock)

- Select your enemy's picture (a Sprite2D or AnimatedSprite2D), a
  CharacterBody2D, or any other node.
- In the **Enemy AI Lite** dock: set **Detect radius** / **Chase speed**, click
  **Make Enemy (brain)**. A picture goes inside a new `Enemy` body that takes
  its place, so the two move together, and Ctrl+Z puts it back. Any other node
  gets a new `Enemy` under it.

**3D:** open a scene whose top node is a Node3D. The dock's button reads **Make 3D
Enemy (brain)** and the fields switch to metres (detect radius 12, chase speed 4).
Select a mesh (a MeshInstance3D, or any node that draws), a CharacterBody3D, or any
other Node3D and click it. A mesh goes inside a new `Enemy` CharacterBody3D that takes
its place, and Ctrl+Z puts it back. Anything else gets a new `Enemy` under it: a
capsule body 1.8 m tall with collision, a red capsule mesh with a nose on the front so
you can see which way it faces, and the brain. The brain needs a floor under it to
stand on, because gravity pulls it down.

It hunts anything in the `"player"` group. The Controller packs join it
automatically. Otherwise select your player node and click **Make the selected
node the player** in the same dock. The status line warns you when nothing in
the scene is marked as the player yet.

## 3. Deal damage (needs the Combat pack)

Enemy AI Lite chases and attacks, but it has no health or damage of its own.
Damage comes from the Combat pack (Pro or Lite). With both installed, no code:

- Select your player. In the **Combat** dock set the **Side** above
  **Add Health + Hurtbox** to *Player side (enemies can hurt it)*, then click
  **Add Health + Hurtbox**.
- Select the enemy. Set **Damage**, set the **Side** above **Add Hitbox** to
  *Enemy side (hurts the player)*, then click **Add Hitbox**.

The Brain's **Attack Radius** is set for you. With Combat installed,
**Make Enemy (brain)** and **Add Hitbox** both set it so the enemy stops close
enough for its hitbox to reach the player's hurtbox: 24 for the dock's 32x32
boxes, or measured from your boxes if you resized them. It also stops just
outside where the two bodies touch, so a wide player body can't hold it off
before it attacks. If the bodies are too wide for the hitbox to reach past, the
status line says to make the hitbox bigger. If you resize a box later, select
the enemy and click **Add Hitbox** again.

The enemy now hurts the player on every attack, once per **Attack Cooldown**
(1 s by default), for as long as they stay in reach: the brain switches its
hitbox on for each attack. Without the Combat pack, the brain's `attacked`
signal is the hook for your own damage code:

```gdscript
$Enemy/Brain.attacked.connect(func(target):
    target.get_node("Health").take_damage(10))
```

## 4. React globally (optional)

```gdscript
EnemyAILite.state_changed.connect(func(enemy, from, to):
    if to == &"chase": $AlertSound.play())
```

## Tuning

In 3D every distance is in metres (the defaults are 12 to notice, 1.8 to swing and 25
for the leash) and speeds are metres per second.

`detect_radius` (notice), `attack_radius` + `attack_cooldown` (swing),
`attack_duration` (how long a Combat hitbox on the body stays on per swing),
`give_up_radius` (leash, measured from its start position: it walks home and
is deaf until it arrives).

## Next

Patrol routes, flee, swinging any node you point the brain at, and the wave
spawner → **upgrade.md**.
