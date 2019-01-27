unit GameData;

interface

uses
  avlVectors, VSEBindMan;

type
  TQuarterIndex = 0..15;
  TQuarterBorder = array[0 .. MaxInt div SizeOf(TVector3D) - 1] of TVector3D;
  TResourceType = (rtCoin, rtKey, rtSecret);
  TCharProfile = record
    RuName: string;
    IsDoctor: Boolean;
    Master: string;
    Resource: TResourceType;
  end;
  TMissionData = record
    Quarter: Integer;
    Pos: TVector3D;
    Resources: array[0..3] of TResourceType;
  end;
  TGraphicsQuality = (gqMin, gqMed, gqFull);

const
  UIFont = 'Courier New';
  GameTitle = '���. ������';
  SGraphicsQuality = 'Quality';
  SPlague = 'Plague';
  SBachelor = 'Bachelor';
  SHaruspex = 'Haruspex';
  SChangeling = 'Changeling';
  PlayerNames: array[0..3] of string = (SPlague, SBachelor, SHaruspex, SChangeling);
  SMariaKaina = 'MariaKaina';
  SVladTheYounger = 'VladTheYounger';
  SAndreyStamatin = 'AndreyStamatin';
  SCapella = 'Capella';
  SNotkin = 'Notkin';
  SSticky = 'Sticky';
  SAlexanderSaburov = 'AlexanderSaburov';
  SStanislavRubin = 'StanislavRubin';
  SAspity = 'Aspity';
  CharPlague: TCharProfile = (
    RuName: '����';
    IsDoctor: false;
    Master: '';
    Resource: TResourceType(0);
  );
  CharBachelor: TCharProfile = (
    RuName: '��������';
    IsDoctor: true;
    Master: '';
    Resource: rtCoin;
  );
  CharHaruspex: TCharProfile = (
    RuName: '��������';
    IsDoctor: true;
    Master: '';
    Resource: rtSecret;
  );
  CharChangeling: TCharProfile = (
    RuName: '����������';
    IsDoctor: true;
    Master: '';
    Resource: rtKey;
  );
  CharMariaKaina: TCharProfile = (
    RuName: '����� �����';
    IsDoctor: false;
    Master: SBachelor;
    Resource: rtCoin;
  );
  CharVladTheYounger: TCharProfile = (
    RuName: '������� ����';
    IsDoctor: false;
    Master: SBachelor;
    Resource: rtSecret;
  );
  CharAndreyStamatin: TCharProfile = (
    RuName: '������ ��������';
    IsDoctor: false;
    Master: SBachelor;
    Resource: rtKey;
  );
  CharCapella: TCharProfile = (
    RuName: '�������';
    IsDoctor: false;
    Master: SHaruspex;
    Resource: rtCoin;
  );
  CharNotkin: TCharProfile = (
    RuName: '������';
    IsDoctor: false;
    Master: SHaruspex;
    Resource: rtSecret;
  );
  CharSticky: TCharProfile = (
    RuName: '������';
    IsDoctor: false;
    Master: SHaruspex;
    Resource: rtKey;
  );
  CharAlexanderSaburov: TCharProfile = (
    RuName: '��������� �������';
    IsDoctor: false;
    Master: SChangeling;
    Resource: rtCoin;
  );
  CharStanislavRubin: TCharProfile = (
    RuName: '��������� �����';
    IsDoctor: false;
    Master: SChangeling;
    Resource: rtSecret;
  );
  CharAspity: TCharProfile = (
    RuName: '������';
    IsDoctor: false;
    Master: SChangeling;
    Resource: rtKey;
  );
  Characters: array[0..12] of record
    Name: string;
    Profile: ^TCharProfile;
  end = (
    (Name: SPlague; Profile: @CharPlague), 
    (Name: SBachelor; Profile: @CharBachelor),
    (Name: SHaruspex; Profile: @CharHaruspex),
    (Name: SChangeling; Profile: @CharChangeling),
    (Name: SMariaKaina; Profile: @CharMariaKaina),
    (Name: SVladTheYounger; Profile: @CharVladTheYounger),
    (Name: SAndreyStamatin; Profile: @CharAndreyStamatin),
    (Name: SCapella; Profile: @CharCapella),
    (Name: SNotkin; Profile: @CharNotkin),
    (Name: SSticky; Profile: @CharSticky),
    (Name: SAlexanderSaburov; Profile: @CharAlexanderSaburov),
    (Name: SStanislavRubin; Profile: @CharStanislavRubin),
    (Name: SAspity; Profile: @CharAspity));
  MapBounds: record
    Min: TVector2D;
    Max: TVector2D;
  end = (Min: (X: -60.0; Y: -35.0); Max: (X: 60.0; Y: 45.0));
  Quarter0Border: array[0..39] of TVector3D = (
    (X: 8.146; Y: 0.0; Z: 41.916),
    (X: -25.463; Y: 0.0; Z: 39.360),
    (X: -25.501; Y: 0.0; Z: 39.620),
    (X: -24.845; Y: 0.0; Z: 41.064),
    (X: -23.957; Y: 0.0; Z: 42.699),
    (X: -21.954; Y: 0.0; Z: 45.006),
    (X: 26.700; Y: 0.0; Z: 45.009),
    (X: 26.296; Y: 0.0; Z: 43.395),
    (X: 25.833; Y: 0.0; Z: 40.952),
    (X: 25.678; Y: 0.0; Z: 39.663),
    (X: 25.370; Y: 0.0; Z: 37.460),
    (X: 24.266; Y: 0.0; Z: 37.638),
    (X: 22.380; Y: 0.0; Z: 37.714),
    (X: 20.610; Y: 0.0; Z: 37.503),
    (X: 15.236; Y: 0.0; Z: 36.991),
    (X: 12.600; Y: 0.0; Z: 36.433),
    (X: 11.069; Y: 0.0; Z: 35.987),
    (X: 9.819; Y: 0.0; Z: 35.507),
    (X: 8.915; Y: 0.0; Z: 35.084),
    (X: 8.126; Y: 0.0; Z: 34.738),
    (X: 7.106; Y: 0.0; Z: 34.161),
    (X: 5.882; Y: 0.0; Z: 33.537),
    (X: 3.858; Y: 0.0; Z: 32.663),
    (X: 2.780; Y: 0.0; Z: 32.278),
    (X: 0.643; Y: 0.0; Z: 31.316),
    (X: -0.685; Y: 0.0; Z: 31.046),
    (X: -3.011; Y: 0.0; Z: 30.482),
    (X: -4.763; Y: 0.0; Z: 30.309),
    (X: -6.650; Y: 0.0; Z: 30.376),
    (X: -8.151; Y: 0.0; Z: 30.607),
    (X: -9.613; Y: 0.0; Z: 30.876),
    (X: -11.275; Y: 0.0; Z: 31.418),
    (X: -12.638; Y: 0.0; Z: 31.983),
    (X: -14.331; Y: 0.0; Z: 32.945),
    (X: -15.678; Y: 0.0; Z: 33.830),
    (X: -17.504; Y: 0.0; Z: 35.060),
    (X: -21.558; Y: 0.0; Z: 37.649),
    (X: -23.193; Y: 0.0; Z: 38.399),
    (X: -25.059; Y: 0.0; Z: 39.303),
    (X: -25.463; Y: 0.0; Z: 39.360));
  Quarter1Border: array[0..57] of TVector3D = (
    (X: -44.017; Y: 0.0; Z: -11.687),
    (X: -30.139; Y: 0.0; Z: -5.268),
    (X: -30.408; Y: 0.0; Z: -6.536),
    (X: -30.657; Y: 0.0; Z: -9.555),
    (X: -30.888; Y: 0.0; Z: -14.578),
    (X: -30.618; Y: 0.0; Z: -18.445),
    (X: -29.996; Y: 0.0; Z: -23.013),
    (X: -29.296; Y: 0.0; Z: -25.043),
    (X: -28.276; Y: 0.0; Z: -27.660),
    (X: -27.448; Y: 0.0; Z: -29.479),
    (X: -26.523; Y: 0.0; Z: -31.692),
    (X: -25.944; Y: 0.0; Z: -33.657),
    (X: -25.944; Y: 0.0; Z: -34.101),
    (X: -26.194; Y: 0.0; Z: -34.332),
    (X: -27.196; Y: 0.0; Z: -34.197),
    (X: -28.602; Y: 0.0; Z: -33.754),
    (X: -29.584; Y: 0.0; Z: -33.291),
    (X: -31.299; Y: 0.0; Z: -32.694),
    (X: -32.743; Y: 0.0; Z: -31.904),
    (X: -33.840; Y: 0.0; Z: -31.404),
    (X: -34.572; Y: 0.0; Z: -31.230),
    (X: -35.899; Y: 0.0; Z: -30.576),
    (X: -37.211; Y: 0.0; Z: -29.671),
    (X: -40.386; Y: 0.0; Z: -27.651),
    (X: -41.825; Y: 0.0; Z: -26.548),
    (X: -43.269; Y: 0.0; Z: -24.874),
    (X: -45.792; Y: 0.0; Z: -22.332),
    (X: -47.042; Y: 0.0; Z: -21.186),
    (X: -48.561; Y: 0.0; Z: -19.855),
    (X: -49.663; Y: 0.0; Z: -18.327),
    (X: -50.914; Y: 0.0; Z: -17.287),
    (X: -52.839; Y: 0.0; Z: -15.594),
    (X: -54.475; Y: 0.0; Z: -13.671),
    (X: -58.134; Y: 0.0; Z: -10.263),
    (X: -58.904; Y: 0.0; Z: -9.725),
    (X: -59.693; Y: 0.0; Z: -8.801),
    (X: -62.248; Y: 0.0; Z: -6.955),
    (X: -64.177; Y: 0.0; Z: -5.914),
    (X: -64.041; Y: 0.0; Z: -4.740),
    (X: -63.068; Y: 0.0; Z: -1.760),
    (X: -62.227; Y: 0.0; Z: 0.043),
    (X: -60.224; Y: 0.0; Z: 2.737),
    (X: -58.375; Y: 0.0; Z: 4.966),
    (X: -57.413; Y: 0.0; Z: 5.736),
    (X: -56.469; Y: 0.0; Z: 6.410),
    (X: -55.412; Y: 0.0; Z: 7.350),
    (X: -53.328; Y: 0.0; Z: 5.341),
    (X: -51.497; Y: 0.0; Z: 3.899),
    (X: -50.074; Y: 0.0; Z: 2.841),
    (X: -48.428; Y: 0.0; Z: 1.487),
    (X: -46.466; Y: 0.0; Z: 0.141),
    (X: -43.701; Y: 0.0; Z: -1.597),
    (X: -40.532; Y: 0.0; Z: -3.305),
    (X: -37.570; Y: 0.0; Z: -4.420),
    (X: -34.704; Y: 0.0; Z: -4.959),
    (X: -32.494; Y: 0.0; Z: -5.155),
    (X: -31.359; Y: 0.0; Z: -5.155),
    (X: -30.139; Y: 0.0; Z: -5.268));
  Quarter2Border: array[0..40] of TVector3D = (
    (X: -40.781; Y: 0.0; Z: 10.075),
    (X: -30.139; Y: 0.0; Z: -5.268),
    (X: -29.033; Y: 0.0; Z: -1.087),
    (X: -28.995; Y: 0.0; Z: 0.568),
    (X: -29.263; Y: 0.0; Z: 2.298),
    (X: -29.784; Y: 0.0; Z: 4.914),
    (X: -30.241; Y: 0.0; Z: 6.590),
    (X: -30.876; Y: 0.0; Z: 8.091),
    (X: -31.992; Y: 0.0; Z: 11.603),
    (X: -32.634; Y: 0.0; Z: 14.363),
    (X: -33.172; Y: 0.0; Z: 16.640),
    (X: -33.307; Y: 0.0; Z: 17.506),
    (X: -33.519; Y: 0.0; Z: 18.391),
    (X: -33.684; Y: 0.0; Z: 19.433),
    (X: -33.619; Y: 0.0; Z: 20.910),
    (X: -33.407; Y: 0.0; Z: 22.045),
    (X: -33.119; Y: 0.0; Z: 23.968),
    (X: -33.299; Y: 0.0; Z: 24.103),
    (X: -36.180; Y: 0.0; Z: 24.049),
    (X: -38.219; Y: 0.0; Z: 23.664),
    (X: -40.758; Y: 0.0; Z: 22.953),
    (X: -42.374; Y: 0.0; Z: 22.203),
    (X: -42.970; Y: 0.0; Z: 21.664),
    (X: -44.954; Y: 0.0; Z: 19.297),
    (X: -47.362; Y: 0.0; Z: 17.159),
    (X: -49.631; Y: 0.0; Z: 14.406),
    (X: -51.729; Y: 0.0; Z: 12.033),
    (X: -53.504; Y: 0.0; Z: 9.644),
    (X: -55.412; Y: 0.0; Z: 7.350),
    (X: -53.328; Y: 0.0; Z: 5.341),
    (X: -51.497; Y: 0.0; Z: 3.899),
    (X: -50.074; Y: 0.0; Z: 2.841),
    (X: -48.428; Y: 0.0; Z: 1.487),
    (X: -46.466; Y: 0.0; Z: 0.141),
    (X: -43.701; Y: 0.0; Z: -1.597),
    (X: -40.532; Y: 0.0; Z: -3.305),
    (X: -37.570; Y: 0.0; Z: -4.420),
    (X: -34.704; Y: 0.0; Z: -4.959),
    (X: -32.494; Y: 0.0; Z: -5.155),
    (X: -31.359; Y: 0.0; Z: -5.155),
    (X: -30.139; Y: 0.0; Z: -5.268));
  Quarter3Border: array[0..43] of TVector3D = (
    (X: -21.214; Y: 0.0; Z: 23.006),
    (X: -11.275; Y: 0.0; Z: 31.418),
    (X: -12.638; Y: 0.0; Z: 31.983),
    (X: -14.331; Y: 0.0; Z: 32.945),
    (X: -15.678; Y: 0.0; Z: 33.830),
    (X: -17.504; Y: 0.0; Z: 35.060),
    (X: -21.558; Y: 0.0; Z: 37.649),
    (X: -23.193; Y: 0.0; Z: 38.399),
    (X: -25.059; Y: 0.0; Z: 39.303),
    (X: -25.463; Y: 0.0; Z: 39.360),
    (X: -26.246; Y: 0.0; Z: 37.922),
    (X: -27.177; Y: 0.0; Z: 36.384),
    (X: -27.908; Y: 0.0; Z: 34.922),
    (X: -28.558; Y: 0.0; Z: 33.176),
    (X: -29.255; Y: 0.0; Z: 29.989),
    (X: -30.365; Y: 0.0; Z: 25.535),
    (X: -30.611; Y: 0.0; Z: 24.180),
    (X: -30.650; Y: 0.0; Z: 23.333),
    (X: -30.862; Y: 0.0; Z: 21.691),
    (X: -30.919; Y: 0.0; Z: 19.978),
    (X: -30.862; Y: 0.0; Z: 18.410),
    (X: -30.457; Y: 0.0; Z: 16.408),
    (X: -30.234; Y: 0.0; Z: 15.609),
    (X: -30.003; Y: 0.0; Z: 14.434),
    (X: -29.600; Y: 0.0; Z: 11.803),
    (X: -29.044; Y: 0.0; Z: 9.990),
    (X: -28.209; Y: 0.0; Z: 9.802),
    (X: -27.574; Y: 0.0; Z: 9.763),
    (X: -26.939; Y: 0.0; Z: 9.629),
    (X: -26.073; Y: 0.0; Z: 9.571),
    (X: -20.780; Y: 0.0; Z: 9.552),
    (X: -20.236; Y: 0.0; Z: 9.593),
    (X: -18.003; Y: 0.0; Z: 9.844),
    (X: -15.568; Y: 0.0; Z: 10.229),
    (X: -14.452; Y: 0.0; Z: 10.286),
    (X: -12.098; Y: 0.0; Z: 10.464),
    (X: -12.498; Y: 0.0; Z: 12.271),
    (X: -12.807; Y: 0.0; Z: 15.044),
    (X: -12.906; Y: 0.0; Z: 16.542),
    (X: -13.138; Y: 0.0; Z: 19.660),
    (X: -13.121; Y: 0.0; Z: 22.300),
    (X: -12.513; Y: 0.0; Z: 27.029),
    (X: -11.976; Y: 0.0; Z: 29.434),
    (X: -11.275; Y: 0.0; Z: 31.418));
  Quarter4Border: array[0..30] of TVector3D = (
    (X: -2.680; Y: 0.0; Z: 21.390),
    (X: 5.882; Y: 0.0; Z: 33.537),
    (X: 3.858; Y: 0.0; Z: 32.663),
    (X: 2.780; Y: 0.0; Z: 32.278),
    (X: 0.643; Y: 0.0; Z: 31.316),
    (X: -0.685; Y: 0.0; Z: 31.046),
    (X: -3.011; Y: 0.0; Z: 30.482),
    (X: -4.763; Y: 0.0; Z: 30.309),
    (X: -6.650; Y: 0.0; Z: 30.376),
    (X: -8.151; Y: 0.0; Z: 30.607),
    (X: -9.613; Y: 0.0; Z: 30.876),
    (X: -11.275; Y: 0.0; Z: 31.418),
    (X: -11.976; Y: 0.0; Z: 29.434),
    (X: -12.513; Y: 0.0; Z: 27.029),
    (X: -13.121; Y: 0.0; Z: 22.300),
    (X: -13.138; Y: 0.0; Z: 19.660),
    (X: -12.906; Y: 0.0; Z: 16.542),
    (X: -12.807; Y: 0.0; Z: 15.044),
    (X: -12.498; Y: 0.0; Z: 12.271),
    (X: -12.098; Y: 0.0; Z: 10.464),
    (X: -2.727; Y: 0.0; Z: 10.591),
    (X: -0.004; Y: 0.0; Z: 10.629),
    (X: 2.133; Y: 0.0; Z: 10.764),
    (X: 5.898; Y: 0.0; Z: 11.393),
    (X: 6.033; Y: 0.0; Z: 12.579),
    (X: 6.074; Y: 0.0; Z: 15.624),
    (X: 6.430; Y: 0.0; Z: 23.893),
    (X: 6.392; Y: 0.0; Z: 26.885),
    (X: 6.315; Y: 0.0; Z: 29.671),
    (X: 6.200; Y: 0.0; Z: 31.210),
    (X: 5.882; Y: 0.0; Z: 33.537));
  Quarter5Border: array[0..39] of TVector3D = (
    (X: 16.605; Y: 0.0; Z: 24.761),
    (X: 21.115; Y: 0.0; Z: 12.884),
    (X: 22.189; Y: 0.0; Z: 14.682),
    (X: 22.670; Y: 0.0; Z: 16.145),
    (X: 23.227; Y: 0.0; Z: 17.560),
    (X: 24.654; Y: 0.0; Z: 21.666),
    (X: 25.020; Y: 0.0; Z: 22.898),
    (X: 25.231; Y: 0.0; Z: 24.245),
    (X: 25.289; Y: 0.0; Z: 25.476),
    (X: 25.585; Y: 0.0; Z: 27.334),
    (X: 25.643; Y: 0.0; Z: 28.175),
    (X: 25.566; Y: 0.0; Z: 29.599),
    (X: 25.582; Y: 0.0; Z: 31.502),
    (X: 25.428; Y: 0.0; Z: 32.522),
    (X: 25.331; Y: 0.0; Z: 34.138),
    (X: 25.374; Y: 0.0; Z: 35.995),
    (X: 25.508; Y: 0.0; Z: 37.438),
    (X: 24.266; Y: 0.0; Z: 37.638),
    (X: 22.380; Y: 0.0; Z: 37.714),
    (X: 20.610; Y: 0.0; Z: 37.503),
    (X: 15.236; Y: 0.0; Z: 36.991),
    (X: 12.600; Y: 0.0; Z: 36.433),
    (X: 11.069; Y: 0.0; Z: 35.987),
    (X: 9.819; Y: 0.0; Z: 35.507),
    (X: 8.915; Y: 0.0; Z: 35.084),
    (X: 8.126; Y: 0.0; Z: 34.738),
    (X: 7.106; Y: 0.0; Z: 34.161),
    (X: 5.882; Y: 0.0; Z: 33.537),
    (X: 6.200; Y: 0.0; Z: 31.210),
    (X: 6.315; Y: 0.0; Z: 29.671),
    (X: 6.392; Y: 0.0; Z: 26.885),
    (X: 6.430; Y: 0.0; Z: 23.893),
    (X: 6.074; Y: 0.0; Z: 15.624),
    (X: 6.033; Y: 0.0; Z: 12.579),
    (X: 5.898; Y: 0.0; Z: 11.393),
    (X: 12.347; Y: 0.0; Z: 12.576),
    (X: 15.262; Y: 0.0; Z: 13.052),
    (X: 17.707; Y: 0.0; Z: 13.225),
    (X: 19.708; Y: 0.0; Z: 13.128),
    (X: 21.115; Y: 0.0; Z: 12.884));
  Quarter6Border: array[0..32] of TVector3D = (
    (X: 36.917; Y: 0.0; Z: 14.512),
    (X: 48.726; Y: 0.0; Z: 11.352),
    (X: 49.728; Y: 0.0; Z: 13.117),
    (X: 50.343; Y: 0.0; Z: 14.118),
    (X: 51.612; Y: 0.0; Z: 16.984),
    (X: 50.143; Y: 0.0; Z: 18.557),
    (X: 49.425; Y: 0.0; Z: 19.164),
    (X: 47.135; Y: 0.0; Z: 20.664),
    (X: 45.711; Y: 0.0; Z: 21.434),
    (X: 42.209; Y: 0.0; Z: 23.399),
    (X: 38.728; Y: 0.0; Z: 25.092),
    (X: 32.816; Y: 0.0; Z: 26.474),
    (X: 30.217; Y: 0.0; Z: 26.898),
    (X: 28.235; Y: 0.0; Z: 26.879),
    (X: 28.040; Y: 0.0; Z: 25.152),
    (X: 27.538; Y: 0.0; Z: 22.572),
    (X: 26.871; Y: 0.0; Z: 20.210),
    (X: 25.944; Y: 0.0; Z: 17.209),
    (X: 25.515; Y: 0.0; Z: 16.080),
    (X: 23.935; Y: 0.0; Z: 13.097),
    (X: 23.115; Y: 0.0; Z: 11.696),
    (X: 23.591; Y: 0.0; Z: 11.547),
    (X: 26.179; Y: 0.0; Z: 9.787),
    (X: 28.484; Y: 0.0; Z: 8.032),
    (X: 31.323; Y: 0.0; Z: 5.660),
    (X: 33.291; Y: 0.0; Z: 4.517),
    (X: 36.171; Y: 0.0; Z: 3.861),
    (X: 39.008; Y: 0.0; Z: 3.734),
    (X: 41.889; Y: 0.0; Z: 4.546),
    (X: 43.315; Y: 0.0; Z: 5.336),
    (X: 44.841; Y: 0.0; Z: 6.544),
    (X: 46.557; Y: 0.0; Z: 8.386),
    (X: 48.726; Y: 0.0; Z: 11.352));
  Quarter7Border: array[0..37] of TVector3D = (
    (X: 48.688; Y: 0.0; Z: -6.293),
    (X: 42.410; Y: 0.0; Z: -19.408),
    (X: 43.349; Y: 0.0; Z: -19.902),
    (X: 45.427; Y: 0.0; Z: -20.036),
    (X: 48.084; Y: 0.0; Z: -21.346),
    (X: 49.355; Y: 0.0; Z: -21.731),
    (X: 50.395; Y: 0.0; Z: -20.922),
    (X: 51.512; Y: 0.0; Z: -19.882),
    (X: 52.397; Y: 0.0; Z: -19.151),
    (X: 52.938; Y: 0.0; Z: -18.203),
    (X: 54.017; Y: 0.0; Z: -16.682),
    (X: 55.750; Y: 0.0; Z: -14.643),
    (X: 57.583; Y: 0.0; Z: -12.764),
    (X: 58.372; Y: 0.0; Z: -11.493),
    (X: 58.696; Y: 0.0; Z: -9.755),
    (X: 58.715; Y: 0.0; Z: -7.966),
    (X: 58.376; Y: 0.0; Z: -6.592),
    (X: 57.934; Y: 0.0; Z: -5.206),
    (X: 56.991; Y: 0.0; Z: -3.378),
    (X: 56.472; Y: 0.0; Z: -1.820),
    (X: 55.096; Y: 0.0; Z: 1.739),
    (X: 54.607; Y: 0.0; Z: 4.450),
    (X: 54.146; Y: 0.0; Z: 5.286),
    (X: 52.869; Y: 0.0; Z: 6.667),
    (X: 51.137; Y: 0.0; Z: 8.380),
    (X: 49.829; Y: 0.0; Z: 9.938),
    (X: 48.726; Y: 0.0; Z: 11.352),
    (X: 46.557; Y: 0.0; Z: 8.386),
    (X: 44.841; Y: 0.0; Z: 6.544),
    (X: 43.315; Y: 0.0; Z: 5.336),
    (X: 41.889; Y: 0.0; Z: 4.546),
    (X: 40.964; Y: 0.0; Z: 0.917),
    (X: 40.491; Y: 0.0; Z: -3.832),
    (X: 40.710; Y: 0.0; Z: -13.761),
    (X: 40.891; Y: 0.0; Z: -16.137),
    (X: 41.276; Y: 0.0; Z: -17.542),
    (X: 41.931; Y: 0.0; Z: -18.910),
    (X: 42.410; Y: 0.0; Z: -19.408));
  Quarter8Border: array[0..51] of TVector3D = (
    (X: 33.166; Y: 0.0; Z: -34.638),
    (X: 42.012; Y: 0.0; Z: -23.613),
    (X: 42.406; Y: 0.0; Z: -26.512),
    (X: 42.468; Y: 0.0; Z: -28.438),
    (X: 43.142; Y: 0.0; Z: -28.592),
    (X: 43.219; Y: 0.0; Z: -29.112),
    (X: 45.279; Y: 0.0; Z: -29.594),
    (X: 46.025; Y: 0.0; Z: -30.595),
    (X: 47.044; Y: 0.0; Z: -31.654),
    (X: 48.200; Y: 0.0; Z: -32.424),
    (X: 46.890; Y: 0.0; Z: -33.118),
    (X: 45.754; Y: 0.0; Z: -34.101),
    (X: 43.886; Y: 0.0; Z: -35.720),
    (X: 41.787; Y: 0.0; Z: -37.277),
    (X: 39.880; Y: 0.0; Z: -38.491),
    (X: 36.534; Y: 0.0; Z: -40.098),
    (X: 35.179; Y: 0.0; Z: -40.501),
    (X: 32.467; Y: 0.0; Z: -40.428),
    (X: 29.474; Y: 0.0; Z: -40.501),
    (X: 27.548; Y: 0.0; Z: -40.784),
    (X: 24.967; Y: 0.0; Z: -41.324),
    (X: 22.964; Y: 0.0; Z: -40.707),
    (X: 20.152; Y: 0.0; Z: -40.514),
    (X: 17.935; Y: 0.0; Z: -39.549),
    (X: 16.362; Y: 0.0; Z: -38.523),
    (X: 14.789; Y: 0.0; Z: -37.681),
    (X: 14.167; Y: 0.0; Z: -37.132),
    (X: 13.144; Y: 0.0; Z: -35.521),
    (X: 12.779; Y: 0.0; Z: -34.606),
    (X: 12.557; Y: 0.0; Z: -33.448),
    (X: 14.316; Y: 0.0; Z: -33.330),
    (X: 16.492; Y: 0.0; Z: -32.887),
    (X: 17.050; Y: 0.0; Z: -32.636),
    (X: 18.225; Y: 0.0; Z: -32.540),
    (X: 19.400; Y: 0.0; Z: -32.309),
    (X: 20.112; Y: 0.0; Z: -32.212),
    (X: 21.710; Y: 0.0; Z: -31.827),
    (X: 24.496; Y: 0.0; Z: -31.269),
    (X: 25.651; Y: 0.0; Z: -30.749),
    (X: 26.536; Y: 0.0; Z: -29.998),
    (X: 27.287; Y: 0.0; Z: -28.978),
    (X: 27.824; Y: 0.0; Z: -27.786),
    (X: 28.150; Y: 0.0; Z: -26.305),
    (X: 28.327; Y: 0.0; Z: -24.699),
    (X: 28.904; Y: 0.0; Z: -21.255),
    (X: 29.388; Y: 0.0; Z: -19.564),
    (X: 30.447; Y: 0.0; Z: -19.713),
    (X: 34.238; Y: 0.0; Z: -19.713),
    (X: 35.334; Y: 0.0; Z: -19.867),
    (X: 36.431; Y: 0.0; Z: -20.078),
    (X: 38.480; Y: 0.0; Z: -21.032),
    (X: 42.012; Y: 0.0; Z: -23.613));
  Quarter9Border: array[0..45] of TVector3D = (
    (X: 1.520; Y: 0.0; Z: -31.379),
    (X: 10.511; Y: 0.0; Z: -17.263),
    (X: 10.055; Y: 0.0; Z: -19.443),
    (X: 9.844; Y: 0.0; Z: -20.907),
    (X: 9.432; Y: 0.0; Z: -23.657),
    (X: 9.373; Y: 0.0; Z: -24.640),
    (X: 9.431; Y: 0.0; Z: -25.948),
    (X: 9.470; Y: 0.0; Z: -27.199),
    (X: 9.724; Y: 0.0; Z: -28.632),
    (X: 10.282; Y: 0.0; Z: -31.769),
    (X: 10.266; Y: 0.0; Z: -33.349),
    (X: 10.594; Y: 0.0; Z: -34.987),
    (X: 11.078; Y: 0.0; Z: -36.160),
    (X: 11.787; Y: 0.0; Z: -37.949),
    (X: 11.684; Y: 0.0; Z: -38.609),
    (X: 10.964; Y: 0.0; Z: -39.134),
    (X: 10.050; Y: 0.0; Z: -39.463),
    (X: 9.079; Y: 0.0; Z: -39.567),
    (X: 7.033; Y: 0.0; Z: -40.122),
    (X: 6.272; Y: 0.0; Z: -40.172),
    (X: 5.321; Y: 0.0; Z: -40.465),
    (X: 2.246; Y: 0.0; Z: -40.282),
    (X: 0.343; Y: 0.0; Z: -40.318),
    (X: -1.011; Y: 0.0; Z: -40.098),
    (X: -4.488; Y: 0.0; Z: -39.622),
    (X: -5.907; Y: 0.0; Z: -38.816),
    (X: -6.566; Y: 0.0; Z: -38.194),
    (X: -7.554; Y: 0.0; Z: -37.608),
    (X: -8.505; Y: 0.0; Z: -36.876),
    (X: -9.942; Y: 0.0; Z: -36.296),
    (X: -9.313; Y: 0.0; Z: -35.126),
    (X: -8.972; Y: 0.0; Z: -33.253),
    (X: -8.934; Y: 0.0; Z: -31.153),
    (X: -9.512; Y: 0.0; Z: -28.016),
    (X: -10.270; Y: 0.0; Z: -24.863),
    (X: -10.673; Y: 0.0; Z: -22.847),
    (X: -11.153; Y: 0.0; Z: -21.033),
    (X: -5.971; Y: 0.0; Z: -21.078),
    (X: -3.873; Y: 0.0; Z: -20.963),
    (X: -2.855; Y: 0.0; Z: -20.824),
    (X: 0.415; Y: 0.0; Z: -20.094),
    (X: 4.090; Y: 0.0; Z: -18.924),
    (X: 7.804; Y: 0.0; Z: -17.597),
    (X: 8.992; Y: 0.0; Z: -17.320),
    (X: 9.858; Y: 0.0; Z: -17.224),
    (X: 10.511; Y: 0.0; Z: -17.263));
  Quarter10Border: array[0..39] of TVector3D = (
    (X: -18.382; Y: 0.0; Z: -22.238),
    (X: -9.942; Y: 0.0; Z: -36.296),
    (X: -11.572; Y: 0.0; Z: -35.915),
    (X: -12.566; Y: 0.0; Z: -35.615),
    (X: -13.560; Y: 0.0; Z: -35.453),
    (X: -15.941; Y: 0.0; Z: -34.412),
    (X: -19.730; Y: 0.0; Z: -33.002),
    (X: -20.472; Y: 0.0; Z: -32.794),
    (X: -21.719; Y: 0.0; Z: -32.077),
    (X: -23.636; Y: 0.0; Z: -30.529),
    (X: -25.796; Y: 0.0; Z: -27.945),
    (X: -26.473; Y: 0.0; Z: -26.723),
    (X: -27.189; Y: 0.0; Z: -24.601),
    (X: -27.327; Y: 0.0; Z: -24.055),
    (X: -28.230; Y: 0.0; Z: -21.802),
    (X: -28.557; Y: 0.0; Z: -20.350),
    (X: -28.690; Y: 0.0; Z: -18.444),
    (X: -28.882; Y: 0.0; Z: -17.559),
    (X: -28.892; Y: 0.0; Z: -16.132),
    (X: -28.267; Y: 0.0; Z: -15.440),
    (X: -26.514; Y: 0.0; Z: -13.920),
    (X: -25.090; Y: 0.0; Z: -12.921),
    (X: -23.724; Y: 0.0; Z: -12.171),
    (X: -22.627; Y: 0.0; Z: -11.844),
    (X: -19.916; Y: 0.0; Z: -11.402),
    (X: -15.981; Y: 0.0; Z: -11.302),
    (X: -13.762; Y: 0.0; Z: -11.586),
    (X: -13.050; Y: 0.0; Z: -11.605),
    (X: -12.439; Y: 0.0; Z: -11.767),
    (X: -11.912; Y: 0.0; Z: -16.954),
    (X: -11.601; Y: 0.0; Z: -18.460),
    (X: -11.447; Y: 0.0; Z: -19.807),
    (X: -11.153; Y: 0.0; Z: -21.033),
    (X: -10.673; Y: 0.0; Z: -22.847),
    (X: -10.270; Y: 0.0; Z: -24.863),
    (X: -9.512; Y: 0.0; Z: -28.016),
    (X: -8.934; Y: 0.0; Z: -31.153),
    (X: -8.972; Y: 0.0; Z: -33.253),
    (X: -9.313; Y: 0.0; Z: -35.126),
    (X: -9.942; Y: 0.0; Z: -36.296));
  Quarter11Border: array[0..52] of TVector3D = (
    (X: -15.811; Y: 0.0; Z: 6.550),
    (X: -28.892; Y: 0.0; Z: -16.132),
    (X: -28.931; Y: 0.0; Z: -12.971),
    (X: -28.661; Y: 0.0; Z: -10.048),
    (X: -28.085; Y: 0.0; Z: -7.475),
    (X: -27.311; Y: 0.0; Z: -3.209),
    (X: -27.211; Y: 0.0; Z: -1.957),
    (X: -26.749; Y: 0.0; Z: 0.737),
    (X: -26.780; Y: 0.0; Z: 1.844),
    (X: -26.972; Y: 0.0; Z: 3.595),
    (X: -27.319; Y: 0.0; Z: 4.529),
    (X: -27.627; Y: 0.0; Z: 5.837),
    (X: -28.069; Y: 0.0; Z: 6.933),
    (X: -28.573; Y: 0.0; Z: 7.964),
    (X: -29.044; Y: 0.0; Z: 9.990),
    (X: -28.209; Y: 0.0; Z: 9.802),
    (X: -27.574; Y: 0.0; Z: 9.763),
    (X: -26.939; Y: 0.0; Z: 9.629),
    (X: -26.073; Y: 0.0; Z: 9.571),
    (X: -20.780; Y: 0.0; Z: 9.552),
    (X: -20.236; Y: 0.0; Z: 9.593),
    (X: -18.003; Y: 0.0; Z: 9.844),
    (X: -15.568; Y: 0.0; Z: 10.229),
    (X: -14.452; Y: 0.0; Z: 10.286),
    (X: -12.098; Y: 0.0; Z: 10.464),
    (X: -2.727; Y: 0.0; Z: 10.591),
    (X: -2.182; Y: 0.0; Z: 9.537),
    (X: -1.605; Y: 0.0; Z: 8.287),
    (X: -0.931; Y: 0.0; Z: 6.439),
    (X: -0.324; Y: 0.0; Z: 4.169),
    (X: -1.927; Y: 0.0; Z: 4.164),
    (X: -3.870; Y: 0.0; Z: 3.741),
    (X: -5.505; Y: 0.0; Z: 3.164),
    (X: -7.217; Y: 0.0; Z: 2.280),
    (X: -8.661; Y: 0.0; Z: 1.222),
    (X: -9.979; Y: 0.0; Z: -0.055),
    (X: -10.981; Y: 0.0; Z: -1.575),
    (X: -11.471; Y: 0.0; Z: -2.540),
    (X: -11.895; Y: 0.0; Z: -3.867),
    (X: -12.241; Y: 0.0; Z: -5.832),
    (X: -12.322; Y: 0.0; Z: -7.475),
    (X: -12.432; Y: 0.0; Z: -9.417),
    (X: -12.439; Y: 0.0; Z: -11.767),
    (X: -13.050; Y: 0.0; Z: -11.605),
    (X: -13.762; Y: 0.0; Z: -11.586),
    (X: -15.981; Y: 0.0; Z: -11.302),
    (X: -19.916; Y: 0.0; Z: -11.402),
    (X: -22.627; Y: 0.0; Z: -11.844),
    (X: -23.724; Y: 0.0; Z: -12.171),
    (X: -25.090; Y: 0.0; Z: -12.921),
    (X: -26.514; Y: 0.0; Z: -13.920),
    (X: -28.267; Y: 0.0; Z: -15.440),
    (X: -28.892; Y: 0.0; Z: -16.132));
  Quarter12Border: array[0..37] of TVector3D = (
    (X: 9.153; Y: 0.0; Z: 2.449),
    (X: 21.115; Y: 0.0; Z: 12.884),
    (X: 20.327; Y: 0.0; Z: 11.745),
    (X: 19.327; Y: 0.0; Z: 9.570),
    (X: 18.485; Y: 0.0; Z: 7.498),
    (X: 17.811; Y: 0.0; Z: 4.765),
    (X: 16.629; Y: 0.0; Z: 0.822),
    (X: 16.042; Y: 0.0; Z: -1.974),
    (X: 15.927; Y: 0.0; Z: -3.140),
    (X: 15.561; Y: 0.0; Z: -4.700),
    (X: 14.980; Y: 0.0; Z: -6.365),
    (X: 13.185; Y: 0.0; Z: -9.167),
    (X: 12.550; Y: 0.0; Z: -10.399),
    (X: 12.257; Y: 0.0; Z: -11.213),
    (X: 10.853; Y: 0.0; Z: -11.603),
    (X: 8.466; Y: 0.0; Z: -11.507),
    (X: 5.944; Y: 0.0; Z: -10.891),
    (X: 4.886; Y: 0.0; Z: -10.256),
    (X: 3.694; Y: 0.0; Z: -9.294),
    (X: 3.063; Y: 0.0; Z: -8.601),
    (X: 2.601; Y: 0.0; Z: -7.869),
    (X: 2.217; Y: 0.0; Z: -6.733),
    (X: 0.807; Y: 0.0; Z: -1.171),
    (X: 0.386; Y: 0.0; Z: 1.506),
    (X: -0.037; Y: 0.0; Z: 2.814),
    (X: -0.324; Y: 0.0; Z: 4.169),
    (X: -0.931; Y: 0.0; Z: 6.439),
    (X: -1.605; Y: 0.0; Z: 8.287),
    (X: -2.182; Y: 0.0; Z: 9.537),
    (X: -2.727; Y: 0.0; Z: 10.591),
    (X: -0.004; Y: 0.0; Z: 10.629),
    (X: 2.133; Y: 0.0; Z: 10.764),
    (X: 5.898; Y: 0.0; Z: 11.393),
    (X: 12.347; Y: 0.0; Z: 12.576),
    (X: 15.262; Y: 0.0; Z: 13.052),
    (X: 17.707; Y: 0.0; Z: 13.225),
    (X: 19.708; Y: 0.0; Z: 13.128),
    (X: 21.115; Y: 0.0; Z: 12.884));
  Quarter13Border: array[0..41] of TVector3D = (
    (X: 32.883; Y: 0.0; Z: -11.450),
    (X: 42.410; Y: 0.0; Z: -19.408),
    (X: 41.585; Y: 0.0; Z: -20.745),
    (X: 41.734; Y: 0.0; Z: -22.650),
    (X: 42.012; Y: 0.0; Z: -23.613),
    (X: 38.480; Y: 0.0; Z: -21.032),
    (X: 36.431; Y: 0.0; Z: -20.078),
    (X: 35.334; Y: 0.0; Z: -19.867),
    (X: 34.238; Y: 0.0; Z: -19.713),
    (X: 30.447; Y: 0.0; Z: -19.713),
    (X: 29.388; Y: 0.0; Z: -19.564),
    (X: 28.851; Y: 0.0; Z: -18.107),
    (X: 28.139; Y: 0.0; Z: -14.963),
    (X: 27.532; Y: 0.0; Z: -13.033),
    (X: 26.723; Y: 0.0; Z: -11.205),
    (X: 25.651; Y: 0.0; Z: -9.524),
    (X: 24.636; Y: 0.0; Z: -8.486),
    (X: 23.212; Y: 0.0; Z: -7.313),
    (X: 21.230; Y: 0.0; Z: -6.025),
    (X: 18.279; Y: 0.0; Z: -4.482),
    (X: 18.702; Y: 0.0; Z: -2.359),
    (X: 19.189; Y: 0.0; Z: 0.324),
    (X: 19.518; Y: 0.0; Z: 2.040),
    (X: 20.577; Y: 0.0; Z: 5.214),
    (X: 20.987; Y: 0.0; Z: 6.117),
    (X: 22.277; Y: 0.0; Z: 10.156),
    (X: 23.115; Y: 0.0; Z: 11.696),
    (X: 23.591; Y: 0.0; Z: 11.547),
    (X: 26.179; Y: 0.0; Z: 9.787),
    (X: 28.484; Y: 0.0; Z: 8.032),
    (X: 31.323; Y: 0.0; Z: 5.660),
    (X: 33.291; Y: 0.0; Z: 4.517),
    (X: 36.171; Y: 0.0; Z: 3.861),
    (X: 39.008; Y: 0.0; Z: 3.734),
    (X: 41.889; Y: 0.0; Z: 4.546),
    (X: 40.964; Y: 0.0; Z: 0.917),
    (X: 40.491; Y: 0.0; Z: -3.832),
    (X: 40.710; Y: 0.0; Z: -13.761),
    (X: 40.891; Y: 0.0; Z: -16.137),
    (X: 41.276; Y: 0.0; Z: -17.542),
    (X: 41.931; Y: 0.0; Z: -18.910),
    (X: 42.410; Y: 0.0; Z: -19.408));
  Quarter14Border: array[0..41] of TVector3D = (
    (X: 20.840; Y: 0.0; Z: -20.102),
    (X: 12.557; Y: 0.0; Z: -33.448),
    (X: 12.185; Y: 0.0; Z: -31.423),
    (X: 11.839; Y: 0.0; Z: -28.594),
    (X: 11.589; Y: 0.0; Z: -25.556),
    (X: 11.620; Y: 0.0; Z: -24.748),
    (X: 11.735; Y: 0.0; Z: -23.940),
    (X: 12.284; Y: 0.0; Z: -21.229),
    (X: 12.631; Y: 0.0; Z: -19.286),
    (X: 12.861; Y: 0.0; Z: -16.820),
    (X: 13.752; Y: 0.0; Z: -14.136),
    (X: 14.287; Y: 0.0; Z: -12.190),
    (X: 14.898; Y: 0.0; Z: -10.717),
    (X: 15.823; Y: 0.0; Z: -9.041),
    (X: 17.018; Y: 0.0; Z: -7.213),
    (X: 17.865; Y: 0.0; Z: -5.732),
    (X: 18.279; Y: 0.0; Z: -4.482),
    (X: 21.230; Y: 0.0; Z: -6.025),
    (X: 23.212; Y: 0.0; Z: -7.313),
    (X: 24.636; Y: 0.0; Z: -8.486),
    (X: 25.651; Y: 0.0; Z: -9.524),
    (X: 26.723; Y: 0.0; Z: -11.205),
    (X: 27.532; Y: 0.0; Z: -13.033),
    (X: 28.139; Y: 0.0; Z: -14.963),
    (X: 28.851; Y: 0.0; Z: -18.107),
    (X: 29.388; Y: 0.0; Z: -19.564),
    (X: 28.904; Y: 0.0; Z: -21.255),
    (X: 28.327; Y: 0.0; Z: -24.699),
    (X: 28.150; Y: 0.0; Z: -26.305),
    (X: 27.824; Y: 0.0; Z: -27.786),
    (X: 27.287; Y: 0.0; Z: -28.978),
    (X: 26.536; Y: 0.0; Z: -29.998),
    (X: 25.651; Y: 0.0; Z: -30.749),
    (X: 24.496; Y: 0.0; Z: -31.269),
    (X: 21.710; Y: 0.0; Z: -31.827),
    (X: 20.112; Y: 0.0; Z: -32.212),
    (X: 19.400; Y: 0.0; Z: -32.309),
    (X: 18.225; Y: 0.0; Z: -32.540),
    (X: 17.050; Y: 0.0; Z: -32.636),
    (X: 16.492; Y: 0.0; Z: -32.887),
    (X: 14.316; Y: 0.0; Z: -33.330),
    (X: 12.557; Y: 0.0; Z: -33.448));
  Quarter15Border: array[0..42] of TVector3D = (
    (X: -0.792; Y: 0.0; Z: -16.000),
    (X: 12.257; Y: 0.0; Z: -11.213),
    (X: 11.599; Y: 0.0; Z: -13.753),
    (X: 11.099; Y: 0.0; Z: -15.563),
    (X: 10.511; Y: 0.0; Z: -17.263),
    (X: 9.858; Y: 0.0; Z: -17.224),
    (X: 8.992; Y: 0.0; Z: -17.320),
    (X: 7.804; Y: 0.0; Z: -17.597),
    (X: 4.090; Y: 0.0; Z: -18.924),
    (X: 0.415; Y: 0.0; Z: -20.094),
    (X: -2.855; Y: 0.0; Z: -20.824),
    (X: -3.873; Y: 0.0; Z: -20.963),
    (X: -5.971; Y: 0.0; Z: -21.078),
    (X: -11.153; Y: 0.0; Z: -21.033),
    (X: -11.447; Y: 0.0; Z: -19.807),
    (X: -11.601; Y: 0.0; Z: -18.460),
    (X: -11.912; Y: 0.0; Z: -16.954),
    (X: -12.439; Y: 0.0; Z: -11.767),
    (X: -12.432; Y: 0.0; Z: -9.417),
    (X: -12.322; Y: 0.0; Z: -7.475),
    (X: -12.241; Y: 0.0; Z: -5.832),
    (X: -11.895; Y: 0.0; Z: -3.867),
    (X: -11.471; Y: 0.0; Z: -2.540),
    (X: -10.981; Y: 0.0; Z: -1.575),
    (X: -9.979; Y: 0.0; Z: -0.055),
    (X: -8.661; Y: 0.0; Z: 1.222),
    (X: -7.217; Y: 0.0; Z: 2.280),
    (X: -5.505; Y: 0.0; Z: 3.164),
    (X: -3.870; Y: 0.0; Z: 3.741),
    (X: -1.927; Y: 0.0; Z: 4.164),
    (X: -0.324; Y: 0.0; Z: 4.169),
    (X: -0.037; Y: 0.0; Z: 2.814),
    (X: 0.386; Y: 0.0; Z: 1.506),
    (X: 0.807; Y: 0.0; Z: -1.171),
    (X: 2.217; Y: 0.0; Z: -6.733),
    (X: 2.601; Y: 0.0; Z: -7.869),
    (X: 3.063; Y: 0.0; Z: -8.601),
    (X: 3.694; Y: 0.0; Z: -9.294),
    (X: 4.886; Y: 0.0; Z: -10.256),
    (X: 5.944; Y: 0.0; Z: -10.891),
    (X: 8.466; Y: 0.0; Z: -11.507),
    (X: 10.853; Y: 0.0; Z: -11.603),
    (X: 12.257; Y: 0.0; Z: -11.213));
  Quarters: array[0..15] of record
    Name: string;
    Linked: set of TQuarterIndex;
    BorderLength: Integer;
    Border: ^TQuarterBorder;
  end = (
    (Name: '�����'; Linked: [1, 2, 3, 4, 5, 6, 7]; BorderLength: Length(Quarter0Border); Border: @Quarter0Border),
    (Name: '������� ����'; Linked: [0, 2, 11]; BorderLength: Length(Quarter1Border); Border: @Quarter1Border),
    (Name: '�������'; Linked: [0, 1, 3]; BorderLength: Length(Quarter2Border); Border: @Quarter2Border),
    (Name: '�����'; Linked: [0, 2, 4, 11]; BorderLength: Length(Quarter3Border); Border: @Quarter3Border),
    (Name: '�����'; Linked: [0, 3, 5, 11, 12]; BorderLength: Length(Quarter4Border); Border: @Quarter4Border),
    (Name: '������'; Linked: [0, 4, 12]; BorderLength: Length(Quarter5Border); Border: @Quarter5Border),
    (Name: '������'; Linked: [0, 7, 13]; BorderLength: Length(Quarter6Border); Border: @Quarter6Border),
    (Name: '����� ���������'; Linked: [0, 6, 13]; BorderLength: Length(Quarter7Border); Border: @Quarter7Border),
    (Name: '����������'; Linked: [13, 14]; BorderLength: Length(Quarter8Border); Border: @Quarter8Border),
    (Name: '�����'; Linked: [10, 14, 15]; BorderLength: Length(Quarter9Border); Border: @Quarter9Border),
    (Name: '�����'; Linked: [9, 11, 15]; BorderLength: Length(Quarter10Border); Border: @Quarter10Border),
    (Name: '���������'; Linked: [1, 3, 4, 10, 12, 15]; BorderLength: Length(Quarter11Border); Border: @Quarter11Border),
    (Name: '������'; Linked: [4, 5, 11, 13, 15]; BorderLength: Length(Quarter12Border); Border: @Quarter12Border),
    (Name: '��������'; Linked: [6, 7, 8, 12, 14]; BorderLength: Length(Quarter13Border); Border: @Quarter13Border),
    (Name: '����������'; Linked: [8, 9, 13]; BorderLength: Length(Quarter14Border); Border: @Quarter14Border),
    (Name: '���������'; Linked: [9, 10, 11, 12]; BorderLength: Length(Quarter15Border); Border: @Quarter15Border)
  );
  VictoryTracks: array[0..2] of record
    Name: string;
    Track: array[0..7] of TVector3D;
  end = ( //TODO: Fine-tune
    (Name: SBachelor; Track: (
      (X: -58.830; Y: 0.0; Z: 32.669),
      (X: -55.443; Y: 0.0; Z: 32.792),
      (X: -52.057; Y: 0.0; Z: 32.546),
      (X: -48.670; Y: 0.0; Z: 32.669),
      (X: -44.975; Y: 0.0; Z: 32.546),
      (X: -41.589; Y: 0.0; Z: 32.546),
      (X: -38.140; Y: 0.0; Z: 32.546),
      (X: -34.753; Y: 0.0; Z: 32.607))
    ),
    (Name: SHaruspex; Track: (
      (X: -59.012; Y: 0.0; Z: 36.855),
      (X: -55.565; Y: 0.0; Z: 37.101),
      (X: -51.994; Y: 0.0; Z: 36.916),
      (X: -48.547; Y: 0.0; Z: 37.101),
      (X: -45.222; Y: 0.0; Z: 36.978),
      (X: -41.775; Y: 0.0; Z: 36.855),
      (X: -38.204; Y: 0.0; Z: 37.039),
      (X: -34.941; Y: 0.0; Z: 36.978))
    ),
    (Name: SChangeling; Track: (
      (X: -59.071; Y: 0.0; Z: 41.100),
      (X: -55.563; Y: 0.0; Z: 41.161),
      (X: -52.239; Y: 0.0; Z: 41.038),
      (X: -48.854; Y: 0.0; Z: 41.223),
      (X: -45.161; Y: 0.0; Z: 41.100),
      (X: -41.714; Y: 0.0; Z: 41.161),
      (X: -38.206; Y: 0.0; Z: 41.038),
      (X: -34.636; Y: 0.0; Z: 40.977))
    )
  );
  MissionsDeck: TVector3D = (X: -59.070; Y: 0.0; Z: 18.362); //TODO: Fine-tune
  Missions: array[0..14] of TMissionData = ( //TODO: Fine-tune Pos
    (Quarter: 1; Pos: (X: -39.002; Y: 0.0; Z: -14.704); Resources: (rtKey, rtSecret, rtCoin, rtKey)),
    (Quarter: 2; Pos: (X: -40.872; Y: 0.0; Z: 9.659); Resources: (rtKey, rtSecret, rtKey, rtCoin)),
    (Quarter: 3; Pos: (X: -22.503; Y: 0.0; Z: 21.210); Resources: (rtKey, rtKey, rtCoin, rtSecret)),
    (Quarter: 4; Pos: (X: -2.752; Y: 0.0; Z: 21.914); Resources: (rtKey, rtKey, rtCoin, rtSecret)),
    (Quarter: 5; Pos: (X: 15.107; Y: 0.0; Z: 26.512); Resources: (rtKey, rtCoin, rtSecret, rtKey)),
    (Quarter: 6; Pos: (X: 36.795; Y: 0.0; Z: 15.868); Resources: (rtKey, rtCoin, rtKey, rtSecret)),
    (Quarter: 7; Pos: (X: 48.242; Y: 0.0; Z: -4.144); Resources: (rtKey, rtCoin, rtSecret, rtKey)),
    (Quarter: 8; Pos: (X: 34.263; Y: 0.0; Z: -28.924); Resources: (rtKey, rtSecret, rtKey, rtCoin)),
    (Quarter: 9; Pos: (X: 1.078; Y: 0.0; Z: -28.924); Resources: (rtKey, rtKey, rtSecret, rtCoin)),
    (Quarter: 10; Pos: (X: -18.448; Y: 0.0; Z: -20.137); Resources: (rtKey, rtKey, rtCoin, rtSecret)),
    (Quarter: 11; Pos: (X: -20.072; Y: 0.0; Z: 0.257); Resources: (rtKey, rtCoin, rtSecret, rtKey)),
    (Quarter: 12; Pos: (X: 8.263; Y: 0.0; Z: 2.752); Resources: (rtKey, rtSecret, rtKey, rtCoin)),
    (Quarter: 13; Pos: (X: 33.989; Y: 0.0; Z: -4.581); Resources: (rtKey, rtKey, rtSecret, rtCoin)),
    (Quarter: 14; Pos: (X: 21.635; Y: 0.0; Z: -20.424); Resources: (rtKey, rtSecret, rtCoin, rtkey)),
    (Quarter: 15; Pos: (X: -4.331; Y: 0.0; Z: -8.814); Resources: (rtKey, rtCoin, rtKey, rtSecret))
  );
  GraphicsQualityName: array[TGraphicsQuality] of string = ('�����������', '�������', '������������');
  TexFolders: array[TGraphicsQuality] of array[0..4] of record Folder, Postfix: string end = (
    (
      (Folder: 'Cards'; Postfix: '.min'),
      (Folder: 'Chars'; Postfix: '.min'),
      (Folder: 'Chips'; Postfix: '.min'),
      (Folder: 'Docs'; Postfix: '.min'),
      (Folder: 'Map'; Postfix: '.min')
    ),
    (
      (Folder: 'Cards'; Postfix: '.med'),
      (Folder: 'Chars'; Postfix: '.full'),
      (Folder: 'Chips'; Postfix: '.full'),
      (Folder: 'Docs'; Postfix: '.full'),
      (Folder: 'Map'; Postfix: '.med')
    ),
    (
      (Folder: 'Cards'; Postfix: '.full'),
      (Folder: 'Chars'; Postfix: '.full'),
      (Folder: 'Chips'; Postfix: '.full'),
      (Folder: 'Docs'; Postfix: '.full'),
      (Folder: 'Map'; Postfix: '.full')
    ));
  BindCamFwd = 'CamFwd';
  BindCamBwd = 'CamBwd';
  BindCamLeft = 'CamLeft';
  BindCamRight = 'CamRight';
  Bindings: array[0..3] of TBindingRec = (
    (Name: BindCamFwd; Description: '������ ������'; Key: Ord('W')),
    (Name: BindCamBwd; Description: '������ �����'; Key: Ord('S')),
    (Name: BindCamLeft; Description: '������ �����'; Key: Ord('A')),
    (Name: BindCamRight; Description: '������ ������'; Key: Ord('D'))
  );       

function PlayerIndex(const Name: string): Integer;

implementation

function PlayerIndex(const Name: string): Integer;
begin
  for Result := 0 to High(PlayerNames) do
    if PlayerNames[Result] = Name then Exit;
  Result := -1;
end;

end.