codeunit 50100 "Event Log Management"
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
    begin
        EventLog := EventLog.EventLog('Application');
        EventLog.Source := 'MicrosoftDynamicsNav';

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