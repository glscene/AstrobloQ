#version 430

in TSenderGF
{
  vec4 Pos;
}
_Sender;

//------------------------------------------------------------------------------

out vec4 _ResultCol;

void main()
{
  _ResultCol = vec4( 1, 1, 1, 1 );
}