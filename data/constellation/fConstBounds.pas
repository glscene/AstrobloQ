unit fConstBounds;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons;

type
  TFormConversion = class(TForm)
    BitBtnConversion: TBitBtn;
    procedure BitBtnConversionClick(Sender: TObject);
  private
  public
  end;

var
  FormConversion: TFormConversion;

//-----------------------------------------------------------
implementation
//-----------------------------------------------------------

{$R *.DFM}

procedure TFormConversion.BitBtnConversionClick(Sender: TObject);
type
  TConstb = record
    ar, de: Single;   // angles
  end;
var
  fi: TextFile; // input
  fo: file of TConstb;  // output
  buf, c, cp, a, d, s: string;
  r: TConstb;
begin
  cp := '';
  AssignFile(fi, 'ConstBounds.csv'); // bound_20.dat
  Reset(fi);
  AssignFile(fo, 'ConstBounds.dat');
  Rewrite(fo);
  repeat
    Readln(fi, buf);
    a := Copy(buf, 1, 10);
    s := Copy(buf, 12, 1);
    d := Copy(buf, 13, 10);
    c := Copy(buf, 24, 4);
    r.ar := StrToFloat(a);
    r.de := StrToFloat(d) * StrToFloat(s + '1');
    if c <> cp then
      r.ar := -r.ar;
    Write(fo, r);
    cp := c;
  until Eof(fi);
  CloseFile(fi);
  CloseFile(fo);
  FormConversion.Close;
end;

end.
