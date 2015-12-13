# android-reverse-tools

Scripts for downloading, decompiling, inserting hooks to apk, compiling and signing apk.
## Scripts
* **apk-download** - download apk from play market using site [https://apkpure.com/](https://apkpure.com/)
* **apk-decompile** - decompiling apk using apktool, dex2jar and jd
* **apk-compile** - compiling apk from jar file and sign it
* **hook-create** - create Hook.java template file. it use javassist to insert hooks into java bytecode
* **hook-compile** - compile Hook.java
* **hook-run** - run Hook.class

## Installing
```bash
git clone https://github.com/zaval/android-reverse-tools.git && cd android-reverse-tools && ./install
```
Enter path, all tools will installs to this directory and alias ```activate-android-reverse``` will be added to ```.bashrc``` file

## Using
```bash
activate-android-reverse
```
All scripts will be added to ```PATH``` end env ```REVERSEPATH``` will contain path to your tools installation.

*Have a nice reverse )*
