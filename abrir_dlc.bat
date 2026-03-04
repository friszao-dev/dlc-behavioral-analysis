@echo off
call conda activate deeplabcut
python -c "import deeplabcut; deeplabcut.launch_dlc()"