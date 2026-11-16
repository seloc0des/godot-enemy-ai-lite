# Upgrading to Enemy AI (Pro)

Enemy AI (Lite) is the free core: the notice/chase/attack/leash brain.
**Enemy AI (Pro)** adds everything around it.

| | Lite (free) | Pro |
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

Lite scenes keep working while Enemy AI (Lite) stays installed. The full brain (`EnemyBrain`, with the `EnemyAI` autoload) has every setting, signal and method the Lite brain has, under the same names, and hunts the same `"player"` group. The Pro brain swings whatever its
`attack_node_path` points at, so after giving an enemy the Pro brain, click
**Make Enemy (brain)** on it once and the dock points it at the enemy's hitbox.

Get it on itch.io. Use it in any game you make, commercial or not.
