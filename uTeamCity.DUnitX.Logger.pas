unit uTeamCity.DUnitX.Logger;

interface

uses
  DUnitX.TestFramework, System.SysUtils, TestFramework;

type
  TTeamCityLogger = class(TInterfacedObject, ITestLogger)
  private
    endTime: TDateTime;
    startTime: TDateTime;
    runTime: TDateTime;
    procedure WriteTeamCityTestFailure(error: ITestError);
  protected
    procedure OnTestingStarts(const threadId: TThreadID; testCount, testActiveCount: Cardinal);

    procedure OnStartTestFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);

    procedure OnSetupFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);
    procedure OnEndSetupFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);

    procedure OnBeginTest(const threadId: TThreadID; const Test: ITestInfo);

    procedure OnSetupTest(const threadId: TThreadID; const Test: ITestInfo);
    procedure OnEndSetupTest(const threadId: TThreadID; const Test: ITestInfo);

    procedure OnExecuteTest(const threadId: TThreadID; const Test: ITestInfo);

    procedure OnTestSuccess(const threadId: TThreadID; const Test: ITestResult);
    procedure OnTestError(const threadId: TThreadID; const Error: ITestError);
    procedure OnTestFailure(const threadId: TThreadID; const Failure: ITestError);
    procedure OnTestIgnored(const threadId: TThreadID; const AIgnored: ITestResult);
    procedure OnTestMemoryLeak(const threadId: TThreadID; const Test: ITestResult);

    procedure OnLog(const logType: TLogLevel; const msg: string);

    procedure OnTeardownTest(const threadId: TThreadID; const Test: ITestInfo);
    procedure OnEndTeardownTest(const threadId: TThreadID; const Test: ITestInfo);

    procedure OnEndTest(const threadId: TThreadID; const Test: ITestResult);

    procedure OnTearDownFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);
    procedure OnEndTearDownFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);

    procedure OnEndTestFixture(const threadId: TThreadID; const results: IFixtureResult);

    procedure OnTestingEnds(const RunResults: IRunResults);
  end;

implementation

const
  CRLF = #13#10;

  { TTeamCityLogger }

procedure TTeamCityLogger.OnBeginTest(const threadId: TThreadID; const Test: ITestInfo);
begin
//  if IsTestMethod(Test.) then
    System.Writeln(Format('##teamcity[testStarted name=''%s'']', [Test.Name]));
end;

procedure TTeamCityLogger.OnEndSetupFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);
begin

end;

procedure TTeamCityLogger.OnEndSetupTest(const threadId: TThreadID; const Test: ITestInfo);
begin

end;

procedure TTeamCityLogger.OnEndTearDownFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);
begin

end;

procedure TTeamCityLogger.OnEndTeardownTest(const threadId: TThreadID; const Test: ITestInfo);
begin

end;

procedure TTeamCityLogger.OnEndTest(const threadId: TThreadID; const Test: ITestResult);
begin
//  if IsTestMethod(Test) then
   System.Writeln(Format('##teamcity[testFinished name=''%s'']',[Test.Test.Name]));
end;

procedure TTeamCityLogger.OnEndTestFixture(const threadId: TThreadID; const results: IFixtureResult);
begin

end;

procedure TTeamCityLogger.OnExecuteTest(const threadId: TThreadID; const Test: ITestInfo);
begin

end;

procedure TTeamCityLogger.OnLog(const logType: TLogLevel; const msg: string);
begin

end;

procedure TTeamCityLogger.OnSetupFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);
begin

end;

procedure TTeamCityLogger.OnSetupTest(const threadId: TThreadID; const Test: ITestInfo);
begin

end;

procedure TTeamCityLogger.OnStartTestFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);
begin

end;

procedure TTeamCityLogger.OnTearDownFixture(const threadId: TThreadID; const fixture: ITestFixtureInfo);
begin

end;

procedure TTeamCityLogger.OnTeardownTest(const threadId: TThreadID; const Test: ITestInfo);
begin

end;

procedure TTeamCityLogger.WriteTeamCityTestFailure(error: ITestError);
begin
  System.Writeln(Format('##teamcity[testFailed type=''%s'' name=''%s'' ' + 'message=''%s'' details=''%s'']',
    [error.ExceptionClass.ClassName,
    error.Test.Name,
    error.ExceptionLocationInfo,  //ThrownExceptionName,
    error.ExceptionMessage // ThrownExceptionMessage
    //error.LocationInfo
    ]));
(*##teamcity[testFailed name='testname' message='failure message' details='message and stack trace']
##teamcity[testFailed type='comparisonFailure' name='testname' message='failure message' details='message and stack trace' expected='expected value' actual='actual value']
                               failure.failedTest.name,
                               failure.thrownExceptionName,
                               failure.LocationInfo,
                               failure.thrownExceptionMessage
*)
end;

procedure TTeamCityLogger.OnTestError(const threadId: TThreadID; const Error: ITestError);
begin
  WriteTeamCityTestFailure(error);
  writeln('E');

end;

procedure TTeamCityLogger.OnTestFailure(const threadId: TThreadID; const Failure: ITestError);
begin
  WriteTeamCityTestFailure(Failure);
  writeln('E');
end;

procedure TTeamCityLogger.OnTestIgnored(const threadId: TThreadID; const AIgnored: ITestResult);
begin

end;

procedure TTeamCityLogger.OnTestingEnds(const RunResults: IRunResults);
var
  h, m, s, l: Word;
begin
  endTime := now;
  runTime := endTime - startTime;
  writeln;
  DecodeTime(runTime, h, m, s, l);
  writeln(Format('Time: %d:%2.2d:%2.2d.%d', [h, m, s, l]));
//  writeln(Report(testResult));
  writeln;
end;

procedure TTeamCityLogger.OnTestingStarts(const threadId: TThreadID; testCount, testActiveCount: Cardinal);
begin

end;

procedure TTeamCityLogger.OnTestMemoryLeak(const threadId: TThreadID; const Test: ITestResult);
begin

end;

procedure TTeamCityLogger.OnTestSuccess(const threadId: TThreadID; const Test: ITestResult);
begin

end;

end.
