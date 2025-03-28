//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/DarkPortalShader" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_NoiseTex ("Noise", 2D) = "white" { }
_PortalTex ("Portal", 2D) = "black" { }
_EdgeColor ("Edge Color", Color) = (0.5,0.1,0.7,1)
_BorderColor ("Border Color", Color) = (0,0,0,1)
_RotSpeed ("Rotation Speed", Float) = 0
_Magnitudes ("LS/SS MinMax", Vector) = (0.25,0.25,0.1,0.1)
_LSFreq ("Large-Scale Frequency", Float) = 8
_SSFreq ("Small-Scale Frequency", Float) = 24
_PlayerPos ("Player Position World", Vector) = (0,0,0,0)
_HoleEdgeDepth ("Hole Edge Depth", Float) = 6
_UVDistCutoff ("Cutoff Edge", Float) = 0.4
_TimeScale ("Time Scale", Float) = 1
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Overlay+1" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Overlay+1" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  Cull Off
  Stencil {
   Ref 1
   Comp Always
   Pass Replace
   Fail DecrSat
   ZFail DecrSat
  }
  Fog {
   Mode Off
  }
  GpuProgramID 46055
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0 = u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    vs_TEXCOORD2 = u_xlat0 * vec4(1.0, -1.0, 1.0, 1.0) + vec4(0.0, 1.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _PortalTex_TexelSize;
uniform 	vec4 _Magnitudes;
uniform 	float _LSFreq;
uniform 	float _SSFreq;
uniform 	float _RotSpeed;
uniform 	vec4 _BorderColor;
uniform 	float _HoleEdgeDepth;
uniform 	float _UVDistCutoff;
uniform 	vec4 _PlayerPos;
uniform 	float _TimeScale;
uniform  sampler2D _NoiseTex;
uniform  sampler2D _PortalTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec4 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
vec2 u_xlat10;
vec3 u_xlat11;
vec2 u_xlat16;
float u_xlat17;
float u_xlat18;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat0.z = vs_TEXCOORD0.x;
    u_xlat1.y = _PortalTex_TexelSize.y * (-_HoleEdgeDepth);
    u_xlat1.x = 0.0;
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat0.zy + vec2(-0.5, -0.5);
    u_xlat1.x = u_xlat16.y / u_xlat16.x;
    u_xlat9.x = max(abs(u_xlat1.x), 1.0);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat17 = min(abs(u_xlat1.x), 1.0);
    u_xlat9.x = u_xlat9.x * u_xlat17;
    u_xlat17 = u_xlat9.x * u_xlat9.x;
    u_xlat25 = u_xlat17 * 0.0208350997 + -0.0851330012;
    u_xlat25 = u_xlat17 * u_xlat25 + 0.180141002;
    u_xlat25 = u_xlat17 * u_xlat25 + -0.330299497;
    u_xlat17 = u_xlat17 * u_xlat25 + 0.999866009;
    u_xlat25 = u_xlat17 * u_xlat9.x;
    u_xlat25 = u_xlat25 * -2.0 + 1.57079637;
    u_xlatb2 = 1.0<abs(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat25 = u_xlatb2 ? u_xlat25 : float(0.0);
    u_xlat9.x = u_xlat9.x * u_xlat17 + u_xlat25;
    u_xlat1.x = (u_xlatb1) ? (-u_xlat9.x) : u_xlat9.x;
    u_xlat9.xy = _Time.xy * vec2(_TimeScale);
    u_xlat9.x = u_xlat9.x * _RotSpeed;
    u_xlat25 = u_xlat9.x * 90.0;
    u_xlatb25 = u_xlat25>=(-u_xlat25);
    u_xlat2.xy = (bool(u_xlatb25)) ? vec2(90.0, 0.0111111114) : vec2(-90.0, -0.0111111114);
    u_xlat9.x = u_xlat9.x * u_xlat2.y;
    u_xlat9.x = fract(u_xlat9.x);
    u_xlat1.x = u_xlat2.x * u_xlat9.x + u_xlat1.x;
    u_xlat25 = u_xlat1.x * _LSFreq;
    u_xlat25 = cos(u_xlat25);
    u_xlat10.xy = _Time.xx * vec2(-1.0, 1.0);
    u_xlat3.xy = u_xlat10.xy * vec2(_TimeScale) + u_xlat0.xy;
    u_xlat0.xy = _Time.xx * vec2(_TimeScale) + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_4 = texture(_NoiseTex, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_3 = texture(_NoiseTex, u_xlat0.xy);
    u_xlat0.x = u_xlat10_3.z * 20.0 + u_xlat9.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat3.xw = (-_Magnitudes.xz) + _Magnitudes.yw;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = u_xlat0.x * 0.5 + _Magnitudes.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.xy = u_xlat10_3.yy * u_xlat0.xy;
    u_xlat0.xy = u_xlat10_3.zz * u_xlat0.xy;
    u_xlat0.xy = vec2(u_xlat25) * u_xlat0.xy + u_xlat16.xy;
    u_xlat16.x = u_xlat9.y + u_xlat9.y;
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat3.w + _Magnitudes.z;
    u_xlat24 = u_xlat10_4.x * u_xlat16.x;
    u_xlat1.x = u_xlat10_4.z * 0.5 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _SSFreq;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat11.xy = vec2(u_xlat24) * u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xx * u_xlat11.xy + u_xlat0.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _UVDistCutoff;
    u_xlatb0.x = u_xlat0.x<0.0;
    if((int(u_xlatb0.x) * int(0xffffffffu))!=0){discard;}
    u_xlat4 = vs_TEXCOORD1.xyxy + (-_PlayerPos);
    u_xlat5 = u_xlat4.xyxy + vec4(0.5, 1.0, 0.0, 0.5);
    u_xlat4 = u_xlat4.zwzw + vec4(0.5, 1.0, 0.0, 0.5);
    u_xlat0.x = u_xlat5.w / u_xlat5.z;
    u_xlat8.x = max(abs(u_xlat0.x), 1.0);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat24 = min(abs(u_xlat0.x), 1.0);
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat24 = u_xlat8.x * u_xlat8.x;
    u_xlat1.x = u_xlat24 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat24 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat24 * u_xlat1.x + -0.330299497;
    u_xlat24 = u_xlat24 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat24 * u_xlat8.x;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb25 = 1.0<abs(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlatb0.x = u_xlat0.x<(-u_xlat0.x);
    u_xlat1.x = u_xlatb25 ? u_xlat1.x : float(0.0);
    u_xlat8.x = u_xlat8.x * u_xlat24 + u_xlat1.x;
    u_xlat0.x = (u_xlatb0.x) ? (-u_xlat8.x) : u_xlat8.x;
    u_xlat0.x = u_xlat2.x * u_xlat9.x + u_xlat0.x;
    u_xlat8.x = u_xlat0.x * _LSFreq;
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat1.xw = u_xlat10.xy * vec2(_TimeScale) + u_xlat5.xy;
    u_xlat1.xw = u_xlat1.xw * vec2(0.0500000007, 0.0500000007);
    u_xlat1.xw = fract(u_xlat1.xw);
    u_xlat10_6 = texture(_NoiseTex, u_xlat1.xw);
    u_xlat7 = _PlayerPos + _PlayerPos;
    u_xlat1.xw = _Time.yy * vec2(_TimeScale) + u_xlat7.xz;
    u_xlat11.xy = u_xlat7.yw + u_xlat7.xz;
    u_xlat11.xy = u_xlat9.yy * vec2(2.0, 2.0) + u_xlat11.xy;
    u_xlat11.xy = sin(u_xlat11.xy);
    u_xlat11.xy = u_xlat11.xy + vec2(1.0, 1.0);
    u_xlat11.xy = u_xlat3.ww * u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy * vec2(0.5, 0.5) + _Magnitudes.zz;
    u_xlat1.xw = _PlayerPos.yw * vec2(2.0, 2.0) + u_xlat1.xw;
    u_xlat24 = u_xlat10_6.z * 20.0 + u_xlat1.x;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 + 1.0;
    u_xlat24 = u_xlat3.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.5 + _Magnitudes.x;
    u_xlat6.xw = vec2(u_xlat24) * u_xlat5.zw;
    u_xlat6.xy = u_xlat10_6.yy * u_xlat6.xw;
    u_xlat6.xy = u_xlat10_6.zz * u_xlat6.xy;
    u_xlat8.xz = u_xlat8.xx * u_xlat6.xy + u_xlat5.zw;
    u_xlat5.xy = _Time.xx * vec2(_TimeScale) + u_xlat5.xy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat10_5 = texture(_NoiseTex, u_xlat5.xy);
    u_xlat1.x = u_xlat11.x * u_xlat10_5.x;
    u_xlat0.x = u_xlat10_5.z * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _SSFreq;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat11.xz = u_xlat8.xz * u_xlat1.xx;
    u_xlat0.xy = u_xlat0.xx * u_xlat11.xz + u_xlat8.xz;
    u_xlat0.w = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.0, 0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = sqrt(u_xlat0.xw);
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.5, 1.5);
    u_xlatb0.xy = lessThan(vec4(-0.0, -0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    if((int(u_xlatb0.y) * int(0xffffffffu))!=0){discard;}
    u_xlat8.xz = u_xlat10.xy * vec2(_TimeScale) + u_xlat4.xy;
    u_xlat10.xy = u_xlat10.xy * vec2(_TimeScale) + vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat10_5 = texture(_NoiseTex, u_xlat10.xy);
    u_xlat8.xz = u_xlat8.xz * vec2(0.0500000007, 0.0500000007);
    u_xlat8.xz = fract(u_xlat8.xz);
    u_xlat10_6 = texture(_NoiseTex, u_xlat8.xz);
    u_xlat8.x = u_xlat10_6.z * 20.0 + u_xlat1.w;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x + 1.0;
    u_xlat8.x = u_xlat3.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * 0.5 + _Magnitudes.x;
    u_xlat8.xz = u_xlat8.xx * u_xlat4.zw;
    u_xlat8.xz = u_xlat10_6.yy * u_xlat8.xz;
    u_xlat8.xz = u_xlat10_6.zz * u_xlat8.xz;
    u_xlat1.x = u_xlat4.w / u_xlat4.z;
    u_xlat25 = max(abs(u_xlat1.x), 1.0);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat10.x = min(abs(u_xlat1.x), 1.0);
    u_xlat25 = u_xlat25 * u_xlat10.x;
    u_xlat10.x = u_xlat25 * u_xlat25;
    u_xlat18 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat18 = u_xlat10.x * u_xlat18 + 0.180141002;
    u_xlat18 = u_xlat10.x * u_xlat18 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat18 + 0.999866009;
    u_xlat18 = u_xlat25 * u_xlat10.x;
    u_xlat18 = u_xlat18 * -2.0 + 1.57079637;
    u_xlatb26 = 1.0<abs(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat18 = u_xlatb26 ? u_xlat18 : float(0.0);
    u_xlat25 = u_xlat25 * u_xlat10.x + u_xlat18;
    u_xlat1.x = (u_xlatb1) ? (-u_xlat25) : u_xlat25;
    u_xlat1.x = u_xlat2.x * u_xlat9.x + u_xlat1.x;
    u_xlat25 = u_xlat1.x * _LSFreq;
    u_xlat25 = cos(u_xlat25);
    u_xlat8.xz = vec2(u_xlat25) * u_xlat8.xz + u_xlat4.zw;
    u_xlat10.xy = _Time.xx * vec2(_TimeScale) + u_xlat4.xy;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat10_4 = texture(_NoiseTex, u_xlat10.xy);
    u_xlat25 = u_xlat11.y * u_xlat10_4.x;
    u_xlat1.x = u_xlat10_4.z * 0.5 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _SSFreq;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat10.xy = u_xlat8.xz * vec2(u_xlat25);
    u_xlat8.xz = u_xlat1.xx * u_xlat10.xy + u_xlat8.xz;
    u_xlat1.x = dot(u_xlat8.xz, u_xlat8.xz);
    u_xlat8.xz = u_xlat8.xz + vec2(0.0, 0.5);
    u_xlat8.x = dot(u_xlat8.xz, u_xlat8.xz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat8.x) + 1.5;
    u_xlatb8 = -0.0<u_xlat8.x;
    u_xlatb0.x = u_xlatb8 || u_xlatb0.x;
    u_xlat8.x = sqrt(u_xlat1.x);
    u_xlat8.x = (-u_xlat8.x) + 1.5;
    u_xlatb8 = -0.0<u_xlat8.x;
    if((int(u_xlatb8) * int(0xffffffffu))!=0){discard;}
    u_xlat8.x = u_xlat10_5.z * 20.0 + u_xlat9.y;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x + 1.0;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat8.x = u_xlat8.x * u_xlat3.x + _Magnitudes.x;
    u_xlat1.xz = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat8.xz = u_xlat8.xx * u_xlat1.xz;
    u_xlat8.xz = u_xlat10_5.yy * u_xlat8.xz;
    u_xlat8.xz = u_xlat10_5.zz * u_xlat8.xz;
    u_xlat25 = u_xlat1.z / u_xlat1.x;
    u_xlat10.x = max(abs(u_xlat25), 1.0);
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat18 = min(abs(u_xlat25), 1.0);
    u_xlat10.x = u_xlat10.x * u_xlat18;
    u_xlat18 = u_xlat10.x * u_xlat10.x;
    u_xlat26 = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat26 = u_xlat18 * u_xlat26 + 0.180141002;
    u_xlat26 = u_xlat18 * u_xlat26 + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat26 + 0.999866009;
    u_xlat26 = u_xlat18 * u_xlat10.x;
    u_xlat26 = u_xlat26 * -2.0 + 1.57079637;
    u_xlatb3 = 1.0<abs(u_xlat25);
    u_xlat25 = min(u_xlat25, 1.0);
    u_xlatb25 = u_xlat25<(-u_xlat25);
    u_xlat26 = u_xlatb3 ? u_xlat26 : float(0.0);
    u_xlat10.x = u_xlat10.x * u_xlat18 + u_xlat26;
    u_xlat25 = (u_xlatb25) ? (-u_xlat10.x) : u_xlat10.x;
    u_xlat9.x = u_xlat2.x * u_xlat9.x + u_xlat25;
    u_xlat25 = u_xlat9.x * _LSFreq;
    u_xlat25 = cos(u_xlat25);
    u_xlat8.xz = vec2(u_xlat25) * u_xlat8.xz + u_xlat1.xz;
    u_xlat1.xz = _Time.xx * vec2(_TimeScale) + vs_TEXCOORD0.xy;
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat10_2 = texture(_NoiseTex, u_xlat1.xz);
    u_xlat16.x = u_xlat16.x * u_xlat10_2.x;
    u_xlat1.x = u_xlat10_2.z * 0.5 + u_xlat9.x;
    u_xlat1.x = u_xlat1.x * _SSFreq;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat9.xy = u_xlat16.xx * u_xlat8.xz;
    u_xlat8.xy = u_xlat1.xx * u_xlat9.xy + u_xlat8.xz;
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat8.x) + _UVDistCutoff;
    u_xlatb8 = u_xlat8.x<0.0;
    u_xlatb0.x = u_xlatb0.x || u_xlatb8;
    u_xlat10_1 = texture(_PortalTex, vs_TEXCOORD2.xy);
    u_xlat8.xyz = u_xlat10_1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
    SV_Target0.xyz = (u_xlatb0.x) ? _BorderColor.xyz : u_xlat8.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 127
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %102 %113 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate %64 Location 64 
                                                     OpMemberDecorate %100 0 BuiltIn 100 
                                                     OpMemberDecorate %100 1 BuiltIn 100 
                                                     OpMemberDecorate %100 2 BuiltIn 100 
                                                     OpDecorate %100 Block 
                                                     OpDecorate %113 Location 113 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                                Output f32_2* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                               Output f32_4* %64 = OpVariable Output 
                                         u32 %98 = OpConstant 1 
                                             %99 = OpTypeArray %6 %98 
                                            %100 = OpTypeStruct %13 %6 %99 
                                            %101 = OpTypePointer Output %100 
       Output struct {f32_4; f32; f32[1];}* %102 = OpVariable Output 
                                        f32 %106 = OpConstant 3.67402E-40 
                                      f32_4 %107 = OpConstantComposite %106 %106 %106 %106 
                                        f32 %110 = OpConstant 3.67402E-40 
                                      f32_4 %111 = OpConstantComposite %110 %110 %110 %110 
                              Output f32_4* %113 = OpVariable Output 
                                        f32 %115 = OpConstant 3.67402E-40 
                                      f32_4 %116 = OpConstantComposite %106 %115 %106 %106 
                                        f32 %118 = OpConstant 3.67402E-40 
                                      f32_4 %119 = OpConstantComposite %118 %106 %118 %118 
                                            %121 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore %9 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore %64 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %91 = OpAccessChain %20 %39 %59 
                                       f32_4 %92 = OpLoad %91 
                                       f32_4 %93 = OpLoad %57 
                                       f32_4 %94 = OpVectorShuffle %93 %93 3 3 3 3 
                                       f32_4 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %33 
                                       f32_4 %97 = OpFAdd %95 %96 
                                                     OpStore %33 %97 
                                      f32_4 %103 = OpLoad %33 
                              Output f32_4* %104 = OpAccessChain %102 %38 
                                                     OpStore %104 %103 
                                      f32_4 %105 = OpLoad %33 
                                      f32_4 %108 = OpFAdd %105 %107 
                                                     OpStore %33 %108 
                                      f32_4 %109 = OpLoad %33 
                                      f32_4 %112 = OpFMul %109 %111 
                                                     OpStore %33 %112 
                                      f32_4 %114 = OpLoad %33 
                                      f32_4 %117 = OpFMul %114 %116 
                                      f32_4 %120 = OpFAdd %117 %119 
                                                     OpStore %113 %120 
                                Output f32* %122 = OpAccessChain %102 %38 %98 
                                        f32 %123 = OpLoad %122 
                                        f32 %124 = OpFNegate %123 
                                Output f32* %125 = OpAccessChain %102 %38 %98 
                                                     OpStore %125 %124 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 1417
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %443 %1388 %1398 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpMemberDecorate %24 0 Offset 24 
                                                      OpMemberDecorate %24 1 Offset 24 
                                                      OpMemberDecorate %24 2 Offset 24 
                                                      OpMemberDecorate %24 3 Offset 24 
                                                      OpMemberDecorate %24 4 Offset 24 
                                                      OpMemberDecorate %24 5 Offset 24 
                                                      OpMemberDecorate %24 6 Offset 24 
                                                      OpMemberDecorate %24 7 Offset 24 
                                                      OpMemberDecorate %24 8 Offset 24 
                                                      OpMemberDecorate %24 9 Offset 24 
                                                      OpMemberDecorate %24 10 Offset 24 
                                                      OpDecorate %24 Block 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %266 DescriptorSet 266 
                                                      OpDecorate %266 Binding 266 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %443 Location 443 
                                                      OpDecorate %586 RelaxedPrecision 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %662 RelaxedPrecision 
                                                      OpDecorate %663 RelaxedPrecision 
                                                      OpDecorate %685 RelaxedPrecision 
                                                      OpDecorate %686 RelaxedPrecision 
                                                      OpDecorate %691 RelaxedPrecision 
                                                      OpDecorate %692 RelaxedPrecision 
                                                      OpDecorate %725 RelaxedPrecision 
                                                      OpDecorate %726 RelaxedPrecision 
                                                      OpDecorate %730 RelaxedPrecision 
                                                      OpDecorate %732 RelaxedPrecision 
                                                      OpDecorate %737 RelaxedPrecision 
                                                      OpDecorate %738 RelaxedPrecision 
                                                      OpDecorate %837 RelaxedPrecision 
                                                      OpDecorate %838 RelaxedPrecision 
                                                      OpDecorate %841 RelaxedPrecision 
                                                      OpDecorate %852 RelaxedPrecision 
                                                      OpDecorate %856 RelaxedPrecision 
                                                      OpDecorate %858 RelaxedPrecision 
                                                      OpDecorate %859 RelaxedPrecision 
                                                      OpDecorate %892 RelaxedPrecision 
                                                      OpDecorate %893 RelaxedPrecision 
                                                      OpDecorate %899 RelaxedPrecision 
                                                      OpDecorate %900 RelaxedPrecision 
                                                      OpDecorate %1038 RelaxedPrecision 
                                                      OpDecorate %1042 RelaxedPrecision 
                                                      OpDecorate %1044 RelaxedPrecision 
                                                      OpDecorate %1050 RelaxedPrecision 
                                                      OpDecorate %1051 RelaxedPrecision 
                                                      OpDecorate %1131 RelaxedPrecision 
                                                      OpDecorate %1132 RelaxedPrecision 
                                                      OpDecorate %1166 RelaxedPrecision 
                                                      OpDecorate %1167 RelaxedPrecision 
                                                      OpDecorate %1173 RelaxedPrecision 
                                                      OpDecorate %1174 RelaxedPrecision 
                                                      OpDecorate %1316 RelaxedPrecision 
                                                      OpDecorate %1317 RelaxedPrecision 
                                                      OpDecorate %1321 RelaxedPrecision 
                                                      OpDecorate %1323 RelaxedPrecision 
                                                      OpDecorate %1328 RelaxedPrecision 
                                                      OpDecorate %1329 RelaxedPrecision 
                                                      OpDecorate %1385 RelaxedPrecision 
                                                      OpDecorate %1386 RelaxedPrecision 
                                                      OpDecorate %1386 DescriptorSet 1386 
                                                      OpDecorate %1386 Binding 1386 
                                                      OpDecorate %1387 RelaxedPrecision 
                                                      OpDecorate %1388 Location 1388 
                                                      OpDecorate %1392 RelaxedPrecision 
                                                      OpDecorate %1393 RelaxedPrecision 
                                                      OpDecorate %1396 RelaxedPrecision 
                                                      OpDecorate %1398 RelaxedPrecision 
                                                      OpDecorate %1398 Location 1398 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_2* %12 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Input %6 
                                          u32 %18 = OpConstant 2 
                                              %19 = OpTypePointer Private %6 
                                              %21 = OpTypeVector %6 3 
                                              %22 = OpTypePointer Private %21 
                               Private f32_3* %23 = OpVariable Private 
                                              %24 = OpTypeStruct %7 %7 %7 %6 %6 %6 %7 %6 %6 %7 %6 
                                              %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32_4; f32; f32; f32; f32_4; f32; f32; f32_4; f32;}* %26 = OpVariable Uniform 
                                              %27 = OpTypeInt 32 1 
                                          i32 %28 = OpConstant 1 
                                          u32 %29 = OpConstant 1 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %47 = OpTypePointer Private %10 
                               Private f32_2* %48 = OpVariable Private 
                                          f32 %51 = OpConstant 3.67402E-40 
                                        f32_2 %52 = OpConstantComposite %51 %51 
                               Private f32_2* %60 = OpVariable Private 
                                          f32 %64 = OpConstant 3.67402E-40 
                                 Private f32* %71 = OpVariable Private 
                                 Private f32* %86 = OpVariable Private 
                                          f32 %88 = OpConstant 3.67402E-40 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %95 = OpConstant 3.67402E-40 
                                         f32 %100 = OpConstant 3.67402E-40 
                                         f32 %105 = OpConstant 3.67402E-40 
                                         f32 %112 = OpConstant 3.67402E-40 
                                         f32 %114 = OpConstant 3.67402E-40 
                                             %116 = OpTypeBool 
                                             %117 = OpTypePointer Private %116 
                               Private bool* %118 = OpVariable Private 
                               Private bool* %127 = OpVariable Private 
                                             %134 = OpTypePointer Function %6 
                                         i32 %161 = OpConstant 0 
                                             %162 = OpTypePointer Uniform %7 
                                         i32 %166 = OpConstant 10 
                                         i32 %173 = OpConstant 5 
                                         f32 %180 = OpConstant 3.67402E-40 
                               Private bool* %182 = OpVariable Private 
                              Private f32_2* %187 = OpVariable Private 
                                             %188 = OpTypePointer Function %10 
                                         f32 %193 = OpConstant 3.67402E-40 
                                       f32_2 %194 = OpConstantComposite %180 %193 
                                         f32 %196 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                       f32_2 %198 = OpConstantComposite %196 %197 
                                         i32 %221 = OpConstant 3 
                              Private f32_2* %227 = OpVariable Private 
                                         f32 %231 = OpConstant 3.67402E-40 
                                       f32_2 %232 = OpConstantComposite %231 %64 
                              Private f32_4* %234 = OpVariable Private 
                              Private f32_2* %262 = OpVariable Private 
                                             %263 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %264 = OpTypeSampledImage %263 
                                             %265 = OpTypePointer UniformConstant %264 
 UniformConstant read_only Texture2DSampled* %266 = OpVariable UniformConstant 
                                         f32 %274 = OpConstant 3.67402E-40 
                                       f32_2 %275 = OpConstantComposite %274 %274 
                              Private f32_2* %284 = OpVariable Private 
                                Private f32* %290 = OpVariable Private 
                                         f32 %293 = OpConstant 3.67402E-40 
                              Private f32_2* %302 = OpVariable Private 
                                         i32 %303 = OpConstant 2 
                                         f32 %317 = OpConstant 3.67402E-40 
                              Private f32_4* %322 = OpVariable Private 
                              Private f32_3* %373 = OpVariable Private 
                                         i32 %383 = OpConstant 4 
                                         i32 %420 = OpConstant 8 
                                             %425 = OpTypeVector %116 2 
                                             %426 = OpTypePointer Private %425 
                             Private bool_2* %427 = OpVariable Private 
                                         i32 %436 = OpConstant -1 
                                             %442 = OpTypePointer Input %7 
                                Input f32_4* %443 = OpVariable Input 
                                         i32 %446 = OpConstant 9 
                                       f32_4 %453 = OpConstantComposite %317 %64 %39 %317 
                                         u32 %458 = OpConstant 3 
                                Private f32* %484 = OpVariable Private 
                               Private bool* %512 = OpVariable Private 
                              Private f32_4* %591 = OpVariable Private 
                              Private f32_2* %597 = OpVariable Private 
                                         f32 %617 = OpConstant 3.67402E-40 
                                       f32_2 %618 = OpConstantComposite %617 %617 
                                       f32_2 %632 = OpConstantComposite %64 %64 
                                       f32_2 %645 = OpConstantComposite %317 %317 
                              Private f32_2* %653 = OpVariable Private 
                                Private f32* %660 = OpVariable Private 
                              Private f32_2* %725 = OpVariable Private 
                                       f32_2 %778 = OpConstantComposite %39 %317 
                                         f32 %791 = OpConstant 3.67402E-40 
                               Private bool* %793 = OpVariable Private 
                                         f32 %794 = OpConstant 3.67402E-40 
                              Private f32_2* %837 = OpVariable Private 
                                Private f32* %931 = OpVariable Private 
                               Private bool* %959 = OpVariable Private 
                                      f32_2 %1106 = OpConstantComposite %791 %791 
                                      f32_4 %1110 = OpConstantComposite %794 %794 %39 %39 
                                            %1113 = OpTypeVector %116 4 
                               Private f32* %1195 = OpVariable Private 
                              Private bool* %1232 = OpVariable Private 
                              Private bool* %1241 = OpVariable Private 
                             Private f32_2* %1316 = OpVariable Private 
                             Private f32_3* %1385 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %1386 = OpVariable UniformConstant 
                               Input f32_4* %1388 = OpVariable Input 
                                        f32 %1394 = OpConstant 3.67402E-40 
                                      f32_3 %1395 = OpConstantComposite %1394 %1394 %1394 
                                            %1397 = OpTypePointer Output %7 
                              Output f32_4* %1398 = OpVariable Output 
                                            %1399 = OpTypePointer Function %21 
                                        i32 %1405 = OpConstant 6 
                                            %1414 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %135 = OpVariable Function 
                               Function f32* %149 = OpVariable Function 
                             Function f32_2* %189 = OpVariable Function 
                               Function f32* %527 = OpVariable Function 
                               Function f32* %540 = OpVariable Function 
                               Function f32* %974 = OpVariable Function 
                               Function f32* %987 = OpVariable Function 
                              Function f32* %1248 = OpVariable Function 
                              Function f32* %1262 = OpVariable Function 
                            Function f32_3* %1400 = OpVariable Function 
                                   Input f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Private f32* %20 = OpAccessChain %9 %18 
                                                      OpStore %20 %17 
                                 Uniform f32* %31 = OpAccessChain %26 %28 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %26 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFNegate %35 
                                          f32 %37 = OpFMul %32 %36 
                                 Private f32* %38 = OpAccessChain %23 %29 
                                                      OpStore %38 %37 
                                 Private f32* %40 = OpAccessChain %23 %14 
                                                      OpStore %40 %39 
                                        f32_3 %41 = OpLoad %23 
                                        f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                        f32_2 %43 = OpLoad %12 
                                        f32_2 %44 = OpFAdd %42 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpVectorShuffle %45 %44 4 5 2 3 
                                                      OpStore %9 %46 
                                        f32_4 %49 = OpLoad %9 
                                        f32_2 %50 = OpVectorShuffle %49 %49 2 1 
                                        f32_2 %53 = OpFAdd %50 %52 
                                                      OpStore %48 %53 
                                 Private f32* %54 = OpAccessChain %48 %29 
                                          f32 %55 = OpLoad %54 
                                 Private f32* %56 = OpAccessChain %48 %14 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFDiv %55 %57 
                                 Private f32* %59 = OpAccessChain %23 %14 
                                                      OpStore %59 %58 
                                 Private f32* %61 = OpAccessChain %23 %14 
                                          f32 %62 = OpLoad %61 
                                          f32 %63 = OpExtInst %1 4 %62 
                                          f32 %65 = OpExtInst %1 40 %63 %64 
                                 Private f32* %66 = OpAccessChain %60 %14 
                                                      OpStore %66 %65 
                                 Private f32* %67 = OpAccessChain %60 %14 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFDiv %64 %68 
                                 Private f32* %70 = OpAccessChain %60 %14 
                                                      OpStore %70 %69 
                                 Private f32* %72 = OpAccessChain %23 %14 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpExtInst %1 4 %73 
                                          f32 %75 = OpExtInst %1 37 %74 %64 
                                                      OpStore %71 %75 
                                 Private f32* %76 = OpAccessChain %60 %14 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpLoad %71 
                                          f32 %79 = OpFMul %77 %78 
                                 Private f32* %80 = OpAccessChain %60 %14 
                                                      OpStore %80 %79 
                                 Private f32* %81 = OpAccessChain %60 %14 
                                          f32 %82 = OpLoad %81 
                                 Private f32* %83 = OpAccessChain %60 %14 
                                          f32 %84 = OpLoad %83 
                                          f32 %85 = OpFMul %82 %84 
                                                      OpStore %71 %85 
                                          f32 %87 = OpLoad %71 
                                          f32 %89 = OpFMul %87 %88 
                                          f32 %91 = OpFAdd %89 %90 
                                                      OpStore %86 %91 
                                          f32 %92 = OpLoad %71 
                                          f32 %93 = OpLoad %86 
                                          f32 %94 = OpFMul %92 %93 
                                          f32 %96 = OpFAdd %94 %95 
                                                      OpStore %86 %96 
                                          f32 %97 = OpLoad %71 
                                          f32 %98 = OpLoad %86 
                                          f32 %99 = OpFMul %97 %98 
                                         f32 %101 = OpFAdd %99 %100 
                                                      OpStore %86 %101 
                                         f32 %102 = OpLoad %71 
                                         f32 %103 = OpLoad %86 
                                         f32 %104 = OpFMul %102 %103 
                                         f32 %106 = OpFAdd %104 %105 
                                                      OpStore %71 %106 
                                         f32 %107 = OpLoad %71 
                                Private f32* %108 = OpAccessChain %60 %14 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %107 %109 
                                                      OpStore %86 %110 
                                         f32 %111 = OpLoad %86 
                                         f32 %113 = OpFMul %111 %112 
                                         f32 %115 = OpFAdd %113 %114 
                                                      OpStore %86 %115 
                                Private f32* %119 = OpAccessChain %23 %14 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpExtInst %1 4 %120 
                                        bool %122 = OpFOrdLessThan %64 %121 
                                                      OpStore %118 %122 
                                Private f32* %123 = OpAccessChain %23 %14 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpExtInst %1 37 %124 %64 
                                Private f32* %126 = OpAccessChain %23 %14 
                                                      OpStore %126 %125 
                                Private f32* %128 = OpAccessChain %23 %14 
                                         f32 %129 = OpLoad %128 
                                Private f32* %130 = OpAccessChain %23 %14 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpFNegate %131 
                                        bool %133 = OpFOrdLessThan %129 %132 
                                                      OpStore %127 %133 
                                        bool %136 = OpLoad %118 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %140 
                                             %137 = OpLabel 
                                         f32 %139 = OpLoad %86 
                                                      OpStore %135 %139 
                                                      OpBranch %138 
                                             %140 = OpLabel 
                                                      OpStore %135 %39 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                         f32 %141 = OpLoad %135 
                                                      OpStore %86 %141 
                                Private f32* %142 = OpAccessChain %60 %14 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpLoad %71 
                                         f32 %145 = OpFMul %143 %144 
                                         f32 %146 = OpLoad %86 
                                         f32 %147 = OpFAdd %145 %146 
                                Private f32* %148 = OpAccessChain %60 %14 
                                                      OpStore %148 %147 
                                        bool %150 = OpLoad %127 
                                                      OpSelectionMerge %152 None 
                                                      OpBranchConditional %150 %151 %156 
                                             %151 = OpLabel 
                                Private f32* %153 = OpAccessChain %60 %14 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                                      OpStore %149 %155 
                                                      OpBranch %152 
                                             %156 = OpLabel 
                                Private f32* %157 = OpAccessChain %60 %14 
                                         f32 %158 = OpLoad %157 
                                                      OpStore %149 %158 
                                                      OpBranch %152 
                                             %152 = OpLabel 
                                         f32 %159 = OpLoad %149 
                                Private f32* %160 = OpAccessChain %23 %14 
                                                      OpStore %160 %159 
                              Uniform f32_4* %163 = OpAccessChain %26 %161 
                                       f32_4 %164 = OpLoad %163 
                                       f32_2 %165 = OpVectorShuffle %164 %164 0 1 
                                Uniform f32* %167 = OpAccessChain %26 %166 
                                         f32 %168 = OpLoad %167 
                                       f32_2 %169 = OpCompositeConstruct %168 %168 
                                       f32_2 %170 = OpFMul %165 %169 
                                                      OpStore %60 %170 
                                Private f32* %171 = OpAccessChain %60 %14 
                                         f32 %172 = OpLoad %171 
                                Uniform f32* %174 = OpAccessChain %26 %173 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %172 %175 
                                Private f32* %177 = OpAccessChain %60 %14 
                                                      OpStore %177 %176 
                                Private f32* %178 = OpAccessChain %60 %14 
                                         f32 %179 = OpLoad %178 
                                         f32 %181 = OpFMul %179 %180 
                                                      OpStore %86 %181 
                                         f32 %183 = OpLoad %86 
                                         f32 %184 = OpLoad %86 
                                         f32 %185 = OpFNegate %184 
                                        bool %186 = OpFOrdGreaterThanEqual %183 %185 
                                                      OpStore %182 %186 
                                        bool %190 = OpLoad %182 
                                                      OpSelectionMerge %192 None 
                                                      OpBranchConditional %190 %191 %195 
                                             %191 = OpLabel 
                                                      OpStore %189 %194 
                                                      OpBranch %192 
                                             %195 = OpLabel 
                                                      OpStore %189 %198 
                                                      OpBranch %192 
                                             %192 = OpLabel 
                                       f32_2 %199 = OpLoad %189 
                                                      OpStore %187 %199 
                                Private f32* %200 = OpAccessChain %60 %14 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %187 %29 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFMul %201 %203 
                                Private f32* %205 = OpAccessChain %60 %14 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %60 %14 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpExtInst %1 10 %207 
                                Private f32* %209 = OpAccessChain %60 %14 
                                                      OpStore %209 %208 
                                Private f32* %210 = OpAccessChain %187 %14 
                                         f32 %211 = OpLoad %210 
                                Private f32* %212 = OpAccessChain %60 %14 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFMul %211 %213 
                                Private f32* %215 = OpAccessChain %23 %14 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFAdd %214 %216 
                                Private f32* %218 = OpAccessChain %23 %14 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %23 %14 
                                         f32 %220 = OpLoad %219 
                                Uniform f32* %222 = OpAccessChain %26 %221 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFMul %220 %223 
                                                      OpStore %86 %224 
                                         f32 %225 = OpLoad %86 
                                         f32 %226 = OpExtInst %1 14 %225 
                                                      OpStore %86 %226 
                              Uniform f32_4* %228 = OpAccessChain %26 %161 
                                       f32_4 %229 = OpLoad %228 
                                       f32_2 %230 = OpVectorShuffle %229 %229 0 0 
                                       f32_2 %233 = OpFMul %230 %232 
                                                      OpStore %227 %233 
                                       f32_2 %235 = OpLoad %227 
                                Uniform f32* %236 = OpAccessChain %26 %166 
                                         f32 %237 = OpLoad %236 
                                       f32_2 %238 = OpCompositeConstruct %237 %237 
                                       f32_2 %239 = OpFMul %235 %238 
                                       f32_4 %240 = OpLoad %9 
                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
                                       f32_2 %242 = OpFAdd %239 %241 
                                       f32_4 %243 = OpLoad %234 
                                       f32_4 %244 = OpVectorShuffle %243 %242 4 5 2 3 
                                                      OpStore %234 %244 
                              Uniform f32_4* %245 = OpAccessChain %26 %161 
                                       f32_4 %246 = OpLoad %245 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 0 
                                Uniform f32* %248 = OpAccessChain %26 %166 
                                         f32 %249 = OpLoad %248 
                                       f32_2 %250 = OpCompositeConstruct %249 %249 
                                       f32_2 %251 = OpFMul %247 %250 
                                       f32_4 %252 = OpLoad %9 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                       f32_2 %254 = OpFAdd %251 %253 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpVectorShuffle %255 %254 4 5 2 3 
                                                      OpStore %9 %256 
                                       f32_4 %257 = OpLoad %9 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 1 
                                       f32_2 %259 = OpExtInst %1 10 %258 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 2 3 
                                                      OpStore %9 %261 
                  read_only Texture2DSampled %267 = OpLoad %266 
                                       f32_4 %268 = OpLoad %9 
                                       f32_2 %269 = OpVectorShuffle %268 %268 0 1 
                                       f32_4 %270 = OpImageSampleImplicitLod %267 %269 
                                       f32_2 %271 = OpVectorShuffle %270 %270 0 2 
                                                      OpStore %262 %271 
                                       f32_4 %272 = OpLoad %234 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                                       f32_2 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %234 
                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 2 3 
                                                      OpStore %234 %278 
                                       f32_4 %279 = OpLoad %234 
                                       f32_2 %280 = OpVectorShuffle %279 %279 0 1 
                                       f32_2 %281 = OpExtInst %1 10 %280 
                                       f32_4 %282 = OpLoad %234 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 2 3 
                                                      OpStore %234 %283 
                  read_only Texture2DSampled %285 = OpLoad %266 
                                       f32_4 %286 = OpLoad %234 
                                       f32_2 %287 = OpVectorShuffle %286 %286 0 1 
                                       f32_4 %288 = OpImageSampleImplicitLod %285 %287 
                                       f32_2 %289 = OpVectorShuffle %288 %288 1 2 
                                                      OpStore %284 %289 
                                Private f32* %291 = OpAccessChain %284 %29 
                                         f32 %292 = OpLoad %291 
                                         f32 %294 = OpFMul %292 %293 
                                Private f32* %295 = OpAccessChain %60 %29 
                                         f32 %296 = OpLoad %295 
                                         f32 %297 = OpFAdd %294 %296 
                                                      OpStore %290 %297 
                                         f32 %298 = OpLoad %290 
                                         f32 %299 = OpExtInst %1 13 %298 
                                                      OpStore %290 %299 
                                         f32 %300 = OpLoad %290 
                                         f32 %301 = OpFAdd %300 %64 
                                                      OpStore %290 %301 
                              Uniform f32_4* %304 = OpAccessChain %26 %303 
                                       f32_4 %305 = OpLoad %304 
                                       f32_2 %306 = OpVectorShuffle %305 %305 0 2 
                                       f32_2 %307 = OpFNegate %306 
                              Uniform f32_4* %308 = OpAccessChain %26 %303 
                                       f32_4 %309 = OpLoad %308 
                                       f32_2 %310 = OpVectorShuffle %309 %309 1 3 
                                       f32_2 %311 = OpFAdd %307 %310 
                                                      OpStore %302 %311 
                                         f32 %312 = OpLoad %290 
                                Private f32* %313 = OpAccessChain %302 %14 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFMul %312 %314 
                                                      OpStore %290 %315 
                                         f32 %316 = OpLoad %290 
                                         f32 %318 = OpFMul %316 %317 
                                Uniform f32* %319 = OpAccessChain %26 %303 %14 
                                         f32 %320 = OpLoad %319 
                                         f32 %321 = OpFAdd %318 %320 
                                                      OpStore %290 %321 
                                       f32_2 %323 = OpLoad %48 
                                         f32 %324 = OpLoad %290 
                                       f32_2 %325 = OpCompositeConstruct %324 %324 
                                       f32_2 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %322 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %322 %328 
                                       f32_2 %329 = OpLoad %284 
                                       f32_2 %330 = OpVectorShuffle %329 %329 0 0 
                                       f32_4 %331 = OpLoad %322 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                       f32_2 %333 = OpFMul %330 %332 
                                       f32_4 %334 = OpLoad %322 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 2 3 
                                                      OpStore %322 %335 
                                       f32_2 %336 = OpLoad %284 
                                       f32_2 %337 = OpVectorShuffle %336 %336 1 1 
                                       f32_4 %338 = OpLoad %322 
                                       f32_2 %339 = OpVectorShuffle %338 %338 0 1 
                                       f32_2 %340 = OpFMul %337 %339 
                                       f32_4 %341 = OpLoad %234 
                                       f32_4 %342 = OpVectorShuffle %341 %340 4 5 2 3 
                                                      OpStore %234 %342 
                                         f32 %343 = OpLoad %86 
                                       f32_2 %344 = OpCompositeConstruct %343 %343 
                                       f32_4 %345 = OpLoad %234 
                                       f32_2 %346 = OpVectorShuffle %345 %345 0 1 
                                       f32_2 %347 = OpFMul %344 %346 
                                       f32_2 %348 = OpLoad %48 
                                       f32_2 %349 = OpFAdd %347 %348 
                                                      OpStore %48 %349 
                                Private f32* %350 = OpAccessChain %60 %29 
                                         f32 %351 = OpLoad %350 
                                Private f32* %352 = OpAccessChain %60 %29 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFAdd %351 %353 
                                                      OpStore %86 %354 
                                         f32 %355 = OpLoad %86 
                                         f32 %356 = OpExtInst %1 13 %355 
                                                      OpStore %86 %356 
                                         f32 %357 = OpLoad %86 
                                         f32 %358 = OpFAdd %357 %64 
                                                      OpStore %86 %358 
                                         f32 %359 = OpLoad %86 
                                         f32 %360 = OpFMul %359 %317 
                                                      OpStore %86 %360 
                                         f32 %361 = OpLoad %86 
                                Private f32* %362 = OpAccessChain %302 %29 
                                         f32 %363 = OpLoad %362 
                                         f32 %364 = OpFMul %361 %363 
                                Uniform f32* %365 = OpAccessChain %26 %303 %18 
                                         f32 %366 = OpLoad %365 
                                         f32 %367 = OpFAdd %364 %366 
                                                      OpStore %86 %367 
                                Private f32* %368 = OpAccessChain %262 %14 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpLoad %86 
                                         f32 %371 = OpFMul %369 %370 
                                Private f32* %372 = OpAccessChain %9 %14 
                                                      OpStore %372 %371 
                                Private f32* %374 = OpAccessChain %262 %29 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpFMul %375 %317 
                                Private f32* %377 = OpAccessChain %23 %14 
                                         f32 %378 = OpLoad %377 
                                         f32 %379 = OpFAdd %376 %378 
                                Private f32* %380 = OpAccessChain %373 %14 
                                                      OpStore %380 %379 
                                Private f32* %381 = OpAccessChain %373 %14 
                                         f32 %382 = OpLoad %381 
                                Uniform f32* %384 = OpAccessChain %26 %383 
                                         f32 %385 = OpLoad %384 
                                         f32 %386 = OpFMul %382 %385 
                                Private f32* %387 = OpAccessChain %373 %14 
                                                      OpStore %387 %386 
                                Private f32* %388 = OpAccessChain %373 %14 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpExtInst %1 13 %389 
                                Private f32* %391 = OpAccessChain %373 %14 
                                                      OpStore %391 %390 
                                       f32_4 %392 = OpLoad %9 
                                       f32_2 %393 = OpVectorShuffle %392 %392 0 0 
                                       f32_2 %394 = OpLoad %48 
                                       f32_2 %395 = OpFMul %393 %394 
                                       f32_4 %396 = OpLoad %234 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 5 2 3 
                                                      OpStore %234 %397 
                                       f32_3 %398 = OpLoad %373 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 0 
                                       f32_4 %400 = OpLoad %234 
                                       f32_2 %401 = OpVectorShuffle %400 %400 0 1 
                                       f32_2 %402 = OpFMul %399 %401 
                                       f32_2 %403 = OpLoad %48 
                                       f32_2 %404 = OpFAdd %402 %403 
                                       f32_4 %405 = OpLoad %9 
                                       f32_4 %406 = OpVectorShuffle %405 %404 4 5 2 3 
                                                      OpStore %9 %406 
                                       f32_4 %407 = OpLoad %9 
                                       f32_2 %408 = OpVectorShuffle %407 %407 0 1 
                                       f32_4 %409 = OpLoad %9 
                                       f32_2 %410 = OpVectorShuffle %409 %409 0 1 
                                         f32 %411 = OpDot %408 %410 
                                Private f32* %412 = OpAccessChain %9 %14 
                                                      OpStore %412 %411 
                                Private f32* %413 = OpAccessChain %9 %14 
                                         f32 %414 = OpLoad %413 
                                         f32 %415 = OpExtInst %1 31 %414 
                                Private f32* %416 = OpAccessChain %9 %14 
                                                      OpStore %416 %415 
                                Private f32* %417 = OpAccessChain %9 %14 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFNegate %418 
                                Uniform f32* %421 = OpAccessChain %26 %420 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFAdd %419 %422 
                                Private f32* %424 = OpAccessChain %9 %14 
                                                      OpStore %424 %423 
                                Private f32* %428 = OpAccessChain %9 %14 
                                         f32 %429 = OpLoad %428 
                                        bool %430 = OpFOrdLessThan %429 %39 
                                      bool_2 %431 = OpLoad %427 
                                      bool_2 %432 = OpCompositeInsert %430 %431 0 
                                                      OpStore %427 %432 
                                      bool_2 %433 = OpLoad %427 
                                        bool %434 = OpCompositeExtract %433 0 
                                         i32 %435 = OpSelect %434 %28 %161 
                                         i32 %437 = OpIMul %435 %436 
                                        bool %438 = OpINotEqual %437 %161 
                                                      OpSelectionMerge %440 None 
                                                      OpBranchConditional %438 %439 %440 
                                             %439 = OpLabel 
                                                      OpKill
                                             %440 = OpLabel 
                                       f32_4 %444 = OpLoad %443 
                                       f32_4 %445 = OpVectorShuffle %444 %444 0 1 0 1 
                              Uniform f32_4* %447 = OpAccessChain %26 %446 
                                       f32_4 %448 = OpLoad %447 
                                       f32_4 %449 = OpFNegate %448 
                                       f32_4 %450 = OpFAdd %445 %449 
                                                      OpStore %9 %450 
                                       f32_4 %451 = OpLoad %9 
                                       f32_4 %452 = OpVectorShuffle %451 %451 0 1 0 1 
                                       f32_4 %454 = OpFAdd %452 %453 
                                                      OpStore %322 %454 
                                       f32_4 %455 = OpLoad %9 
                                       f32_4 %456 = OpVectorShuffle %455 %455 2 3 2 3 
                                       f32_4 %457 = OpFAdd %456 %453 
                                                      OpStore %9 %457 
                                Private f32* %459 = OpAccessChain %322 %458 
                                         f32 %460 = OpLoad %459 
                                Private f32* %461 = OpAccessChain %322 %18 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFDiv %460 %462 
                                Private f32* %464 = OpAccessChain %23 %14 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %23 %14 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpExtInst %1 4 %466 
                                         f32 %468 = OpExtInst %1 40 %467 %64 
                                                      OpStore %290 %468 
                                         f32 %469 = OpLoad %290 
                                         f32 %470 = OpFDiv %64 %469 
                                                      OpStore %290 %470 
                                Private f32* %471 = OpAccessChain %23 %14 
                                         f32 %472 = OpLoad %471 
                                         f32 %473 = OpExtInst %1 4 %472 
                                         f32 %474 = OpExtInst %1 37 %473 %64 
                                Private f32* %475 = OpAccessChain %234 %14 
                                                      OpStore %475 %474 
                                         f32 %476 = OpLoad %290 
                                Private f32* %477 = OpAccessChain %234 %14 
                                         f32 %478 = OpLoad %477 
                                         f32 %479 = OpFMul %476 %478 
                                                      OpStore %290 %479 
                                         f32 %480 = OpLoad %290 
                                         f32 %481 = OpLoad %290 
                                         f32 %482 = OpFMul %480 %481 
                                Private f32* %483 = OpAccessChain %234 %14 
                                                      OpStore %483 %482 
                                Private f32* %485 = OpAccessChain %234 %14 
                                         f32 %486 = OpLoad %485 
                                         f32 %487 = OpFMul %486 %88 
                                         f32 %488 = OpFAdd %487 %90 
                                                      OpStore %484 %488 
                                Private f32* %489 = OpAccessChain %234 %14 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpLoad %484 
                                         f32 %492 = OpFMul %490 %491 
                                         f32 %493 = OpFAdd %492 %95 
                                                      OpStore %484 %493 
                                Private f32* %494 = OpAccessChain %234 %14 
                                         f32 %495 = OpLoad %494 
                                         f32 %496 = OpLoad %484 
                                         f32 %497 = OpFMul %495 %496 
                                         f32 %498 = OpFAdd %497 %100 
                                                      OpStore %484 %498 
                                Private f32* %499 = OpAccessChain %234 %14 
                                         f32 %500 = OpLoad %499 
                                         f32 %501 = OpLoad %484 
                                         f32 %502 = OpFMul %500 %501 
                                         f32 %503 = OpFAdd %502 %105 
                                Private f32* %504 = OpAccessChain %234 %14 
                                                      OpStore %504 %503 
                                         f32 %505 = OpLoad %290 
                                Private f32* %506 = OpAccessChain %234 %14 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpFMul %505 %507 
                                                      OpStore %484 %508 
                                         f32 %509 = OpLoad %484 
                                         f32 %510 = OpFMul %509 %112 
                                         f32 %511 = OpFAdd %510 %114 
                                                      OpStore %484 %511 
                                Private f32* %513 = OpAccessChain %23 %14 
                                         f32 %514 = OpLoad %513 
                                         f32 %515 = OpExtInst %1 4 %514 
                                        bool %516 = OpFOrdLessThan %64 %515 
                                                      OpStore %512 %516 
                                Private f32* %517 = OpAccessChain %23 %14 
                                         f32 %518 = OpLoad %517 
                                         f32 %519 = OpExtInst %1 37 %518 %64 
                                Private f32* %520 = OpAccessChain %23 %14 
                                                      OpStore %520 %519 
                                Private f32* %521 = OpAccessChain %23 %14 
                                         f32 %522 = OpLoad %521 
                                Private f32* %523 = OpAccessChain %23 %14 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpFNegate %524 
                                        bool %526 = OpFOrdLessThan %522 %525 
                                                      OpStore %127 %526 
                                        bool %528 = OpLoad %512 
                                                      OpSelectionMerge %530 None 
                                                      OpBranchConditional %528 %529 %532 
                                             %529 = OpLabel 
                                         f32 %531 = OpLoad %484 
                                                      OpStore %527 %531 
                                                      OpBranch %530 
                                             %532 = OpLabel 
                                                      OpStore %527 %39 
                                                      OpBranch %530 
                                             %530 = OpLabel 
                                         f32 %533 = OpLoad %527 
                                                      OpStore %484 %533 
                                         f32 %534 = OpLoad %290 
                                Private f32* %535 = OpAccessChain %234 %14 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpFMul %534 %536 
                                         f32 %538 = OpLoad %484 
                                         f32 %539 = OpFAdd %537 %538 
                                                      OpStore %290 %539 
                                        bool %541 = OpLoad %127 
                                                      OpSelectionMerge %543 None 
                                                      OpBranchConditional %541 %542 %546 
                                             %542 = OpLabel 
                                         f32 %544 = OpLoad %290 
                                         f32 %545 = OpFNegate %544 
                                                      OpStore %540 %545 
                                                      OpBranch %543 
                                             %546 = OpLabel 
                                         f32 %547 = OpLoad %290 
                                                      OpStore %540 %547 
                                                      OpBranch %543 
                                             %543 = OpLabel 
                                         f32 %548 = OpLoad %540 
                                Private f32* %549 = OpAccessChain %23 %14 
                                                      OpStore %549 %548 
                                Private f32* %550 = OpAccessChain %187 %14 
                                         f32 %551 = OpLoad %550 
                                Private f32* %552 = OpAccessChain %60 %14 
                                         f32 %553 = OpLoad %552 
                                         f32 %554 = OpFMul %551 %553 
                                Private f32* %555 = OpAccessChain %23 %14 
                                         f32 %556 = OpLoad %555 
                                         f32 %557 = OpFAdd %554 %556 
                                Private f32* %558 = OpAccessChain %23 %14 
                                                      OpStore %558 %557 
                                Private f32* %559 = OpAccessChain %23 %14 
                                         f32 %560 = OpLoad %559 
                                Uniform f32* %561 = OpAccessChain %26 %221 
                                         f32 %562 = OpLoad %561 
                                         f32 %563 = OpFMul %560 %562 
                                                      OpStore %290 %563 
                                         f32 %564 = OpLoad %290 
                                         f32 %565 = OpExtInst %1 14 %564 
                                                      OpStore %290 %565 
                                       f32_2 %566 = OpLoad %227 
                                Uniform f32* %567 = OpAccessChain %26 %166 
                                         f32 %568 = OpLoad %567 
                                       f32_2 %569 = OpCompositeConstruct %568 %568 
                                       f32_2 %570 = OpFMul %566 %569 
                                       f32_4 %571 = OpLoad %322 
                                       f32_2 %572 = OpVectorShuffle %571 %571 0 1 
                                       f32_2 %573 = OpFAdd %570 %572 
                                       f32_4 %574 = OpLoad %234 
                                       f32_4 %575 = OpVectorShuffle %574 %573 4 5 2 3 
                                                      OpStore %234 %575 
                                       f32_4 %576 = OpLoad %234 
                                       f32_2 %577 = OpVectorShuffle %576 %576 0 1 
                                       f32_2 %578 = OpFMul %577 %275 
                                       f32_4 %579 = OpLoad %234 
                                       f32_4 %580 = OpVectorShuffle %579 %578 4 5 2 3 
                                                      OpStore %234 %580 
                                       f32_4 %581 = OpLoad %234 
                                       f32_2 %582 = OpVectorShuffle %581 %581 0 1 
                                       f32_2 %583 = OpExtInst %1 10 %582 
                                       f32_4 %584 = OpLoad %234 
                                       f32_4 %585 = OpVectorShuffle %584 %583 4 5 2 3 
                                                      OpStore %234 %585 
                  read_only Texture2DSampled %586 = OpLoad %266 
                                       f32_4 %587 = OpLoad %234 
                                       f32_2 %588 = OpVectorShuffle %587 %587 0 1 
                                       f32_4 %589 = OpImageSampleImplicitLod %586 %588 
                                       f32_2 %590 = OpVectorShuffle %589 %589 1 2 
                                                      OpStore %284 %590 
                              Uniform f32_4* %592 = OpAccessChain %26 %446 
                                       f32_4 %593 = OpLoad %592 
                              Uniform f32_4* %594 = OpAccessChain %26 %446 
                                       f32_4 %595 = OpLoad %594 
                                       f32_4 %596 = OpFAdd %593 %595 
                                                      OpStore %591 %596 
                              Uniform f32_4* %598 = OpAccessChain %26 %161 
                                       f32_4 %599 = OpLoad %598 
                                       f32_2 %600 = OpVectorShuffle %599 %599 1 1 
                                Uniform f32* %601 = OpAccessChain %26 %166 
                                         f32 %602 = OpLoad %601 
                                       f32_2 %603 = OpCompositeConstruct %602 %602 
                                       f32_2 %604 = OpFMul %600 %603 
                                       f32_4 %605 = OpLoad %591 
                                       f32_2 %606 = OpVectorShuffle %605 %605 0 2 
                                       f32_2 %607 = OpFAdd %604 %606 
                                                      OpStore %597 %607 
                                       f32_4 %608 = OpLoad %591 
                                       f32_2 %609 = OpVectorShuffle %608 %608 1 3 
                                       f32_4 %610 = OpLoad %591 
                                       f32_2 %611 = OpVectorShuffle %610 %610 0 2 
                                       f32_2 %612 = OpFAdd %609 %611 
                                       f32_4 %613 = OpLoad %591 
                                       f32_4 %614 = OpVectorShuffle %613 %612 4 5 2 3 
                                                      OpStore %591 %614 
                                       f32_2 %615 = OpLoad %60 
                                       f32_2 %616 = OpVectorShuffle %615 %615 1 1 
                                       f32_2 %619 = OpFMul %616 %618 
                                       f32_4 %620 = OpLoad %591 
                                       f32_2 %621 = OpVectorShuffle %620 %620 0 1 
                                       f32_2 %622 = OpFAdd %619 %621 
                                       f32_4 %623 = OpLoad %591 
                                       f32_4 %624 = OpVectorShuffle %623 %622 4 5 2 3 
                                                      OpStore %591 %624 
                                       f32_4 %625 = OpLoad %591 
                                       f32_2 %626 = OpVectorShuffle %625 %625 0 1 
                                       f32_2 %627 = OpExtInst %1 13 %626 
                                       f32_4 %628 = OpLoad %591 
                                       f32_4 %629 = OpVectorShuffle %628 %627 4 5 2 3 
                                                      OpStore %591 %629 
                                       f32_4 %630 = OpLoad %591 
                                       f32_2 %631 = OpVectorShuffle %630 %630 0 1 
                                       f32_2 %633 = OpFAdd %631 %632 
                                       f32_4 %634 = OpLoad %591 
                                       f32_4 %635 = OpVectorShuffle %634 %633 4 5 2 3 
                                                      OpStore %591 %635 
                                       f32_2 %636 = OpLoad %302 
                                       f32_2 %637 = OpVectorShuffle %636 %636 1 1 
                                       f32_4 %638 = OpLoad %591 
                                       f32_2 %639 = OpVectorShuffle %638 %638 0 1 
                                       f32_2 %640 = OpFMul %637 %639 
                                       f32_4 %641 = OpLoad %591 
                                       f32_4 %642 = OpVectorShuffle %641 %640 4 5 2 3 
                                                      OpStore %591 %642 
                                       f32_4 %643 = OpLoad %591 
                                       f32_2 %644 = OpVectorShuffle %643 %643 0 1 
                                       f32_2 %646 = OpFMul %644 %645 
                              Uniform f32_4* %647 = OpAccessChain %26 %303 
                                       f32_4 %648 = OpLoad %647 
                                       f32_2 %649 = OpVectorShuffle %648 %648 2 2 
                                       f32_2 %650 = OpFAdd %646 %649 
                                       f32_4 %651 = OpLoad %591 
                                       f32_4 %652 = OpVectorShuffle %651 %650 4 5 2 3 
                                                      OpStore %591 %652 
                              Uniform f32_4* %654 = OpAccessChain %26 %446 
                                       f32_4 %655 = OpLoad %654 
                                       f32_2 %656 = OpVectorShuffle %655 %655 1 3 
                                       f32_2 %657 = OpFMul %656 %618 
                                       f32_2 %658 = OpLoad %597 
                                       f32_2 %659 = OpFAdd %657 %658 
                                                      OpStore %653 %659 
                                Private f32* %661 = OpAccessChain %284 %29 
                                         f32 %662 = OpLoad %661 
                                         f32 %663 = OpFMul %662 %293 
                                Private f32* %664 = OpAccessChain %653 %14 
                                         f32 %665 = OpLoad %664 
                                         f32 %666 = OpFAdd %663 %665 
                                                      OpStore %660 %666 
                                         f32 %667 = OpLoad %660 
                                         f32 %668 = OpExtInst %1 13 %667 
                                                      OpStore %660 %668 
                                         f32 %669 = OpLoad %660 
                                         f32 %670 = OpFAdd %669 %64 
                                                      OpStore %660 %670 
                                Private f32* %671 = OpAccessChain %302 %14 
                                         f32 %672 = OpLoad %671 
                                         f32 %673 = OpLoad %660 
                                         f32 %674 = OpFMul %672 %673 
                                                      OpStore %660 %674 
                                         f32 %675 = OpLoad %660 
                                         f32 %676 = OpFMul %675 %317 
                                Uniform f32* %677 = OpAccessChain %26 %303 %14 
                                         f32 %678 = OpLoad %677 
                                         f32 %679 = OpFAdd %676 %678 
                                                      OpStore %660 %679 
                                         f32 %680 = OpLoad %660 
                                       f32_2 %681 = OpCompositeConstruct %680 %680 
                                       f32_4 %682 = OpLoad %322 
                                       f32_2 %683 = OpVectorShuffle %682 %682 2 3 
                                       f32_2 %684 = OpFMul %681 %683 
                                                      OpStore %597 %684 
                                       f32_2 %685 = OpLoad %284 
                                       f32_2 %686 = OpVectorShuffle %685 %685 0 0 
                                       f32_2 %687 = OpLoad %597 
                                       f32_2 %688 = OpFMul %686 %687 
                                       f32_4 %689 = OpLoad %234 
                                       f32_4 %690 = OpVectorShuffle %689 %688 4 1 2 5 
                                                      OpStore %234 %690 
                                       f32_2 %691 = OpLoad %284 
                                       f32_2 %692 = OpVectorShuffle %691 %691 1 1 
                                       f32_4 %693 = OpLoad %234 
                                       f32_2 %694 = OpVectorShuffle %693 %693 0 3 
                                       f32_2 %695 = OpFMul %692 %694 
                                       f32_4 %696 = OpLoad %234 
                                       f32_4 %697 = OpVectorShuffle %696 %695 4 5 2 3 
                                                      OpStore %234 %697 
                                         f32 %698 = OpLoad %290 
                                       f32_2 %699 = OpCompositeConstruct %698 %698 
                                       f32_4 %700 = OpLoad %234 
                                       f32_2 %701 = OpVectorShuffle %700 %700 0 1 
                                       f32_2 %702 = OpFMul %699 %701 
                                       f32_4 %703 = OpLoad %322 
                                       f32_2 %704 = OpVectorShuffle %703 %703 2 3 
                                       f32_2 %705 = OpFAdd %702 %704 
                                       f32_4 %706 = OpLoad %234 
                                       f32_4 %707 = OpVectorShuffle %706 %705 4 5 2 3 
                                                      OpStore %234 %707 
                              Uniform f32_4* %708 = OpAccessChain %26 %161 
                                       f32_4 %709 = OpLoad %708 
                                       f32_2 %710 = OpVectorShuffle %709 %709 0 0 
                                Uniform f32* %711 = OpAccessChain %26 %166 
                                         f32 %712 = OpLoad %711 
                                       f32_2 %713 = OpCompositeConstruct %712 %712 
                                       f32_2 %714 = OpFMul %710 %713 
                                       f32_4 %715 = OpLoad %322 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 1 
                                       f32_2 %717 = OpFAdd %714 %716 
                                       f32_4 %718 = OpLoad %322 
                                       f32_4 %719 = OpVectorShuffle %718 %717 4 5 2 3 
                                                      OpStore %322 %719 
                                       f32_4 %720 = OpLoad %322 
                                       f32_2 %721 = OpVectorShuffle %720 %720 0 1 
                                       f32_2 %722 = OpExtInst %1 10 %721 
                                       f32_4 %723 = OpLoad %322 
                                       f32_4 %724 = OpVectorShuffle %723 %722 4 5 2 3 
                                                      OpStore %322 %724 
                  read_only Texture2DSampled %726 = OpLoad %266 
                                       f32_4 %727 = OpLoad %322 
                                       f32_2 %728 = OpVectorShuffle %727 %727 0 1 
                                       f32_4 %729 = OpImageSampleImplicitLod %726 %728 
                                       f32_2 %730 = OpVectorShuffle %729 %729 0 2 
                                                      OpStore %725 %730 
                                Private f32* %731 = OpAccessChain %725 %14 
                                         f32 %732 = OpLoad %731 
                                Private f32* %733 = OpAccessChain %591 %14 
                                         f32 %734 = OpLoad %733 
                                         f32 %735 = OpFMul %732 %734 
                                                      OpStore %290 %735 
                                Private f32* %736 = OpAccessChain %725 %29 
                                         f32 %737 = OpLoad %736 
                                         f32 %738 = OpFMul %737 %317 
                                Private f32* %739 = OpAccessChain %23 %14 
                                         f32 %740 = OpLoad %739 
                                         f32 %741 = OpFAdd %738 %740 
                                Private f32* %742 = OpAccessChain %23 %14 
                                                      OpStore %742 %741 
                                Private f32* %743 = OpAccessChain %23 %14 
                                         f32 %744 = OpLoad %743 
                                Uniform f32* %745 = OpAccessChain %26 %383 
                                         f32 %746 = OpLoad %745 
                                         f32 %747 = OpFMul %744 %746 
                                Private f32* %748 = OpAccessChain %23 %14 
                                                      OpStore %748 %747 
                                Private f32* %749 = OpAccessChain %23 %14 
                                         f32 %750 = OpLoad %749 
                                         f32 %751 = OpExtInst %1 13 %750 
                                Private f32* %752 = OpAccessChain %23 %14 
                                                      OpStore %752 %751 
                                         f32 %753 = OpLoad %290 
                                       f32_2 %754 = OpCompositeConstruct %753 %753 
                                       f32_4 %755 = OpLoad %234 
                                       f32_2 %756 = OpVectorShuffle %755 %755 0 1 
                                       f32_2 %757 = OpFMul %754 %756 
                                       f32_4 %758 = OpLoad %322 
                                       f32_4 %759 = OpVectorShuffle %758 %757 4 5 2 3 
                                                      OpStore %322 %759 
                                       f32_3 %760 = OpLoad %23 
                                       f32_2 %761 = OpVectorShuffle %760 %760 0 0 
                                       f32_4 %762 = OpLoad %322 
                                       f32_2 %763 = OpVectorShuffle %762 %762 0 1 
                                       f32_2 %764 = OpFMul %761 %763 
                                       f32_4 %765 = OpLoad %234 
                                       f32_2 %766 = OpVectorShuffle %765 %765 0 1 
                                       f32_2 %767 = OpFAdd %764 %766 
                                       f32_4 %768 = OpLoad %234 
                                       f32_4 %769 = OpVectorShuffle %768 %767 4 5 2 3 
                                                      OpStore %234 %769 
                                       f32_4 %770 = OpLoad %234 
                                       f32_2 %771 = OpVectorShuffle %770 %770 0 1 
                                       f32_4 %772 = OpLoad %234 
                                       f32_2 %773 = OpVectorShuffle %772 %772 0 1 
                                         f32 %774 = OpDot %771 %773 
                                Private f32* %775 = OpAccessChain %23 %14 
                                                      OpStore %775 %774 
                                       f32_4 %776 = OpLoad %234 
                                       f32_2 %777 = OpVectorShuffle %776 %776 0 1 
                                       f32_2 %779 = OpFAdd %777 %778 
                                       f32_4 %780 = OpLoad %234 
                                       f32_4 %781 = OpVectorShuffle %780 %779 4 5 2 3 
                                                      OpStore %234 %781 
                                       f32_4 %782 = OpLoad %234 
                                       f32_2 %783 = OpVectorShuffle %782 %782 0 1 
                                       f32_4 %784 = OpLoad %234 
                                       f32_2 %785 = OpVectorShuffle %784 %784 0 1 
                                         f32 %786 = OpDot %783 %785 
                                                      OpStore %290 %786 
                                         f32 %787 = OpLoad %290 
                                         f32 %788 = OpExtInst %1 31 %787 
                                                      OpStore %290 %788 
                                         f32 %789 = OpLoad %290 
                                         f32 %790 = OpFNegate %789 
                                         f32 %792 = OpFAdd %790 %791 
                                                      OpStore %290 %792 
                                         f32 %795 = OpLoad %290 
                                        bool %796 = OpFOrdLessThan %794 %795 
                                                      OpStore %793 %796 
                                Private f32* %797 = OpAccessChain %23 %14 
                                         f32 %798 = OpLoad %797 
                                         f32 %799 = OpExtInst %1 31 %798 
                                Private f32* %800 = OpAccessChain %23 %14 
                                                      OpStore %800 %799 
                                Private f32* %801 = OpAccessChain %23 %14 
                                         f32 %802 = OpLoad %801 
                                         f32 %803 = OpFNegate %802 
                                         f32 %804 = OpFAdd %803 %791 
                                Private f32* %805 = OpAccessChain %23 %14 
                                                      OpStore %805 %804 
                                Private f32* %806 = OpAccessChain %23 %14 
                                         f32 %807 = OpLoad %806 
                                        bool %808 = OpFOrdLessThan %794 %807 
                                                      OpStore %127 %808 
                                        bool %809 = OpLoad %127 
                                         i32 %810 = OpSelect %809 %28 %161 
                                         i32 %811 = OpIMul %810 %436 
                                        bool %812 = OpINotEqual %811 %161 
                                                      OpSelectionMerge %814 None 
                                                      OpBranchConditional %812 %813 %814 
                                             %813 = OpLabel 
                                                      OpKill
                                             %814 = OpLabel 
                                       f32_2 %816 = OpLoad %227 
                                Uniform f32* %817 = OpAccessChain %26 %166 
                                         f32 %818 = OpLoad %817 
                                       f32_2 %819 = OpCompositeConstruct %818 %818 
                                       f32_2 %820 = OpFMul %816 %819 
                                       f32_4 %821 = OpLoad %9 
                                       f32_2 %822 = OpVectorShuffle %821 %821 0 1 
                                       f32_2 %823 = OpFAdd %820 %822 
                                       f32_4 %824 = OpLoad %234 
                                       f32_4 %825 = OpVectorShuffle %824 %823 4 5 2 3 
                                                      OpStore %234 %825 
                                       f32_2 %826 = OpLoad %227 
                                Uniform f32* %827 = OpAccessChain %26 %166 
                                         f32 %828 = OpLoad %827 
                                       f32_2 %829 = OpCompositeConstruct %828 %828 
                                       f32_2 %830 = OpFMul %826 %829 
                                       f32_2 %831 = OpLoad %12 
                                       f32_2 %832 = OpFAdd %830 %831 
                                                      OpStore %227 %832 
                                       f32_2 %833 = OpLoad %227 
                                       f32_2 %834 = OpFMul %833 %275 
                                                      OpStore %227 %834 
                                       f32_2 %835 = OpLoad %227 
                                       f32_2 %836 = OpExtInst %1 10 %835 
                                                      OpStore %227 %836 
                  read_only Texture2DSampled %838 = OpLoad %266 
                                       f32_2 %839 = OpLoad %227 
                                       f32_4 %840 = OpImageSampleImplicitLod %838 %839 
                                       f32_2 %841 = OpVectorShuffle %840 %840 1 2 
                                                      OpStore %837 %841 
                                       f32_4 %842 = OpLoad %234 
                                       f32_2 %843 = OpVectorShuffle %842 %842 0 1 
                                       f32_2 %844 = OpFMul %843 %275 
                                       f32_4 %845 = OpLoad %234 
                                       f32_4 %846 = OpVectorShuffle %845 %844 4 5 2 3 
                                                      OpStore %234 %846 
                                       f32_4 %847 = OpLoad %234 
                                       f32_2 %848 = OpVectorShuffle %847 %847 0 1 
                                       f32_2 %849 = OpExtInst %1 10 %848 
                                       f32_4 %850 = OpLoad %234 
                                       f32_4 %851 = OpVectorShuffle %850 %849 4 5 2 3 
                                                      OpStore %234 %851 
                  read_only Texture2DSampled %852 = OpLoad %266 
                                       f32_4 %853 = OpLoad %234 
                                       f32_2 %854 = OpVectorShuffle %853 %853 0 1 
                                       f32_4 %855 = OpImageSampleImplicitLod %852 %854 
                                       f32_2 %856 = OpVectorShuffle %855 %855 1 2 
                                                      OpStore %284 %856 
                                Private f32* %857 = OpAccessChain %284 %29 
                                         f32 %858 = OpLoad %857 
                                         f32 %859 = OpFMul %858 %293 
                                Private f32* %860 = OpAccessChain %653 %29 
                                         f32 %861 = OpLoad %860 
                                         f32 %862 = OpFAdd %859 %861 
                                Private f32* %863 = OpAccessChain %23 %14 
                                                      OpStore %863 %862 
                                Private f32* %864 = OpAccessChain %23 %14 
                                         f32 %865 = OpLoad %864 
                                         f32 %866 = OpExtInst %1 13 %865 
                                Private f32* %867 = OpAccessChain %23 %14 
                                                      OpStore %867 %866 
                                Private f32* %868 = OpAccessChain %23 %14 
                                         f32 %869 = OpLoad %868 
                                         f32 %870 = OpFAdd %869 %64 
                                Private f32* %871 = OpAccessChain %23 %14 
                                                      OpStore %871 %870 
                                Private f32* %872 = OpAccessChain %302 %14 
                                         f32 %873 = OpLoad %872 
                                Private f32* %874 = OpAccessChain %23 %14 
                                         f32 %875 = OpLoad %874 
                                         f32 %876 = OpFMul %873 %875 
                                Private f32* %877 = OpAccessChain %23 %14 
                                                      OpStore %877 %876 
                                Private f32* %878 = OpAccessChain %23 %14 
                                         f32 %879 = OpLoad %878 
                                         f32 %880 = OpFMul %879 %317 
                                Uniform f32* %881 = OpAccessChain %26 %303 %14 
                                         f32 %882 = OpLoad %881 
                                         f32 %883 = OpFAdd %880 %882 
                                Private f32* %884 = OpAccessChain %23 %14 
                                                      OpStore %884 %883 
                                       f32_4 %885 = OpLoad %9 
                                       f32_2 %886 = OpVectorShuffle %885 %885 2 3 
                                       f32_3 %887 = OpLoad %23 
                                       f32_2 %888 = OpVectorShuffle %887 %887 0 0 
                                       f32_2 %889 = OpFMul %886 %888 
                                       f32_4 %890 = OpLoad %322 
                                       f32_4 %891 = OpVectorShuffle %890 %889 4 5 2 3 
                                                      OpStore %322 %891 
                                       f32_2 %892 = OpLoad %284 
                                       f32_2 %893 = OpVectorShuffle %892 %892 0 0 
                                       f32_4 %894 = OpLoad %322 
                                       f32_2 %895 = OpVectorShuffle %894 %894 0 1 
                                       f32_2 %896 = OpFMul %893 %895 
                                       f32_4 %897 = OpLoad %234 
                                       f32_4 %898 = OpVectorShuffle %897 %896 4 1 2 5 
                                                      OpStore %234 %898 
                                       f32_2 %899 = OpLoad %284 
                                       f32_2 %900 = OpVectorShuffle %899 %899 1 1 
                                       f32_4 %901 = OpLoad %234 
                                       f32_2 %902 = OpVectorShuffle %901 %901 0 3 
                                       f32_2 %903 = OpFMul %900 %902 
                                       f32_4 %904 = OpLoad %234 
                                       f32_4 %905 = OpVectorShuffle %904 %903 4 5 2 3 
                                                      OpStore %234 %905 
                                Private f32* %906 = OpAccessChain %9 %458 
                                         f32 %907 = OpLoad %906 
                                Private f32* %908 = OpAccessChain %9 %18 
                                         f32 %909 = OpLoad %908 
                                         f32 %910 = OpFDiv %907 %909 
                                Private f32* %911 = OpAccessChain %23 %14 
                                                      OpStore %911 %910 
                                Private f32* %912 = OpAccessChain %23 %14 
                                         f32 %913 = OpLoad %912 
                                         f32 %914 = OpExtInst %1 4 %913 
                                         f32 %915 = OpExtInst %1 40 %914 %64 
                                                      OpStore %660 %915 
                                         f32 %916 = OpLoad %660 
                                         f32 %917 = OpFDiv %64 %916 
                                                      OpStore %660 %917 
                                Private f32* %918 = OpAccessChain %23 %14 
                                         f32 %919 = OpLoad %918 
                                         f32 %920 = OpExtInst %1 4 %919 
                                         f32 %921 = OpExtInst %1 37 %920 %64 
                                Private f32* %922 = OpAccessChain %322 %14 
                                                      OpStore %922 %921 
                                         f32 %923 = OpLoad %660 
                                Private f32* %924 = OpAccessChain %322 %14 
                                         f32 %925 = OpLoad %924 
                                         f32 %926 = OpFMul %923 %925 
                                                      OpStore %660 %926 
                                         f32 %927 = OpLoad %660 
                                         f32 %928 = OpLoad %660 
                                         f32 %929 = OpFMul %927 %928 
                                Private f32* %930 = OpAccessChain %322 %14 
                                                      OpStore %930 %929 
                                Private f32* %932 = OpAccessChain %322 %14 
                                         f32 %933 = OpLoad %932 
                                         f32 %934 = OpFMul %933 %88 
                                         f32 %935 = OpFAdd %934 %90 
                                                      OpStore %931 %935 
                                Private f32* %936 = OpAccessChain %322 %14 
                                         f32 %937 = OpLoad %936 
                                         f32 %938 = OpLoad %931 
                                         f32 %939 = OpFMul %937 %938 
                                         f32 %940 = OpFAdd %939 %95 
                                                      OpStore %931 %940 
                                Private f32* %941 = OpAccessChain %322 %14 
                                         f32 %942 = OpLoad %941 
                                         f32 %943 = OpLoad %931 
                                         f32 %944 = OpFMul %942 %943 
                                         f32 %945 = OpFAdd %944 %100 
                                                      OpStore %931 %945 
                                Private f32* %946 = OpAccessChain %322 %14 
                                         f32 %947 = OpLoad %946 
                                         f32 %948 = OpLoad %931 
                                         f32 %949 = OpFMul %947 %948 
                                         f32 %950 = OpFAdd %949 %105 
                                Private f32* %951 = OpAccessChain %322 %14 
                                                      OpStore %951 %950 
                                         f32 %952 = OpLoad %660 
                                Private f32* %953 = OpAccessChain %322 %14 
                                         f32 %954 = OpLoad %953 
                                         f32 %955 = OpFMul %952 %954 
                                                      OpStore %931 %955 
                                         f32 %956 = OpLoad %931 
                                         f32 %957 = OpFMul %956 %112 
                                         f32 %958 = OpFAdd %957 %114 
                                                      OpStore %931 %958 
                                Private f32* %960 = OpAccessChain %23 %14 
                                         f32 %961 = OpLoad %960 
                                         f32 %962 = OpExtInst %1 4 %961 
                                        bool %963 = OpFOrdLessThan %64 %962 
                                                      OpStore %959 %963 
                                Private f32* %964 = OpAccessChain %23 %14 
                                         f32 %965 = OpLoad %964 
                                         f32 %966 = OpExtInst %1 37 %965 %64 
                                Private f32* %967 = OpAccessChain %23 %14 
                                                      OpStore %967 %966 
                                Private f32* %968 = OpAccessChain %23 %14 
                                         f32 %969 = OpLoad %968 
                                Private f32* %970 = OpAccessChain %23 %14 
                                         f32 %971 = OpLoad %970 
                                         f32 %972 = OpFNegate %971 
                                        bool %973 = OpFOrdLessThan %969 %972 
                                                      OpStore %127 %973 
                                        bool %975 = OpLoad %959 
                                                      OpSelectionMerge %977 None 
                                                      OpBranchConditional %975 %976 %979 
                                             %976 = OpLabel 
                                         f32 %978 = OpLoad %931 
                                                      OpStore %974 %978 
                                                      OpBranch %977 
                                             %979 = OpLabel 
                                                      OpStore %974 %39 
                                                      OpBranch %977 
                                             %977 = OpLabel 
                                         f32 %980 = OpLoad %974 
                                                      OpStore %931 %980 
                                         f32 %981 = OpLoad %660 
                                Private f32* %982 = OpAccessChain %322 %14 
                                         f32 %983 = OpLoad %982 
                                         f32 %984 = OpFMul %981 %983 
                                         f32 %985 = OpLoad %931 
                                         f32 %986 = OpFAdd %984 %985 
                                                      OpStore %660 %986 
                                        bool %988 = OpLoad %127 
                                                      OpSelectionMerge %990 None 
                                                      OpBranchConditional %988 %989 %993 
                                             %989 = OpLabel 
                                         f32 %991 = OpLoad %660 
                                         f32 %992 = OpFNegate %991 
                                                      OpStore %987 %992 
                                                      OpBranch %990 
                                             %993 = OpLabel 
                                         f32 %994 = OpLoad %660 
                                                      OpStore %987 %994 
                                                      OpBranch %990 
                                             %990 = OpLabel 
                                         f32 %995 = OpLoad %987 
                                Private f32* %996 = OpAccessChain %23 %14 
                                                      OpStore %996 %995 
                                Private f32* %997 = OpAccessChain %187 %14 
                                         f32 %998 = OpLoad %997 
                                Private f32* %999 = OpAccessChain %60 %14 
                                        f32 %1000 = OpLoad %999 
                                        f32 %1001 = OpFMul %998 %1000 
                               Private f32* %1002 = OpAccessChain %23 %14 
                                        f32 %1003 = OpLoad %1002 
                                        f32 %1004 = OpFAdd %1001 %1003 
                               Private f32* %1005 = OpAccessChain %23 %14 
                                                      OpStore %1005 %1004 
                               Private f32* %1006 = OpAccessChain %23 %14 
                                        f32 %1007 = OpLoad %1006 
                               Uniform f32* %1008 = OpAccessChain %26 %221 
                                        f32 %1009 = OpLoad %1008 
                                        f32 %1010 = OpFMul %1007 %1009 
                                                      OpStore %660 %1010 
                                        f32 %1011 = OpLoad %660 
                                        f32 %1012 = OpExtInst %1 14 %1011 
                                                      OpStore %660 %1012 
                                        f32 %1013 = OpLoad %660 
                                      f32_2 %1014 = OpCompositeConstruct %1013 %1013 
                                      f32_4 %1015 = OpLoad %234 
                                      f32_2 %1016 = OpVectorShuffle %1015 %1015 0 1 
                                      f32_2 %1017 = OpFMul %1014 %1016 
                                      f32_4 %1018 = OpLoad %9 
                                      f32_2 %1019 = OpVectorShuffle %1018 %1018 2 3 
                                      f32_2 %1020 = OpFAdd %1017 %1019 
                                                      OpStore %48 %1020 
                             Uniform f32_4* %1021 = OpAccessChain %26 %161 
                                      f32_4 %1022 = OpLoad %1021 
                                      f32_2 %1023 = OpVectorShuffle %1022 %1022 0 0 
                               Uniform f32* %1024 = OpAccessChain %26 %166 
                                        f32 %1025 = OpLoad %1024 
                                      f32_2 %1026 = OpCompositeConstruct %1025 %1025 
                                      f32_2 %1027 = OpFMul %1023 %1026 
                                      f32_4 %1028 = OpLoad %9 
                                      f32_2 %1029 = OpVectorShuffle %1028 %1028 0 1 
                                      f32_2 %1030 = OpFAdd %1027 %1029 
                                      f32_4 %1031 = OpLoad %9 
                                      f32_4 %1032 = OpVectorShuffle %1031 %1030 4 5 2 3 
                                                      OpStore %9 %1032 
                                      f32_4 %1033 = OpLoad %9 
                                      f32_2 %1034 = OpVectorShuffle %1033 %1033 0 1 
                                      f32_2 %1035 = OpExtInst %1 10 %1034 
                                      f32_4 %1036 = OpLoad %9 
                                      f32_4 %1037 = OpVectorShuffle %1036 %1035 4 5 2 3 
                                                      OpStore %9 %1037 
                 read_only Texture2DSampled %1038 = OpLoad %266 
                                      f32_4 %1039 = OpLoad %9 
                                      f32_2 %1040 = OpVectorShuffle %1039 %1039 0 1 
                                      f32_4 %1041 = OpImageSampleImplicitLod %1038 %1040 
                                      f32_2 %1042 = OpVectorShuffle %1041 %1041 0 2 
                                                      OpStore %262 %1042 
                               Private f32* %1043 = OpAccessChain %262 %14 
                                        f32 %1044 = OpLoad %1043 
                               Private f32* %1045 = OpAccessChain %591 %29 
                                        f32 %1046 = OpLoad %1045 
                                        f32 %1047 = OpFMul %1044 %1046 
                               Private f32* %1048 = OpAccessChain %9 %14 
                                                      OpStore %1048 %1047 
                               Private f32* %1049 = OpAccessChain %262 %29 
                                        f32 %1050 = OpLoad %1049 
                                        f32 %1051 = OpFMul %1050 %317 
                               Private f32* %1052 = OpAccessChain %23 %14 
                                        f32 %1053 = OpLoad %1052 
                                        f32 %1054 = OpFAdd %1051 %1053 
                               Private f32* %1055 = OpAccessChain %373 %14 
                                                      OpStore %1055 %1054 
                               Private f32* %1056 = OpAccessChain %373 %14 
                                        f32 %1057 = OpLoad %1056 
                               Uniform f32* %1058 = OpAccessChain %26 %383 
                                        f32 %1059 = OpLoad %1058 
                                        f32 %1060 = OpFMul %1057 %1059 
                               Private f32* %1061 = OpAccessChain %373 %14 
                                                      OpStore %1061 %1060 
                               Private f32* %1062 = OpAccessChain %373 %14 
                                        f32 %1063 = OpLoad %1062 
                                        f32 %1064 = OpExtInst %1 13 %1063 
                               Private f32* %1065 = OpAccessChain %373 %14 
                                                      OpStore %1065 %1064 
                                      f32_4 %1066 = OpLoad %9 
                                      f32_2 %1067 = OpVectorShuffle %1066 %1066 0 0 
                                      f32_2 %1068 = OpLoad %48 
                                      f32_2 %1069 = OpFMul %1067 %1068 
                                      f32_4 %1070 = OpLoad %234 
                                      f32_4 %1071 = OpVectorShuffle %1070 %1069 4 5 2 3 
                                                      OpStore %234 %1071 
                                      f32_3 %1072 = OpLoad %373 
                                      f32_2 %1073 = OpVectorShuffle %1072 %1072 0 0 
                                      f32_4 %1074 = OpLoad %234 
                                      f32_2 %1075 = OpVectorShuffle %1074 %1074 0 1 
                                      f32_2 %1076 = OpFMul %1073 %1075 
                                      f32_2 %1077 = OpLoad %48 
                                      f32_2 %1078 = OpFAdd %1076 %1077 
                                      f32_4 %1079 = OpLoad %9 
                                      f32_4 %1080 = OpVectorShuffle %1079 %1078 4 5 2 3 
                                                      OpStore %9 %1080 
                                      f32_4 %1081 = OpLoad %9 
                                      f32_2 %1082 = OpVectorShuffle %1081 %1081 0 1 
                                      f32_4 %1083 = OpLoad %9 
                                      f32_2 %1084 = OpVectorShuffle %1083 %1083 0 1 
                                        f32 %1085 = OpDot %1082 %1084 
                               Private f32* %1086 = OpAccessChain %9 %18 
                                                      OpStore %1086 %1085 
                                      f32_4 %1087 = OpLoad %9 
                                      f32_2 %1088 = OpVectorShuffle %1087 %1087 0 1 
                                      f32_2 %1089 = OpFAdd %1088 %778 
                                      f32_4 %1090 = OpLoad %9 
                                      f32_4 %1091 = OpVectorShuffle %1090 %1089 4 5 2 3 
                                                      OpStore %9 %1091 
                                      f32_4 %1092 = OpLoad %9 
                                      f32_2 %1093 = OpVectorShuffle %1092 %1092 0 1 
                                      f32_4 %1094 = OpLoad %9 
                                      f32_2 %1095 = OpVectorShuffle %1094 %1094 0 1 
                                        f32 %1096 = OpDot %1093 %1095 
                               Private f32* %1097 = OpAccessChain %9 %14 
                                                      OpStore %1097 %1096 
                                      f32_4 %1098 = OpLoad %9 
                                      f32_2 %1099 = OpVectorShuffle %1098 %1098 0 2 
                                      f32_2 %1100 = OpExtInst %1 31 %1099 
                                      f32_4 %1101 = OpLoad %9 
                                      f32_4 %1102 = OpVectorShuffle %1101 %1100 4 5 2 3 
                                                      OpStore %9 %1102 
                                      f32_4 %1103 = OpLoad %9 
                                      f32_2 %1104 = OpVectorShuffle %1103 %1103 0 1 
                                      f32_2 %1105 = OpFNegate %1104 
                                      f32_2 %1107 = OpFAdd %1105 %1106 
                                      f32_4 %1108 = OpLoad %9 
                                      f32_4 %1109 = OpVectorShuffle %1108 %1107 4 5 2 3 
                                                      OpStore %9 %1109 
                                      f32_4 %1111 = OpLoad %9 
                                      f32_4 %1112 = OpVectorShuffle %1111 %1111 0 1 0 0 
                                     bool_4 %1114 = OpFOrdLessThan %1110 %1112 
                                     bool_2 %1115 = OpVectorShuffle %1114 %1114 0 1 
                                                      OpStore %427 %1115 
                                     bool_2 %1116 = OpLoad %427 
                                       bool %1117 = OpCompositeExtract %1116 0 
                                       bool %1118 = OpLoad %793 
                                       bool %1119 = OpLogicalOr %1117 %1118 
                                     bool_2 %1120 = OpLoad %427 
                                     bool_2 %1121 = OpCompositeInsert %1119 %1120 0 
                                                      OpStore %427 %1121 
                                     bool_2 %1122 = OpLoad %427 
                                       bool %1123 = OpCompositeExtract %1122 1 
                                        i32 %1124 = OpSelect %1123 %28 %161 
                                        i32 %1125 = OpIMul %1124 %436 
                                       bool %1126 = OpINotEqual %1125 %161 
                                                      OpSelectionMerge %1128 None 
                                                      OpBranchConditional %1126 %1127 %1128 
                                            %1127 = OpLabel 
                                                      OpKill
                                            %1128 = OpLabel 
                               Private f32* %1130 = OpAccessChain %837 %29 
                                        f32 %1131 = OpLoad %1130 
                                        f32 %1132 = OpFMul %1131 %293 
                               Private f32* %1133 = OpAccessChain %60 %29 
                                        f32 %1134 = OpLoad %1133 
                                        f32 %1135 = OpFAdd %1132 %1134 
                               Private f32* %1136 = OpAccessChain %373 %14 
                                                      OpStore %1136 %1135 
                               Private f32* %1137 = OpAccessChain %373 %14 
                                        f32 %1138 = OpLoad %1137 
                                        f32 %1139 = OpExtInst %1 13 %1138 
                               Private f32* %1140 = OpAccessChain %373 %14 
                                                      OpStore %1140 %1139 
                               Private f32* %1141 = OpAccessChain %373 %14 
                                        f32 %1142 = OpLoad %1141 
                                        f32 %1143 = OpFAdd %1142 %64 
                               Private f32* %1144 = OpAccessChain %373 %14 
                                                      OpStore %1144 %1143 
                               Private f32* %1145 = OpAccessChain %373 %14 
                                        f32 %1146 = OpLoad %1145 
                                        f32 %1147 = OpFMul %1146 %317 
                               Private f32* %1148 = OpAccessChain %373 %14 
                                                      OpStore %1148 %1147 
                               Private f32* %1149 = OpAccessChain %373 %14 
                                        f32 %1150 = OpLoad %1149 
                               Private f32* %1151 = OpAccessChain %302 %14 
                                        f32 %1152 = OpLoad %1151 
                                        f32 %1153 = OpFMul %1150 %1152 
                               Uniform f32* %1154 = OpAccessChain %26 %303 %14 
                                        f32 %1155 = OpLoad %1154 
                                        f32 %1156 = OpFAdd %1153 %1155 
                               Private f32* %1157 = OpAccessChain %373 %14 
                                                      OpStore %1157 %1156 
                                      f32_2 %1158 = OpLoad %12 
                                      f32_2 %1159 = OpFAdd %1158 %52 
                                                      OpStore %48 %1159 
                                      f32_3 %1160 = OpLoad %373 
                                      f32_2 %1161 = OpVectorShuffle %1160 %1160 0 0 
                                      f32_2 %1162 = OpLoad %48 
                                      f32_2 %1163 = OpFMul %1161 %1162 
                                      f32_3 %1164 = OpLoad %23 
                                      f32_3 %1165 = OpVectorShuffle %1164 %1163 3 1 4 
                                                      OpStore %23 %1165 
                                      f32_2 %1166 = OpLoad %837 
                                      f32_2 %1167 = OpVectorShuffle %1166 %1166 0 0 
                                      f32_3 %1168 = OpLoad %23 
                                      f32_2 %1169 = OpVectorShuffle %1168 %1168 0 2 
                                      f32_2 %1170 = OpFMul %1167 %1169 
                                      f32_3 %1171 = OpLoad %23 
                                      f32_3 %1172 = OpVectorShuffle %1171 %1170 3 1 4 
                                                      OpStore %23 %1172 
                                      f32_2 %1173 = OpLoad %837 
                                      f32_2 %1174 = OpVectorShuffle %1173 %1173 1 1 
                                      f32_3 %1175 = OpLoad %23 
                                      f32_2 %1176 = OpVectorShuffle %1175 %1175 0 2 
                                      f32_2 %1177 = OpFMul %1174 %1176 
                                      f32_3 %1178 = OpLoad %23 
                                      f32_3 %1179 = OpVectorShuffle %1178 %1177 3 1 4 
                                                      OpStore %23 %1179 
                               Private f32* %1180 = OpAccessChain %48 %29 
                                        f32 %1181 = OpLoad %1180 
                               Private f32* %1182 = OpAccessChain %48 %14 
                                        f32 %1183 = OpLoad %1182 
                                        f32 %1184 = OpFDiv %1181 %1183 
                               Private f32* %1185 = OpAccessChain %373 %14 
                                                      OpStore %1185 %1184 
                               Private f32* %1186 = OpAccessChain %373 %14 
                                        f32 %1187 = OpLoad %1186 
                                        f32 %1188 = OpExtInst %1 4 %1187 
                                        f32 %1189 = OpExtInst %1 40 %1188 %64 
                               Private f32* %1190 = OpAccessChain %227 %14 
                                                      OpStore %1190 %1189 
                               Private f32* %1191 = OpAccessChain %227 %14 
                                        f32 %1192 = OpLoad %1191 
                                        f32 %1193 = OpFDiv %64 %1192 
                               Private f32* %1194 = OpAccessChain %227 %14 
                                                      OpStore %1194 %1193 
                               Private f32* %1196 = OpAccessChain %373 %14 
                                        f32 %1197 = OpLoad %1196 
                                        f32 %1198 = OpExtInst %1 4 %1197 
                                        f32 %1199 = OpExtInst %1 37 %1198 %64 
                                                      OpStore %1195 %1199 
                               Private f32* %1200 = OpAccessChain %227 %14 
                                        f32 %1201 = OpLoad %1200 
                                        f32 %1202 = OpLoad %1195 
                                        f32 %1203 = OpFMul %1201 %1202 
                               Private f32* %1204 = OpAccessChain %227 %14 
                                                      OpStore %1204 %1203 
                               Private f32* %1205 = OpAccessChain %227 %14 
                                        f32 %1206 = OpLoad %1205 
                               Private f32* %1207 = OpAccessChain %227 %14 
                                        f32 %1208 = OpLoad %1207 
                                        f32 %1209 = OpFMul %1206 %1208 
                                                      OpStore %1195 %1209 
                                        f32 %1210 = OpLoad %1195 
                                        f32 %1211 = OpFMul %1210 %88 
                                        f32 %1212 = OpFAdd %1211 %90 
                                                      OpStore %290 %1212 
                                        f32 %1213 = OpLoad %1195 
                                        f32 %1214 = OpLoad %290 
                                        f32 %1215 = OpFMul %1213 %1214 
                                        f32 %1216 = OpFAdd %1215 %95 
                                                      OpStore %290 %1216 
                                        f32 %1217 = OpLoad %1195 
                                        f32 %1218 = OpLoad %290 
                                        f32 %1219 = OpFMul %1217 %1218 
                                        f32 %1220 = OpFAdd %1219 %100 
                                                      OpStore %290 %1220 
                                        f32 %1221 = OpLoad %1195 
                                        f32 %1222 = OpLoad %290 
                                        f32 %1223 = OpFMul %1221 %1222 
                                        f32 %1224 = OpFAdd %1223 %105 
                                                      OpStore %1195 %1224 
                                        f32 %1225 = OpLoad %1195 
                               Private f32* %1226 = OpAccessChain %227 %14 
                                        f32 %1227 = OpLoad %1226 
                                        f32 %1228 = OpFMul %1225 %1227 
                                                      OpStore %290 %1228 
                                        f32 %1229 = OpLoad %290 
                                        f32 %1230 = OpFMul %1229 %112 
                                        f32 %1231 = OpFAdd %1230 %114 
                                                      OpStore %290 %1231 
                               Private f32* %1233 = OpAccessChain %373 %14 
                                        f32 %1234 = OpLoad %1233 
                                        f32 %1235 = OpExtInst %1 4 %1234 
                                       bool %1236 = OpFOrdLessThan %64 %1235 
                                                      OpStore %1232 %1236 
                               Private f32* %1237 = OpAccessChain %373 %14 
                                        f32 %1238 = OpLoad %1237 
                                        f32 %1239 = OpExtInst %1 37 %1238 %64 
                               Private f32* %1240 = OpAccessChain %373 %14 
                                                      OpStore %1240 %1239 
                               Private f32* %1242 = OpAccessChain %373 %14 
                                        f32 %1243 = OpLoad %1242 
                               Private f32* %1244 = OpAccessChain %373 %14 
                                        f32 %1245 = OpLoad %1244 
                                        f32 %1246 = OpFNegate %1245 
                                       bool %1247 = OpFOrdLessThan %1243 %1246 
                                                      OpStore %1241 %1247 
                                       bool %1249 = OpLoad %1232 
                                                      OpSelectionMerge %1251 None 
                                                      OpBranchConditional %1249 %1250 %1253 
                                            %1250 = OpLabel 
                                        f32 %1252 = OpLoad %290 
                                                      OpStore %1248 %1252 
                                                      OpBranch %1251 
                                            %1253 = OpLabel 
                                                      OpStore %1248 %39 
                                                      OpBranch %1251 
                                            %1251 = OpLabel 
                                        f32 %1254 = OpLoad %1248 
                                                      OpStore %290 %1254 
                               Private f32* %1255 = OpAccessChain %227 %14 
                                        f32 %1256 = OpLoad %1255 
                                        f32 %1257 = OpLoad %1195 
                                        f32 %1258 = OpFMul %1256 %1257 
                                        f32 %1259 = OpLoad %290 
                                        f32 %1260 = OpFAdd %1258 %1259 
                               Private f32* %1261 = OpAccessChain %227 %14 
                                                      OpStore %1261 %1260 
                                       bool %1263 = OpLoad %1241 
                                                      OpSelectionMerge %1265 None 
                                                      OpBranchConditional %1263 %1264 %1269 
                                            %1264 = OpLabel 
                               Private f32* %1266 = OpAccessChain %227 %14 
                                        f32 %1267 = OpLoad %1266 
                                        f32 %1268 = OpFNegate %1267 
                                                      OpStore %1262 %1268 
                                                      OpBranch %1265 
                                            %1269 = OpLabel 
                               Private f32* %1270 = OpAccessChain %227 %14 
                                        f32 %1271 = OpLoad %1270 
                                                      OpStore %1262 %1271 
                                                      OpBranch %1265 
                                            %1265 = OpLabel 
                                        f32 %1272 = OpLoad %1262 
                               Private f32* %1273 = OpAccessChain %373 %14 
                                                      OpStore %1273 %1272 
                               Private f32* %1274 = OpAccessChain %187 %14 
                                        f32 %1275 = OpLoad %1274 
                               Private f32* %1276 = OpAccessChain %60 %14 
                                        f32 %1277 = OpLoad %1276 
                                        f32 %1278 = OpFMul %1275 %1277 
                               Private f32* %1279 = OpAccessChain %373 %14 
                                        f32 %1280 = OpLoad %1279 
                                        f32 %1281 = OpFAdd %1278 %1280 
                               Private f32* %1282 = OpAccessChain %373 %14 
                                                      OpStore %1282 %1281 
                               Private f32* %1283 = OpAccessChain %373 %14 
                                        f32 %1284 = OpLoad %1283 
                               Uniform f32* %1285 = OpAccessChain %26 %221 
                                        f32 %1286 = OpLoad %1285 
                                        f32 %1287 = OpFMul %1284 %1286 
                               Private f32* %1288 = OpAccessChain %60 %14 
                                                      OpStore %1288 %1287 
                               Private f32* %1289 = OpAccessChain %60 %14 
                                        f32 %1290 = OpLoad %1289 
                                        f32 %1291 = OpExtInst %1 14 %1290 
                               Private f32* %1292 = OpAccessChain %60 %14 
                                                      OpStore %1292 %1291 
                                      f32_2 %1293 = OpLoad %60 
                                      f32_2 %1294 = OpVectorShuffle %1293 %1293 0 0 
                                      f32_3 %1295 = OpLoad %23 
                                      f32_2 %1296 = OpVectorShuffle %1295 %1295 0 2 
                                      f32_2 %1297 = OpFMul %1294 %1296 
                                      f32_2 %1298 = OpLoad %48 
                                      f32_2 %1299 = OpFAdd %1297 %1298 
                                                      OpStore %48 %1299 
                             Uniform f32_4* %1300 = OpAccessChain %26 %161 
                                      f32_4 %1301 = OpLoad %1300 
                                      f32_2 %1302 = OpVectorShuffle %1301 %1301 0 0 
                               Uniform f32* %1303 = OpAccessChain %26 %166 
                                        f32 %1304 = OpLoad %1303 
                                      f32_2 %1305 = OpCompositeConstruct %1304 %1304 
                                      f32_2 %1306 = OpFMul %1302 %1305 
                                      f32_2 %1307 = OpLoad %12 
                                      f32_2 %1308 = OpFAdd %1306 %1307 
                                      f32_3 %1309 = OpLoad %23 
                                      f32_3 %1310 = OpVectorShuffle %1309 %1308 3 4 2 
                                                      OpStore %23 %1310 
                                      f32_3 %1311 = OpLoad %23 
                                      f32_2 %1312 = OpVectorShuffle %1311 %1311 0 1 
                                      f32_2 %1313 = OpExtInst %1 10 %1312 
                                      f32_3 %1314 = OpLoad %23 
                                      f32_3 %1315 = OpVectorShuffle %1314 %1313 3 4 2 
                                                      OpStore %23 %1315 
                 read_only Texture2DSampled %1317 = OpLoad %266 
                                      f32_3 %1318 = OpLoad %23 
                                      f32_2 %1319 = OpVectorShuffle %1318 %1318 0 1 
                                      f32_4 %1320 = OpImageSampleImplicitLod %1317 %1319 
                                      f32_2 %1321 = OpVectorShuffle %1320 %1320 0 2 
                                                      OpStore %1316 %1321 
                               Private f32* %1322 = OpAccessChain %1316 %14 
                                        f32 %1323 = OpLoad %1322 
                                        f32 %1324 = OpLoad %86 
                                        f32 %1325 = OpFMul %1323 %1324 
                               Private f32* %1326 = OpAccessChain %23 %14 
                                                      OpStore %1326 %1325 
                               Private f32* %1327 = OpAccessChain %1316 %29 
                                        f32 %1328 = OpLoad %1327 
                                        f32 %1329 = OpFMul %1328 %317 
                               Private f32* %1330 = OpAccessChain %373 %14 
                                        f32 %1331 = OpLoad %1330 
                                        f32 %1332 = OpFAdd %1329 %1331 
                               Private f32* %1333 = OpAccessChain %373 %14 
                                                      OpStore %1333 %1332 
                               Private f32* %1334 = OpAccessChain %373 %14 
                                        f32 %1335 = OpLoad %1334 
                               Uniform f32* %1336 = OpAccessChain %26 %383 
                                        f32 %1337 = OpLoad %1336 
                                        f32 %1338 = OpFMul %1335 %1337 
                               Private f32* %1339 = OpAccessChain %373 %14 
                                                      OpStore %1339 %1338 
                               Private f32* %1340 = OpAccessChain %373 %14 
                                        f32 %1341 = OpLoad %1340 
                                        f32 %1342 = OpExtInst %1 13 %1341 
                               Private f32* %1343 = OpAccessChain %373 %14 
                                                      OpStore %1343 %1342 
                                      f32_2 %1344 = OpLoad %48 
                                      f32_3 %1345 = OpLoad %23 
                                      f32_2 %1346 = OpVectorShuffle %1345 %1345 0 0 
                                      f32_2 %1347 = OpFMul %1344 %1346 
                                      f32_3 %1348 = OpLoad %23 
                                      f32_3 %1349 = OpVectorShuffle %1348 %1347 3 4 2 
                                                      OpStore %23 %1349 
                                      f32_3 %1350 = OpLoad %373 
                                      f32_2 %1351 = OpVectorShuffle %1350 %1350 0 0 
                                      f32_3 %1352 = OpLoad %23 
                                      f32_2 %1353 = OpVectorShuffle %1352 %1352 0 1 
                                      f32_2 %1354 = OpFMul %1351 %1353 
                                      f32_2 %1355 = OpLoad %48 
                                      f32_2 %1356 = OpFAdd %1354 %1355 
                                      f32_3 %1357 = OpLoad %373 
                                      f32_3 %1358 = OpVectorShuffle %1357 %1356 3 4 2 
                                                      OpStore %373 %1358 
                                      f32_3 %1359 = OpLoad %373 
                                      f32_2 %1360 = OpVectorShuffle %1359 %1359 0 1 
                                      f32_3 %1361 = OpLoad %373 
                                      f32_2 %1362 = OpVectorShuffle %1361 %1361 0 1 
                                        f32 %1363 = OpDot %1360 %1362 
                               Private f32* %1364 = OpAccessChain %373 %14 
                                                      OpStore %1364 %1363 
                               Private f32* %1365 = OpAccessChain %373 %14 
                                        f32 %1366 = OpLoad %1365 
                                        f32 %1367 = OpExtInst %1 31 %1366 
                               Private f32* %1368 = OpAccessChain %373 %14 
                                                      OpStore %1368 %1367 
                               Private f32* %1369 = OpAccessChain %373 %14 
                                        f32 %1370 = OpLoad %1369 
                                        f32 %1371 = OpFNegate %1370 
                               Uniform f32* %1372 = OpAccessChain %26 %420 
                                        f32 %1373 = OpLoad %1372 
                                        f32 %1374 = OpFAdd %1371 %1373 
                               Private f32* %1375 = OpAccessChain %373 %14 
                                                      OpStore %1375 %1374 
                               Private f32* %1376 = OpAccessChain %373 %14 
                                        f32 %1377 = OpLoad %1376 
                                       bool %1378 = OpFOrdLessThan %1377 %39 
                                                      OpStore %1241 %1378 
                                     bool_2 %1379 = OpLoad %427 
                                       bool %1380 = OpCompositeExtract %1379 0 
                                       bool %1381 = OpLoad %1241 
                                       bool %1382 = OpLogicalOr %1380 %1381 
                                     bool_2 %1383 = OpLoad %427 
                                     bool_2 %1384 = OpCompositeInsert %1382 %1383 0 
                                                      OpStore %427 %1384 
                 read_only Texture2DSampled %1387 = OpLoad %1386 
                                      f32_4 %1389 = OpLoad %1388 
                                      f32_2 %1390 = OpVectorShuffle %1389 %1389 0 1 
                                      f32_4 %1391 = OpImageSampleImplicitLod %1387 %1390 
                                      f32_3 %1392 = OpVectorShuffle %1391 %1391 0 1 2 
                                                      OpStore %1385 %1392 
                                      f32_3 %1393 = OpLoad %1385 
                                      f32_3 %1396 = OpFMul %1393 %1395 
                                                      OpStore %373 %1396 
                                     bool_2 %1401 = OpLoad %427 
                                       bool %1402 = OpCompositeExtract %1401 0 
                                                      OpSelectionMerge %1404 None 
                                                      OpBranchConditional %1402 %1403 %1409 
                                            %1403 = OpLabel 
                             Uniform f32_4* %1406 = OpAccessChain %26 %1405 
                                      f32_4 %1407 = OpLoad %1406 
                                      f32_3 %1408 = OpVectorShuffle %1407 %1407 0 1 2 
                                                      OpStore %1400 %1408 
                                                      OpBranch %1404 
                                            %1409 = OpLabel 
                                      f32_3 %1410 = OpLoad %373 
                                                      OpStore %1400 %1410 
                                                      OpBranch %1404 
                                            %1404 = OpLabel 
                                      f32_3 %1411 = OpLoad %1400 
                                      f32_4 %1412 = OpLoad %1398 
                                      f32_4 %1413 = OpVectorShuffle %1412 %1411 4 5 6 3 
                                                      OpStore %1398 %1413 
                                Output f32* %1415 = OpAccessChain %1398 %458 
                                                      OpStore %1415 %64 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
 Pass {
  LOD 100
  Tags { "QUEUE" = "Overlay+1" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 90483
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0 + vec4(0.0, -0.100000001, 0.0, 0.0);
    u_xlat0 = u_xlat0 + vec4(1.0, 0.899999976, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    vs_TEXCOORD2 = u_xlat0 * vec4(1.0, -1.0, 1.0, 1.0) + vec4(0.0, 1.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _Magnitudes;
uniform 	float _LSFreq;
uniform 	float _SSFreq;
uniform 	float _RotSpeed;
uniform 	vec4 _EdgeColor;
uniform 	float _UVDistCutoff;
uniform 	float _TimeScale;
uniform  sampler2D _NoiseTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat6 = u_xlat0.y / u_xlat0.x;
    u_xlat9 = max(abs(u_xlat6), 1.0);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat6), 1.0);
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = 1.0<abs(u_xlat6);
    u_xlat6 = min(u_xlat6, 1.0);
    u_xlatb6 = u_xlat6<(-u_xlat6);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlat6 = (u_xlatb6) ? (-u_xlat9) : u_xlat9;
    u_xlat1.xy = _Time.xy * vec2(vec2(_TimeScale, _TimeScale)) + vec2(-1.0, -1.0);
    u_xlat9 = u_xlat1.x * _RotSpeed;
    u_xlat10 = u_xlat9 * 90.0;
    u_xlatb10 = u_xlat10>=(-u_xlat10);
    u_xlat2.xy = (bool(u_xlatb10)) ? vec2(90.0, 0.0111111114) : vec2(-90.0, -0.0111111114);
    u_xlat9 = u_xlat9 * u_xlat2.y;
    u_xlat9 = fract(u_xlat9);
    u_xlat6 = u_xlat2.x * u_xlat9 + u_xlat6;
    u_xlat9 = u_xlat6 * _LSFreq;
    u_xlat9 = cos(u_xlat9);
    u_xlat1.z = (-u_xlat1.x);
    u_xlat7.xy = u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat10_2 = texture(_NoiseTex, u_xlat7.xy);
    u_xlat7.x = u_xlat10_2.z * 20.0 + u_xlat1.y;
    u_xlat7.x = sin(u_xlat7.x);
    u_xlat7.x = u_xlat7.x + 1.0;
    u_xlat7.x = u_xlat7.x * 0.5;
    u_xlat2.xw = (-_Magnitudes.xz) + _Magnitudes.yw;
    u_xlat7.x = u_xlat7.x * u_xlat2.x + _Magnitudes.x;
    u_xlat7.xy = u_xlat0.xy * u_xlat7.xx;
    u_xlat7.xy = u_xlat10_2.yy * u_xlat7.xy;
    u_xlat7.xy = u_xlat10_2.zz * u_xlat7.xy;
    u_xlat0.xy = vec2(u_xlat9) * u_xlat7.xy + u_xlat0.xy;
    u_xlat9 = u_xlat1.y + u_xlat1.y;
    u_xlat1.xy = u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat10_1 = texture(_NoiseTex, u_xlat1.xy);
    u_xlat9 = sin(u_xlat9);
    u_xlat9 = u_xlat9 + 1.0;
    u_xlat9 = u_xlat9 * 0.5;
    u_xlat9 = u_xlat9 * u_xlat2.w + _Magnitudes.z;
    u_xlat9 = u_xlat10_1.x * u_xlat9;
    u_xlat6 = u_xlat10_1.z * 0.5 + u_xlat6;
    u_xlat6 = u_xlat6 * _SSFreq;
    u_xlat6 = sin(u_xlat6);
    u_xlat1.xy = vec2(u_xlat9) * u_xlat0.xy;
    u_xlat0.xy = vec2(u_xlat6) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat3 = (-u_xlat0.x) + _UVDistCutoff;
    u_xlatb3 = u_xlat3<0.0;
    if((int(u_xlatb3) * int(0xffffffffu))!=0){discard;}
    u_xlat3 = _UVDistCutoff + -0.200000003;
    u_xlat0.x = (-u_xlat3) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * -0.5 + 0.5;
    u_xlat0.x = min(u_xlat0.x, 0.300000012);
    SV_Target0.w = u_xlat0.x * vs_TEXCOORD0.y;
    SV_Target0.xyz = _EdgeColor.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 131
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %102 %118 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate %64 Location 64 
                                                     OpMemberDecorate %100 0 BuiltIn 100 
                                                     OpMemberDecorate %100 1 BuiltIn 100 
                                                     OpMemberDecorate %100 2 BuiltIn 100 
                                                     OpDecorate %100 Block 
                                                     OpDecorate %118 Location 118 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                                Output f32_2* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                               Output f32_4* %64 = OpVariable Output 
                                         u32 %98 = OpConstant 1 
                                             %99 = OpTypeArray %6 %98 
                                            %100 = OpTypeStruct %13 %6 %99 
                                            %101 = OpTypePointer Output %100 
       Output struct {f32_4; f32; f32[1];}* %102 = OpVariable Output 
                                        f32 %104 = OpConstant 3.67402E-40 
                                        f32 %105 = OpConstant 3.67402E-40 
                                      f32_4 %106 = OpConstantComposite %104 %105 %104 %104 
                                        f32 %110 = OpConstant 3.67402E-40 
                                        f32 %111 = OpConstant 3.67402E-40 
                                      f32_4 %112 = OpConstantComposite %110 %111 %110 %110 
                                        f32 %115 = OpConstant 3.67402E-40 
                                      f32_4 %116 = OpConstantComposite %115 %115 %115 %115 
                              Output f32_4* %118 = OpVariable Output 
                                        f32 %120 = OpConstant 3.67402E-40 
                                      f32_4 %121 = OpConstantComposite %110 %120 %110 %110 
                                      f32_4 %123 = OpConstantComposite %104 %110 %104 %104 
                                            %125 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore %9 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore %64 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %91 = OpAccessChain %20 %39 %59 
                                       f32_4 %92 = OpLoad %91 
                                       f32_4 %93 = OpLoad %57 
                                       f32_4 %94 = OpVectorShuffle %93 %93 3 3 3 3 
                                       f32_4 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %33 
                                       f32_4 %97 = OpFAdd %95 %96 
                                                     OpStore %33 %97 
                                      f32_4 %103 = OpLoad %33 
                                      f32_4 %107 = OpFAdd %103 %106 
                              Output f32_4* %108 = OpAccessChain %102 %38 
                                                     OpStore %108 %107 
                                      f32_4 %109 = OpLoad %33 
                                      f32_4 %113 = OpFAdd %109 %112 
                                                     OpStore %33 %113 
                                      f32_4 %114 = OpLoad %33 
                                      f32_4 %117 = OpFMul %114 %116 
                                                     OpStore %33 %117 
                                      f32_4 %119 = OpLoad %33 
                                      f32_4 %122 = OpFMul %119 %121 
                                      f32_4 %124 = OpFAdd %122 %123 
                                                     OpStore %118 %124 
                                Output f32* %126 = OpAccessChain %102 %38 %98 
                                        f32 %127 = OpLoad %126 
                                        f32 %128 = OpFNegate %127 
                                Output f32* %129 = OpAccessChain %102 %38 %98 
                                                     OpStore %129 %128 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 427
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %424 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpMemberDecorate %123 0 Offset 123 
                                                      OpMemberDecorate %123 1 Offset 123 
                                                      OpMemberDecorate %123 2 Offset 123 
                                                      OpMemberDecorate %123 3 Offset 123 
                                                      OpMemberDecorate %123 4 Offset 123 
                                                      OpMemberDecorate %123 5 Offset 123 
                                                      OpMemberDecorate %123 6 Offset 123 
                                                      OpMemberDecorate %123 7 Offset 123 
                                                      OpDecorate %123 Block 
                                                      OpDecorate %125 DescriptorSet 125 
                                                      OpDecorate %125 Binding 125 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %216 DescriptorSet 216 
                                                      OpDecorate %216 Binding 216 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %424 RelaxedPrecision 
                                                      OpDecorate %424 Location 424 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_2* %12 = OpVariable Input 
                                          f32 %14 = OpConstant 3.67402E-40 
                                        f32_2 %15 = OpConstantComposite %14 %14 
                                              %19 = OpTypePointer Private %6 
                                 Private f32* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 1 
                                          u32 %25 = OpConstant 0 
                                 Private f32* %29 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                                              %36 = OpTypeVector %6 3 
                                              %37 = OpTypePointer Private %36 
                               Private f32_3* %38 = OpVariable Private 
                                 Private f32* %51 = OpVariable Private 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          f32 %56 = OpConstant 3.67402E-40 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %84 = OpConstant 3.67402E-40 
                                              %86 = OpTypeBool 
                                              %87 = OpTypePointer Private %86 
                                Private bool* %88 = OpVariable Private 
                                Private bool* %94 = OpVariable Private 
                                              %99 = OpTypePointer Function %6 
                                         f32 %106 = OpConstant 3.67402E-40 
                                             %123 = OpTypeStruct %7 %7 %6 %6 %6 %7 %6 %6 
                                             %124 = OpTypePointer Uniform %123 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32_4; f32; f32;}* %125 = OpVariable Uniform 
                                             %126 = OpTypeInt 32 1 
                                         i32 %127 = OpConstant 0 
                                             %128 = OpTypePointer Uniform %7 
                                         i32 %132 = OpConstant 7 
                                             %133 = OpTypePointer Uniform %6 
                                         f32 %143 = OpConstant 3.67402E-40 
                                       f32_2 %144 = OpConstantComposite %143 %143 
                                         i32 %150 = OpConstant 4 
                                Private f32* %154 = OpVariable Private 
                                         f32 %156 = OpConstant 3.67402E-40 
                               Private bool* %158 = OpVariable Private 
                                             %163 = OpTypePointer Private %10 
                              Private f32_2* %164 = OpVariable Private 
                                             %165 = OpTypePointer Function %10 
                                         f32 %170 = OpConstant 3.67402E-40 
                                       f32_2 %171 = OpConstantComposite %156 %170 
                                         f32 %173 = OpConstant 3.67402E-40 
                                         f32 %174 = OpConstant 3.67402E-40 
                                       f32_2 %175 = OpConstantComposite %173 %174 
                                         i32 %190 = OpConstant 2 
                                         u32 %199 = OpConstant 2 
                              Private f32_2* %201 = OpVariable Private 
                                         f32 %207 = OpConstant 3.67402E-40 
                                       f32_2 %208 = OpConstantComposite %207 %207 
                              Private f32_2* %212 = OpVariable Private 
                                             %213 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %214 = OpTypeSampledImage %213 
                                             %215 = OpTypePointer UniformConstant %214 
 UniformConstant read_only Texture2DSampled* %216 = OpVariable UniformConstant 
                                         f32 %223 = OpConstant 3.67402E-40 
                                         f32 %239 = OpConstant 3.67402E-40 
                              Private f32_2* %242 = OpVariable Private 
                                         i32 %243 = OpConstant 1 
                              Private f32_2* %299 = OpVariable Private 
                                         i32 %328 = OpConstant 3 
                                Private f32* %361 = OpVariable Private 
                                         i32 %365 = OpConstant 6 
                               Private bool* %369 = OpVariable Private 
                                         i32 %374 = OpConstant -1 
                                         f32 %382 = OpConstant 3.67402E-40 
                                         f32 %392 = OpConstant 3.67402E-40 
                                         f32 %406 = OpConstant 3.67402E-40 
                                             %411 = OpTypePointer Input %6 
                                         u32 %415 = OpConstant 3 
                                         i32 %417 = OpConstant 5 
                                             %423 = OpTypePointer Output %7 
                               Output f32_4* %424 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %100 = OpVariable Function 
                               Function f32* %114 = OpVariable Function 
                             Function f32_2* %166 = OpVariable Function 
                                        f32_2 %13 = OpLoad %12 
                                        f32_2 %16 = OpFAdd %13 %15 
                                        f32_4 %17 = OpLoad %9 
                                        f32_4 %18 = OpVectorShuffle %17 %16 4 5 2 3 
                                                      OpStore %9 %18 
                                 Private f32* %23 = OpAccessChain %9 %22 
                                          f32 %24 = OpLoad %23 
                                 Private f32* %26 = OpAccessChain %9 %25 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %24 %27 
                                                      OpStore %20 %28 
                                          f32 %30 = OpLoad %20 
                                          f32 %31 = OpExtInst %1 4 %30 
                                          f32 %33 = OpExtInst %1 40 %31 %32 
                                                      OpStore %29 %33 
                                          f32 %34 = OpLoad %29 
                                          f32 %35 = OpFDiv %32 %34 
                                                      OpStore %29 %35 
                                          f32 %39 = OpLoad %20 
                                          f32 %40 = OpExtInst %1 4 %39 
                                          f32 %41 = OpExtInst %1 37 %40 %32 
                                 Private f32* %42 = OpAccessChain %38 %25 
                                                      OpStore %42 %41 
                                          f32 %43 = OpLoad %29 
                                 Private f32* %44 = OpAccessChain %38 %25 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFMul %43 %45 
                                                      OpStore %29 %46 
                                          f32 %47 = OpLoad %29 
                                          f32 %48 = OpLoad %29 
                                          f32 %49 = OpFMul %47 %48 
                                 Private f32* %50 = OpAccessChain %38 %25 
                                                      OpStore %50 %49 
                                 Private f32* %52 = OpAccessChain %38 %25 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFMul %53 %54 
                                          f32 %57 = OpFAdd %55 %56 
                                                      OpStore %51 %57 
                                 Private f32* %58 = OpAccessChain %38 %25 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpLoad %51 
                                          f32 %61 = OpFMul %59 %60 
                                          f32 %63 = OpFAdd %61 %62 
                                                      OpStore %51 %63 
                                 Private f32* %64 = OpAccessChain %38 %25 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpLoad %51 
                                          f32 %67 = OpFMul %65 %66 
                                          f32 %69 = OpFAdd %67 %68 
                                                      OpStore %51 %69 
                                 Private f32* %70 = OpAccessChain %38 %25 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpLoad %51 
                                          f32 %73 = OpFMul %71 %72 
                                          f32 %75 = OpFAdd %73 %74 
                                 Private f32* %76 = OpAccessChain %38 %25 
                                                      OpStore %76 %75 
                                          f32 %77 = OpLoad %29 
                                 Private f32* %78 = OpAccessChain %38 %25 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFMul %77 %79 
                                                      OpStore %51 %80 
                                          f32 %81 = OpLoad %51 
                                          f32 %83 = OpFMul %81 %82 
                                          f32 %85 = OpFAdd %83 %84 
                                                      OpStore %51 %85 
                                          f32 %89 = OpLoad %20 
                                          f32 %90 = OpExtInst %1 4 %89 
                                         bool %91 = OpFOrdLessThan %32 %90 
                                                      OpStore %88 %91 
                                          f32 %92 = OpLoad %20 
                                          f32 %93 = OpExtInst %1 37 %92 %32 
                                                      OpStore %20 %93 
                                          f32 %95 = OpLoad %20 
                                          f32 %96 = OpLoad %20 
                                          f32 %97 = OpFNegate %96 
                                         bool %98 = OpFOrdLessThan %95 %97 
                                                      OpStore %94 %98 
                                        bool %101 = OpLoad %88 
                                                      OpSelectionMerge %103 None 
                                                      OpBranchConditional %101 %102 %105 
                                             %102 = OpLabel 
                                         f32 %104 = OpLoad %51 
                                                      OpStore %100 %104 
                                                      OpBranch %103 
                                             %105 = OpLabel 
                                                      OpStore %100 %106 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                         f32 %107 = OpLoad %100 
                                                      OpStore %51 %107 
                                         f32 %108 = OpLoad %29 
                                Private f32* %109 = OpAccessChain %38 %25 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFMul %108 %110 
                                         f32 %112 = OpLoad %51 
                                         f32 %113 = OpFAdd %111 %112 
                                                      OpStore %29 %113 
                                        bool %115 = OpLoad %94 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %120 
                                             %116 = OpLabel 
                                         f32 %118 = OpLoad %29 
                                         f32 %119 = OpFNegate %118 
                                                      OpStore %114 %119 
                                                      OpBranch %117 
                                             %120 = OpLabel 
                                         f32 %121 = OpLoad %29 
                                                      OpStore %114 %121 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                         f32 %122 = OpLoad %114 
                                                      OpStore %20 %122 
                              Uniform f32_4* %129 = OpAccessChain %125 %127 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                Uniform f32* %134 = OpAccessChain %125 %132 
                                         f32 %135 = OpLoad %134 
                                Uniform f32* %136 = OpAccessChain %125 %132 
                                         f32 %137 = OpLoad %136 
                                       f32_2 %138 = OpCompositeConstruct %135 %137 
                                         f32 %139 = OpCompositeExtract %138 0 
                                         f32 %140 = OpCompositeExtract %138 1 
                                       f32_2 %141 = OpCompositeConstruct %139 %140 
                                       f32_2 %142 = OpFMul %131 %141 
                                       f32_2 %145 = OpFAdd %142 %144 
                                       f32_3 %146 = OpLoad %38 
                                       f32_3 %147 = OpVectorShuffle %146 %145 3 4 2 
                                                      OpStore %38 %147 
                                Private f32* %148 = OpAccessChain %38 %25 
                                         f32 %149 = OpLoad %148 
                                Uniform f32* %151 = OpAccessChain %125 %150 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %149 %152 
                                                      OpStore %29 %153 
                                         f32 %155 = OpLoad %29 
                                         f32 %157 = OpFMul %155 %156 
                                                      OpStore %154 %157 
                                         f32 %159 = OpLoad %154 
                                         f32 %160 = OpLoad %154 
                                         f32 %161 = OpFNegate %160 
                                        bool %162 = OpFOrdGreaterThanEqual %159 %161 
                                                      OpStore %158 %162 
                                        bool %167 = OpLoad %158 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %172 
                                             %168 = OpLabel 
                                                      OpStore %166 %171 
                                                      OpBranch %169 
                                             %172 = OpLabel 
                                                      OpStore %166 %175 
                                                      OpBranch %169 
                                             %169 = OpLabel 
                                       f32_2 %176 = OpLoad %166 
                                                      OpStore %164 %176 
                                         f32 %177 = OpLoad %29 
                                Private f32* %178 = OpAccessChain %164 %22 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFMul %177 %179 
                                                      OpStore %29 %180 
                                         f32 %181 = OpLoad %29 
                                         f32 %182 = OpExtInst %1 10 %181 
                                                      OpStore %29 %182 
                                Private f32* %183 = OpAccessChain %164 %25 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpLoad %29 
                                         f32 %186 = OpFMul %184 %185 
                                         f32 %187 = OpLoad %20 
                                         f32 %188 = OpFAdd %186 %187 
                                                      OpStore %20 %188 
                                         f32 %189 = OpLoad %20 
                                Uniform f32* %191 = OpAccessChain %125 %190 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFMul %189 %192 
                                                      OpStore %29 %193 
                                         f32 %194 = OpLoad %29 
                                         f32 %195 = OpExtInst %1 14 %194 
                                                      OpStore %29 %195 
                                Private f32* %196 = OpAccessChain %38 %25 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFNegate %197 
                                Private f32* %200 = OpAccessChain %38 %199 
                                                      OpStore %200 %198 
                                       f32_3 %202 = OpLoad %38 
                                       f32_2 %203 = OpVectorShuffle %202 %202 2 0 
                                       f32_2 %204 = OpLoad %12 
                                       f32_2 %205 = OpFAdd %203 %204 
                                                      OpStore %201 %205 
                                       f32_2 %206 = OpLoad %201 
                                       f32_2 %209 = OpFMul %206 %208 
                                                      OpStore %201 %209 
                                       f32_2 %210 = OpLoad %201 
                                       f32_2 %211 = OpExtInst %1 10 %210 
                                                      OpStore %201 %211 
                  read_only Texture2DSampled %217 = OpLoad %216 
                                       f32_2 %218 = OpLoad %201 
                                       f32_4 %219 = OpImageSampleImplicitLod %217 %218 
                                       f32_2 %220 = OpVectorShuffle %219 %219 1 2 
                                                      OpStore %212 %220 
                                Private f32* %221 = OpAccessChain %212 %22 
                                         f32 %222 = OpLoad %221 
                                         f32 %224 = OpFMul %222 %223 
                                Private f32* %225 = OpAccessChain %38 %22 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFAdd %224 %226 
                                Private f32* %228 = OpAccessChain %164 %25 
                                                      OpStore %228 %227 
                                Private f32* %229 = OpAccessChain %164 %25 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpExtInst %1 13 %230 
                                Private f32* %232 = OpAccessChain %164 %25 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %164 %25 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpFAdd %234 %32 
                                Private f32* %236 = OpAccessChain %164 %25 
                                                      OpStore %236 %235 
                                Private f32* %237 = OpAccessChain %164 %25 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                Private f32* %241 = OpAccessChain %164 %25 
                                                      OpStore %241 %240 
                              Uniform f32_4* %244 = OpAccessChain %125 %243 
                                       f32_4 %245 = OpLoad %244 
                                       f32_2 %246 = OpVectorShuffle %245 %245 0 2 
                                       f32_2 %247 = OpFNegate %246 
                              Uniform f32_4* %248 = OpAccessChain %125 %243 
                                       f32_4 %249 = OpLoad %248 
                                       f32_2 %250 = OpVectorShuffle %249 %249 1 3 
                                       f32_2 %251 = OpFAdd %247 %250 
                                                      OpStore %242 %251 
                                Private f32* %252 = OpAccessChain %164 %25 
                                         f32 %253 = OpLoad %252 
                                Private f32* %254 = OpAccessChain %242 %25 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFMul %253 %255 
                                Uniform f32* %257 = OpAccessChain %125 %243 %25 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFAdd %256 %258 
                                Private f32* %260 = OpAccessChain %164 %25 
                                                      OpStore %260 %259 
                                       f32_4 %261 = OpLoad %9 
                                       f32_2 %262 = OpVectorShuffle %261 %261 0 1 
                                       f32_2 %263 = OpLoad %164 
                                       f32_2 %264 = OpVectorShuffle %263 %263 0 0 
                                       f32_2 %265 = OpFMul %262 %264 
                                                      OpStore %164 %265 
                                       f32_2 %266 = OpLoad %212 
                                       f32_2 %267 = OpVectorShuffle %266 %266 0 0 
                                       f32_2 %268 = OpLoad %164 
                                       f32_2 %269 = OpFMul %267 %268 
                                                      OpStore %164 %269 
                                       f32_2 %270 = OpLoad %212 
                                       f32_2 %271 = OpVectorShuffle %270 %270 1 1 
                                       f32_2 %272 = OpLoad %164 
                                       f32_2 %273 = OpFMul %271 %272 
                                                      OpStore %201 %273 
                                         f32 %274 = OpLoad %29 
                                       f32_2 %275 = OpCompositeConstruct %274 %274 
                                       f32_2 %276 = OpLoad %201 
                                       f32_2 %277 = OpFMul %275 %276 
                                       f32_4 %278 = OpLoad %9 
                                       f32_2 %279 = OpVectorShuffle %278 %278 0 1 
                                       f32_2 %280 = OpFAdd %277 %279 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 2 3 
                                                      OpStore %9 %282 
                                Private f32* %283 = OpAccessChain %38 %22 
                                         f32 %284 = OpLoad %283 
                                Private f32* %285 = OpAccessChain %38 %22 
                                         f32 %286 = OpLoad %285 
                                         f32 %287 = OpFAdd %284 %286 
                                                      OpStore %29 %287 
                                       f32_3 %288 = OpLoad %38 
                                       f32_2 %289 = OpVectorShuffle %288 %288 0 0 
                                       f32_2 %290 = OpLoad %12 
                                       f32_2 %291 = OpFAdd %289 %290 
                                       f32_3 %292 = OpLoad %38 
                                       f32_3 %293 = OpVectorShuffle %292 %291 3 4 2 
                                                      OpStore %38 %293 
                                       f32_3 %294 = OpLoad %38 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                       f32_2 %296 = OpExtInst %1 10 %295 
                                       f32_3 %297 = OpLoad %38 
                                       f32_3 %298 = OpVectorShuffle %297 %296 3 4 2 
                                                      OpStore %38 %298 
                  read_only Texture2DSampled %300 = OpLoad %216 
                                       f32_3 %301 = OpLoad %38 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 1 
                                       f32_4 %303 = OpImageSampleImplicitLod %300 %302 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 2 
                                                      OpStore %299 %304 
                                         f32 %305 = OpLoad %29 
                                         f32 %306 = OpExtInst %1 13 %305 
                                                      OpStore %29 %306 
                                         f32 %307 = OpLoad %29 
                                         f32 %308 = OpFAdd %307 %32 
                                                      OpStore %29 %308 
                                         f32 %309 = OpLoad %29 
                                         f32 %310 = OpFMul %309 %239 
                                                      OpStore %29 %310 
                                         f32 %311 = OpLoad %29 
                                Private f32* %312 = OpAccessChain %242 %22 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpFMul %311 %313 
                                Uniform f32* %315 = OpAccessChain %125 %243 %199 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFAdd %314 %316 
                                                      OpStore %29 %317 
                                Private f32* %318 = OpAccessChain %299 %25 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpLoad %29 
                                         f32 %321 = OpFMul %319 %320 
                                                      OpStore %29 %321 
                                Private f32* %322 = OpAccessChain %299 %22 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFMul %323 %239 
                                         f32 %325 = OpLoad %20 
                                         f32 %326 = OpFAdd %324 %325 
                                                      OpStore %20 %326 
                                         f32 %327 = OpLoad %20 
                                Uniform f32* %329 = OpAccessChain %125 %328 
                                         f32 %330 = OpLoad %329 
                                         f32 %331 = OpFMul %327 %330 
                                                      OpStore %20 %331 
                                         f32 %332 = OpLoad %20 
                                         f32 %333 = OpExtInst %1 13 %332 
                                                      OpStore %20 %333 
                                         f32 %334 = OpLoad %29 
                                       f32_2 %335 = OpCompositeConstruct %334 %334 
                                       f32_4 %336 = OpLoad %9 
                                       f32_2 %337 = OpVectorShuffle %336 %336 0 1 
                                       f32_2 %338 = OpFMul %335 %337 
                                       f32_3 %339 = OpLoad %38 
                                       f32_3 %340 = OpVectorShuffle %339 %338 3 4 2 
                                                      OpStore %38 %340 
                                         f32 %341 = OpLoad %20 
                                       f32_2 %342 = OpCompositeConstruct %341 %341 
                                       f32_3 %343 = OpLoad %38 
                                       f32_2 %344 = OpVectorShuffle %343 %343 0 1 
                                       f32_2 %345 = OpFMul %342 %344 
                                       f32_4 %346 = OpLoad %9 
                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                                       f32_2 %348 = OpFAdd %345 %347 
                                       f32_4 %349 = OpLoad %9 
                                       f32_4 %350 = OpVectorShuffle %349 %348 4 5 2 3 
                                                      OpStore %9 %350 
                                       f32_4 %351 = OpLoad %9 
                                       f32_2 %352 = OpVectorShuffle %351 %351 0 1 
                                       f32_4 %353 = OpLoad %9 
                                       f32_2 %354 = OpVectorShuffle %353 %353 0 1 
                                         f32 %355 = OpDot %352 %354 
                                Private f32* %356 = OpAccessChain %9 %25 
                                                      OpStore %356 %355 
                                Private f32* %357 = OpAccessChain %9 %25 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpExtInst %1 31 %358 
                                Private f32* %360 = OpAccessChain %9 %25 
                                                      OpStore %360 %359 
                                Private f32* %362 = OpAccessChain %9 %25 
                                         f32 %363 = OpLoad %362 
                                         f32 %364 = OpFNegate %363 
                                Uniform f32* %366 = OpAccessChain %125 %365 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %364 %367 
                                                      OpStore %361 %368 
                                         f32 %370 = OpLoad %361 
                                        bool %371 = OpFOrdLessThan %370 %106 
                                                      OpStore %369 %371 
                                        bool %372 = OpLoad %369 
                                         i32 %373 = OpSelect %372 %243 %127 
                                         i32 %375 = OpIMul %373 %374 
                                        bool %376 = OpINotEqual %375 %127 
                                                      OpSelectionMerge %378 None 
                                                      OpBranchConditional %376 %377 %378 
                                             %377 = OpLabel 
                                                      OpKill
                                             %378 = OpLabel 
                                Uniform f32* %380 = OpAccessChain %125 %365 
                                         f32 %381 = OpLoad %380 
                                         f32 %383 = OpFAdd %381 %382 
                                                      OpStore %361 %383 
                                         f32 %384 = OpLoad %361 
                                         f32 %385 = OpFNegate %384 
                                Private f32* %386 = OpAccessChain %9 %25 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                Private f32* %389 = OpAccessChain %9 %25 
                                                      OpStore %389 %388 
                                Private f32* %390 = OpAccessChain %9 %25 
                                         f32 %391 = OpLoad %390 
                                         f32 %393 = OpFMul %391 %392 
                                Private f32* %394 = OpAccessChain %9 %25 
                                                      OpStore %394 %393 
                                Private f32* %395 = OpAccessChain %9 %25 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpExtInst %1 43 %396 %106 %32 
                                Private f32* %398 = OpAccessChain %9 %25 
                                                      OpStore %398 %397 
                                Private f32* %399 = OpAccessChain %9 %25 
                                         f32 %400 = OpLoad %399 
                                         f32 %401 = OpFMul %400 %14 
                                         f32 %402 = OpFAdd %401 %239 
                                Private f32* %403 = OpAccessChain %9 %25 
                                                      OpStore %403 %402 
                                Private f32* %404 = OpAccessChain %9 %25 
                                         f32 %405 = OpLoad %404 
                                         f32 %407 = OpExtInst %1 37 %405 %406 
                                Private f32* %408 = OpAccessChain %9 %25 
                                                      OpStore %408 %407 
                                Private f32* %409 = OpAccessChain %9 %25 
                                         f32 %410 = OpLoad %409 
                                  Input f32* %412 = OpAccessChain %12 %22 
                                         f32 %413 = OpLoad %412 
                                         f32 %414 = OpFMul %410 %413 
                                Private f32* %416 = OpAccessChain %9 %415 
                                                      OpStore %416 %414 
                              Uniform f32_4* %418 = OpAccessChain %125 %417 
                                       f32_4 %419 = OpLoad %418 
                                       f32_3 %420 = OpVectorShuffle %419 %419 0 1 2 
                                       f32_4 %421 = OpLoad %9 
                                       f32_4 %422 = OpVectorShuffle %421 %420 4 5 6 3 
                                                      OpStore %9 %422 
                                       f32_4 %425 = OpLoad %9 
                                                      OpStore %424 %425 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}