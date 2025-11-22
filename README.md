> 🇬🇧 English | [🇹🇷 Türkçe](READMETR.md)

# HandBrake Batch Compressor (HBC)

A small, focused macOS utility that batches video compression with **HandBrakeCLI** – one folder, one click, no manual queue juggling.

HBC recursively scans a source folder (and all nested subfolders), finds supported video files, and encodes them using HandBrakeCLI with a simple, minimal UI. It is designed to be:

- 🖱️ **One‑click friendly** – pick a folder, press **Start**, and let it run.
- 📁 **Folder‑aware** – works with deeply nested folders without you having to organize files first.
- 🧠 **Safe by default** – keeps your originals unless you explicitly enable destructive behavior.
- 🌍 **Multi‑language** – ships with UI translations for many of the world’s most common languages.

> **Note:** HBC is an independent, unofficial project. It is **not** affiliated with or endorsed by the HandBrake team.  
> All credit for the actual video encoding goes to the amazing [HandBrake](https://handbrake.fr/) project and its contributors.

---

## Demo

A short demo video is included in this repository as `DemoVideo.mp4`.

[▶️ Watch the demo](DemoVideo.mp4)

The demo briefly shows:
- Launching HBC.
- Selecting a source folder that contains video files.
- Starting a batch with the default settings.
- Watching the progress and status updates while files are processed.
- Reviewing the compressed output folder once the run is complete.

---

## Features

- 🔍 **Recursive folder scan**
  - Select a source folder and HBC will discover supported video files in that folder and all nested subfolders.

- 🎬 **Batch video encoding with HandBrakeCLI**
  - Uses HandBrake’s command‑line interface under the hood.
  - Lets you configure encoder, quality, framerate and extra parameters from the UI.

- 🧯 **Safe mode (YOLO off)**
  - Encoded files are written into a separate “compressed” folder.
  - The original folder structure and files are left untouched.

- ⚠️ **YOLO Mode (destructive, opt‑in)**
  - When enabled, HBC compares each newly encoded file with the original:
    - If the new file is **smaller**, the original is removed and replaced.
    - If the new file is **larger** or encoding failed, the original is kept.
  - This is a **destructive** mode and cannot be undone – HBC will show a clear warning when you turn it on.

- 🧹 **Optimize Original Folder** (for safe workflows)
  - After encoding with YOLO **disabled**, HBC writes all encoded files into a compressed folder.
  - The **Optimize Original Folder** command then:
    - Walks through the compressed folder.
    - Locates matching originals in the source folder.
    - Replaces the original only when the compressed file is smaller.
  - This lets you review results first, then apply space savings back to your original folder structure.

- 📝 **Run log (optional)**
  - You can choose to save a per‑run log file into the selected source folder.
  - The log records successes, skips, size comparisons, and errors to help you understand what happened during a batch.

- 🧩 **Info & help sheets**
  - Dedicated in‑app help explaining:
    - What **YOLO Mode** does and why it is risky.
    - How **Optimize Original Folder** works and when to use it.
  - A separate **“How to install HandBrake”** sheet guides users through installing Homebrew and HandBrakeCLI, with copy‑friendly commands and a simple installation check.

- 🌐 **Language support**
  - The UI can follow the system language or use a manually selected language from the Settings sheet.
  - Currently includes translations for:
    - English  
    - Turkish  
    - Spanish  
    - French  
    - German  
    - Portuguese  
    - Russian  
    - Japanese  
    - Korean  
    - Hindi  
    - Bengali  
    - Vietnamese  
    - Italian  
    - Tamil  
    - Telugu  
    - Marathi  
    - Javanese  
  - If a translation is missing for a given key or language, HBC falls back to English for that piece of text.

---

## Requirements

- A recent version of **macOS** (modern SwiftUI / Sonoma‑era APIs).  
  Check the deployment target in the Xcode project if you plan to run it on older systems.
- [HandBrakeCLI](https://handbrake.fr/) installed and available on your system.
- (Optional but recommended) [Homebrew](https://brew.sh/) to install HandBrakeCLI easily.

HBC itself is a native SwiftUI macOS app and does **not** bundle HandBrakeCLI – you must install it separately.

---

## Installing HandBrakeCLI

HBC expects `HandBrakeCLI` to be available on your PATH or at one of the common locations (for example `/usr/local/bin/HandBrakeCLI`).  
The app includes an in‑app “How to install HandBrake” sheet, but here is the quick version:

### 1. Install Homebrew (if you don’t have it yet)

Visit the [Homebrew website](https://brew.sh/) for the latest installation instructions.  
Typically this looks like:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install HandBrakeCLI via Homebrew

```bash
brew install handbrake
```

This will install the command‑line version of HandBrake, usually into a location that HBC can detect automatically.

### 3. Custom HandBrakeCLI path (optional)

If you installed `HandBrakeCLI` manually or in a non‑standard location:

- Open **Settings** in HBC.
- Enter the full path to your `HandBrakeCLI` binary.
- Use the **Check** button to verify that HBC can execute it.

---

## Installing HBC (the app)

There are two typical ways to run HBC:

### From a prebuilt release (recommended for users)

1. Download the latest release from the [Releases](https://github.com/kemalsanli/HBC/releases) page.
2. Drag the `HBC.app` (or similarly named app bundle) into your `/Applications` folder.
3. Launch the app from Launchpad or Finder.

> If macOS Gatekeeper warns you about an unidentified developer, you may need to right‑click the app and choose **Open** once to approve it.

### From source (for developers)

1. Clone this repository:

   ```bash
   git clone https://github.com/kemalsanli/HBC.git
   cd HBC
   ```

2. Open the project in Xcode:

   ```bash
   open HBC.xcodeproj
   ```

   (Or open the workspace if you are using one.)

3. Choose the **HBC** app target and run it on **My Mac** (`⌘R`).

Make sure HandBrakeCLI is installed and reachable, as described in the previous section.

---

## Usage

A typical workflow looks like this:

1. **Launch HBC.**
2. Click **Select Source Folder** and choose the folder that contains your videos.
3. Adjust encoder, quality, framerate and extra parameters if needed.
4. (Optional) Enable:
   - **Save run log in source folder**
   - **YOLO Mode** (if you understand and accept the risks)
5. Click **Start** to begin the batch.
6. Watch progress indicators and status messages as each file is processed.
7. When the batch finishes:
   - If YOLO was **off**:
     - Review the compressed folder generated by HBC.
     - When satisfied, use **Optimize Original Folder** to selectively replace originals with smaller versions.
   - If YOLO was **on**:
     - Originals may already have been replaced as files were encoded.

At any point you can:

- Open the **Help / About** sheet for an overview of the app.
- Open the **YOLO Mode** and **Optimize Original Folder** info sheets to review detailed behavior.
- Open **How to install HandBrake** for installation / troubleshooting help.

---

## Error handling & logs

- HBC shows errors as standard macOS alerts where appropriate (e.g. when no videos are found, or HandBrakeCLI cannot be run).
- If **Save run log** is enabled, a log file is written into the selected source folder with:
  - Every file processed and the size comparison result.
  - Any encoding errors reported by HandBrakeCLI.
  - Decisions taken by YOLO Mode or Optimize Original Folder.

These logs can be very helpful for debugging, or just for verifying what exactly happened during a long batch run.

---

## Localization

HBC has a lightweight, hand‑rolled localization system:

- All user‑visible strings are keyed via an internal `L10nKey` enum.
- Each language has its own dictionary mapping keys to translated strings.
- When a translation is missing for a given language/key pair, HBC automatically falls back to English.
- The Settings sheet lets you:
  - Use the system language (`System`).
  - Or force a specific language for the app UI.

If you’d like to improve translations or add new ones, contributions are very welcome (see below).

---

## Contributing

Contributions, bug reports, and feature requests are very welcome.

- Open an issue on [GitHub](https://github.com/kemalsanli/HBC/issues) to report bugs, request features, or discuss ideas.
- Submit a pull request if you’d like to:
  - Improve the codebase.
  - Fix a bug or edge case.
  - Improve or add translations for your language.
  - Enhance documentation or README.

Before submitting a PR, please:

- Keep changes focused and well‑scoped.
- Add or update documentation / comments where it helps future readers.
- Test your changes on macOS with at least one language and a simple batch run.

---

## Acknowledgements

This project would not be useful without:

- **[HandBrake](https://handbrake.fr/)** – for the powerful, open‑source encoding engine (HandBrakeCLI) that does all the heavy lifting.
- The wider open‑source community whose tools and libraries make macOS development much more pleasant.

HBC simply aims to provide a friendly, focused front‑end around HandBrakeCLI for batch video compression on macOS.

---

## License

This repository is open source.  
Please see the [`LICENSE`](./LICENSE) file in this repository for full details.
