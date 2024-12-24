program Coco(Input, Output);

(*----------------------------------------------------------------------
 Преобразования координат
-----------------------------------------------------------------------*)

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Apc.Math,
  Apc.PrecNut,
  Apc.Spheric,
  Apc.Sun,
  Apc.Time;

var
  X, Y, Z, XS, YS, ZS: Double;
  T, TEQX, TEQXN: Double;
  LS, BS, RS: Double;
  A: Double33;
  IsEclipt: Boolean;
  CharMode: Char;

//-----------------------------------------------------------------------
procedure GetEqx(var TEQX: Double);
begin
  Write(' равноденствие (yyyy) ? ');
  Readln(TEQX);
  TEQX := (TEQX - 2000.0) / 100.0;
end;

//-----------------------------------------------------------------------
procedure GetDat(var T: Double);
var
  D, M, Y: integer;
  Hour, JD: Double;
begin
  write(' Дата (год месяц день час) ?      ');
  Readln(Y, M, D, Hour);
  JD := MJD(D, M, Y, Hour) + 2400000.5;
  Writeln;
  Writeln(' JD', JD:13:4);
  Writeln;
  T := (JD - 2451545.0) / 36525.0;
end;

//-----------------------------------------------------------------------
procedure GetInp(var X, Y, Z, TEQX: Double; var IsEclipt: Boolean);
var
  I, D, M: Integer;
  L, B, R, S: Double;
begin

  Writeln;
  Writeln('                Coco: преобразование координат        ');
  Writeln;
  Writeln(' Ввод координат: выберите необходимую систему ');
  Writeln;
  Writeln('  1  эклиптические декартовы  2  эклиптические полярные');
  Writeln('  3  экваториальные декартовы 4  экваториальные полярные');
  Writeln;
  Write('  ');
  Readln(I);
  Writeln;

  case I of
    1:
      begin
        Write(' Координаты (x y z) ?  ');
        Readln(X, Y, Z);
        IsEclipt := True;
      end;
    2:
      begin
        Write(' Координаты (L (o '' ")  B (o '' ")  R) ?  ');
        Read(D, M, S);
        Ddd(D, M, S, L);
        Readln(D, M, S, R);
        Ddd(D, M, S, B);
        Cart(R, B, L, X, Y, Z);
        IsEclipt := True;
      end;
    3:
      begin
        Write(' Координаты (x y z) ?  ');
        Readln(X, Y, Z);
        IsEclipt := False;  // Для экваториальных True
      end;
    4:
      begin
        Write(' Координаты (Ra (h m s)  Dec (o '' ")  R) ?  ');
        Read(D, M, S);
        Ddd(D, M, S, L);
        Readln(D, M, S, R);
        Ddd(D, M, S, B);
        L := L * 15.0;
        Cart(R, B, L, X, Y, Z);
        IsEclipt := False;
      end;
  end; // case
  GetEqx(TEQX); // read equinox
end; // GetInp

//-----------------------------------------------------------------------

procedure Results(X, Y, Z: Double; IsEclipt: Boolean);
var
  L, B, R, S: Double;
  D, M: integer;
begin
  Writeln;
  Writeln(' (x,y,z) = (', X:13:8, ',', Y:13:8, ',', Z:13:8, ')');
  Writeln;

  Polar(X, Y, Z, R, B, L);
  if IsEclipt then
  begin
    Writeln(' ':5, '   o  ''  " ', ' ':8, '   o  ''  " ');
    DMS(L, D, M, S);
    Write(' L = ', D:3, M:3, S:5:1, ' ':3);
    DMS(B, D, M, S);
    Write(' B = ', D:3, M:3, S:5:1, ' ':3);
  end
  else
  begin
    Writeln(' ':5, '   h  m  s ', ' ':10, '   o  ''  " ');
    DMS(L / 15, D, M, S);
    Write(' Ra = ', D:2, M:3, S:5:1, ' ':3);
    DMS(B, D, M, S);
    Write(' Dec = ', D:3, M:3, S:5:1, ' ':3);
  end;

  Writeln(' R = ', R:12:8);
  Writeln;
  Writeln;
end; // Results

//-----------------------------------------------------------------------

begin (* Coco *)
  GetInp(X, Y, Z, TEQX, IsEclipt);    // ввод данных
  Results(X, Y, Z, IsEclipt);         // расчёт результатов
  repeat                              // вывод результатов
    Write(' Комманда (?=Справка): ');
    Readln(CharMode);
    Writeln;

    if CharMode in ['?', 'P', 'p', 'A', 'a', 'E', 'e', 'H', 'h', 'G', 'g'] then
//    if CharInSet('?', 'P', 'p', 'A', 'a', 'E', 'e', 'H', 'h', 'G', 'g') then
      case CharMode of
        '?':
          begin // Подсказка
            Writeln;
            Writeln('   A -> экваториальные     E -> эклиптические    ');
            Writeln('   P -> прецессия          G -> геоцентрические  ');
            Writeln('   H -> гелиоцентрические  S -> STOP             ');
            Writeln;
          end;
        'P', 'p':
          begin (* Прецессия *)
            write(' Новое');
            GetEqx(TEQXN); (* ввод нового равноденствия equinox *)
            if IsEclipt then
              PrecMatEcl(TEQX, TEQXN, A)
            else
              PrecMatEqu(TEQX, TEQXN, A);
            PrecArt(A, X, Y, Z);
            TEQX := TEQXN;
            writeln;
            writeln(' Координаты равноденствия T =', TEQX:13:10);
          end;
        'A', 'a':
          begin (* equatorial -> ecliptic   *)
            Writeln;
            Equ2Ecl(TEQX, X, Y, Z);
            Write(' Эклиптические ');
          end;
        'E', 'e':
          begin  (* ecliptic -> equatorial *)
            Writeln;
            Ecl2Equ(TEQX, X, Y, Z);
            write(' Экваториальные');
          end;
 //           Writeln(' координаты: ');
 //           IsEclipt := not IsEclipt;
        'G', 'g', (* -> geocentric coordinates *)
        'H', 'h': (* -> heliocentric coordinates *)
          begin
            GetDat(T); (* read date *)
            SunPos(T, LS, BS, RS);
            Cart(RS, BS, LS, XS, YS, ZS);
            PrecMatEcl(T, TEQX, A);
            PrecArt(A, XS, YS, ZS);
            if not IsEclipt then
              Ecl2Equ(TEQX, XS, YS, ZS);
            if CharMode in ['G', 'g'] then
            begin
              X := X + XS;
              Y := Y + YS;
              Z := Z + ZS;
              Writeln(' Геоцентрические координаты: ');
            end
            else
            begin
              X := X - XS;
              Y := Y - YS;
              Z := Z - ZS;
              Writeln(' Гелиоцентрические координаты: ');
            end;
          end;
      end;
    if not(CharMode in ['?', 'S', 's']) then
      Results(X, Y, Z, IsEclipt);
  until CharMode in ['S', 's'];
end.
