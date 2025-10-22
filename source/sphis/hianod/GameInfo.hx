package sphis.hianod;

import sphis.any.Version;

class GameInfo
{
	public static var game_version:Version = new Version(0, 1);

	public static var modpack_api_version:Version = new Version(3, 0);
	public static var modpack_api_rule(get, never):String;

	static function get_modpack_api_rule():String
	{
		final min_modpack_api_version = new Version().fromVersion(modpack_api_version, [1, 0, 0]).toString();
		final max_modpack_api_version = new Version().fromVersion(modpack_api_version, [-1, 0, 0]).toString();

		return min_modpack_api_version + '>= <=' + max_modpack_api_version;
	}
}
