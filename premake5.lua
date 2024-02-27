workspace "test"
    architecture "x64"
    configurations { "Debug", "Release" }

    language "C++"
    cppdialect "C++20"

    targetdir "%{wks.location}/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{wks.name}"
    objdir "%{wks.location}/bin-int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{wks.name}"

    targetname "%{wks.name}"

    files {
        "Gms2Ext/src/**.c",
        "Gms2Ext/src/**.cpp",
        "Gms2Ext/include/**.h",
        "Gms2Ext/include/**.hpp"
    }

    includedirs {
        "Gms2Ext/include"
    }

    kind "SharedLib"

	defines {
		"__YYDEFINE_EXTENSION_FUNCTIONS__"
	}

    filter "configurations:Debug"
        defines "_CONF_DEBUG"

        symbols "on"
    
    filter "configurations:Release"
        defines "_CONF_RELEASE"

        optimize "on"
    
    filter "system:Windows"
        defines "_SYS_WINDOWS"

        systemversion "latest"

		prebuildcommands {
			"\"%{wks.location}\\scripts\\prebuild.bat\""
		}

		postbuildcommands {
			"\"%{wks.location}\\scripts\\postbuild.bat\""
		}

project "Gms2Ext"
    location "Gms2Ext"