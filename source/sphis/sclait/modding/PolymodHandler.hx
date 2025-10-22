package sphis.sclait.modding;

import flixel.FlxG;
import polymod.Polymod;
import polymod.format.ParseRules;
import polymod.fs.ZipFileSystem;
import sphis.hianod.GameInfo;
import sphis.hianod.scripts.ScriptHandler;

class PolymodHandler
{
	public static var modFileSystem:Null<ZipFileSystem> = null;

	public static function scriptShit()
	{
		addImports();
	}

	public static function addImports() {}

	public static function buildParseRules():polymod.format.ParseRules
	{
		var output:polymod.format.ParseRules = polymod.format.ParseRules.getDefault();
		// Ensure TXT files have merge support.
		output.addType('txt', TextFileFormat.LINES);
		// Ensure script files have merge support.
		output.addType('hscript', TextFileFormat.PLAINTEXT);
		output.addType('hxs', TextFileFormat.PLAINTEXT);
		output.addType('hxc', TextFileFormat.PLAINTEXT);
		output.addType('hx', TextFileFormat.PLAINTEXT);

		// You can specify the format of a specific file, with file extension.
		// output.addFile("data/introText.txt", TextFileFormat.LINES)
		return output;
	}

	public static function buildIgnoreList():Array<String>
	{
		var result = Polymod.getDefaultIgnoreList();

		result.push('.git');
		result.push('.gitignore');
		result.push('.gitattributes');
		result.push('README.md');

		result.push('.haxelib');

		return result;
	}

	public static function loadMods(dirs:Array<String>)
	{
		Polymod.init({
			modRoot: #if REDIRECT_MODS '../../../../' + #end
			'modpacks/',
			dirs: dirs,
			errorCallback: onError,
			ignoredFiles: buildIgnoreList(),
			useScriptedClasses: true,
			loadScriptsAsync: #if html5 true #else false #end,
			framework: OPENFL,
			parseRules: buildParseRules(),
			customFilesystem: modFileSystem,
			apiVersionRule: GameInfo.modpack_api_rule,
			frameworkParams: {
				assetLibraryPaths: [],
				coreAssetRedirect: #if REDIRECT_MODS '../../../../' + #end
				'assets/',
			},
		});
	}

	public static function onError(error:PolymodError)
	{
		trace('[${error.severity}] (${Std.string(error.code).toUpperCase()}): ${error.message}');
	}

	public static function buildFileSystem():polymod.fs.ZipFileSystem
	{
		polymod.Polymod.onError = onError;
		return new ZipFileSystem({
			modRoot: #if REDIRECT_MODS '../../../../' + #end
			'modpacks/',
			autoScan: true
		});
	}

	public static function getAllMods():Array<ModMetadata>
	{
		trace('Scanning the mods folder...');

		var modMetadata:Array<ModMetadata> = Polymod.scan({
			modRoot: 'modpacks/',
			apiVersionRule: GameInfo.modpack_api_rule,
			fileSystem: modFileSystem,
			errorCallback: onError
		});
		trace('Found ${modMetadata.length} mods when scanning.');
		return modMetadata;
	}

	public static function getAllModIds():Array<String>
	{
		var modIds:Array<String> = [for (i in getAllMods()) i.id];
		return modIds;
	}

	public static function forceReloadAssets():Void
	{
		if (modFileSystem == null)
			modFileSystem = buildFileSystem();

		// Forcibly clear scripts so that scripts can be edited.
		ScriptHandler.clearScripts();
		Polymod.clearScripts();

		scriptShit();

		loadMods(getAllModIds());
		ScriptHandler.loadScripts();

		if (FlxG.state != null)
			FlxG.resetState();
	}
}
