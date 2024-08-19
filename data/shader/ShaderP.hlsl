static const float Pi = 3.141592653589793;

static const float Pi2 = Pi * 2.0;

static const float P2i = Pi / 2.0;

SamplerState _SamplerState {};

float Pow2( float X_ )
{
    return X_ * X_;
}

float Roo2( float X_ )
{
    return sqrt( X_ );
}

float2 VectorToSky( float3 Vector_ )
{
    float2 _Result;

    _Result.x = ( Pi - atan2( -Vector_.z, -Vector_.x ) ) / Pi2;
    _Result.y =        acos ( -Vector_.y             )   / Pi ;

    return _Result;
}

float Fresnel( float3 EyeVec_, float3 NorVec_, float RefI_ )
{
    float N = Pow2( RefI_ );
    float C = dot( EyeVec_, NorVec_ );
    float G = sqrt( N + Pow2( C ) - 1 );
    float NC = N * C;
    return ( Pow2( (  C - G ) / (  C + G ) )
           + Pow2( ( NC - G ) / ( NC + G ) ) ) / 2;

    /* 近似
    float R = pow( ( RefI_ - 1 ) / ( RefI_ + 1 ), 2 );
    float C = dot( EyeVec_, NorVec_ );
    return R + ( 1 - R ) * pow( 1 - C, 5 );
    */
}

struct TSenderP               //Fragment variable types
{
    float4 Scr :SV_Position;  //Position (screen)
    float4 Pos :TEXCOORD0  ;  //Location (global)
    float4 Tan :TANGENT    ;  //Tangents (global)
    float4 Bin :BINORMAL   ;  //Binormal (global)
    float4 Nor :NORMAL     ;  //Normals (global)
    float4 Tex :TEXCOORD1  ;  //Texture coordinates
};

struct TResultP               //Pixel variable type
{
    float4 Col :SV_Target  ;  //Color
};

//

TResultP MainP( TSenderP _Sender )
{
    TResultP _Result;

    float3 N = normalize( _Sender.Nor.xyz );
    float3 T = normalize( _Sender.Tan.xyz );
    float3 B = normalize( _Sender.Bin.xyz );
    float3 L = -_Light.Dir.xyz;
    float3 V = normalize( _EyePos.xyz - _Sender.Pos.xyz );
    float3 H = normalize( L + V );

    //--------------------------------------------------------------------------

    if ( dot( N, V ) < 0 ) N = -N;

    clip( -_Sender.Pos.z );

    //--------------------------------------------------------------------------

    float LD = max( dot( N, L ), 0.0 );

    float4 D = _DiffImage.Sample( _SamplerState, _Sender.Tex.xy );

    float4 CD = ( _AmbiLight + _Light.Col * LD ) * ( _DiffRatio * D );

    //--------------------------------------------------------------------------

    float LS = pow( max( dot( N, H ), 0.0 ), _SpecShiny );

    float4 CS = ( _Light.Col * LS ) * _SpecRatio;

    //--------------------------------------------------------------------------

    _Result.Col = _EmisLight + CD + CS;

    //--------------------------------------------------------------------------

    _Result.Col.a = 1;

    _Result.Col = _Opacity * _Result.Col;

    return _Result;
}

