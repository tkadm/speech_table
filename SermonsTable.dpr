program SermonsTable;



uses
  Forms,
  u_main in 'u_main.pas' {F_Main},
  mdPreacherProperty in 'mdPreacherProperty.pas' {F_PreacherProperty},
  u_objects in 'u_objects.pas',
  mdGraph in 'mdGraph.pas' {F_Graph},
  uh_graphics in 'uh_graphics.pas' {FH_Graphics},
  uh_options in 'uh_options.pas' {FH_Options},
  mdWorship in 'mdWorship.pas' {F_Worship},
  mdSermon in 'mdSermon.pas' {F_Sermon},
  mdSermonSorts in 'mdSermonSorts.pas' {F_SermonSorts},
  mdExceedDays in 'mdExceedDays.pas' {F_ExceedDays},
  mdPrintMaster in 'mdPrintMaster.pas' {F_PrintMaster},
  DB.SQLite in 'D:\WorkSoftProjects\Test\TSQLDataSet\DB.SQLite.pas',
  mdWorshipTablePeriod in 'mdWorshipTablePeriod.pas' {F_WorshipTablePeriod};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF_Main, F_Main);
  Application.Run;
end.
