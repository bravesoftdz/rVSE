unit Missions;

interface

uses
  Windows, AvL, avlUtils, avlEventBus, avlMath, avlVectors, VSECore, Game,
  GameObjects, GameData;

type
  TMission = class(TCard)
  protected
    FMissionData: TMissionData;
    FResource: TResourceType;
  public
    constructor Create(MissionData: TMissionData);
    procedure Activate(Player: TPlayer); virtual;
    function Execute(Player: TPlayer; Char: TCharacter): Boolean; virtual;
    property Resource: TResourceType read FResource;
  end;
  TMission1 = class(TMission)
    constructor Create;
  end;
  TMission2 = class(TMission)
    constructor Create;
  end;
  TMission3 = class(TMission)
    constructor Create;
  end;
  TMission4 = class(TMission)
    constructor Create;
  end;
  TMission5 = class(TMission)
    constructor Create;
  end;
  TMission6 = class(TMission)
    constructor Create;
  end;
  TMission7 = class(TMission)
    constructor Create;
  end;
  TMission8 = class(TMission)
    constructor Create;
  end;
  TMission9 = class(TMission)
    constructor Create;
  end;
  TMission10 = class(TMission)
    constructor Create;
  end;
  TMission11 = class(TMission)
    constructor Create;
  end;
  TMission12 = class(TMission)
    constructor Create;
  end;
  TMission13 = class(TMission)
    constructor Create;
  end;
  TMission14 = class(TMission)
    constructor Create;
  end;
  TMission15 = class(TMission)
    constructor Create;
  end;

function CreateMissionsDeck: TDeck;

implementation

uses
  Scene;

function CreateMissionsDeck: TDeck;

  procedure Add(Mission: TMission);
  begin
    Result.Add(Mission);
    Mission.Pos := Vector3D(-59.070, 0.0, 18.362);
    Mission.FModel.Transform.Rotate(-Pi/2, 1.0, 0.0, 0.0);
    EventBus.SendEvent(SceneAddObject, nil, [Mission]);
  end;

var
  i: Integer;
begin
  Result := TDeck.Create;
  Add(TMission1.Create);
  Add(TMission2.Create);
  Add(TMission3.Create);
  Add(TMission4.Create);
  Add(TMission5.Create);
  Add(TMission6.Create);
  Add(TMission7.Create);
  Add(TMission8.Create);
  Add(TMission9.Create);
  Add(TMission10.Create);
  Add(TMission11.Create);
  Add(TMission12.Create);
  Add(TMission13.Create);
  Add(TMission14.Create);
  Add(TMission15.Create);
  Result.Shuffle;
  for i := 0 to Result.Count - 2 do
    Result[i].Follow := Result[i + 1];
end;

{ TMission }

constructor TMission.Create(MissionData: TMissionData);
const
  Scale = 5.0;
begin
  inherited Create('Missions' + IntToStr((MissionData.Quarter - 1) div 3), (MissionData.Quarter - 1) mod 3);
  FMissionData := MissionData;
  FModel.Transform.Scale(Scale, Scale, Scale);
  FHeight := FHeight * Scale;
end;

procedure TMission.Activate(Player: TPlayer);
begin
  FResource := FMissionData.Resources[PlayerIndex(Player.Name)];
  Follow := nil;
  with FPos do
    AddAnimationStep(aaMoveTo, Vector3D(X, 10.0, Z), 200);
  with FMissionData.Pos do
  begin
    AddAnimationStep(aaMoveTo, Vector3D(X, 10.0, Z), Round(10 * VectorSize(VectorSub(FMissionData.Pos, FPos))));
    AddAnimationStep(aaRotate, Vector4D(0.0, 0.0, 1.0, Pi), 250);
    AddAnimationStep(aaMoveTo, Vector3D(X, 0.0, Z), 200);
  end;
end;

function TMission.Execute(Player: TPlayer; Char: TCharacter): Boolean;
begin
  //TODO: execution checks
  AddAnimationStep(aaMove, Vector3D(0.0, 10.0, 0.0), 250);
  AddAnimationStep(aaRemove, Vector3D(0.0), 0);
end;

{ TMission1 }

constructor TMission1.Create;
begin
  inherited Create(GameData.Missions[0]);
end;

{ TMission2 }

constructor TMission2.Create;
begin
  inherited Create(GameData.Missions[1]);
end;

{ TMission3 }

constructor TMission3.Create;
begin
  inherited Create(GameData.Missions[2]);
end;

{ TMission4 }

constructor TMission4.Create;
begin
  inherited Create(GameData.Missions[3]);
end;

{ TMission5 }

constructor TMission5.Create;
begin
  inherited Create(GameData.Missions[4]);
end;

{ TMission6 }

constructor TMission6.Create;
begin
  inherited Create(GameData.Missions[5]);
end;

{ TMission7 }

constructor TMission7.Create;
begin
  inherited Create(GameData.Missions[6]);
end;

{ TMission8 }

constructor TMission8.Create;
begin
  inherited Create(GameData.Missions[7]);
end;

{ TMission9 }

constructor TMission9.Create;
begin
  inherited Create(GameData.Missions[8]);
end;

{ TMission10 }

constructor TMission10.Create;
begin
  inherited Create(GameData.Missions[9]);
end;

{ TMission11 }

constructor TMission11.Create;
begin
  inherited Create(GameData.Missions[10]);
end;

{ TMission12 }

constructor TMission12.Create;
begin
  inherited Create(GameData.Missions[11]);
end;

{ TMission13 }

constructor TMission13.Create;
begin
  inherited Create(GameData.Missions[12]);
end;

{ TMission14 }

constructor TMission14.Create;
begin
  inherited Create(GameData.Missions[13]);
end;

{ TMission15 }

constructor TMission15.Create;
begin
  inherited Create(GameData.Missions[14]);
end;

end.