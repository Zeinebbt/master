@echo off
REM === Script pour lancer le backend Style&Home ===

cd /d "%~dp0"
cd backend

echo [INFO] Réglage du PYTHONPATH...
set PYTHONPATH=.

echo [INFO] Lancement du serveur Flask...
python -m app.main

pause