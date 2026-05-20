program PlanetPos(Input, Output);

(* -----------------------------------------------------------------------
 PlanetPos: гелиоцентрические и геоцентрические позиции планет
 ----------------------------------------------------------------------- *)

{$APPTYPE CONSOLE}

uses
  Apc.Math,
  Apc.PrecNut,
  Apc.Spheric,
  Apc.Sun,
  Apc.Planets,
  Apc.Time;

const
  J2000 = 0.0;
  B1950 = -0.500002108;

var
  Day, Month, Year, IPLAN, IMODE, K: integer;
  Hour, MODJD, T, TEQX: Double;
  X, Y, Z, XP, YP, ZP, XS, YS, ZS: Double;
  L, B, R, LS, BS, RS, Ra, Dec, DELTA, DELTA0: Double;
  A: Double33;
  CharMode: Char;

(* -----------------------------------------------------------------------
 PRINTOUT: запись координат одной планеты
 ----------------------------------------------------------------------- *)
procedure PRINTOUT(IPLAN: integer; L, B, R, Ra, Dec, DELTA: Double);
var
  H, M: integer;
  S: Double;
begin
  DMS(L, H, M, S);
  write(H:3, M:3, S:5:1);
  DMS(B, H, M, S);
  write(H:4, M:3, S:5:1);
  if IPLAN < 4 then
    write(R:11:6)
  else
    write(R:10:5, ' ');
  DMS(Ra, H, M, S);
  write(H:4, M:3, S:6:2);
  DMS(Dec, H, M, S);
  write(H:4, M:3, S:5:1);
  if IPLAN < 4 then
    write(DELTA:11:6)
  else
    write(DELTA:10:5, ' ');
end;

(* ------------------------- PlanetPos -------------------------------------- *)
begin
  writeln;
  writeln('   PlanetPos: гелиоцентрические и геоцентрические позиции планет ');
  writeln;

  repeat
    writeln;
    writeln(' (J) J2000 astrometric       (B) B1950 astrometric  ');
    writeln(' (A) apparent coordinates    (E) end                ');
    writeln;
    write(' выберите опцию: ');
    Readln(CharMode);
    writeln;

    if CharMode in ['A', 'a', 'J', 'j', 'B', 'b'] then

    begin
      (* read date *)
      write(' дата (год месяц день час) ?     ');
      Readln(Year, Month, Day, Hour);
      writeln;
      writeln;
      writeln;
      writeln;
      MODJD := MJD(Day, Month, Year, Hour);
      T := (MODJD - 51544.5) / 36525.0;
      write(' дата:  ', Year:4, '/', Month:2, '/', Day:2, ' ', Hour:5:1, '(ET)');
      write('JD:':6, (MODJD + 2400000.5):12:3, 'равноденствие ':18);
      case CharMode of
        'A', 'a':
          writeln('на дату');
        'J', 'j':
          writeln('J2000');
        'B', 'b':
          writeln('B1950');
      end;
      writeln;

      (* header *)
      write(' ':10, 'l':6, 'b':12, 'r':11);
      writeln(' ':7, 'Ra':5, 'Dec':13, 'delta':13);
      write(' ':9, '   o  ''  "', ' ':3, '  o  ''  "', ' ':6, 'AU', ' ':4);
      writeln(' ':2, '  h  m  s', ' ':4, '  o  ''  "', ' ':6, 'AU');

      (* эклиптические координаты Солнца, Equinox T *)
      SunPos(T, LS, BS, RS);

      (* координаты планет; включая Плутон в период между 1890 и 2100 годами *)
      if ((-1.1 < T) and (T < +1.0)) then
        K := 9
      else
        K := 8;

      for IPLAN := 0 to K do

      begin
        (* гелиоцентрические эклиптические координаты планет *)
        case IPLAN of
          1:
            MercuryPos(T, L, B, R);
          2:
            VenusPos(T, L, B, R);
          4:
            MarsPos(T, L, B, R);
          5:
            JupiterPos(T, L, B, R);
          6:
            SaturnPos(T, L, B, R);
          7:
            UranusPos(T, L, B, R);
          8:
            NeptunePos(T, L, B, R);
          9:
            PlutoPos(T, L, B, R);
          0:
            begin
              L := 0.0;
              B := 0.0;
              R := 0.0;
            end;
          3:
            begin
              L := LS + 180.0;
              B := -BS;
              R := RS;
            end;
        end;

        (* геоцентрические эклиптические координаты (light-time corrected) *)

        if CharMode in ['A', 'a'] then
          IMODE := 2
        else
          IMODE := 1;
        GeoCentric(T, L, B, R, LS, BS, RS, IPLAN, IMODE, XP, YP, ZP, XS, YS, ZS, X, Y, Z, DELTA0);

        (* прецессия, экваториальные координаты, нутация *)
        case CharMode of
          'J', 'j':
            TEQX := J2000;
          'B', 'b':
            TEQX := B1950;
        end;

        if CharMode in ['A', 'a'] then
        begin
          Ecl2Equ(T, X, Y, Z);
          NutEqu(T, X, Y, Z);
        end
        else
        begin
          PrecMatEcl(T, TEQX, A);
          PrecArt(A, XP, YP, ZP);
          PrecArt(A, X, Y, Z);
          Ecl2Equ(TEQX, X, Y, Z);
        end;

        (* сферические координаты *)

        Polar(XP, YP, ZP, R, B, L);
        Polar(X, Y, Z, DELTA, Dec, Ra);
        Ra := Ra / 15.0;

        (* output *)

        case IPLAN of
          0:
            write(' Солнце  ');
          1:
            write(' Меркурий');
          2:
            write(' Венера  ');
          3:
            write(' Земля   ');
          4:
            write(' Марс    ');
          5:
            write(' Юпитер  ');
          6:
            write(' Сатурн  ');
          7:
            write(' Уран    ');
          8:
            write(' Нептун  ');
          9:
            write(' Плутон  ');
        end;

        PRINTOUT(IPLAN, L, B, R, Ra, Dec, DELTA0);
        writeln;
      end;

      writeln;
      writeln(' l,b,r:   гелиоцентрические эклиптические (geometric) ');
      write(' Ra,Dec:  геоцентрические экваториальные ');
      if CharMode in ['A', 'a'] then
        writeln('(apparent)')
      else
        writeln('(astrometric)');
      writeln(' delta:   geocentric distance   (geometric)');
      writeln;
    end;
  until CharMode in ['E', 'e'];
end.
