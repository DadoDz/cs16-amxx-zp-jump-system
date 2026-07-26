#include <amxmodx>
#include <engine>
#include <fakemeta>
#include <hamsandwich>
#include <zombie_plague_x/zombie_plague_x> (e.g. zombieplague)

#define PLUGIN  "[ZP] Jump System"
#define VERSION "1.0"
#define AUTHOR  "DadoDz"

new g_jumpsnum[33], g_ijumps[33];

public plugin_init()
{
	register_plugin(PLUGIN, VERSION, AUTHOR);

	register_event("HLTV", "event_round_start", "a", "1=0", "2=0")
	register_event("DeathMsg", "event_deathmsg", "a");
	RegisterHam(Ham_Player_Jump, "player", "fw_PlayerJump", 0);
}

public plugin_natives()
{
	register_native("zp_get_user_jumps", "native_get_user_jumps", 1);
	register_native("zp_add_user_jumps", "native_add_user_jumps", 1);
}

public event_round_start() for (new i = 1; i <= 32; i++) g_jumpsnum[i] = 0;
public event_deathmsg() g_jumpsnum[read_data(2)] = 0;
public client_putinserver(id) g_jumpsnum[id] = 0;
public client_disconnected(id) g_jumpsnum[id] = 0;
public zp_user_infected_pre(id) g_jumpsnum[id] = 0;
public zp_user_humanized_pre(id) g_jumpsnum[id] = 0;

public fw_PlayerJump(id)
{
	if (g_jumpsnum[id] && is_user_connected(id) && is_user_alive(id))
	{
		if ((get_user_button(id) & IN_JUMP) && !(get_entity_flags(id) & FL_ONGROUND) && !(get_user_oldbutton(id) & IN_JUMP) && g_ijumps[id] <= g_jumpsnum[id] - 1)
		{
			static Float:fVelocity[3];
			entity_get_vector(id, EV_VEC_velocity, fVelocity);
			fVelocity[2] = random_float(265.0, 285.0);
			entity_set_vector(id, EV_VEC_velocity, fVelocity);
			g_ijumps[id]++;
		}

		if ((get_user_button(id) & IN_JUMP) && (get_entity_flags(id) & FL_ONGROUND))
			g_ijumps[id] = 0;
	}
}

// Native: zp_add_user_jumps
public native_add_user_jumps(id, amount)
{
	if (!is_user_connected(id))
		return false;

	g_jumpsnum[id] += amount;

	if (g_jumpsnum[id] < 0)
		g_jumpsnum[id] = 0;

	return true;
}

public native_get_user_jumps(id) return g_jumpsnum[id];
