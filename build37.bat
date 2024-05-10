@echo off
echo 执行准备工作：准备证书与formulation文件 
cd blockchain_preparations
call run_preparations_37.bat
cd ..
echo 将配置文件拷贝至工作目录
xcopy /S/E/Y blockchain_preparations\config37 blockchain\test-37
cd blockchain/test-37
call refresh.bat
cd ../..