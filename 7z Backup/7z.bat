set hh=%time:~0,2%
if %hh% LSS 10 (set hh=0%time:~1,1%)
set dst=%date:~0,4%%date:~5,2%%date:~8,2%_%hh%%time:~3,2%%time:~6,2%
"C:\Program Files\7-Zip\7z.exe" a %1_%dst%.zip %1
