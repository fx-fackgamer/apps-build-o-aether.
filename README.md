APP's BUILD O AETHER
Android HTML/CSS/JavaScript editor and preview starter project. APKs are built by GitHub Actions.
Features
One editor for HTML + CSS + JavaScript.
Separate Preview screen.
Basic JavaScript runtime error display in preview.
Export editor content as a single HTML file.
GitHub Actions builds a debug APK and uploads it as an artifact.
Important MVP limitation
The APK produced by this workflow is the APP's BUILD O AETHER editor app. It does not automatically turn arbitrary code typed into the editor into a separate installable APK. The editor can export HTML. To package a particular HTML project as its own Android app, that HTML must be added to the Android project's app assets and the Android wrapper/build workflow must be configured for that project. A secure one-tap cloud build from inside the app needs authenticated GitHub integration via a trusted backend/GitHub App; never embed a personal access token in the APK.
Build
Create a new GitHub repository named apps-build-o-aether.
Upload the contents of this folder to the repository root (not the enclosing folder).
Open Actions, enable workflows if prompted, then run Build Android APK.
Wait for the workflow to finish successfully.
Open the run, find Artifacts, and download app-debug-apk.
Extract the ZIP and install the APK on your Android phone. Android may ask you to allow installs from the browser/file manager.
Requirements
JDK 17
Android Gradle Plugin 8.7.3
Gradle 8.9 (installed by workflow)
