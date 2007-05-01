-- This is a setup file. Lines that start with "--" are comments.
--  This config file is actually just Lua code. Even though you'll only
--  need a small subset of the language, there's a lot of flexibility
--  available to you if you need it.   http://www.lua.org/
--
-- All functionality supplied by the installer is encapsulated in either the
--  "Setup" or "MojoSetup" table, so you can use any other symbol name without
--  namespace clashes, assuming it's not a Lua keyword or a symbol supplied
--  by the standard lua libraries.
--
-- So here's the actual configuration...we used loki_setup's xml schema
--  as a rough guideline.

Setup.Package
{
    id = "mygame",
    description = "My Game",
    version = "1.0",
    splash = "splash.jpg",
    superuser = false,
    destination = "/usr/local/bin",
    recommended_destinations = { "/opt/games", "/usr/local/games" },

    -- Things named Setup.Something are internal functions we supply.
    --  Generally these return the table you pass to them, but they
    --  may sanitize the values, add defaults, and verify the data.

    -- End User License Agreement(s). You can specify multiple files.
    --  Also, Note the "translate" call.
    Setup.Eula
    {
        description = "My Game License",
        source = MojoSetup.translate("MyGame_EULA.html")
    },

    Setup.Eula
    {
        description = "Punkbuster License",
        source = MojoSetup.translate("PunkBuster_EULA.html"),
    },

    -- README file(s) to show and install.
    Setup.Readme
    {
        description = "My Game README",
        source = MojoSetup.translate("README.html"),
    },

    -- Specify media (discs) we may need for this install and how to find them.
    Setup.Media
    {
        id = "cd1",
        description = "MyGame CD 1",
        uniquefile = "Sound/blip.wav"
    },

    Setup.Media
    {
        id = "cd2",
        description = "MyGame CD 2",
        uniquefile = "Maps/town.map"
    },

    -- Specify chunks to install...optional or otherwise.
    Setup.Option
    {
        value = true,
        required = true,
        disabled = false,
        size = "600M",
        description = "Base Install",

        -- File(s) to install.
        Setup.File
        {
            destination = "MyGame/MyGame.app",
            unpackarchives = true,
            source = { "media://cd1/Maps/m.zip", "media://cd1/Sounds/*.wav" },

            -- You can optionally assign a lua function...we'll call this for
            --  each file to see if we should avoid installing it.
            filter = function(fn) return fn == "Graphics/dontinstall.jpg" end
        },

        -- Radio buttons.
        Setup.OptionGroup
        {
            disabled = false,
            description = "Language",
            Setup.Option
            {
                value = string.match(MojoSetup.info.locale, "^en_") ~= nil,
                size = "10M",
                description = "English",
                Setup.File { source="Lang/English.zip" },
            },
            Setup.Option
            {
                value = string.match(MojoSetup.info.locale, "^fr_") ~= nil,
                size = "10M",
                description = "French",
                Setup.File { source="Lang/French.zip" },
            },
            Setup.Option
            {
                value = string.match(MojoSetup.info.locale, "^de_") ~= nil,
                size = "10M",
                description = "German",
                Setup.File { source="Lang/German.zip" },
            },
        },
    },

    Setup.Option
    {
        value = true,
        required = false,
        disabled = false,
        size = "20M",
        description = "Downloadable extras",

        -- File(s) to install.
        Setup.File
        {
            destination = "MyGame/MyGame.app",
            unpackarchives = true,
            source = { "http://hostname.dom/extras/extras.zip" },
        },
    },
}

-- end of config.lua ...
