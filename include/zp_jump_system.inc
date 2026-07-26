#if defined _zp_jump_system_included
	#endinput
#endif
#define _zp_jump_system_included

/**
 * Returns the number of jumps the player currently has available.
 *
 * @param id        Player index
 *
 * @return          Number of jumps remaining
 */
native zp_get_user_jumps(id);

/**
 * Adds (or removes, with a negative amount) jumps to a player's jump count.
 * The count will never go below 0.
 *
 * @param id        Player index
 * @param amount    Amount of jumps to add (use a negative value to subtract)
 *
 * @return          true on success, false if the player is not connected
 */
native zp_add_user_jumps(id, amount);
