struct TSenderV
{
    float4 Pos :POSITION   ;
    float4 Tan :TANGENT    ;
    float4 Bin :BINORMAL   ;
    float4 Nor :NORMAL     ;
    float4 Tex :TEXCOORD   ;
};

struct TResultV
{
    float4 Scr :SV_Position;
    float4 Pos :TEXCOORD0  ;
    float4 Tan :TANGENT    ;
    float4 Bin :BINORMAL   ;
    float4 Nor :NORMAL     ;
    float4 Tex :TEXCOORD1  ;
};


TResultV MainV( TSenderV _Sender )
{
    TResultV _Result;

    float4x4 tMatrixGL = transpose( _MatrixGL );

    _Result.Scr = mul( _Sender.Pos, _MatrixLS );
    _Result.Pos = mul( _Sender.Pos, _MatrixLG );
    _Result.Tan = mul( _Sender.Tan, tMatrixGL );
    _Result.Bin = mul( _Sender.Bin, tMatrixGL );
    _Result.Nor = mul( _Sender.Nor, tMatrixGL );
    _Result.Tex =      _Sender.Tex             ;

    return _Result;
}


