@echo off
setlocal enabledelayedexpansion

REM ==============================
REM JMeter Home
REM ==============================
if "%JMETER_HOME%"=="" (
  set JMETER_HOME=C:\tools\apache-jmeter-5.6.3
)


REM ==============================
REM Project Root
REM ==============================
set PROJECT_ROOT=%cd%

REM ==============================
REM Test Plan
REM ==============================
set TEST_PLAN=%PROJECT_ROOT%\test-plans\login_perf_test.jmx

REM ==============================
REM Properties
REM ==============================
set PROPS=%PROJECT_ROOT%\config\test.properties

REM ==============================
REM Results
REM ==============================
set RESULTS_DIR=%PROJECT_ROOT%\results
set REPORTS_DIR=%RESULTS_DIR%\reports

REM ==============================
REM CLEAN OLD RESULTS
REM ==============================
echo Cleaning old results...
del /f /q "%RESULTS_DIR%\*.jtl" 2>nul
rmdir /s /q "%REPORTS_DIR%" 2>nul

mkdir "%RESULTS_DIR%" 2>nul
mkdir "%REPORTS_DIR%" 2>nul

echo ======================================
echo RUNNING BASELINE TEST
echo ======================================
call "%JMETER_HOME%\bin\jmeter" -n ^
 -t "%TEST_PLAN%" ^
 -q "%PROPS%" ^
 -Jusers=1 ^
 -Jrampup=1 ^
 -Jduration=10 ^
 -l "%RESULTS_DIR%\baseline.jtl"

call "%JMETER_HOME%\bin\jmeter" -g "%RESULTS_DIR%\baseline.jtl" ^
 -o "%REPORTS_DIR%\baseline-report"

echo ======================================
echo RUNNING LOAD TEST
echo ======================================
call "%JMETER_HOME%\bin\jmeter" -n ^
 -t "%TEST_PLAN%" ^
 -q "%PROPS%" ^
 -Jusers=50 ^
 -Jrampup=30 ^
 -Jduration=60 ^
 -l "%RESULTS_DIR%\load.jtl"

call "%JMETER_HOME%\bin\jmeter" -g "%RESULTS_DIR%\load.jtl" ^
 -o "%REPORTS_DIR%\load-report"

echo ======================================
echo RUNNING STRESS TEST
echo ======================================
call "%JMETER_HOME%\bin\jmeter" -n ^
 -t "%TEST_PLAN%" ^
 -q "%PROPS%" ^
 -Jusers=200 ^
 -Jrampup=30 ^
 -Jduration=60 ^
 -l "%RESULTS_DIR%\stress.jtl"

call "%JMETER_HOME%\bin\jmeter" -g "%RESULTS_DIR%\stress.jtl" ^
 -o "%REPORTS_DIR%\stress-report"

echo ======================================
echo RUNNING SPIKE TEST
echo ======================================
call "%JMETER_HOME%\bin\jmeter" -n ^
 -t "%TEST_PLAN%" ^
 -q "%PROPS%" ^
 -Jusers=200 ^
 -Jrampup=5 ^
 -Jduration=20 ^
 -l "%RESULTS_DIR%\spike.jtl"

call "%JMETER_HOME%\bin\jmeter" -g "%RESULTS_DIR%\spike.jtl" ^
 -o "%REPORTS_DIR%\spike-report"

echo ======================================
echo ALL PERFORMANCE TESTS COMPLETED
echo ======================================

echo Reports available at:
echo %REPORTS_DIR%
