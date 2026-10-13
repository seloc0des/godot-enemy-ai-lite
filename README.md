# Enemy AI (Lite)

Free no-code enemy brain for **Godot 4.5+**. Drop it on any CharacterBody2D:
it idles, chases whatever is in the `"player"` group, attacks on a cooldown,
and leashes back home when kited — all Inspector radii, baked on from the
editor chooser dock.

Free Lite tier of the SELODEV **Enemy AI** addon. Pro adds waypoint patrol
routes, flee-at-low-health, swinging any node you point the brain at, and the spawner
with endless + wave modes. Deliberately **not** a behavior-tree framework.

## 5-minute setup

1. Copy `addons/enemy_ai_lite/` into your project.
2. Enable **Enemy AI (Lite)** in Project Settings → Plugins.
3. Select your enemy's picture (or any node) → in the **Enemy AI Lite** dock
   click **Make Enemy (brain)**. A picture goes inside the new Enemy, so the two
   move together.
4. Select your player node → click **Make the selected node the player** in the
   same dock (the Controller packs already do this).

Anything in the `"player"` group is now hunted: notice → chase → attack →
leash back home. Zero code.

## What it does

- `EnemyBrainLite` — idle/chase/attack/return driving the parent
  CharacterBody2D (top-down). `detect_radius` to notice, `attack_radius` +
  `attack_cooldown` to swing (the `attacked` signal is where you deal damage),
  `give_up_radius` to leash home — mid-attack included, so it can't be kited
  forever. A Combat hitbox on the body is switched on for each attack
  (`attack_duration`), so it hits once per swing while the player stays in
  reach. Signals: `state_changed`, `target_acquired`, `target_lost`, `attacked`.
- `EnemyAILite` autoload — `state_changed` + `attack_started` mirrored globally
  for HUDs and music.
- **Chooser dock** — bake a brain onto the selected node (shape included).

## Verify

```bash
godot --headless --path . res://tools/verify.tscn   # prints PASS
```
Or open `tools/acceptance.tscn` and press F6 for a PASS/FAIL banner.

## License

MIT. Use it in commercial games.


## Part of a family

This is one free tier from the selodev catalog of no-code Godot 4 systems. They share an item contract and a save contract, so they plug into each other, and each one also works fully on its own.

Free systems:

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite)
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite)
- [Loot Lite](https://github.com/seloc0des/godot-loot-lite)
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite)
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite)
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite)
- [Stats / Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite)
- [Save / Load Lite](https://github.com/seloc0des/godot-save-load-lite)
- [Dialogue Lite](https://github.com/seloc0des/godot-dialogue-lite)
- [Combat Lite](https://github.com/seloc0des/godot-combat-lite)
- [Controller Lite](https://github.com/seloc0des/godot-controller-lite)
- [Enemy AI Lite](https://github.com/seloc0des/godot-enemy-ai-lite)
- [Scene Flow Lite](https://github.com/seloc0des/godot-scene-flow-lite)
- [Audio Lite](https://github.com/seloc0des/godot-audio-lite)
- [Level Builder Lite](https://github.com/seloc0des/godot-level-builder-lite)
- [Weather System Lite](https://github.com/seloc0des/godot-weather-lite)
- [Settings + Menus](https://github.com/seloc0des/godot-settings-menus) (complete and free, no paid tier)

Free VFX: [Magic Cast](https://github.com/seloc0des/godot-magic-cast-vfx-lite), [Elemental Impact](https://github.com/seloc0des/godot-elemental-impact-vfx-lite), [Explosion](https://github.com/seloc0des/godot-explosion-vfx-lite), [Pickup, Buff & Heal](https://github.com/seloc0des/godot-pickup-buff-vfx-lite).

Free starter projects: [Free Starter](https://github.com/seloc0des/free-starter-godot), [Dungeon](https://github.com/seloc0des/godot-dungeon-starter), [Survival](https://github.com/seloc0des/godot-survival-starter), [RPG](https://github.com/seloc0des/godot-rpg-starter).

The full versions add drop-in UI, editor docks and the cross-system wiring. They're on itch.io: **https://selodev.itch.io**
