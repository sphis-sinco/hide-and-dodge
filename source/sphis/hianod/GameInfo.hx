package sphis.hianod;

import sphis.any.Version;

class GameInfo
{
	public var game_version:Version = new Version(0, 1);

	public var mod_api_version:Version = new Version(1, 0, 0);
	public var mod_api_rule(get, never):String;

	function get_mod_api_rule():String
	{
		final min_mod_api_version = new Version().fromVersion(mod_api_version, [1, 0, 0]).toString();
		final max_mod_api_version = new Version().fromVersion(mod_api_version, [-1, 0, 0]).toString();

		return min_mod_api_version + '>= <=' + max_mod_api_version;
	}
}
