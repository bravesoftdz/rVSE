program Pathologic;

uses
  {$IFDEF DEBUGMEM}FastMM4,{$ENDIF} Windows, AvL, avlUtils, avlEventBus,
  VSECore, VSETexMan, VSEMemPak, StateStart, StateMenu, StateGame;

{$R *.res}
{$R MemPak.res}

function LoadTexture(Sender: TObject; const Name: string): Cardinal;
begin
  try
    Result := TexMan.AddTexture(Name, GetFile(GetTexFileName(Name)), true, true, true);
    TexMan.SetFilter(Result, tfAnisotropic);
  except
    Result := 0;
  end;
end;

procedure InitStates;
begin
  Randomize;
  EventBus.ClearEvents;
  TexMan.OnLostTex := LoadTexture;
  Core.AddState(TStateGame.Create);
  Core.AddState(TStateMenu.Create);
  Core.SwitchState(Core.AddState(TStateStart.Create));
end;

begin
  InitSettings.InitStates := InitStates;
  InitSettings.Caption := 'Pathologic';
  InitSettings.Version := '1.0';
  if Settings.FirstRun then
  begin
    InitSettings.Fullscreen := true;
    InitSettings.ResolutionX := Screen.Width;
    InitSettings.ResolutionY := Screen.Height;
    Settings.Int[SSectionSettings, SGraphicsQuality] := Integer(gqMed);
  end;
  VSEStart;
  EventBus.ClearEvents;
end.
