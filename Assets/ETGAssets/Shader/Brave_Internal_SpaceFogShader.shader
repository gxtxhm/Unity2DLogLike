//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/SpaceFogShader" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_NoiseTex ("Noise", 2D) = "white" { }
_PortalTex ("Portal", 2D) = "black" { }
_RotSpeed ("Rotation Speed", Float) = 0
_Magnitudes ("LS/SS MinMax", Vector) = (0.25,0.25,0.1,0.1)
_LSFreq ("Large-Scale Frequency", Float) = 8
_SSFreq ("Small-Scale Frequency", Float) = 24
_PlayerPos ("Player Position World", Vector) = (0,0,0,0)
_UVDistCutoff ("Cutoff Edge", Float) = 0.4
_MandatedAlpha ("Alpha", Float) = 1
_TimeScale ("Time Scale", Float) = 1
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Overlay+1" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Overlay+1" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 12660
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	float _UVDistCutoff;
uniform 	vec4 _PlayerPos;
uniform 	float _TimeScale;
uniform  sampler2D _NoiseTex;
uniform  sampler2D _PortalTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat10_6;
vec4 u_xlat7;
vec2 u_xlat8;
vec3 u_xlat16_8;
bool u_xlatb8;
vec2 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
bool u_xlatb17;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = u_xlat0.y / u_xlat0.x;
    u_xlat24 = max(abs(u_xlat16.x), 1.0);
    u_xlat24 = float(1.0) / u_xlat24;
    u_xlat1.x = min(abs(u_xlat16.x), 1.0);
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat1.x = u_xlat24 * u_xlat24;
    u_xlat9.x = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat9.x = u_xlat1.x * u_xlat9.x + 0.180141002;
    u_xlat9.x = u_xlat1.x * u_xlat9.x + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat9.x + 0.999866009;
    u_xlat9.x = u_xlat24 * u_xlat1.x;
    u_xlat9.x = u_xlat9.x * -2.0 + 1.57079637;
    u_xlatb17 = 1.0<abs(u_xlat16.x);
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlatb16 = u_xlat16.x<(-u_xlat16.x);
    u_xlat9.x = u_xlatb17 ? u_xlat9.x : float(0.0);
    u_xlat24 = u_xlat24 * u_xlat1.x + u_xlat9.x;
    u_xlat16.x = (u_xlatb16) ? (-u_xlat24) : u_xlat24;
    u_xlat1.xy = _Time.xy * vec2(_TimeScale);
    u_xlat24 = u_xlat1.x * _RotSpeed;
    u_xlat1.x = u_xlat24 * 90.0;
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlat1.xz = (bool(u_xlatb1)) ? vec2(90.0, 0.0111111114) : vec2(-90.0, -0.0111111114);
    u_xlat24 = u_xlat24 * u_xlat1.z;
    u_xlat24 = fract(u_xlat24);
    u_xlat16.x = u_xlat1.x * u_xlat24 + u_xlat16.x;
    u_xlat17.x = u_xlat16.x * _LSFreq;
    u_xlat17.x = cos(u_xlat17.x);
    u_xlat2.xy = _Time.xx * vec2(-1.0, 1.0);
    u_xlat18.xy = u_xlat2.xy * vec2(_TimeScale) + vs_TEXCOORD0.xy;
    u_xlat18.xy = u_xlat18.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat10_3 = texture(_NoiseTex, u_xlat18.xy);
    u_xlat25 = u_xlat10_3.z * 20.0 + u_xlat1.y;
    u_xlat25 = sin(u_xlat25);
    u_xlat25 = u_xlat25 + 1.0;
    u_xlat25 = u_xlat25 * 0.5;
    u_xlat18.xy = (-_Magnitudes.xz) + _Magnitudes.yw;
    u_xlat25 = u_xlat25 * u_xlat18.x + _Magnitudes.x;
    u_xlat3.xw = u_xlat0.xy * vec2(u_xlat25);
    u_xlat3.xy = u_xlat10_3.yy * u_xlat3.xw;
    u_xlat3.xy = u_xlat10_3.zz * u_xlat3.xy;
    u_xlat0.xy = u_xlat17.xx * u_xlat3.xy + u_xlat0.xy;
    u_xlat17.x = u_xlat1.y + u_xlat1.y;
    u_xlat17.x = sin(u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * 0.5;
    u_xlat17.x = u_xlat17.x * u_xlat18.y + _Magnitudes.z;
    u_xlat3.xy = _Time.xx * vec2(_TimeScale) + vs_TEXCOORD0.xy;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat10_3 = texture(_NoiseTex, u_xlat3.xy);
    u_xlat17.x = u_xlat17.x * u_xlat10_3.x;
    u_xlat16.x = u_xlat10_3.z * 0.5 + u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _SSFreq;
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat17.xy = u_xlat0.xy * u_xlat17.xx;
    u_xlat0.xy = u_xlat16.xx * u_xlat17.xy + u_xlat0.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _UVDistCutoff;
    u_xlatb8 = u_xlat0.x<0.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.200000003;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    if((int(u_xlatb8) * int(0xffffffffu))!=0){discard;}
    u_xlat3 = vs_TEXCOORD1.xyxy + (-_PlayerPos);
    u_xlat4 = u_xlat3.xyxy + vec4(0.5, 1.0, 0.0, 0.5);
    u_xlat3 = u_xlat3.zwzw + vec4(0.5, 1.0, 0.0, 0.5);
    u_xlat8.x = u_xlat4.w / u_xlat4.z;
    u_xlat16.x = max(abs(u_xlat8.x), 1.0);
    u_xlat16.x = float(1.0) / u_xlat16.x;
    u_xlat17.x = min(abs(u_xlat8.x), 1.0);
    u_xlat16.x = u_xlat16.x * u_xlat17.x;
    u_xlat17.x = u_xlat16.x * u_xlat16.x;
    u_xlat25 = u_xlat17.x * 0.0208350997 + -0.0851330012;
    u_xlat25 = u_xlat17.x * u_xlat25 + 0.180141002;
    u_xlat25 = u_xlat17.x * u_xlat25 + -0.330299497;
    u_xlat17.x = u_xlat17.x * u_xlat25 + 0.999866009;
    u_xlat25 = u_xlat16.x * u_xlat17.x;
    u_xlat25 = u_xlat25 * -2.0 + 1.57079637;
    u_xlatb5 = 1.0<abs(u_xlat8.x);
    u_xlat8.x = min(u_xlat8.x, 1.0);
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
    u_xlat25 = u_xlatb5 ? u_xlat25 : float(0.0);
    u_xlat16.x = u_xlat16.x * u_xlat17.x + u_xlat25;
    u_xlat8.x = (u_xlatb8) ? (-u_xlat16.x) : u_xlat16.x;
    u_xlat8.x = u_xlat1.x * u_xlat24 + u_xlat8.x;
    u_xlat16.x = u_xlat8.x * _LSFreq;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat17.xy = u_xlat2.xy * vec2(_TimeScale) + u_xlat4.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_TimeScale) + u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat10_5 = texture(_NoiseTex, u_xlat2.xy);
    u_xlat17.xy = u_xlat17.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat17.xy = fract(u_xlat17.xy);
    u_xlat10_6 = texture(_NoiseTex, u_xlat17.xy);
    u_xlat7 = _PlayerPos + _PlayerPos;
    u_xlat17.xy = _Time.yy * vec2(_TimeScale) + u_xlat7.xz;
    u_xlat2.xy = u_xlat7.yw + u_xlat7.xz;
    u_xlat2.xy = u_xlat1.yy * vec2(2.0, 2.0) + u_xlat2.xy;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat2.xy = u_xlat18.yy * u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.5, 0.5) + _Magnitudes.zz;
    u_xlat9.xy = _PlayerPos.yw * vec2(2.0, 2.0) + u_xlat17.xy;
    u_xlat9.x = u_xlat10_6.z * 20.0 + u_xlat9.x;
    u_xlat9.y = u_xlat10_5.z * 20.0 + u_xlat9.y;
    u_xlat9.xy = sin(u_xlat9.xy);
    u_xlat9.xy = u_xlat9.xy + vec2(1.0, 1.0);
    u_xlat9.xy = u_xlat18.xx * u_xlat9.xy;
    u_xlat17.x = u_xlat9.y * 0.5 + _Magnitudes.x;
    u_xlat17.xy = u_xlat17.xx * u_xlat3.zw;
    u_xlat17.xy = u_xlat10_5.yy * u_xlat17.xy;
    u_xlat17.xy = u_xlat10_5.zz * u_xlat17.xy;
    u_xlat9.x = u_xlat9.x * 0.5 + _Magnitudes.x;
    u_xlat18.xy = u_xlat9.xx * u_xlat4.zw;
    u_xlat18.xy = u_xlat10_6.yy * u_xlat18.xy;
    u_xlat18.xy = u_xlat10_6.zz * u_xlat18.xy;
    u_xlat18.xy = u_xlat16.xx * u_xlat18.xy + u_xlat4.zw;
    u_xlat4.xy = _Time.xx * vec2(_TimeScale) + u_xlat4.xy;
    u_xlat4.xy = fract(u_xlat4.xy);
    u_xlat10_4 = texture(_NoiseTex, u_xlat4.xy);
    u_xlat16.x = u_xlat2.x * u_xlat10_4.x;
    u_xlat8.x = u_xlat10_4.z * 0.5 + u_xlat8.x;
    u_xlat8.x = u_xlat8.x * _SSFreq;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat4.xy = u_xlat16.xx * u_xlat18.xy;
    u_xlat8.xy = u_xlat8.xx * u_xlat4.xy + u_xlat18.xy;
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat8.x) + 1.5;
    u_xlatb8 = -0.0<u_xlat8.x;
    if((int(u_xlatb8) * int(0xffffffffu))!=0){discard;}
    u_xlat8.x = u_xlat3.w / u_xlat3.z;
    u_xlat16.x = max(abs(u_xlat8.x), 1.0);
    u_xlat16.x = float(1.0) / u_xlat16.x;
    u_xlat9.x = min(abs(u_xlat8.x), 1.0);
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
    u_xlat9.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat9.x * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat9.x * u_xlat2.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat16.x * u_xlat9.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb18 = 1.0<abs(u_xlat8.x);
    u_xlat8.x = min(u_xlat8.x, 1.0);
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
    u_xlat2.x = u_xlatb18 ? u_xlat2.x : float(0.0);
    u_xlat16.x = u_xlat16.x * u_xlat9.x + u_xlat2.x;
    u_xlat8.x = (u_xlatb8) ? (-u_xlat16.x) : u_xlat16.x;
    u_xlat8.x = u_xlat1.x * u_xlat24 + u_xlat8.x;
    u_xlat16.x = u_xlat8.x * _LSFreq;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16.xy = u_xlat16.xx * u_xlat17.xy + u_xlat3.zw;
    u_xlat1.xy = _Time.xx * vec2(_TimeScale) + u_xlat3.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat10_1 = texture(_NoiseTex, u_xlat1.xy);
    u_xlat1.x = u_xlat10_1.x * u_xlat2.y;
    u_xlat8.x = u_xlat10_1.z * 0.5 + u_xlat8.x;
    u_xlat8.x = u_xlat8.x * _SSFreq;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat1.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat8.xy = u_xlat8.xx * u_xlat1.xy + u_xlat16.xy;
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat8.x) + 1.5;
    u_xlatb8 = -0.0<u_xlat8.x;
    if((int(u_xlatb8) * int(0xffffffffu))!=0){discard;}
    u_xlat10_1 = texture(_PortalTex, vs_TEXCOORD2.xy);
    u_xlat16_8.xyz = u_xlat10_1.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 130
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %102 %113 %121 %122 
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
                                                     OpDecorate %121 RelaxedPrecision 
                                                     OpDecorate %121 Location 121 
                                                     OpDecorate %122 RelaxedPrecision 
                                                     OpDecorate %122 Location 122 
                                                     OpDecorate %123 RelaxedPrecision 
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
                              Output f32_4* %121 = OpVariable Output 
                               Input f32_4* %122 = OpVariable Input 
                                            %124 = OpTypePointer Output %6 
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
                                      f32_4 %123 = OpLoad %122 
                                                     OpStore %121 %123 
                                Output f32* %125 = OpAccessChain %102 %38 %98 
                                        f32 %126 = OpLoad %125 
                                        f32 %127 = OpFNegate %126 
                                Output f32* %128 = OpAccessChain %102 %38 %98 
                                                     OpStore %128 %127 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 1082
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %417 %434 %1060 %1070 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpMemberDecorate %142 0 Offset 142 
                                                      OpMemberDecorate %142 1 Offset 142 
                                                      OpMemberDecorate %142 2 Offset 142 
                                                      OpMemberDecorate %142 3 Offset 142 
                                                      OpMemberDecorate %142 4 Offset 142 
                                                      OpMemberDecorate %142 5 Offset 142 
                                                      OpMemberDecorate %142 6 Offset 142 
                                                      OpMemberDecorate %142 7 Offset 142 
                                                      OpDecorate %142 Block 
                                                      OpDecorate %144 DescriptorSet 144 
                                                      OpDecorate %144 Binding 144 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %245 DescriptorSet 245 
                                                      OpDecorate %245 Binding 245 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %417 Location 417 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %434 Location 434 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %602 RelaxedPrecision 
                                                      OpDecorate %606 RelaxedPrecision 
                                                      OpDecorate %611 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %615 RelaxedPrecision 
                                                      OpDecorate %668 RelaxedPrecision 
                                                      OpDecorate %669 RelaxedPrecision 
                                                      OpDecorate %675 RelaxedPrecision 
                                                      OpDecorate %676 RelaxedPrecision 
                                                      OpDecorate %707 RelaxedPrecision 
                                                      OpDecorate %708 RelaxedPrecision 
                                                      OpDecorate %713 RelaxedPrecision 
                                                      OpDecorate %714 RelaxedPrecision 
                                                      OpDecorate %746 RelaxedPrecision 
                                                      OpDecorate %747 RelaxedPrecision 
                                                      OpDecorate %750 RelaxedPrecision 
                                                      OpDecorate %751 RelaxedPrecision 
                                                      OpDecorate %773 RelaxedPrecision 
                                                      OpDecorate %776 RelaxedPrecision 
                                                      OpDecorate %778 RelaxedPrecision 
                                                      OpDecorate %784 RelaxedPrecision 
                                                      OpDecorate %785 RelaxedPrecision 
                                                      OpDecorate %992 RelaxedPrecision 
                                                      OpDecorate %993 RelaxedPrecision 
                                                      OpDecorate %997 RelaxedPrecision 
                                                      OpDecorate %999 RelaxedPrecision 
                                                      OpDecorate %1005 RelaxedPrecision 
                                                      OpDecorate %1006 RelaxedPrecision 
                                                      OpDecorate %1057 RelaxedPrecision 
                                                      OpDecorate %1058 RelaxedPrecision 
                                                      OpDecorate %1058 DescriptorSet 1058 
                                                      OpDecorate %1058 Binding 1058 
                                                      OpDecorate %1059 RelaxedPrecision 
                                                      OpDecorate %1060 Location 1060 
                                                      OpDecorate %1064 RelaxedPrecision 
                                                      OpDecorate %1065 RelaxedPrecision 
                                                      OpDecorate %1066 RelaxedPrecision 
                                                      OpDecorate %1067 RelaxedPrecision 
                                                      OpDecorate %1068 RelaxedPrecision 
                                                      OpDecorate %1070 RelaxedPrecision 
                                                      OpDecorate %1070 Location 1070 
                                                      OpDecorate %1073 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_2* %11 = OpVariable Input 
                                          f32 %13 = OpConstant 3.67402E-40 
                                        f32_2 %14 = OpConstantComposite %13 %13 
                               Private f32_2* %16 = OpVariable Private 
                                              %17 = OpTypeInt 32 0 
                                          u32 %18 = OpConstant 1 
                                              %19 = OpTypePointer Private %6 
                                          u32 %22 = OpConstant 0 
                                 Private f32* %27 = OpVariable Private 
                                          f32 %31 = OpConstant 3.67402E-40 
                                              %35 = OpTypeVector %6 3 
                                              %36 = OpTypePointer Private %35 
                               Private f32_3* %37 = OpVariable Private 
                               Private f32_2* %51 = OpVariable Private 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          f32 %56 = OpConstant 3.67402E-40 
                                          f32 %64 = OpConstant 3.67402E-40 
                                          f32 %72 = OpConstant 3.67402E-40 
                                          f32 %80 = OpConstant 3.67402E-40 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %92 = OpConstant 3.67402E-40 
                                              %95 = OpTypeBool 
                                              %96 = OpTypePointer Private %95 
                                Private bool* %97 = OpVariable Private 
                               Private bool* %106 = OpVariable Private 
                                             %113 = OpTypePointer Function %6 
                                         f32 %121 = OpConstant 3.67402E-40 
                                             %141 = OpTypeVector %6 4 
                                             %142 = OpTypeStruct %141 %141 %6 %6 %6 %6 %141 %6 
                                             %143 = OpTypePointer Uniform %142 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32_4; f32;}* %144 = OpVariable Uniform 
                                             %145 = OpTypeInt 32 1 
                                         i32 %146 = OpConstant 0 
                                             %147 = OpTypePointer Uniform %141 
                                         i32 %151 = OpConstant 7 
                                             %152 = OpTypePointer Uniform %6 
                                         i32 %161 = OpConstant 4 
                                         f32 %166 = OpConstant 3.67402E-40 
                               Private bool* %169 = OpVariable Private 
                                             %176 = OpTypePointer Function %7 
                                         f32 %181 = OpConstant 3.67402E-40 
                                       f32_2 %182 = OpConstantComposite %166 %181 
                                         f32 %184 = OpConstant 3.67402E-40 
                                         f32 %185 = OpConstant 3.67402E-40 
                                       f32_2 %186 = OpConstantComposite %184 %185 
                                         u32 %191 = OpConstant 2 
                              Private f32_2* %205 = OpVariable Private 
                                         i32 %208 = OpConstant 2 
                              Private f32_3* %217 = OpVariable Private 
                                         f32 %221 = OpConstant 3.67402E-40 
                                       f32_2 %222 = OpConstantComposite %221 %31 
                              Private f32_2* %226 = OpVariable Private 
                                         f32 %236 = OpConstant 3.67402E-40 
                                       f32_2 %237 = OpConstantComposite %236 %236 
                              Private f32_2* %241 = OpVariable Private 
                                             %242 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %243 = OpTypeSampledImage %242 
                                             %244 = OpTypePointer UniformConstant %243 
 UniformConstant read_only Texture2DSampled* %245 = OpVariable UniformConstant 
                                Private f32* %250 = OpVariable Private 
                                         f32 %253 = OpConstant 3.67402E-40 
                                         f32 %263 = OpConstant 3.67402E-40 
                              Private f32_2* %265 = OpVariable Private 
                                         i32 %266 = OpConstant 1 
                              Private f32_2* %282 = OpVariable Private 
                                         i32 %358 = OpConstant 3 
                                         i32 %388 = OpConstant 5 
                               Private bool* %393 = OpVariable Private 
                                         f32 %403 = OpConstant 3.67402E-40 
                                             %416 = OpTypePointer Input %141 
                                Input f32_4* %417 = OpVariable Input 
                                         u32 %418 = OpConstant 3 
                                             %419 = OpTypePointer Input %6 
                                         i32 %426 = OpConstant -1 
                                             %432 = OpTypePointer Private %141 
                              Private f32_4* %433 = OpVariable Private 
                                Input f32_4* %434 = OpVariable Input 
                                         i32 %437 = OpConstant 6 
                              Private f32_4* %442 = OpVariable Private 
                                       f32_4 %445 = OpConstantComposite %263 %31 %121 %263 
                              Private f32_2* %450 = OpVariable Private 
                               Private bool* %511 = OpVariable Private 
                              Private f32_2* %601 = OpVariable Private 
                              Private f32_2* %611 = OpVariable Private 
                              Private f32_4* %616 = OpVariable Private 
                                         f32 %639 = OpConstant 3.67402E-40 
                                       f32_2 %640 = OpConstantComposite %639 %639 
                                       f32_2 %647 = OpConstantComposite %31 %31 
                              Private f32_2* %649 = OpVariable Private 
                                       f32_2 %655 = OpConstantComposite %263 %263 
                                         f32 %821 = OpConstant 3.67402E-40 
                                         f32 %824 = OpConstant 3.67402E-40 
                               Private bool* %904 = OpVariable Private 
                              Private f32_2* %992 = OpVariable Private 
                             Private f32_3* %1057 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %1058 = OpVariable UniformConstant 
                               Input f32_4* %1060 = OpVariable Input 
                             Private f32_3* %1065 = OpVariable Private 
                                            %1069 = OpTypePointer Output %141 
                              Output f32_4* %1070 = OpVariable Output 
                                            %1079 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %114 = OpVariable Function 
                               Function f32* %131 = OpVariable Function 
                             Function f32_2* %177 = OpVariable Function 
                               Function f32* %526 = OpVariable Function 
                               Function f32* %541 = OpVariable Function 
                               Function f32* %919 = OpVariable Function 
                               Function f32* %937 = OpVariable Function 
                                        f32_2 %12 = OpLoad %11 
                                        f32_2 %15 = OpFAdd %12 %14 
                                                      OpStore %9 %15 
                                 Private f32* %20 = OpAccessChain %9 %18 
                                          f32 %21 = OpLoad %20 
                                 Private f32* %23 = OpAccessChain %9 %22 
                                          f32 %24 = OpLoad %23 
                                          f32 %25 = OpFDiv %21 %24 
                                 Private f32* %26 = OpAccessChain %16 %22 
                                                      OpStore %26 %25 
                                 Private f32* %28 = OpAccessChain %16 %22 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpExtInst %1 4 %29 
                                          f32 %32 = OpExtInst %1 40 %30 %31 
                                                      OpStore %27 %32 
                                          f32 %33 = OpLoad %27 
                                          f32 %34 = OpFDiv %31 %33 
                                                      OpStore %27 %34 
                                 Private f32* %38 = OpAccessChain %16 %22 
                                          f32 %39 = OpLoad %38 
                                          f32 %40 = OpExtInst %1 4 %39 
                                          f32 %41 = OpExtInst %1 37 %40 %31 
                                 Private f32* %42 = OpAccessChain %37 %22 
                                                      OpStore %42 %41 
                                          f32 %43 = OpLoad %27 
                                 Private f32* %44 = OpAccessChain %37 %22 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFMul %43 %45 
                                                      OpStore %27 %46 
                                          f32 %47 = OpLoad %27 
                                          f32 %48 = OpLoad %27 
                                          f32 %49 = OpFMul %47 %48 
                                 Private f32* %50 = OpAccessChain %37 %22 
                                                      OpStore %50 %49 
                                 Private f32* %52 = OpAccessChain %37 %22 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFMul %53 %54 
                                          f32 %57 = OpFAdd %55 %56 
                                 Private f32* %58 = OpAccessChain %51 %22 
                                                      OpStore %58 %57 
                                 Private f32* %59 = OpAccessChain %37 %22 
                                          f32 %60 = OpLoad %59 
                                 Private f32* %61 = OpAccessChain %51 %22 
                                          f32 %62 = OpLoad %61 
                                          f32 %63 = OpFMul %60 %62 
                                          f32 %65 = OpFAdd %63 %64 
                                 Private f32* %66 = OpAccessChain %51 %22 
                                                      OpStore %66 %65 
                                 Private f32* %67 = OpAccessChain %37 %22 
                                          f32 %68 = OpLoad %67 
                                 Private f32* %69 = OpAccessChain %51 %22 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpFMul %68 %70 
                                          f32 %73 = OpFAdd %71 %72 
                                 Private f32* %74 = OpAccessChain %51 %22 
                                                      OpStore %74 %73 
                                 Private f32* %75 = OpAccessChain %37 %22 
                                          f32 %76 = OpLoad %75 
                                 Private f32* %77 = OpAccessChain %51 %22 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFMul %76 %78 
                                          f32 %81 = OpFAdd %79 %80 
                                 Private f32* %82 = OpAccessChain %37 %22 
                                                      OpStore %82 %81 
                                          f32 %83 = OpLoad %27 
                                 Private f32* %84 = OpAccessChain %37 %22 
                                          f32 %85 = OpLoad %84 
                                          f32 %86 = OpFMul %83 %85 
                                 Private f32* %87 = OpAccessChain %51 %22 
                                                      OpStore %87 %86 
                                 Private f32* %88 = OpAccessChain %51 %22 
                                          f32 %89 = OpLoad %88 
                                          f32 %91 = OpFMul %89 %90 
                                          f32 %93 = OpFAdd %91 %92 
                                 Private f32* %94 = OpAccessChain %51 %22 
                                                      OpStore %94 %93 
                                 Private f32* %98 = OpAccessChain %16 %22 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpExtInst %1 4 %99 
                                        bool %101 = OpFOrdLessThan %31 %100 
                                                      OpStore %97 %101 
                                Private f32* %102 = OpAccessChain %16 %22 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpExtInst %1 37 %103 %31 
                                Private f32* %105 = OpAccessChain %16 %22 
                                                      OpStore %105 %104 
                                Private f32* %107 = OpAccessChain %16 %22 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %16 %22 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                        bool %112 = OpFOrdLessThan %108 %111 
                                                      OpStore %106 %112 
                                        bool %115 = OpLoad %97 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %120 
                                             %116 = OpLabel 
                                Private f32* %118 = OpAccessChain %51 %22 
                                         f32 %119 = OpLoad %118 
                                                      OpStore %114 %119 
                                                      OpBranch %117 
                                             %120 = OpLabel 
                                                      OpStore %114 %121 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                         f32 %122 = OpLoad %114 
                                Private f32* %123 = OpAccessChain %51 %22 
                                                      OpStore %123 %122 
                                         f32 %124 = OpLoad %27 
                                Private f32* %125 = OpAccessChain %37 %22 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFMul %124 %126 
                                Private f32* %128 = OpAccessChain %51 %22 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFAdd %127 %129 
                                                      OpStore %27 %130 
                                        bool %132 = OpLoad %106 
                                                      OpSelectionMerge %134 None 
                                                      OpBranchConditional %132 %133 %137 
                                             %133 = OpLabel 
                                         f32 %135 = OpLoad %27 
                                         f32 %136 = OpFNegate %135 
                                                      OpStore %131 %136 
                                                      OpBranch %134 
                                             %137 = OpLabel 
                                         f32 %138 = OpLoad %27 
                                                      OpStore %131 %138 
                                                      OpBranch %134 
                                             %134 = OpLabel 
                                         f32 %139 = OpLoad %131 
                                Private f32* %140 = OpAccessChain %16 %22 
                                                      OpStore %140 %139 
                              Uniform f32_4* %148 = OpAccessChain %144 %146 
                                       f32_4 %149 = OpLoad %148 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                Uniform f32* %153 = OpAccessChain %144 %151 
                                         f32 %154 = OpLoad %153 
                                       f32_2 %155 = OpCompositeConstruct %154 %154 
                                       f32_2 %156 = OpFMul %150 %155 
                                       f32_3 %157 = OpLoad %37 
                                       f32_3 %158 = OpVectorShuffle %157 %156 3 4 2 
                                                      OpStore %37 %158 
                                Private f32* %159 = OpAccessChain %37 %22 
                                         f32 %160 = OpLoad %159 
                                Uniform f32* %162 = OpAccessChain %144 %161 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %160 %163 
                                                      OpStore %27 %164 
                                         f32 %165 = OpLoad %27 
                                         f32 %167 = OpFMul %165 %166 
                                Private f32* %168 = OpAccessChain %37 %22 
                                                      OpStore %168 %167 
                                Private f32* %170 = OpAccessChain %37 %22 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %37 %22 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                        bool %175 = OpFOrdGreaterThanEqual %171 %174 
                                                      OpStore %169 %175 
                                        bool %178 = OpLoad %169 
                                                      OpSelectionMerge %180 None 
                                                      OpBranchConditional %178 %179 %183 
                                             %179 = OpLabel 
                                                      OpStore %177 %182 
                                                      OpBranch %180 
                                             %183 = OpLabel 
                                                      OpStore %177 %186 
                                                      OpBranch %180 
                                             %180 = OpLabel 
                                       f32_2 %187 = OpLoad %177 
                                       f32_3 %188 = OpLoad %37 
                                       f32_3 %189 = OpVectorShuffle %188 %187 3 1 4 
                                                      OpStore %37 %189 
                                         f32 %190 = OpLoad %27 
                                Private f32* %192 = OpAccessChain %37 %191 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %190 %193 
                                                      OpStore %27 %194 
                                         f32 %195 = OpLoad %27 
                                         f32 %196 = OpExtInst %1 10 %195 
                                                      OpStore %27 %196 
                                Private f32* %197 = OpAccessChain %37 %22 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpLoad %27 
                                         f32 %200 = OpFMul %198 %199 
                                Private f32* %201 = OpAccessChain %16 %22 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFAdd %200 %202 
                                Private f32* %204 = OpAccessChain %16 %22 
                                                      OpStore %204 %203 
                                Private f32* %206 = OpAccessChain %16 %22 
                                         f32 %207 = OpLoad %206 
                                Uniform f32* %209 = OpAccessChain %144 %208 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpFMul %207 %210 
                                Private f32* %212 = OpAccessChain %205 %22 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %205 %22 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 14 %214 
                                Private f32* %216 = OpAccessChain %205 %22 
                                                      OpStore %216 %215 
                              Uniform f32_4* %218 = OpAccessChain %144 %146 
                                       f32_4 %219 = OpLoad %218 
                                       f32_2 %220 = OpVectorShuffle %219 %219 0 0 
                                       f32_2 %223 = OpFMul %220 %222 
                                       f32_3 %224 = OpLoad %217 
                                       f32_3 %225 = OpVectorShuffle %224 %223 3 4 2 
                                                      OpStore %217 %225 
                                       f32_3 %227 = OpLoad %217 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                                Uniform f32* %229 = OpAccessChain %144 %151 
                                         f32 %230 = OpLoad %229 
                                       f32_2 %231 = OpCompositeConstruct %230 %230 
                                       f32_2 %232 = OpFMul %228 %231 
                                       f32_2 %233 = OpLoad %11 
                                       f32_2 %234 = OpFAdd %232 %233 
                                                      OpStore %226 %234 
                                       f32_2 %235 = OpLoad %226 
                                       f32_2 %238 = OpFMul %235 %237 
                                                      OpStore %226 %238 
                                       f32_2 %239 = OpLoad %226 
                                       f32_2 %240 = OpExtInst %1 10 %239 
                                                      OpStore %226 %240 
                  read_only Texture2DSampled %246 = OpLoad %245 
                                       f32_2 %247 = OpLoad %226 
                                       f32_4 %248 = OpImageSampleImplicitLod %246 %247 
                                       f32_2 %249 = OpVectorShuffle %248 %248 1 2 
                                                      OpStore %241 %249 
                                Private f32* %251 = OpAccessChain %241 %18 
                                         f32 %252 = OpLoad %251 
                                         f32 %254 = OpFMul %252 %253 
                                Private f32* %255 = OpAccessChain %37 %18 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %254 %256 
                                                      OpStore %250 %257 
                                         f32 %258 = OpLoad %250 
                                         f32 %259 = OpExtInst %1 13 %258 
                                                      OpStore %250 %259 
                                         f32 %260 = OpLoad %250 
                                         f32 %261 = OpFAdd %260 %31 
                                                      OpStore %250 %261 
                                         f32 %262 = OpLoad %250 
                                         f32 %264 = OpFMul %262 %263 
                                                      OpStore %250 %264 
                              Uniform f32_4* %267 = OpAccessChain %144 %266 
                                       f32_4 %268 = OpLoad %267 
                                       f32_2 %269 = OpVectorShuffle %268 %268 0 2 
                                       f32_2 %270 = OpFNegate %269 
                              Uniform f32_4* %271 = OpAccessChain %144 %266 
                                       f32_4 %272 = OpLoad %271 
                                       f32_2 %273 = OpVectorShuffle %272 %272 1 3 
                                       f32_2 %274 = OpFAdd %270 %273 
                                                      OpStore %265 %274 
                                         f32 %275 = OpLoad %250 
                                Private f32* %276 = OpAccessChain %265 %22 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpFMul %275 %277 
                                Uniform f32* %279 = OpAccessChain %144 %266 %22 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFAdd %278 %280 
                                                      OpStore %250 %281 
                                       f32_2 %283 = OpLoad %9 
                                         f32 %284 = OpLoad %250 
                                       f32_2 %285 = OpCompositeConstruct %284 %284 
                                       f32_2 %286 = OpFMul %283 %285 
                                                      OpStore %282 %286 
                                       f32_2 %287 = OpLoad %241 
                                       f32_2 %288 = OpVectorShuffle %287 %287 0 0 
                                       f32_2 %289 = OpLoad %282 
                                       f32_2 %290 = OpFMul %288 %289 
                                                      OpStore %282 %290 
                                       f32_2 %291 = OpLoad %241 
                                       f32_2 %292 = OpVectorShuffle %291 %291 1 1 
                                       f32_2 %293 = OpLoad %282 
                                       f32_2 %294 = OpFMul %292 %293 
                                                      OpStore %226 %294 
                                       f32_2 %295 = OpLoad %205 
                                       f32_2 %296 = OpVectorShuffle %295 %295 0 0 
                                       f32_2 %297 = OpLoad %226 
                                       f32_2 %298 = OpFMul %296 %297 
                                       f32_2 %299 = OpLoad %9 
                                       f32_2 %300 = OpFAdd %298 %299 
                                                      OpStore %9 %300 
                                Private f32* %301 = OpAccessChain %37 %18 
                                         f32 %302 = OpLoad %301 
                                Private f32* %303 = OpAccessChain %37 %18 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpFAdd %302 %304 
                                Private f32* %306 = OpAccessChain %205 %22 
                                                      OpStore %306 %305 
                                Private f32* %307 = OpAccessChain %205 %22 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpExtInst %1 13 %308 
                                Private f32* %310 = OpAccessChain %205 %22 
                                                      OpStore %310 %309 
                                Private f32* %311 = OpAccessChain %205 %22 
                                         f32 %312 = OpLoad %311 
                                         f32 %313 = OpFAdd %312 %31 
                                Private f32* %314 = OpAccessChain %205 %22 
                                                      OpStore %314 %313 
                                Private f32* %315 = OpAccessChain %205 %22 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFMul %316 %263 
                                Private f32* %318 = OpAccessChain %205 %22 
                                                      OpStore %318 %317 
                                Private f32* %319 = OpAccessChain %205 %22 
                                         f32 %320 = OpLoad %319 
                                Private f32* %321 = OpAccessChain %265 %18 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFMul %320 %322 
                                Uniform f32* %324 = OpAccessChain %144 %266 %191 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpFAdd %323 %325 
                                Private f32* %327 = OpAccessChain %205 %22 
                                                      OpStore %327 %326 
                              Uniform f32_4* %328 = OpAccessChain %144 %146 
                                       f32_4 %329 = OpLoad %328 
                                       f32_2 %330 = OpVectorShuffle %329 %329 0 0 
                                Uniform f32* %331 = OpAccessChain %144 %151 
                                         f32 %332 = OpLoad %331 
                                       f32_2 %333 = OpCompositeConstruct %332 %332 
                                       f32_2 %334 = OpFMul %330 %333 
                                       f32_2 %335 = OpLoad %11 
                                       f32_2 %336 = OpFAdd %334 %335 
                                                      OpStore %226 %336 
                                       f32_2 %337 = OpLoad %226 
                                       f32_2 %338 = OpExtInst %1 10 %337 
                                                      OpStore %226 %338 
                  read_only Texture2DSampled %339 = OpLoad %245 
                                       f32_2 %340 = OpLoad %226 
                                       f32_4 %341 = OpImageSampleImplicitLod %339 %340 
                                       f32_2 %342 = OpVectorShuffle %341 %341 0 2 
                                                      OpStore %241 %342 
                                Private f32* %343 = OpAccessChain %205 %22 
                                         f32 %344 = OpLoad %343 
                                Private f32* %345 = OpAccessChain %241 %22 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFMul %344 %346 
                                Private f32* %348 = OpAccessChain %205 %22 
                                                      OpStore %348 %347 
                                Private f32* %349 = OpAccessChain %241 %18 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFMul %350 %263 
                                Private f32* %352 = OpAccessChain %16 %22 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFAdd %351 %353 
                                Private f32* %355 = OpAccessChain %16 %22 
                                                      OpStore %355 %354 
                                Private f32* %356 = OpAccessChain %16 %22 
                                         f32 %357 = OpLoad %356 
                                Uniform f32* %359 = OpAccessChain %144 %358 
                                         f32 %360 = OpLoad %359 
                                         f32 %361 = OpFMul %357 %360 
                                Private f32* %362 = OpAccessChain %16 %22 
                                                      OpStore %362 %361 
                                Private f32* %363 = OpAccessChain %16 %22 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpExtInst %1 13 %364 
                                Private f32* %366 = OpAccessChain %16 %22 
                                                      OpStore %366 %365 
                                       f32_2 %367 = OpLoad %9 
                                       f32_2 %368 = OpLoad %205 
                                       f32_2 %369 = OpVectorShuffle %368 %368 0 0 
                                       f32_2 %370 = OpFMul %367 %369 
                                                      OpStore %205 %370 
                                       f32_2 %371 = OpLoad %16 
                                       f32_2 %372 = OpVectorShuffle %371 %371 0 0 
                                       f32_2 %373 = OpLoad %205 
                                       f32_2 %374 = OpFMul %372 %373 
                                       f32_2 %375 = OpLoad %9 
                                       f32_2 %376 = OpFAdd %374 %375 
                                                      OpStore %9 %376 
                                       f32_2 %377 = OpLoad %9 
                                       f32_2 %378 = OpLoad %9 
                                         f32 %379 = OpDot %377 %378 
                                Private f32* %380 = OpAccessChain %9 %22 
                                                      OpStore %380 %379 
                                Private f32* %381 = OpAccessChain %9 %22 
                                         f32 %382 = OpLoad %381 
                                         f32 %383 = OpExtInst %1 31 %382 
                                Private f32* %384 = OpAccessChain %9 %22 
                                                      OpStore %384 %383 
                                Private f32* %385 = OpAccessChain %9 %22 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFNegate %386 
                                Uniform f32* %389 = OpAccessChain %144 %388 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFAdd %387 %390 
                                Private f32* %392 = OpAccessChain %9 %22 
                                                      OpStore %392 %391 
                                Private f32* %394 = OpAccessChain %9 %22 
                                         f32 %395 = OpLoad %394 
                                        bool %396 = OpFOrdLessThan %395 %121 
                                                      OpStore %393 %396 
                                Private f32* %397 = OpAccessChain %9 %22 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpExtInst %1 30 %398 
                                Private f32* %400 = OpAccessChain %9 %22 
                                                      OpStore %400 %399 
                                Private f32* %401 = OpAccessChain %9 %22 
                                         f32 %402 = OpLoad %401 
                                         f32 %404 = OpFMul %402 %403 
                                Private f32* %405 = OpAccessChain %9 %22 
                                                      OpStore %405 %404 
                                Private f32* %406 = OpAccessChain %9 %22 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpExtInst %1 29 %407 
                                Private f32* %409 = OpAccessChain %9 %22 
                                                      OpStore %409 %408 
                                Private f32* %410 = OpAccessChain %9 %22 
                                         f32 %411 = OpLoad %410 
                                         f32 %412 = OpExtInst %1 37 %411 %31 
                                Private f32* %413 = OpAccessChain %9 %22 
                                                      OpStore %413 %412 
                                Private f32* %414 = OpAccessChain %9 %22 
                                         f32 %415 = OpLoad %414 
                                  Input f32* %420 = OpAccessChain %417 %418 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFMul %415 %421 
                                Private f32* %423 = OpAccessChain %9 %22 
                                                      OpStore %423 %422 
                                        bool %424 = OpLoad %393 
                                         i32 %425 = OpSelect %424 %266 %146 
                                         i32 %427 = OpIMul %425 %426 
                                        bool %428 = OpINotEqual %427 %146 
                                                      OpSelectionMerge %430 None 
                                                      OpBranchConditional %428 %429 %430 
                                             %429 = OpLabel 
                                                      OpKill
                                             %430 = OpLabel 
                                       f32_4 %435 = OpLoad %434 
                                       f32_4 %436 = OpVectorShuffle %435 %435 0 1 0 1 
                              Uniform f32_4* %438 = OpAccessChain %144 %437 
                                       f32_4 %439 = OpLoad %438 
                                       f32_4 %440 = OpFNegate %439 
                                       f32_4 %441 = OpFAdd %436 %440 
                                                      OpStore %433 %441 
                                       f32_4 %443 = OpLoad %433 
                                       f32_4 %444 = OpVectorShuffle %443 %443 0 1 0 1 
                                       f32_4 %446 = OpFAdd %444 %445 
                                                      OpStore %442 %446 
                                       f32_4 %447 = OpLoad %433 
                                       f32_4 %448 = OpVectorShuffle %447 %447 2 3 2 3 
                                       f32_4 %449 = OpFAdd %448 %445 
                                                      OpStore %433 %449 
                                Private f32* %451 = OpAccessChain %442 %418 
                                         f32 %452 = OpLoad %451 
                                Private f32* %453 = OpAccessChain %442 %191 
                                         f32 %454 = OpLoad %453 
                                         f32 %455 = OpFDiv %452 %454 
                                Private f32* %456 = OpAccessChain %450 %22 
                                                      OpStore %456 %455 
                                Private f32* %457 = OpAccessChain %450 %22 
                                         f32 %458 = OpLoad %457 
                                         f32 %459 = OpExtInst %1 4 %458 
                                         f32 %460 = OpExtInst %1 40 %459 %31 
                                Private f32* %461 = OpAccessChain %16 %22 
                                                      OpStore %461 %460 
                                Private f32* %462 = OpAccessChain %16 %22 
                                         f32 %463 = OpLoad %462 
                                         f32 %464 = OpFDiv %31 %463 
                                Private f32* %465 = OpAccessChain %16 %22 
                                                      OpStore %465 %464 
                                Private f32* %466 = OpAccessChain %450 %22 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpExtInst %1 4 %467 
                                         f32 %469 = OpExtInst %1 37 %468 %31 
                                Private f32* %470 = OpAccessChain %205 %22 
                                                      OpStore %470 %469 
                                Private f32* %471 = OpAccessChain %16 %22 
                                         f32 %472 = OpLoad %471 
                                Private f32* %473 = OpAccessChain %205 %22 
                                         f32 %474 = OpLoad %473 
                                         f32 %475 = OpFMul %472 %474 
                                Private f32* %476 = OpAccessChain %16 %22 
                                                      OpStore %476 %475 
                                Private f32* %477 = OpAccessChain %16 %22 
                                         f32 %478 = OpLoad %477 
                                Private f32* %479 = OpAccessChain %16 %22 
                                         f32 %480 = OpLoad %479 
                                         f32 %481 = OpFMul %478 %480 
                                Private f32* %482 = OpAccessChain %205 %22 
                                                      OpStore %482 %481 
                                Private f32* %483 = OpAccessChain %205 %22 
                                         f32 %484 = OpLoad %483 
                                         f32 %485 = OpFMul %484 %54 
                                         f32 %486 = OpFAdd %485 %56 
                                                      OpStore %250 %486 
                                Private f32* %487 = OpAccessChain %205 %22 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpLoad %250 
                                         f32 %490 = OpFMul %488 %489 
                                         f32 %491 = OpFAdd %490 %64 
                                                      OpStore %250 %491 
                                Private f32* %492 = OpAccessChain %205 %22 
                                         f32 %493 = OpLoad %492 
                                         f32 %494 = OpLoad %250 
                                         f32 %495 = OpFMul %493 %494 
                                         f32 %496 = OpFAdd %495 %72 
                                                      OpStore %250 %496 
                                Private f32* %497 = OpAccessChain %205 %22 
                                         f32 %498 = OpLoad %497 
                                         f32 %499 = OpLoad %250 
                                         f32 %500 = OpFMul %498 %499 
                                         f32 %501 = OpFAdd %500 %80 
                                Private f32* %502 = OpAccessChain %205 %22 
                                                      OpStore %502 %501 
                                Private f32* %503 = OpAccessChain %16 %22 
                                         f32 %504 = OpLoad %503 
                                Private f32* %505 = OpAccessChain %205 %22 
                                         f32 %506 = OpLoad %505 
                                         f32 %507 = OpFMul %504 %506 
                                                      OpStore %250 %507 
                                         f32 %508 = OpLoad %250 
                                         f32 %509 = OpFMul %508 %90 
                                         f32 %510 = OpFAdd %509 %92 
                                                      OpStore %250 %510 
                                Private f32* %512 = OpAccessChain %450 %22 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpExtInst %1 4 %513 
                                        bool %515 = OpFOrdLessThan %31 %514 
                                                      OpStore %511 %515 
                                Private f32* %516 = OpAccessChain %450 %22 
                                         f32 %517 = OpLoad %516 
                                         f32 %518 = OpExtInst %1 37 %517 %31 
                                Private f32* %519 = OpAccessChain %450 %22 
                                                      OpStore %519 %518 
                                Private f32* %520 = OpAccessChain %450 %22 
                                         f32 %521 = OpLoad %520 
                                Private f32* %522 = OpAccessChain %450 %22 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpFNegate %523 
                                        bool %525 = OpFOrdLessThan %521 %524 
                                                      OpStore %393 %525 
                                        bool %527 = OpLoad %511 
                                                      OpSelectionMerge %529 None 
                                                      OpBranchConditional %527 %528 %531 
                                             %528 = OpLabel 
                                         f32 %530 = OpLoad %250 
                                                      OpStore %526 %530 
                                                      OpBranch %529 
                                             %531 = OpLabel 
                                                      OpStore %526 %121 
                                                      OpBranch %529 
                                             %529 = OpLabel 
                                         f32 %532 = OpLoad %526 
                                                      OpStore %250 %532 
                                Private f32* %533 = OpAccessChain %16 %22 
                                         f32 %534 = OpLoad %533 
                                Private f32* %535 = OpAccessChain %205 %22 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpFMul %534 %536 
                                         f32 %538 = OpLoad %250 
                                         f32 %539 = OpFAdd %537 %538 
                                Private f32* %540 = OpAccessChain %16 %22 
                                                      OpStore %540 %539 
                                        bool %542 = OpLoad %393 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %542 %543 %548 
                                             %543 = OpLabel 
                                Private f32* %545 = OpAccessChain %16 %22 
                                         f32 %546 = OpLoad %545 
                                         f32 %547 = OpFNegate %546 
                                                      OpStore %541 %547 
                                                      OpBranch %544 
                                             %548 = OpLabel 
                                Private f32* %549 = OpAccessChain %16 %22 
                                         f32 %550 = OpLoad %549 
                                                      OpStore %541 %550 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                         f32 %551 = OpLoad %541 
                                Private f32* %552 = OpAccessChain %450 %22 
                                                      OpStore %552 %551 
                                Private f32* %553 = OpAccessChain %37 %22 
                                         f32 %554 = OpLoad %553 
                                         f32 %555 = OpLoad %27 
                                         f32 %556 = OpFMul %554 %555 
                                Private f32* %557 = OpAccessChain %450 %22 
                                         f32 %558 = OpLoad %557 
                                         f32 %559 = OpFAdd %556 %558 
                                Private f32* %560 = OpAccessChain %450 %22 
                                                      OpStore %560 %559 
                                Private f32* %561 = OpAccessChain %450 %22 
                                         f32 %562 = OpLoad %561 
                                Uniform f32* %563 = OpAccessChain %144 %208 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFMul %562 %564 
                                Private f32* %566 = OpAccessChain %16 %22 
                                                      OpStore %566 %565 
                                Private f32* %567 = OpAccessChain %16 %22 
                                         f32 %568 = OpLoad %567 
                                         f32 %569 = OpExtInst %1 14 %568 
                                Private f32* %570 = OpAccessChain %16 %22 
                                                      OpStore %570 %569 
                                       f32_3 %571 = OpLoad %217 
                                       f32_2 %572 = OpVectorShuffle %571 %571 0 1 
                                Uniform f32* %573 = OpAccessChain %144 %151 
                                         f32 %574 = OpLoad %573 
                                       f32_2 %575 = OpCompositeConstruct %574 %574 
                                       f32_2 %576 = OpFMul %572 %575 
                                       f32_4 %577 = OpLoad %442 
                                       f32_2 %578 = OpVectorShuffle %577 %577 0 1 
                                       f32_2 %579 = OpFAdd %576 %578 
                                                      OpStore %205 %579 
                                       f32_3 %580 = OpLoad %217 
                                       f32_2 %581 = OpVectorShuffle %580 %580 0 1 
                                Uniform f32* %582 = OpAccessChain %144 %151 
                                         f32 %583 = OpLoad %582 
                                       f32_2 %584 = OpCompositeConstruct %583 %583 
                                       f32_2 %585 = OpFMul %581 %584 
                                       f32_4 %586 = OpLoad %433 
                                       f32_2 %587 = OpVectorShuffle %586 %586 0 1 
                                       f32_2 %588 = OpFAdd %585 %587 
                                       f32_3 %589 = OpLoad %217 
                                       f32_3 %590 = OpVectorShuffle %589 %588 3 4 2 
                                                      OpStore %217 %590 
                                       f32_3 %591 = OpLoad %217 
                                       f32_2 %592 = OpVectorShuffle %591 %591 0 1 
                                       f32_2 %593 = OpFMul %592 %237 
                                       f32_3 %594 = OpLoad %217 
                                       f32_3 %595 = OpVectorShuffle %594 %593 3 4 2 
                                                      OpStore %217 %595 
                                       f32_3 %596 = OpLoad %217 
                                       f32_2 %597 = OpVectorShuffle %596 %596 0 1 
                                       f32_2 %598 = OpExtInst %1 10 %597 
                                       f32_3 %599 = OpLoad %217 
                                       f32_3 %600 = OpVectorShuffle %599 %598 3 4 2 
                                                      OpStore %217 %600 
                  read_only Texture2DSampled %602 = OpLoad %245 
                                       f32_3 %603 = OpLoad %217 
                                       f32_2 %604 = OpVectorShuffle %603 %603 0 1 
                                       f32_4 %605 = OpImageSampleImplicitLod %602 %604 
                                       f32_2 %606 = OpVectorShuffle %605 %605 1 2 
                                                      OpStore %601 %606 
                                       f32_2 %607 = OpLoad %205 
                                       f32_2 %608 = OpFMul %607 %237 
                                                      OpStore %205 %608 
                                       f32_2 %609 = OpLoad %205 
                                       f32_2 %610 = OpExtInst %1 10 %609 
                                                      OpStore %205 %610 
                  read_only Texture2DSampled %612 = OpLoad %245 
                                       f32_2 %613 = OpLoad %205 
                                       f32_4 %614 = OpImageSampleImplicitLod %612 %613 
                                       f32_2 %615 = OpVectorShuffle %614 %614 1 2 
                                                      OpStore %611 %615 
                              Uniform f32_4* %617 = OpAccessChain %144 %437 
                                       f32_4 %618 = OpLoad %617 
                              Uniform f32_4* %619 = OpAccessChain %144 %437 
                                       f32_4 %620 = OpLoad %619 
                                       f32_4 %621 = OpFAdd %618 %620 
                                                      OpStore %616 %621 
                              Uniform f32_4* %622 = OpAccessChain %144 %146 
                                       f32_4 %623 = OpLoad %622 
                                       f32_2 %624 = OpVectorShuffle %623 %623 1 1 
                                Uniform f32* %625 = OpAccessChain %144 %151 
                                         f32 %626 = OpLoad %625 
                                       f32_2 %627 = OpCompositeConstruct %626 %626 
                                       f32_2 %628 = OpFMul %624 %627 
                                       f32_4 %629 = OpLoad %616 
                                       f32_2 %630 = OpVectorShuffle %629 %629 0 2 
                                       f32_2 %631 = OpFAdd %628 %630 
                                                      OpStore %226 %631 
                                       f32_4 %632 = OpLoad %616 
                                       f32_2 %633 = OpVectorShuffle %632 %632 1 3 
                                       f32_4 %634 = OpLoad %616 
                                       f32_2 %635 = OpVectorShuffle %634 %634 0 2 
                                       f32_2 %636 = OpFAdd %633 %635 
                                                      OpStore %282 %636 
                                       f32_3 %637 = OpLoad %37 
                                       f32_2 %638 = OpVectorShuffle %637 %637 1 1 
                                       f32_2 %641 = OpFMul %638 %640 
                                       f32_2 %642 = OpLoad %282 
                                       f32_2 %643 = OpFAdd %641 %642 
                                                      OpStore %282 %643 
                                       f32_2 %644 = OpLoad %282 
                                       f32_2 %645 = OpExtInst %1 13 %644 
                                                      OpStore %282 %645 
                                       f32_2 %646 = OpLoad %282 
                                       f32_2 %648 = OpFAdd %646 %647 
                                                      OpStore %282 %648 
                                       f32_2 %650 = OpLoad %265 
                                       f32_2 %651 = OpVectorShuffle %650 %650 1 1 
                                       f32_2 %652 = OpLoad %282 
                                       f32_2 %653 = OpFMul %651 %652 
                                                      OpStore %649 %653 
                                       f32_2 %654 = OpLoad %649 
                                       f32_2 %656 = OpFMul %654 %655 
                              Uniform f32_4* %657 = OpAccessChain %144 %266 
                                       f32_4 %658 = OpLoad %657 
                                       f32_2 %659 = OpVectorShuffle %658 %658 2 2 
                                       f32_2 %660 = OpFAdd %656 %659 
                                                      OpStore %649 %660 
                              Uniform f32_4* %661 = OpAccessChain %144 %437 
                                       f32_4 %662 = OpLoad %661 
                                       f32_2 %663 = OpVectorShuffle %662 %662 1 3 
                                       f32_2 %664 = OpFMul %663 %640 
                                       f32_2 %665 = OpLoad %226 
                                       f32_2 %666 = OpFAdd %664 %665 
                                                      OpStore %226 %666 
                                Private f32* %667 = OpAccessChain %611 %18 
                                         f32 %668 = OpLoad %667 
                                         f32 %669 = OpFMul %668 %253 
                                Private f32* %670 = OpAccessChain %226 %22 
                                         f32 %671 = OpLoad %670 
                                         f32 %672 = OpFAdd %669 %671 
                                Private f32* %673 = OpAccessChain %51 %22 
                                                      OpStore %673 %672 
                                Private f32* %674 = OpAccessChain %601 %18 
                                         f32 %675 = OpLoad %674 
                                         f32 %676 = OpFMul %675 %253 
                                Private f32* %677 = OpAccessChain %226 %18 
                                         f32 %678 = OpLoad %677 
                                         f32 %679 = OpFAdd %676 %678 
                                Private f32* %680 = OpAccessChain %226 %22 
                                                      OpStore %680 %679 
                                Private f32* %681 = OpAccessChain %226 %22 
                                         f32 %682 = OpLoad %681 
                                         f32 %683 = OpExtInst %1 13 %682 
                                Private f32* %684 = OpAccessChain %226 %22 
                                                      OpStore %684 %683 
                                Private f32* %685 = OpAccessChain %226 %22 
                                         f32 %686 = OpLoad %685 
                                         f32 %687 = OpFAdd %686 %31 
                                Private f32* %688 = OpAccessChain %226 %22 
                                                      OpStore %688 %687 
                                Private f32* %689 = OpAccessChain %265 %22 
                                         f32 %690 = OpLoad %689 
                                Private f32* %691 = OpAccessChain %226 %22 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFMul %690 %692 
                                Private f32* %694 = OpAccessChain %226 %22 
                                                      OpStore %694 %693 
                                Private f32* %695 = OpAccessChain %226 %22 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFMul %696 %263 
                                Uniform f32* %698 = OpAccessChain %144 %266 %22 
                                         f32 %699 = OpLoad %698 
                                         f32 %700 = OpFAdd %697 %699 
                                Private f32* %701 = OpAccessChain %226 %22 
                                                      OpStore %701 %700 
                                       f32_2 %702 = OpLoad %226 
                                       f32_2 %703 = OpVectorShuffle %702 %702 0 0 
                                       f32_4 %704 = OpLoad %433 
                                       f32_2 %705 = OpVectorShuffle %704 %704 2 3 
                                       f32_2 %706 = OpFMul %703 %705 
                                                      OpStore %226 %706 
                                       f32_2 %707 = OpLoad %601 
                                       f32_2 %708 = OpVectorShuffle %707 %707 0 0 
                                       f32_2 %709 = OpLoad %226 
                                       f32_2 %710 = OpFMul %708 %709 
                                       f32_3 %711 = OpLoad %217 
                                       f32_3 %712 = OpVectorShuffle %711 %710 3 1 4 
                                                      OpStore %217 %712 
                                       f32_2 %713 = OpLoad %601 
                                       f32_2 %714 = OpVectorShuffle %713 %713 1 1 
                                       f32_3 %715 = OpLoad %217 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 2 
                                       f32_2 %717 = OpFMul %714 %716 
                                       f32_3 %718 = OpLoad %217 
                                       f32_3 %719 = OpVectorShuffle %718 %717 3 4 2 
                                                      OpStore %217 %719 
                                Private f32* %720 = OpAccessChain %51 %22 
                                         f32 %721 = OpLoad %720 
                                         f32 %722 = OpExtInst %1 13 %721 
                                Private f32* %723 = OpAccessChain %51 %22 
                                                      OpStore %723 %722 
                                Private f32* %724 = OpAccessChain %51 %22 
                                         f32 %725 = OpLoad %724 
                                         f32 %726 = OpFAdd %725 %31 
                                Private f32* %727 = OpAccessChain %51 %22 
                                                      OpStore %727 %726 
                                Private f32* %728 = OpAccessChain %265 %22 
                                         f32 %729 = OpLoad %728 
                                Private f32* %730 = OpAccessChain %51 %22 
                                         f32 %731 = OpLoad %730 
                                         f32 %732 = OpFMul %729 %731 
                                Private f32* %733 = OpAccessChain %51 %22 
                                                      OpStore %733 %732 
                                Private f32* %734 = OpAccessChain %51 %22 
                                         f32 %735 = OpLoad %734 
                                         f32 %736 = OpFMul %735 %263 
                                Uniform f32* %737 = OpAccessChain %144 %266 %22 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpFAdd %736 %738 
                                Private f32* %740 = OpAccessChain %51 %22 
                                                      OpStore %740 %739 
                                       f32_2 %741 = OpLoad %51 
                                       f32_2 %742 = OpVectorShuffle %741 %741 0 0 
                                       f32_4 %743 = OpLoad %442 
                                       f32_2 %744 = OpVectorShuffle %743 %743 2 3 
                                       f32_2 %745 = OpFMul %742 %744 
                                                      OpStore %226 %745 
                                       f32_2 %746 = OpLoad %611 
                                       f32_2 %747 = OpVectorShuffle %746 %746 0 0 
                                       f32_2 %748 = OpLoad %226 
                                       f32_2 %749 = OpFMul %747 %748 
                                                      OpStore %51 %749 
                                       f32_2 %750 = OpLoad %611 
                                       f32_2 %751 = OpVectorShuffle %750 %750 1 1 
                                       f32_2 %752 = OpLoad %51 
                                       f32_2 %753 = OpFMul %751 %752 
                                                      OpStore %51 %753 
                                       f32_2 %754 = OpLoad %16 
                                       f32_2 %755 = OpVectorShuffle %754 %754 0 0 
                                       f32_2 %756 = OpLoad %51 
                                       f32_2 %757 = OpFMul %755 %756 
                                       f32_4 %758 = OpLoad %442 
                                       f32_2 %759 = OpVectorShuffle %758 %758 2 3 
                                       f32_2 %760 = OpFAdd %757 %759 
                                                      OpStore %51 %760 
                              Uniform f32_4* %761 = OpAccessChain %144 %146 
                                       f32_4 %762 = OpLoad %761 
                                       f32_2 %763 = OpVectorShuffle %762 %762 0 0 
                                Uniform f32* %764 = OpAccessChain %144 %151 
                                         f32 %765 = OpLoad %764 
                                       f32_2 %766 = OpCompositeConstruct %765 %765 
                                       f32_2 %767 = OpFMul %763 %766 
                                       f32_4 %768 = OpLoad %442 
                                       f32_2 %769 = OpVectorShuffle %768 %768 0 1 
                                       f32_2 %770 = OpFAdd %767 %769 
                                                      OpStore %226 %770 
                                       f32_2 %771 = OpLoad %226 
                                       f32_2 %772 = OpExtInst %1 10 %771 
                                                      OpStore %226 %772 
                  read_only Texture2DSampled %773 = OpLoad %245 
                                       f32_2 %774 = OpLoad %226 
                                       f32_4 %775 = OpImageSampleImplicitLod %773 %774 
                                       f32_2 %776 = OpVectorShuffle %775 %775 0 2 
                                                      OpStore %241 %776 
                                Private f32* %777 = OpAccessChain %241 %22 
                                         f32 %778 = OpLoad %777 
                                Private f32* %779 = OpAccessChain %649 %22 
                                         f32 %780 = OpLoad %779 
                                         f32 %781 = OpFMul %778 %780 
                                Private f32* %782 = OpAccessChain %16 %22 
                                                      OpStore %782 %781 
                                Private f32* %783 = OpAccessChain %241 %18 
                                         f32 %784 = OpLoad %783 
                                         f32 %785 = OpFMul %784 %263 
                                Private f32* %786 = OpAccessChain %450 %22 
                                         f32 %787 = OpLoad %786 
                                         f32 %788 = OpFAdd %785 %787 
                                Private f32* %789 = OpAccessChain %450 %22 
                                                      OpStore %789 %788 
                                Private f32* %790 = OpAccessChain %450 %22 
                                         f32 %791 = OpLoad %790 
                                Uniform f32* %792 = OpAccessChain %144 %358 
                                         f32 %793 = OpLoad %792 
                                         f32 %794 = OpFMul %791 %793 
                                Private f32* %795 = OpAccessChain %450 %22 
                                                      OpStore %795 %794 
                                Private f32* %796 = OpAccessChain %450 %22 
                                         f32 %797 = OpLoad %796 
                                         f32 %798 = OpExtInst %1 13 %797 
                                Private f32* %799 = OpAccessChain %450 %22 
                                                      OpStore %799 %798 
                                       f32_2 %800 = OpLoad %16 
                                       f32_2 %801 = OpVectorShuffle %800 %800 0 0 
                                       f32_2 %802 = OpLoad %51 
                                       f32_2 %803 = OpFMul %801 %802 
                                                      OpStore %226 %803 
                                       f32_2 %804 = OpLoad %450 
                                       f32_2 %805 = OpVectorShuffle %804 %804 0 0 
                                       f32_2 %806 = OpLoad %226 
                                       f32_2 %807 = OpFMul %805 %806 
                                       f32_2 %808 = OpLoad %51 
                                       f32_2 %809 = OpFAdd %807 %808 
                                                      OpStore %450 %809 
                                       f32_2 %810 = OpLoad %450 
                                       f32_2 %811 = OpLoad %450 
                                         f32 %812 = OpDot %810 %811 
                                Private f32* %813 = OpAccessChain %450 %22 
                                                      OpStore %813 %812 
                                Private f32* %814 = OpAccessChain %450 %22 
                                         f32 %815 = OpLoad %814 
                                         f32 %816 = OpExtInst %1 31 %815 
                                Private f32* %817 = OpAccessChain %450 %22 
                                                      OpStore %817 %816 
                                Private f32* %818 = OpAccessChain %450 %22 
                                         f32 %819 = OpLoad %818 
                                         f32 %820 = OpFNegate %819 
                                         f32 %822 = OpFAdd %820 %821 
                                Private f32* %823 = OpAccessChain %450 %22 
                                                      OpStore %823 %822 
                                Private f32* %825 = OpAccessChain %450 %22 
                                         f32 %826 = OpLoad %825 
                                        bool %827 = OpFOrdLessThan %824 %826 
                                                      OpStore %393 %827 
                                        bool %828 = OpLoad %393 
                                         i32 %829 = OpSelect %828 %266 %146 
                                         i32 %830 = OpIMul %829 %426 
                                        bool %831 = OpINotEqual %830 %146 
                                                      OpSelectionMerge %833 None 
                                                      OpBranchConditional %831 %832 %833 
                                             %832 = OpLabel 
                                                      OpKill
                                             %833 = OpLabel 
                                Private f32* %835 = OpAccessChain %433 %418 
                                         f32 %836 = OpLoad %835 
                                Private f32* %837 = OpAccessChain %433 %191 
                                         f32 %838 = OpLoad %837 
                                         f32 %839 = OpFDiv %836 %838 
                                Private f32* %840 = OpAccessChain %450 %22 
                                                      OpStore %840 %839 
                                Private f32* %841 = OpAccessChain %450 %22 
                                         f32 %842 = OpLoad %841 
                                         f32 %843 = OpExtInst %1 4 %842 
                                         f32 %844 = OpExtInst %1 40 %843 %31 
                                Private f32* %845 = OpAccessChain %16 %22 
                                                      OpStore %845 %844 
                                Private f32* %846 = OpAccessChain %16 %22 
                                         f32 %847 = OpLoad %846 
                                         f32 %848 = OpFDiv %31 %847 
                                Private f32* %849 = OpAccessChain %16 %22 
                                                      OpStore %849 %848 
                                Private f32* %850 = OpAccessChain %450 %22 
                                         f32 %851 = OpLoad %850 
                                         f32 %852 = OpExtInst %1 4 %851 
                                         f32 %853 = OpExtInst %1 37 %852 %31 
                                Private f32* %854 = OpAccessChain %51 %22 
                                                      OpStore %854 %853 
                                Private f32* %855 = OpAccessChain %16 %22 
                                         f32 %856 = OpLoad %855 
                                Private f32* %857 = OpAccessChain %51 %22 
                                         f32 %858 = OpLoad %857 
                                         f32 %859 = OpFMul %856 %858 
                                Private f32* %860 = OpAccessChain %16 %22 
                                                      OpStore %860 %859 
                                Private f32* %861 = OpAccessChain %16 %22 
                                         f32 %862 = OpLoad %861 
                                Private f32* %863 = OpAccessChain %16 %22 
                                         f32 %864 = OpLoad %863 
                                         f32 %865 = OpFMul %862 %864 
                                Private f32* %866 = OpAccessChain %51 %22 
                                                      OpStore %866 %865 
                                Private f32* %867 = OpAccessChain %51 %22 
                                         f32 %868 = OpLoad %867 
                                         f32 %869 = OpFMul %868 %54 
                                         f32 %870 = OpFAdd %869 %56 
                                Private f32* %871 = OpAccessChain %205 %22 
                                                      OpStore %871 %870 
                                Private f32* %872 = OpAccessChain %51 %22 
                                         f32 %873 = OpLoad %872 
                                Private f32* %874 = OpAccessChain %205 %22 
                                         f32 %875 = OpLoad %874 
                                         f32 %876 = OpFMul %873 %875 
                                         f32 %877 = OpFAdd %876 %64 
                                Private f32* %878 = OpAccessChain %205 %22 
                                                      OpStore %878 %877 
                                Private f32* %879 = OpAccessChain %51 %22 
                                         f32 %880 = OpLoad %879 
                                Private f32* %881 = OpAccessChain %205 %22 
                                         f32 %882 = OpLoad %881 
                                         f32 %883 = OpFMul %880 %882 
                                         f32 %884 = OpFAdd %883 %72 
                                Private f32* %885 = OpAccessChain %205 %22 
                                                      OpStore %885 %884 
                                Private f32* %886 = OpAccessChain %51 %22 
                                         f32 %887 = OpLoad %886 
                                Private f32* %888 = OpAccessChain %205 %22 
                                         f32 %889 = OpLoad %888 
                                         f32 %890 = OpFMul %887 %889 
                                         f32 %891 = OpFAdd %890 %80 
                                Private f32* %892 = OpAccessChain %51 %22 
                                                      OpStore %892 %891 
                                Private f32* %893 = OpAccessChain %16 %22 
                                         f32 %894 = OpLoad %893 
                                Private f32* %895 = OpAccessChain %51 %22 
                                         f32 %896 = OpLoad %895 
                                         f32 %897 = OpFMul %894 %896 
                                Private f32* %898 = OpAccessChain %205 %22 
                                                      OpStore %898 %897 
                                Private f32* %899 = OpAccessChain %205 %22 
                                         f32 %900 = OpLoad %899 
                                         f32 %901 = OpFMul %900 %90 
                                         f32 %902 = OpFAdd %901 %92 
                                Private f32* %903 = OpAccessChain %205 %22 
                                                      OpStore %903 %902 
                                Private f32* %905 = OpAccessChain %450 %22 
                                         f32 %906 = OpLoad %905 
                                         f32 %907 = OpExtInst %1 4 %906 
                                        bool %908 = OpFOrdLessThan %31 %907 
                                                      OpStore %904 %908 
                                Private f32* %909 = OpAccessChain %450 %22 
                                         f32 %910 = OpLoad %909 
                                         f32 %911 = OpExtInst %1 37 %910 %31 
                                Private f32* %912 = OpAccessChain %450 %22 
                                                      OpStore %912 %911 
                                Private f32* %913 = OpAccessChain %450 %22 
                                         f32 %914 = OpLoad %913 
                                Private f32* %915 = OpAccessChain %450 %22 
                                         f32 %916 = OpLoad %915 
                                         f32 %917 = OpFNegate %916 
                                        bool %918 = OpFOrdLessThan %914 %917 
                                                      OpStore %393 %918 
                                        bool %920 = OpLoad %904 
                                                      OpSelectionMerge %922 None 
                                                      OpBranchConditional %920 %921 %925 
                                             %921 = OpLabel 
                                Private f32* %923 = OpAccessChain %205 %22 
                                         f32 %924 = OpLoad %923 
                                                      OpStore %919 %924 
                                                      OpBranch %922 
                                             %925 = OpLabel 
                                                      OpStore %919 %121 
                                                      OpBranch %922 
                                             %922 = OpLabel 
                                         f32 %926 = OpLoad %919 
                                Private f32* %927 = OpAccessChain %205 %22 
                                                      OpStore %927 %926 
                                Private f32* %928 = OpAccessChain %16 %22 
                                         f32 %929 = OpLoad %928 
                                Private f32* %930 = OpAccessChain %51 %22 
                                         f32 %931 = OpLoad %930 
                                         f32 %932 = OpFMul %929 %931 
                                Private f32* %933 = OpAccessChain %205 %22 
                                         f32 %934 = OpLoad %933 
                                         f32 %935 = OpFAdd %932 %934 
                                Private f32* %936 = OpAccessChain %16 %22 
                                                      OpStore %936 %935 
                                        bool %938 = OpLoad %393 
                                                      OpSelectionMerge %940 None 
                                                      OpBranchConditional %938 %939 %944 
                                             %939 = OpLabel 
                                Private f32* %941 = OpAccessChain %16 %22 
                                         f32 %942 = OpLoad %941 
                                         f32 %943 = OpFNegate %942 
                                                      OpStore %937 %943 
                                                      OpBranch %940 
                                             %944 = OpLabel 
                                Private f32* %945 = OpAccessChain %16 %22 
                                         f32 %946 = OpLoad %945 
                                                      OpStore %937 %946 
                                                      OpBranch %940 
                                             %940 = OpLabel 
                                         f32 %947 = OpLoad %937 
                                Private f32* %948 = OpAccessChain %450 %22 
                                                      OpStore %948 %947 
                                Private f32* %949 = OpAccessChain %37 %22 
                                         f32 %950 = OpLoad %949 
                                         f32 %951 = OpLoad %27 
                                         f32 %952 = OpFMul %950 %951 
                                Private f32* %953 = OpAccessChain %450 %22 
                                         f32 %954 = OpLoad %953 
                                         f32 %955 = OpFAdd %952 %954 
                                Private f32* %956 = OpAccessChain %450 %22 
                                                      OpStore %956 %955 
                                Private f32* %957 = OpAccessChain %450 %22 
                                         f32 %958 = OpLoad %957 
                                Uniform f32* %959 = OpAccessChain %144 %208 
                                         f32 %960 = OpLoad %959 
                                         f32 %961 = OpFMul %958 %960 
                                Private f32* %962 = OpAccessChain %16 %22 
                                                      OpStore %962 %961 
                                Private f32* %963 = OpAccessChain %16 %22 
                                         f32 %964 = OpLoad %963 
                                         f32 %965 = OpExtInst %1 14 %964 
                                Private f32* %966 = OpAccessChain %16 %22 
                                                      OpStore %966 %965 
                                       f32_2 %967 = OpLoad %16 
                                       f32_2 %968 = OpVectorShuffle %967 %967 0 0 
                                       f32_3 %969 = OpLoad %217 
                                       f32_2 %970 = OpVectorShuffle %969 %969 0 1 
                                       f32_2 %971 = OpFMul %968 %970 
                                       f32_4 %972 = OpLoad %433 
                                       f32_2 %973 = OpVectorShuffle %972 %972 2 3 
                                       f32_2 %974 = OpFAdd %971 %973 
                                                      OpStore %16 %974 
                              Uniform f32_4* %975 = OpAccessChain %144 %146 
                                       f32_4 %976 = OpLoad %975 
                                       f32_2 %977 = OpVectorShuffle %976 %976 0 0 
                                Uniform f32* %978 = OpAccessChain %144 %151 
                                         f32 %979 = OpLoad %978 
                                       f32_2 %980 = OpCompositeConstruct %979 %979 
                                       f32_2 %981 = OpFMul %977 %980 
                                       f32_4 %982 = OpLoad %433 
                                       f32_2 %983 = OpVectorShuffle %982 %982 0 1 
                                       f32_2 %984 = OpFAdd %981 %983 
                                       f32_3 %985 = OpLoad %37 
                                       f32_3 %986 = OpVectorShuffle %985 %984 3 4 2 
                                                      OpStore %37 %986 
                                       f32_3 %987 = OpLoad %37 
                                       f32_2 %988 = OpVectorShuffle %987 %987 0 1 
                                       f32_2 %989 = OpExtInst %1 10 %988 
                                       f32_3 %990 = OpLoad %37 
                                       f32_3 %991 = OpVectorShuffle %990 %989 3 4 2 
                                                      OpStore %37 %991 
                  read_only Texture2DSampled %993 = OpLoad %245 
                                       f32_3 %994 = OpLoad %37 
                                       f32_2 %995 = OpVectorShuffle %994 %994 0 1 
                                       f32_4 %996 = OpImageSampleImplicitLod %993 %995 
                                       f32_2 %997 = OpVectorShuffle %996 %996 0 2 
                                                      OpStore %992 %997 
                                Private f32* %998 = OpAccessChain %992 %22 
                                         f32 %999 = OpLoad %998 
                               Private f32* %1000 = OpAccessChain %649 %18 
                                        f32 %1001 = OpLoad %1000 
                                        f32 %1002 = OpFMul %999 %1001 
                               Private f32* %1003 = OpAccessChain %37 %22 
                                                      OpStore %1003 %1002 
                               Private f32* %1004 = OpAccessChain %992 %18 
                                        f32 %1005 = OpLoad %1004 
                                        f32 %1006 = OpFMul %1005 %263 
                               Private f32* %1007 = OpAccessChain %450 %22 
                                        f32 %1008 = OpLoad %1007 
                                        f32 %1009 = OpFAdd %1006 %1008 
                               Private f32* %1010 = OpAccessChain %450 %22 
                                                      OpStore %1010 %1009 
                               Private f32* %1011 = OpAccessChain %450 %22 
                                        f32 %1012 = OpLoad %1011 
                               Uniform f32* %1013 = OpAccessChain %144 %358 
                                        f32 %1014 = OpLoad %1013 
                                        f32 %1015 = OpFMul %1012 %1014 
                               Private f32* %1016 = OpAccessChain %450 %22 
                                                      OpStore %1016 %1015 
                               Private f32* %1017 = OpAccessChain %450 %22 
                                        f32 %1018 = OpLoad %1017 
                                        f32 %1019 = OpExtInst %1 13 %1018 
                               Private f32* %1020 = OpAccessChain %450 %22 
                                                      OpStore %1020 %1019 
                                      f32_2 %1021 = OpLoad %16 
                                      f32_3 %1022 = OpLoad %37 
                                      f32_2 %1023 = OpVectorShuffle %1022 %1022 0 0 
                                      f32_2 %1024 = OpFMul %1021 %1023 
                                      f32_3 %1025 = OpLoad %37 
                                      f32_3 %1026 = OpVectorShuffle %1025 %1024 3 4 2 
                                                      OpStore %37 %1026 
                                      f32_2 %1027 = OpLoad %450 
                                      f32_2 %1028 = OpVectorShuffle %1027 %1027 0 0 
                                      f32_3 %1029 = OpLoad %37 
                                      f32_2 %1030 = OpVectorShuffle %1029 %1029 0 1 
                                      f32_2 %1031 = OpFMul %1028 %1030 
                                      f32_2 %1032 = OpLoad %16 
                                      f32_2 %1033 = OpFAdd %1031 %1032 
                                                      OpStore %450 %1033 
                                      f32_2 %1034 = OpLoad %450 
                                      f32_2 %1035 = OpLoad %450 
                                        f32 %1036 = OpDot %1034 %1035 
                               Private f32* %1037 = OpAccessChain %450 %22 
                                                      OpStore %1037 %1036 
                               Private f32* %1038 = OpAccessChain %450 %22 
                                        f32 %1039 = OpLoad %1038 
                                        f32 %1040 = OpExtInst %1 31 %1039 
                               Private f32* %1041 = OpAccessChain %450 %22 
                                                      OpStore %1041 %1040 
                               Private f32* %1042 = OpAccessChain %450 %22 
                                        f32 %1043 = OpLoad %1042 
                                        f32 %1044 = OpFNegate %1043 
                                        f32 %1045 = OpFAdd %1044 %821 
                               Private f32* %1046 = OpAccessChain %450 %22 
                                                      OpStore %1046 %1045 
                               Private f32* %1047 = OpAccessChain %450 %22 
                                        f32 %1048 = OpLoad %1047 
                                       bool %1049 = OpFOrdLessThan %824 %1048 
                                                      OpStore %393 %1049 
                                       bool %1050 = OpLoad %393 
                                        i32 %1051 = OpSelect %1050 %266 %146 
                                        i32 %1052 = OpIMul %1051 %426 
                                       bool %1053 = OpINotEqual %1052 %146 
                                                      OpSelectionMerge %1055 None 
                                                      OpBranchConditional %1053 %1054 %1055 
                                            %1054 = OpLabel 
                                                      OpKill
                                            %1055 = OpLabel 
                 read_only Texture2DSampled %1059 = OpLoad %1058 
                                      f32_4 %1061 = OpLoad %1060 
                                      f32_2 %1062 = OpVectorShuffle %1061 %1061 0 1 
                                      f32_4 %1063 = OpImageSampleImplicitLod %1059 %1062 
                                      f32_3 %1064 = OpVectorShuffle %1063 %1063 0 1 2 
                                                      OpStore %1057 %1064 
                                      f32_3 %1066 = OpLoad %1057 
                                      f32_3 %1067 = OpLoad %1057 
                                      f32_3 %1068 = OpFAdd %1066 %1067 
                                                      OpStore %1065 %1068 
                                      f32_2 %1071 = OpLoad %9 
                                      f32_3 %1072 = OpVectorShuffle %1071 %1071 0 0 0 
                                      f32_3 %1073 = OpLoad %1065 
                                      f32_3 %1074 = OpFMul %1072 %1073 
                                      f32_4 %1075 = OpLoad %1070 
                                      f32_4 %1076 = OpVectorShuffle %1075 %1074 4 5 6 3 
                                                      OpStore %1070 %1076 
                               Private f32* %1077 = OpAccessChain %9 %22 
                                        f32 %1078 = OpLoad %1077 
                                Output f32* %1080 = OpAccessChain %1070 %418 
                                                      OpStore %1080 %1078 
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