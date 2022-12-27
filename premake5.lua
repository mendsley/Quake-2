workspace "Quake2"
	language "C"
	characterset "MBCS"
	symbols "On"
	debugformat "c7"
	editandcontinue "Off"
	exceptionhandling "On"

	startproject "quake2"

	flags {
		"FatalWarnings",
		"MultiProcessorCompile",
		"NoIncrementalLink",
		"NoManifest",
		"NoMinimalRebuild",
	}

	configurations {
		"Debug",
		"Release",
	}

	platforms {
		"x86",
	}

	location ".build"

	filter "system:windows"
		defines {
			"WIN32",
			"_CRT_SECURE_NO_WARNINGS",
			"strdup=_strdup",
			"strcasecmp=_stricmp",
		}
		buildoptions {
			"/wd4700",
		}

	filter "configurations:Debug"
		defines {
		}

	filter "configurations:Release"
		defines {
			"NDEBUG",
		}

project "quake2"
	kind "WindowedApp"

	files {
		"client/*.c",
		"client/*.h",
		"win32/*.c",
		"win32/*.h",
		"qcommon/*.c",
		"qcommon/*.h",
		"game/m_flash.c",
		"server/*.c",
		"server/*.h",

		"game/q_shared.c",
	}

	removefiles {
		"win32/rw_dib.c",
	}

	filter "system:windows"
		links {
			"ws2_32",
			"Winmm",
			"opengl32",
		}

		removefiles {
			"server/sv_null.c",
		}

project "game"
	kind "SharedLib"

	files {
		"game/*.c",
		"game/*.h",
	}

project "ref_gl"
	kind "SharedLib"

	files {
		"ref_gl/*.c",
		"ref_gl/*.h",

		"win32/glw_imp.c",
		"win32/qgl_win.c",
		"game/q_shared.c",
		"win32/q_shwin.c",
	}

	links {
		"Winmm",
	}

project "ref_soft"
	kind "SharedLib"

	files {
		"ref_soft/*.c",
		"ref_soft/*.h",
		"ref_soft/*.asm",

		"game/q_shared.c",
		"win32/q_shwin.c",
		"win32/rw_imp.c",
		"win32/rw_dib.c",
		"win32/rw_ddraw.c",
	}

	filter "system:windows"
		links {
			"Winmm",
		}

project "ctf"
	kind "SharedLib"

	files {
		"ctf/*.c",
		"ctf/*.h",
	}
