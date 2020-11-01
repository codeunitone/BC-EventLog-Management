codeunit 50100 "Windows-EventLog Management"
{

    local procedure MyProcedure()
    var
        myInt: Integer;
    begin

    end;

    procedure WriteEventlog(EventType: Option Information,Warning,Error; LogMessage: Text)
    var
        EventLog: DotNet SystemDiagnosticEventLog;
        EventLogEntryType: DotNet SystemDiagnosticsEventLogEntryType;
        EventLogName: Label 'Application';
        EventLogSource: Label 'MicrosoftDynamicsNav';
    begin
        EventLog := EventLog.EventLog(EventLogName);
        EventLog.Source := EventLogSource;

        case EventType of
            EventType::Information:
                EventLogEntryType := EventLogEntryType.Information;
            EventType::Warning:
                EventLogEntryType := EventLogEntryType.Warning;
            EventType::Error:
                EventLogEntryType := EventlogEntryType.Error;
        end;

        EventLog.WriteEntry(LogMessage, EventLogEntryType);
        EventLog.Dispose;
    end;
}