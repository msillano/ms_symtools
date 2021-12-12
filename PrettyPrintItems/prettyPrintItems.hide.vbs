' file doc (for doxygen)
' /**  
' *  @file 
' *  <b>prettyPrintItems.hide.vbs</b> This little VBS driver is general purpose: it runs hidden any BAT file passed as parameter. 
' */
' // code doc
' /**
' *  Pseudo-function with actual VBS script code.
' *
' *  The program puts in double quotes(") the file BAT path and all (optional)  arguments.
' *  Then uses Shell.Run to run the BAT with '0' as intWindowStyle.  0: Hide the window (and activate another window).
' *  For more intWindowStyle (0..10) see "https://ss64.com/vb/run.html" where is also the original code: <tt>invisible.vbs</tt>
' */

Dim Args()
ReDim Args(WScript.Arguments.Count - 1)

For i = 0 To WScript.Arguments.Count - 1
   Args(i) = """" & WScript.Arguments(i) & """"
Next
' 'NOTE: all arguments for the BAT are in doubles quotes! 
' 'msgbox Join(Args)
CreateObject("WScript.Shell").Run Join(Args), 0, False