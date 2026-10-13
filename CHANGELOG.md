# Changelog: Enemy AI (Lite)

## 1.1.3 (2026-10-12)

The tabs show their names on Godot 4.5.

- **The Enemy AI Lite tab was blank on Godot 4.5.** Its tab beside the Inspector had no title, so
  "open the Enemy AI Lite tab" pointed at nothing. It is named when the pack switches on now. Godot
  4.7 was not affected.

## 1.1.2 (2026-09-27)

Installs without errors, and its tab works the moment you switch it on.

- **Its tab works the moment you switch it on.** Right after installing, some of its buttons only
  half-worked until you restarted Godot.
- **No red errors when you install it.** Installing it filled the Output panel with "Failed to
  load script" errors before you'd even switched it on. Some of its scripts named a part of the
  pack that only exists once the pack is on.
- **The tab fits a default-width dock.** The Enemy AI tab fits at any editor scale. The heading and
  long button labels wrap, and the tab scrolls when a long message makes it taller than the dock.

## 1.1.1 (2026-09-27)

Click your enemy's picture, then Make Enemy, and the two move together.

- **Make Enemy puts your picture inside the new Enemy.** Select the enemy's picture (a sprite, an
  animated sprite, a polygon or a colour box in the level) and press Make Enemy (brain). The new
  Enemy takes the picture's place, the picture goes inside it, and nothing moves on screen. The
  Enemy used to go inside the picture, so in the game it chased the player and left the picture
  standing there. Ctrl+Z puts the picture back as it was.
- **Clicking a picture that's already inside a body works on that body**, so a second click
  retunes its Brain instead of adding another body.
- **A picture at the top of its own scene is left alone**, and the status line says what to do:
  drag that scene into your level and select it there.
- **Scenes made the old way:** if your Enemy sits inside its picture, drag the Enemy out onto your
  level in the Scene list, then drop the picture onto the Enemy.

## 1.1.0 (2026-09-26)

- **Enemies from Make Enemy land their Combat hits, and keep landing them.** The attack radius is
  sized from the enemy's hitbox, the player's hurtbox and both bodies (24 for Combat's default
  boxes), so the enemy gets close enough to hurt, and it hurts the player on every attack while in
  reach. It used to stop about 37 px away, where its hitbox never reached, or hit once and then
  stand there. If the hitbox is too small to reach past the two bodies, the status says to make it
  bigger. Scenes you already built keep their radius.
- **A Combat hitbox on a Lite enemy switches on for each attack** (Attack Duration) and off between
  swings, with no click needed in scenes you already built.
- **Make Enemy clicked twice updates the brain** instead of adding a second one, and an instanced
  enemy scene gets Editable Children so the new radius saves.
- **A warning when the enemy's hitbox and the player's hurtbox are on the same side.**
- **Make Enemy tells you when nothing is marked as the player.** Brains only chase the player, and
  the status line says so when your scene has none, next to a **Make the selected node the
  player** button.
- **The quick start's damage step uses the Combat dock** (Pro or Lite), with the attack radius that
  makes the boxes touch.
- **Brains the dock adds stay still in the editor**, and pressing Play right after a button
  includes what it added.
- **Switching the plugin off only removes the autoload if the plugin added it**, and closing
  the editor no longer removes it at all. A project that declares it itself, like the starter
  kits, keeps it.
- **The Enemy AI Lite tab no longer cuts its text off.** It opened in a narrow column, so labels,
  file pickers and the notes at the bottom ran past the edge. It now asks for the same width as the
  other tabs.

## 1.0.2 — 2026-08-10

A quieter first run. No change to how anything behaves.

- **The debugger no longer fills with warnings when you press Play.** The event bus declares the signals every system talks through, and Godot flagged each one as unused because the code that sends and receives them lives in the other files. Nothing was broken, but a first run could print a stack of warnings that looked like your mistakes. They're gone.

## 1.0.1 — 2026-08-10

Safer download.

- **The download can't damage a project you're already working on.** It now unzips into one folder named after the pack, instead of putting files loose at the top. Before this, unzipping it straight into an existing game overwrote that game's name, its start-up scene and the list of add-ons you had switched on. It can't reach any of that now.
- **Added START-HERE.txt and INSTALLING.txt** at the top of the folder — what's in the download, the two-minute install, and what to do if something goes wrong. Plain text, opens anywhere.
- **Fixed: the docs pointed at a self-test file that wasn't there.** They said `tools/verify.tscn`; in the download it's `tools/enemy_ai_lite/verify.tscn`. The paths now match what's actually in the box.

## 1.0.0

- Initial release.
- `EnemyBrainLite`: idle/chase/attack/return states, detect/attack/give-up radii, attack cooldown, leash applies mid-attack.
- `EnemyAILite` autoload bus: state_changed, attack_started.
- No-code chooser dock: bake a brain onto the selected node.
- Demo: two chasers with different radii + a stand-in player.
- Headless `tools/verify.tscn` (13 checks) + `tools/acceptance.tscn` PASS/FAIL banner.
