@ECHO OFF

:: move to current directory
CD %~dp0

SET CMD=mean-calc.vbs
SET OUTPUT=output.csv
SET INPUTS=data-sample-1.csv data-sample-2.csv data-sample-3.csv

CScript %CMD% %OUTPUT% %INPUTS%
