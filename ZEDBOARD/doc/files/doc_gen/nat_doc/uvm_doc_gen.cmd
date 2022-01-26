@GOTO start_run_from_here


:start_run_from_here
@set /p standalone=" STANDALONE(1-true): "
"C:\Program Files (x86)\Natural Docs\NaturalDocs.exe" C:\Images\REPOS\GitHub\VFP_Docs\Generator\uvm_doc_gen --pause-before-exit
@GOTO start_run_from_here