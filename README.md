# Auto Game Resolution Toggle Script

This AutoHotkey script automatically switches your display resolution when specific games are running. It uses NirCmd to change between a high-resolution gaming mode (e.g., 2880x1620 @ 240Hz) and your default desktop resolution (e.g., 1920x1080 @ 240Hz). The script monitors a customizable list of game executables and changes the resolution when any of them are detected running, then restores your default resolution when the game closes.

**Features:**

- Automatically detects when selected games launch and changes resolution for optimal gameplay.
- Restores your preferred desktop resolution when the game exits.
- Easy to customize the list of games and resolutions.

**Requirements:**

- [AutoHotkey v2.0](https://www.autohotkey.com/)
- [NirCmd](https://www.nirsoft.net/utils/nircmd.html) (update the script path if needed)

**Usage:**

1. Edit the script to set the correct path to `nircmd.exe` and update the `gameList` with your game executables.
2. Optionally, adjust the `gameRes` and `defaultRes` arrays for your preferred resolutions and refresh rates.
3. Run the script with AutoHotkey.
4. (Optional) Place a shortcut to the script in your Windows Startup folder to have it run automatically when your system starts. To do this, press `Win + R`, type `shell:startup`, and copy a shortcut to the script into the folder.
5. The script will automatically handle resolution switching when you launch or close any of the specified games.
