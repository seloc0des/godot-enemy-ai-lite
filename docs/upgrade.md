# Upgrading to the full Enemy AI

Enemy AI (Lite) is the free core: the notice/chase/attack/leash brain.
**The full Enemy AI** adds everything around it.

| | Lite (free) | Full |
|---|---|---|
| Idle/chase/attack/return brain | ✅ | ✅ |
| Detect / attack / give-up radii | ✅ | ✅ |
| Attack cooldown + attacked signal | ✅ | ✅ |
| Leash applies mid-attack (no kiting) | ✅ | ✅ |
| No-code chooser dock | ✅ | ✅ |
| Waypoint patrol routes (+ per-point pauses) | — | ✅ |
| Flee below a health fraction | — | ✅ |
| Combat hitbox on the enemy's body hits every attack | ✅ | ✅ |
| Swing any node you point the brain at (a sword arc, a spell area) | — | ✅ |
| Spawner: endless mode (interval + max_alive) | — | ✅ |
| Spawner: wave mode (+ all_waves_cleared) | — | ✅ |
| Death counting via any `died` signal | — | ✅ |
| Patrol route + spawner dock buttons | — | ✅ |
| 3D brain (CharacterBody3D, metres) | ✅ | ✅ |
| 3D patrol routes and 3D spawner | — | ✅ |

Lite scenes keep working while Enemy AI (Lite) stays installed. The full brain (`EnemyBrain`, with the `EnemyAI` autoload) has every setting, signal and method the Lite brain has, under the same names, and hunts the same `"player"` group. The full brain swings whatever its
`attack_node_path` points at, so after giving an enemy the full brain, click
**Make Enemy (brain)** on it once and the dock points it at the enemy's hitbox.

Get it on itch.io. Use it in any game you make, commercial or not.
