call mvn clean package
pause
xcopy "D:\Works\Workspaces\Stamps\stampgui\target\stampgui-1.0.0.jar" "D:\Works\Workspaces\Stamps\stampgui.jar" /Y
java -jar "D:\Works\Workspaces\Stamps\stampgui.jar" -gui >stamp.log 2>error.log