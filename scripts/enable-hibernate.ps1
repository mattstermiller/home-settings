Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile', '-Command', 'regedit /S C:\Users\M.Miller\.setup\resources\enable-hibernate.reg'
# powercfg.exe /hibernate on
