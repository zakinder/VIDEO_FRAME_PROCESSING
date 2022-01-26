@echo -- UPDATING BKWORKSPACE
@ECHO OFF
@set batchfile_path=%~dp0
@set bkworkspace_folder=%batchfile_path%backup_workspace
@set workspace_folder=%batchfile_path%workspace


xcopy "%batchfile_path%\workspace\sdk\fsbl\*.*" "%batchfile_path%\backup_workspace\SDK\fsbl\" >nul /E /K /D /H /Y
xcopy "%batchfile_path%\workspace\sdk\fsbl_bsp\*.*" "%batchfile_path%\backup_workspace\SDK\fsbl_bsp\" >nul /E /K /D /H /Y
xcopy "%batchfile_path%\workspace\sdk\vfpWebCamera\*.*" "%batchfile_path%\backup_workspace\SDK\vfpWebCamera\" >nul /E /K /D /H /Y
xcopy "%batchfile_path%\workspace\sdk\vfpWebCamera_bsp\*.*" "%batchfile_path%\backup_workspace\SDK\vfpWebCamera_bsp\" >nul /E /K /D /H /Y
