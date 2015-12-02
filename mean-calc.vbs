Option Explicit

' ======================================================================= '
'
' Mean Calculation Script (calc-mean.vbs)
'
' Usage:
' calc-mean.vbs <output> <input-1> <input-2> ... <input-n>
'
' Copyright (c) 2015 tag
' http://karat5i.blogspot.jp/
'
' ======================================================================= '

' delimiter
Dim strDelimiter : strDelimiter = ","

' ======================================================================= '

' object: Arguments
Dim objArgs : Set objArgs = Wscript.Arguments

' object: FileSystemObject
Dim objFSO : Set objFSO = CreateObject("Scripting.FileSystemObject")

' string: Folder path including this script
Dim scriptFolderPath : scriptFolderPath = Left(WSH.ScriptFullName, Len(WSH.ScriptFullName) - Len(WSH.ScriptName))

' string: Path of output file
Dim strOutput : strOutput = objArgs(0)
' object : Output file
Dim objOutput : Set objOutput = objFSO.OpenTextFile(objFSO.BuildPath(scriptFolderPath, strOutput), 2, True)

' integer: index
Dim Index

' get input files from arguments
Dim strInput()
For Index = 0 To (objArgs.Count - 2) Step 1
	ReDim Preserve strInput(Index)
	strInput(Index) = objArgs(Index + 1)
Next

' open all input files
Dim objInputArray()
For Index = 0 To UBound(strInput) Step 1
	ReDim Preserve objInputArray(Index)
	Set objInputArray(Index) = objFSO.OpenTextFile(objFSO.BuildPath(scriptFolderPath, strInput(Index)), 1)
Next

' process
Do Until objInputArray(0).AtEndOfLine = True
	objOutput.WriteLine(LineAverage(ReadAndSplit(objInputArray)))
Loop

' ======================================================================= '

' read a line and split
Function ReadAndSplit(inputList)
	Dim I, line()
	For I = 0 To UBound(inputList) Step 1
		ReDim Preserve line(I)
		line(I) = inputList(I).ReadLine
		line(I) = Split(line(I), strDelimiter)
	Next
	ReadAndSplit = line
End Function

' calculate average of each value in array
Function LineAverage(lineList)
	Dim I, J, Dat(), strResult
	For J = 0 To UBound(lineList(0)) Step 1
		For I = 0 To UBound(lineList) Step 1
			ReDim Preserve Dat(I)
			Dat(I) = lineList(I)(J)
		Next
		strResult = strResult & Average(Dat) & ","
	Next
	strResult = Left(strResult, Len(strResult) - 1)
	LineAverage = strResult
End Function

' calculate average
Function Average(valueList)
	Dim Total : Total = 0
	Dim Num : Num = UBound(valueList)
	Dim Index
	For Index = 0 To Num Step 1
		Total = Total + valueList(Index)
	Next
	Average = Total / (Num + 1)
End Function
