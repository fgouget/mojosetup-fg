# MojoSetup

## Introduction

MojoSetup is a software installer. It can be packaged in a shell script which
can then be used to install software either as root or in a regular user
account.

The installer can work from a plain terminal but also has GTK 2 and GTK 3 GUIs.
The installation process can be customized using LUA code and/or external
pre/post-installation processes.

You will find more details about how to compile MojoSetup in the
[docs.txt](docs.txt) file.


## Upstream

This is a fork of the upstream MojoSetup project which you can find here:
* [Website](https://icculus.org/mojosetup/)
* [Source repository](https://hg.icculus.org/icculus/mojosetup/)
* [Translations](https://translations.launchpad.net/mojosetup/)


## This fork

The goal is to make the extra patches it contains more broadly available while
they are, hopefully, getting integrated upstream. So it will hopefully be
relatively short-lived.

Here is a short summary of this fork's fixes and improvements:
* The selection of the GUI backend, particularly selecting between GTK 2 and
  GTK 3, no longer causes crashes.
* The translation no longer causes the GTK 3 GUI to crash.
* The GUI no longer freezes when waiting for an external process.
* The installer can now recommend installing in /opt as per the FHS.
* Fixed upgrades so the filesystem contains the same files as after a fresh
  installation. In particular this includes deleting obsolete files.
* Upgrades no longer ask for permission to modify every single file from the
  previous installation.
* Upgrades now upgrade the uninstaller too.
* Uninstalling after an upgrade no longer leaves files behind.
* Improved the rollback when canceling an installation or upgrade.
* Added the following attributes:
  - **recommended_full_destinations** which allows recommending installation
    or upgrades in non-default locations.
  - **checkdst()** which allows validating the installation directory.
* Improved localization support and completed the Simplified Chinese
  translation.
* Miscellaneous other fixes, including all compilation warnings.


## License

This fork uses the same license as upstream, that is the [zlib](LICENSE.txt)
license, and relies on the same closed-source friendly components.
