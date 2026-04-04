project "ImGuiTestEngine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "imgui_test_engine/*.h",
        "imgui_test_engine/*.cpp",
        "imgui_test_engine/thirdparty/**.h",
        "imgui_test_engine/thirdparty/**.cpp",
        "shared/*.h",
        "shared/*.cpp"
    }

    includedirs
    {
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.ImGuiTestEngine}",
        "%{IncludeDir.ImGuiTestShared}",
        "%{IncludeDir.glm}"
    }

    defines
    {
        "IMGUI_ENABLE_TEST_ENGINE",
        "IMGUI_TEST_ENGINE_ENABLE_COROUTINE_STDTHREAD_IMPL=1"
    }

    filter "system:windows"
        systemversion "latest"
        buildoptions
        {
            "/utf-8"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"

