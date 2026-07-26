# [ZP] Jump System

A Counter-Strike 1.6 Zombie Plague multi-jump system that grants players extra mid-air jumps. The number of jumps a player has is not fixed in this plugin, it's controlled externally through exposed natives. Jump count automatically resets on round start, disconnect, death, and when a player becomes infected or humanized.

## Plugin Information
- **Name:** [ZP] Jump System
- **Version:** 1.0
- **Author:** DadoDz
- **Game:** Counter-Strike 1.6
- **Mod:** Zombie Plague

## Requirements
- AMX Mod X 1.9+
- Zombie Plague Mod

## Installation
1. Place `zp_jump_system.sma` in: `addons/amxmodx/scripting/`
2. Compile it with your AMXX compiler.
3. Place the compiled `.amxx` file in: `addons/amxmodx/plugins/`
4. Add this line to your `plugins.ini`: `zp_jump_system.amxx`
5. Place `zp_jump_system.inc` in: `addons/amxmodx/scripting/include/` if other plugins need to grant/read jumps.
6. Restart your server.

## Integration

This plugin does not grant jumps on its own, it only provides the *mechanic* (extra jump height while jumps remain). Another plugin (e.g. a VIP system, shop, or level-up system) must call `zp_add_user_jumps` to actually give the player jumps. Example:

```amxxpawn
// Grant 2 extra jumps to a VIP player at round start
if (is_user_vip(id))
	zp_add_user_jumps(id, 2);
```

```amxxpawn
// Check how many jumps a player has left
new jumps = zp_get_user_jumps(id);
```

## Notice
This jump system was created specifically for my own Zombie Plague server and based on my personal interests and requirements. It was developed to fit the needs of my server, using exposed natives so other systems (VIP, shop, levels, etc.) can control how many jumps a player gets. This plugin was created for my own server, but it may also be adapted and used on other Zombie Plague servers.
