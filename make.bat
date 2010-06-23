
@IF "%OPENCL_ROOT%"=="" @GOTO USAGE
@IF "%LOCAL_ROOT%"=="" @SET LOCAL_ROOT=%CD%
@SET DIRS=math environment compiler query imgfilter yuv pid nbody

@IF "%1"=="" SET TARGET=all
@IF NOT "%1"=="" SET TARGET=%1

@FOR %%A IN (%DIRS%) DO @(
	@PUSHD sources\%%A
	make %TARGET% DEBUG=1
	@POPD
)
@GOTO END

:USAGE
ECHO You must set OPENCL_ROOT (which includes the headers and the .lib).

:END