@ECHO OFF

:: move to current directory
CD %~dp0

SET CMD=mean-calc.vbs
SET OUTPUT=output.csv
SET INPUTS=sample-data-1.csv sample-data-2.csv sample-data-3.csv

CScript %CMD% %OUTPUT% %INPUTS%
