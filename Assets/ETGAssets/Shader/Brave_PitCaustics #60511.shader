//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/PitCaustics" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MaskTex ("Mask (RGB)", 2D) = "white" { }
_CausticTex ("Casutics", 2D) = "white" { }
_CausticScale ("Caustic Scale", Float) = 1
_CausticColor ("Caustic Color", Color) = (1,1,1,0)
_LightCausticPower ("LCP", Float) = 0.125
_LightCausticColor ("Light Color", Color) = (1,1,1,1)
_DarkCausticPower ("DCP", Float) = 0.08
_DarkCausticColor ("Dark Color", Color) = (0,0,0,1)
_ValueMinimum ("Value Min", Float) = 0.5
_ValueMaximum ("Value Max", Float) = 0.5
_EmissiveBoost ("Boost", Float) = 0
_TimeScale ("TimeScale", Float) = 1
_WaterFoamHeightMod ("Foam Height Modifier", Float) = 0.25
_ReflPower ("Refl Power", Float) = 1
_TestVal ("Test Val", Range(0, 1)) = 0
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "False" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 29069
Program "vp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_COLOR0;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _ValueMinimum;
uniform 	float _ValueMaximum;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = (-u_xlat10_0.xyz) + _CausticColor.xyz;
    u_xlat0.xyz = _CausticColor.www * u_xlat7.xyz + u_xlat10_0.xyz;
    u_xlat7.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat2 = u_xlat7.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat7.x = vs_TEXCOORD2.y + vs_TEXCOORD2.x;
    u_xlat3.x = u_xlat7.y * _TimeScale + u_xlat7.x;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat4.x * 0.111111112;
    u_xlat4.y = u_xlat3.x * 0.166666672;
    u_xlat3.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat15.xy = u_xlat2.zw * vec2(0.5, 0.125);
    u_xlat2.xy = u_xlat2.xy * vec2(1.25, 0.899999976) + u_xlat7.xx;
    u_xlat7.x = cos(u_xlat2.x);
    u_xlat4.x = u_xlat7.x * 0.111111112;
    u_xlat7.x = sin(u_xlat2.y);
    u_xlat4.y = u_xlat7.x * 0.166666672;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003) + u_xlat15.xy;
    u_xlat10_3 = texture(_CausticTex, u_xlat3.xy);
    u_xlat2.xy = u_xlat2.xy * vec2(0.142857149, 0.142857149);
    u_xlat2.xy = u_xlat2.ww * vec2(0.25, 0.166666672) + u_xlat2.xy;
    u_xlat10_2 = texture(_CausticTex, u_xlat2.xy);
    u_xlat7.x = _EmissiveBoost + 1.0;
    u_xlat20 = vs_TEXCOORD3.y * 500.0;
    u_xlat19 = u_xlat7.z * 5.0 + u_xlat20;
    u_xlat19 = sin(u_xlat19);
    u_xlat4.x = u_xlat19 * 0.00150000001;
    u_xlat4.y = 0.0;
    u_xlat4.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.0, 0.075000003);
    u_xlat10_4 = texture(_ReflMapFromPixelator, u_xlat4.xy);
    u_xlat5.xyz = vs_TEXCOORD2.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat13.x = vs_TEXCOORD2.x * 6.0 + u_xlat7.y;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat19 = cos(u_xlat5.x);
    u_xlat13.x = u_xlat19 * u_xlat13.x;
    u_xlat13.x = u_xlat13.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb19 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xy = floor(u_xlat5.yz);
    u_xlat5.xy = u_xlat5.xy * vec2(0.0625, 0.0625);
    u_xlat20 = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat20 = fract(u_xlat20);
    u_xlat20 = u_xlat20 * 0.5 + 0.5;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(u_xlat20) : u_xlat10_3.xyz;
    u_xlat13.xy = u_xlat13.xx + vec2(-0.0625, -0.25);
    u_xlatb13 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlatb13 = u_xlat13.y<vs_COLOR0.x;
    u_xlat13.x = (u_xlatb13) ? 1.0 : u_xlat10_1.x;
    u_xlat5.w = u_xlat10_0.w * u_xlat13.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LightCausticPower);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat13.xxx + u_xlat0.xyz;
    u_xlat7.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_4.xyz;
    u_xlat18 = u_xlat10_4.w * _ReflPower;
    u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
    u_xlat7.xyz = (-u_xlat0.xyz) + u_xlat7.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat7.xyz = (bool(u_xlatb18)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25 + 0.75;
        u_xlat7.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat18, u_xlat7.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat18 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat5 + u_xlat2;
    u_xlatb7 = u_xlat0.y>=u_xlat0.z;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.zy;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat7.xxxx * u_xlat3 + u_xlat2;
    u_xlatb7 = u_xlat0.x>=u_xlat2.x;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat2.xyw;
    u_xlat3.w = u_xlat0.x;
    u_xlat2.xyw = u_xlat3.wyx;
    u_xlat2 = (-u_xlat3) + u_xlat2;
    u_xlat2 = u_xlat7.xxxx * u_xlat2 + u_xlat3;
    u_xlat7.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat13.x = (-u_xlat2.y) + u_xlat2.w;
    u_xlat19 = u_xlat7.x * 6.0 + 1.00000001e-010;
    u_xlat13.x = u_xlat13.x / u_xlat19;
    u_xlat13.x = u_xlat13.x + u_xlat2.z;
    u_xlat19 = u_xlat2.x + 1.00000001e-010;
    u_xlat7.x = u_xlat7.x / u_xlat19;
    u_xlatb19 = _CausticColor.y>=_CausticColor.z;
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat8 = (-_CausticColor.z) + _CausticColor.y;
    u_xlat19 = u_xlat19 * u_xlat8 + _CausticColor.z;
    u_xlatb8 = _CausticColor.x>=u_xlat19;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat14 = (-u_xlat19) + _CausticColor.x;
    u_xlat19 = u_xlat8 * u_xlat14 + u_xlat19;
    u_xlat8 = u_xlat19 * _ValueMinimum;
    u_xlat2.x = max(u_xlat8, u_xlat2.x);
    u_xlat19 = u_xlat19 * _ValueMaximum;
    u_xlat19 = min(u_xlat19, u_xlat2.x);
    u_xlat2.xyz = abs(u_xlat13.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat7.xyz = vec3(u_xlat19) * u_xlat2.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat10_1.xxx * u_xlat7.xyz + u_xlat0.xyz;
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %98 %99 %112 %142 %162 %174 %175 %177 %180 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %162 Location 162 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %180 Location 180 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 4 
                                             %111 = OpTypePointer Input %50 
                                Input f32_3* %112 = OpVariable Input 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                               Output f32_3* %142 = OpVariable Output 
                                             %150 = OpTypePointer Uniform %6 
                                         f32 %157 = OpConstant 3.67402E-40 
                                       f32_3 %158 = OpConstantComposite %157 %157 %157 
                               Output f32_4* %162 = OpVariable Output 
                               Output f32_4* %174 = OpVariable Output 
                                Input f32_4* %175 = OpVariable Input 
                               Output f32_3* %177 = OpVariable Output 
                                         f32 %178 = OpConstant 3.67402E-40 
                                       f32_3 %179 = OpConstantComposite %178 %178 %178 
                               Output f32_4* %180 = OpVariable Output 
                                       f32_4 %181 = OpConstantComposite %178 %178 %178 %178 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %114 = OpAccessChain %21 %36 %28 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %113 %116 
                                Private f32* %120 = OpAccessChain %44 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %112 
                              Uniform f32_4* %122 = OpAccessChain %21 %36 %23 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %44 %88 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %112 
                              Uniform f32_4* %128 = OpAccessChain %21 %36 %36 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %44 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %44 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %44 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %143 = OpLoad %134 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                                      OpStore %142 %147 
                                Private f32* %148 = OpAccessChain %9 %88 
                                         f32 %149 = OpLoad %148 
                                Uniform f32* %151 = OpAccessChain %21 %28 %118 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %149 %152 
                                Private f32* %154 = OpAccessChain %9 %88 
                                                      OpStore %154 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 3 1 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %44 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %44 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_2 %164 = OpVectorShuffle %163 %163 2 3 
                                       f32_4 %165 = OpLoad %162 
                                       f32_4 %166 = OpVectorShuffle %165 %164 0 1 4 5 
                                                      OpStore %162 %166 
                                       f32_4 %167 = OpLoad %44 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 2 
                                       f32_4 %169 = OpLoad %44 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 3 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %162 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %162 %173 
                                       f32_4 %176 = OpLoad %175 
                                                      OpStore %174 %176 
                                                      OpStore %177 %179 
                                                      OpStore %180 %181 
                                 Output f32* %183 = OpAccessChain %92 %28 %88 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %92 %28 %88 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 909
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %87 %239 %320 %603 %900 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpMemberDecorate %38 0 Offset 38 
                                                      OpMemberDecorate %38 1 RelaxedPrecision 
                                                      OpMemberDecorate %38 1 Offset 38 
                                                      OpMemberDecorate %38 2 Offset 38 
                                                      OpMemberDecorate %38 3 Offset 38 
                                                      OpMemberDecorate %38 4 Offset 38 
                                                      OpMemberDecorate %38 5 Offset 38 
                                                      OpMemberDecorate %38 6 RelaxedPrecision 
                                                      OpMemberDecorate %38 6 Offset 38 
                                                      OpMemberDecorate %38 7 Offset 38 
                                                      OpMemberDecorate %38 8 Offset 38 
                                                      OpMemberDecorate %38 9 Offset 38 
                                                      OpMemberDecorate %38 10 Offset 38 
                                                      OpMemberDecorate %38 11 Offset 38 
                                                      OpMemberDecorate %38 12 Offset 38 
                                                      OpMemberDecorate %38 13 Offset 38 
                                                      OpMemberDecorate %38 14 Offset 38 
                                                      OpMemberDecorate %38 15 Offset 38 
                                                      OpMemberDecorate %38 16 Offset 38 
                                                      OpMemberDecorate %38 17 Offset 38 
                                                      OpMemberDecorate %38 18 Offset 38 
                                                      OpMemberDecorate %38 19 Offset 38 
                                                      OpMemberDecorate %38 20 Offset 38 
                                                      OpDecorate %38 Block 
                                                      OpDecorate %40 DescriptorSet 40 
                                                      OpDecorate %40 Binding 40 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %87 Location 87 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %275 DescriptorSet 275 
                                                      OpDecorate %275 Binding 275 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %320 Location 320 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %406 RelaxedPrecision 
                                                      OpDecorate %409 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %413 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %418 RelaxedPrecision 
                                                      OpDecorate %419 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %429 RelaxedPrecision 
                                                      OpDecorate %430 RelaxedPrecision 
                                                      OpDecorate %431 RelaxedPrecision 
                                                      OpDecorate %432 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %488 RelaxedPrecision 
                                                      OpDecorate %507 SpecId 507 
                                                      OpDecorate %581 DescriptorSet 581 
                                                      OpDecorate %581 Binding 581 
                                                      OpDecorate %586 RelaxedPrecision 
                                                      OpDecorate %593 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %596 RelaxedPrecision 
                                                      OpDecorate %599 RelaxedPrecision 
                                                      OpDecorate %600 RelaxedPrecision 
                                                      OpDecorate %603 RelaxedPrecision 
                                                      OpDecorate %603 Location 603 
                                                      OpDecorate %604 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %615 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %617 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %622 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                                      OpDecorate %624 RelaxedPrecision 
                                                      OpDecorate %625 RelaxedPrecision 
                                                      OpDecorate %628 RelaxedPrecision 
                                                      OpDecorate %630 RelaxedPrecision 
                                                      OpDecorate %639 RelaxedPrecision 
                                                      OpDecorate %640 RelaxedPrecision 
                                                      OpDecorate %641 RelaxedPrecision 
                                                      OpDecorate %642 RelaxedPrecision 
                                                      OpDecorate %643 RelaxedPrecision 
                                                      OpDecorate %644 RelaxedPrecision 
                                                      OpDecorate %645 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate %653 RelaxedPrecision 
                                                      OpDecorate %654 RelaxedPrecision 
                                                      OpDecorate %669 RelaxedPrecision 
                                                      OpDecorate %686 RelaxedPrecision 
                                                      OpDecorate %687 RelaxedPrecision 
                                                      OpDecorate %690 RelaxedPrecision 
                                                      OpDecorate %718 RelaxedPrecision 
                                                      OpDecorate %885 RelaxedPrecision 
                                                      OpDecorate %886 RelaxedPrecision 
                                                      OpDecorate %887 RelaxedPrecision 
                                                      OpDecorate %893 RelaxedPrecision 
                                                      OpDecorate %894 RelaxedPrecision 
                                                      OpDecorate %900 RelaxedPrecision 
                                                      OpDecorate %900 Location 900 
                                                      OpDecorate %905 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Private %20 
                               Private f32_3* %22 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %23 = OpVariable UniformConstant 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                               Private f32_3* %32 = OpVariable Private 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %7 %36 
                                              %38 = OpTypeStruct %7 %7 %7 %37 %20 %20 %7 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
                                              %41 = OpTypeInt 32 1 
                                          i32 %42 = OpConstant 8 
                                              %43 = OpTypePointer Uniform %7 
                               Private f32_3* %48 = OpVariable Private 
                                          i32 %57 = OpConstant 0 
                                          i32 %61 = OpConstant 20 
                               Private f32_4* %66 = OpVariable Private 
                                          i32 %69 = OpConstant 10 
                                              %70 = OpTypePointer Uniform %6 
                                              %86 = OpTypePointer Input %20 
                                 Input f32_3* %87 = OpVariable Input 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypePointer Input %6 
                               Private f32_4* %96 = OpVariable Private 
                              Private f32_4* %106 = OpVariable Private 
                                         f32 %117 = OpConstant 3.67402E-40 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         i32 %134 = OpConstant 7 
                                             %141 = OpTypePointer Private %15 
                              Private f32_2* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                       f32_2 %147 = OpConstantComposite %145 %146 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_2 %153 = OpConstantComposite %151 %152 
                                         f32 %193 = OpConstant 3.67402E-40 
                                       f32_2 %194 = OpConstantComposite %193 %193 
 UniformConstant read_only Texture2DSampled* %200 = OpVariable UniformConstant 
                                         f32 %210 = OpConstant 3.67402E-40 
                                       f32_2 %211 = OpConstantComposite %210 %210 
                                         f32 %217 = OpConstant 3.67402E-40 
                                       f32_2 %218 = OpConstantComposite %217 %122 
                              Private f32_3* %225 = OpVariable Private 
                                         i32 %231 = OpConstant 15 
                                         f32 %234 = OpConstant 3.67402E-40 
                                Private f32* %237 = OpVariable Private 
                                             %238 = OpTypePointer Input %7 
                                Input f32_4* %239 = OpVariable Input 
                                         f32 %242 = OpConstant 3.67402E-40 
                                Private f32* %244 = OpVariable Private 
                                         u32 %245 = OpConstant 2 
                                         f32 %248 = OpConstant 3.67402E-40 
                                         f32 %255 = OpConstant 3.67402E-40 
                                         f32 %258 = OpConstant 3.67402E-40 
                                         f32 %269 = OpConstant 3.67402E-40 
                                       f32_2 %270 = OpConstantComposite %258 %269 
                              Private f32_4* %274 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %275 = OpVariable UniformConstant 
                              Private f32_3* %280 = OpVariable Private 
                                         f32 %283 = OpConstant 3.67402E-40 
                                         f32 %284 = OpConstant 3.67402E-40 
                                       f32_3 %285 = OpConstantComposite %283 %284 %284 
                              Private f32_2* %287 = OpVariable Private 
                                         f32 %290 = OpConstant 3.67402E-40 
                                         f32 %310 = OpConstant 3.67402E-40 
                                         i32 %312 = OpConstant 19 
                                             %317 = OpTypeBool 
                                             %318 = OpTypePointer Private %317 
                               Private bool* %319 = OpVariable Private 
                                Input f32_4* %320 = OpVariable Input 
                                       f32_2 %333 = OpConstantComposite %310 %310 
                                         f32 %339 = OpConstant 3.67402E-40 
                                         f32 %340 = OpConstant 3.67402E-40 
                                       f32_2 %341 = OpConstantComposite %339 %340 
                                         f32 %346 = OpConstant 3.67402E-40 
                              Private f32_3* %355 = OpVariable Private 
                                             %356 = OpTypePointer Function %20 
                                         f32 %369 = OpConstant 3.67402E-40 
                                         f32 %370 = OpConstant 3.67402E-40 
                                       f32_2 %371 = OpConstantComposite %369 %370 
                               Private bool* %373 = OpVariable Private 
                              Private f32_3* %379 = OpVariable Private 
                                Private f32* %396 = OpVariable Private 
                                             %397 = OpTypePointer Function %6 
                              Private f32_4* %406 = OpVariable Private 
                                         u32 %407 = OpConstant 3 
                                         i32 %414 = OpConstant 13 
                                         i32 %420 = OpConstant 14 
                                         i32 %437 = OpConstant 12 
                                         i32 %445 = OpConstant 11 
                                         f32 %468 = OpConstant 3.67402E-40 
                                       f32_3 %469 = OpConstantComposite %468 %468 %468 
                                Private f32* %474 = OpVariable Private 
                                         i32 %477 = OpConstant 9 
                                         i32 %482 = OpConstant 18 
                               Private bool* %496 = OpVariable Private 
                                         i32 %497 = OpConstant 2 
                                        bool %501 = OpConstantFalse 
                                        bool %507 = OpSpecConstantFalse 
                                         i32 %515 = OpConstant 3 
                                         i32 %516 = OpConstant 1 
                                         i32 %551 = OpConstant 5 
                                             %552 = OpTypePointer Uniform %20 
                                         i32 %558 = OpConstant 4 
                                             %578 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %579 = OpTypeSampledImage %578 
                                             %580 = OpTypePointer UniformConstant %579 
 UniformConstant read_only Texture3DSampled* %581 = OpVariable UniformConstant 
                              Private f32_4* %586 = OpVariable Private 
                                Input f32_3* %603 = OpVariable Input 
                              Private f32_3* %608 = OpVariable Private 
                                         i32 %610 = OpConstant 6 
                              Private f32_4* %622 = OpVariable Private 
                               Private bool* %626 = OpVariable Private 
                              Private f32_2* %639 = OpVariable Private 
                                         f32 %647 = OpConstant 3.67402E-40 
                                         f32 %663 = OpConstant 3.67402E-40 
                                       f32_2 %664 = OpConstantComposite %647 %663 
                                         f32 %744 = OpConstant 3.67402E-40 
                                Private f32* %776 = OpVariable Private 
                               Private bool* %789 = OpVariable Private 
                                Private f32* %800 = OpVariable Private 
                                         i32 %812 = OpConstant 16 
                                         i32 %822 = OpConstant 17 
                                         f32 %833 = OpConstant 3.67402E-40 
                                       f32_3 %834 = OpConstantComposite %234 %663 %833 
                                       f32_3 %845 = OpConstantComposite %290 %290 %290 
                                         f32 %847 = OpConstant 3.67402E-40 
                                       f32_3 %848 = OpConstantComposite %847 %847 %847 
                                       f32_3 %855 = OpConstantComposite %647 %647 %647 
                                       f32_3 %876 = OpConstantComposite %234 %234 %234 
                                       f32_3 %897 = OpConstantComposite %258 %258 %258 
                                             %899 = OpTypePointer Output %7 
                               Output f32_4* %900 = OpVariable Output 
                                             %906 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %357 = OpVariable Function 
                             Function f32_3* %383 = OpVariable Function 
                               Function f32* %398 = OpVariable Function 
                             Function f32_3* %542 = OpVariable Function 
                               Function f32* %632 = OpVariable Function 
                               Function f32* %673 = OpVariable Function 
                               Function f32* %770 = OpVariable Function 
                               Function f32* %794 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %24 = OpLoad %23 
                                        f32_2 %25 = OpLoad %17 
                                        f32_4 %26 = OpImageSampleImplicitLod %24 %25 
                                          f32 %29 = OpCompositeExtract %26 0 
                                 Private f32* %31 = OpAccessChain %22 %28 
                                                      OpStore %31 %29 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_3 %35 = OpFNegate %34 
                               Uniform f32_4* %44 = OpAccessChain %40 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFAdd %35 %46 
                                                      OpStore %32 %47 
                               Uniform f32_4* %49 = OpAccessChain %40 %42 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 3 3 3 
                                        f32_3 %52 = OpLoad %32 
                                        f32_3 %53 = OpFMul %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFAdd %53 %55 
                                                      OpStore %48 %56 
                               Uniform f32_4* %58 = OpAccessChain %40 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                               Uniform f32_4* %62 = OpAccessChain %40 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %60 %64 
                                                      OpStore %32 %65 
                                        f32_3 %67 = OpLoad %32 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 0 0 
                                 Uniform f32* %71 = OpAccessChain %40 %69 
                                          f32 %72 = OpLoad %71 
                                 Uniform f32* %73 = OpAccessChain %40 %69 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %75 = OpAccessChain %40 %69 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %77 = OpAccessChain %40 %69 
                                          f32 %78 = OpLoad %77 
                                        f32_4 %79 = OpCompositeConstruct %72 %74 %76 %78 
                                          f32 %80 = OpCompositeExtract %79 0 
                                          f32 %81 = OpCompositeExtract %79 1 
                                          f32 %82 = OpCompositeExtract %79 2 
                                          f32 %83 = OpCompositeExtract %79 3 
                                        f32_4 %84 = OpCompositeConstruct %80 %81 %82 %83 
                                        f32_4 %85 = OpFMul %68 %84 
                                                      OpStore %66 %85 
                                   Input f32* %90 = OpAccessChain %87 %88 
                                          f32 %91 = OpLoad %90 
                                   Input f32* %92 = OpAccessChain %87 %28 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFAdd %91 %93 
                                 Private f32* %95 = OpAccessChain %32 %28 
                                                      OpStore %95 %94 
                                 Private f32* %97 = OpAccessChain %32 %88 
                                          f32 %98 = OpLoad %97 
                                 Uniform f32* %99 = OpAccessChain %40 %69 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFMul %98 %100 
                                Private f32* %102 = OpAccessChain %32 %28 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                Private f32* %105 = OpAccessChain %96 %28 
                                                      OpStore %105 %104 
                                Private f32* %107 = OpAccessChain %96 %28 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpExtInst %1 14 %108 
                                Private f32* %110 = OpAccessChain %106 %28 
                                                      OpStore %110 %109 
                                Private f32* %111 = OpAccessChain %96 %28 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpExtInst %1 13 %112 
                                Private f32* %114 = OpAccessChain %96 %28 
                                                      OpStore %114 %113 
                                Private f32* %115 = OpAccessChain %106 %28 
                                         f32 %116 = OpLoad %115 
                                         f32 %118 = OpFMul %116 %117 
                                Private f32* %119 = OpAccessChain %106 %28 
                                                      OpStore %119 %118 
                                Private f32* %120 = OpAccessChain %96 %28 
                                         f32 %121 = OpLoad %120 
                                         f32 %123 = OpFMul %121 %122 
                                Private f32* %124 = OpAccessChain %106 %88 
                                                      OpStore %124 %123 
                                       f32_4 %125 = OpLoad %106 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                                       f32_3 %127 = OpLoad %87 
                                       f32_2 %128 = OpVectorShuffle %127 %127 0 1 
                                       f32_2 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %96 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 2 3 
                                                      OpStore %96 %131 
                                       f32_4 %132 = OpLoad %96 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                Uniform f32* %135 = OpAccessChain %40 %134 
                                         f32 %136 = OpLoad %135 
                                       f32_2 %137 = OpCompositeConstruct %136 %136 
                                       f32_2 %138 = OpFMul %133 %137 
                                       f32_4 %139 = OpLoad %96 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 2 3 
                                                      OpStore %96 %140 
                                       f32_4 %143 = OpLoad %66 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %148 = OpFMul %144 %147 
                                                      OpStore %142 %148 
                                       f32_4 %149 = OpLoad %66 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %154 = OpFMul %150 %153 
                                       f32_3 %155 = OpLoad %32 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 0 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %66 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %66 %159 
                                Private f32* %160 = OpAccessChain %66 %28 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 14 %161 
                                Private f32* %163 = OpAccessChain %32 %28 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %32 %28 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %165 %117 
                                Private f32* %167 = OpAccessChain %106 %28 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %66 %88 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpExtInst %1 13 %169 
                                Private f32* %171 = OpAccessChain %32 %28 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %32 %28 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %173 %122 
                                Private f32* %175 = OpAccessChain %106 %88 
                                                      OpStore %175 %174 
                                       f32_4 %176 = OpLoad %106 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                                       f32_3 %178 = OpLoad %87 
                                       f32_2 %179 = OpVectorShuffle %178 %178 0 1 
                                       f32_2 %180 = OpFAdd %177 %179 
                                       f32_4 %181 = OpLoad %66 
                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 2 3 
                                                      OpStore %66 %182 
                                       f32_4 %183 = OpLoad %66 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
                                Uniform f32* %185 = OpAccessChain %40 %134 
                                         f32 %186 = OpLoad %185 
                                       f32_2 %187 = OpCompositeConstruct %186 %186 
                                       f32_2 %188 = OpFMul %184 %187 
                                       f32_4 %189 = OpLoad %66 
                                       f32_4 %190 = OpVectorShuffle %189 %188 4 5 2 3 
                                                      OpStore %66 %190 
                                       f32_4 %191 = OpLoad %96 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %195 = OpFMul %192 %194 
                                       f32_2 %196 = OpLoad %142 
                                       f32_2 %197 = OpFAdd %195 %196 
                                       f32_4 %198 = OpLoad %96 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 2 3 
                                                      OpStore %96 %199 
                  read_only Texture2DSampled %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %96 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                                       f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_4 %206 = OpLoad %96 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %96 %207 
                                       f32_4 %208 = OpLoad %66 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_2 %212 = OpFMul %209 %211 
                                       f32_4 %213 = OpLoad %66 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                                      OpStore %66 %214 
                                       f32_4 %215 = OpLoad %66 
                                       f32_2 %216 = OpVectorShuffle %215 %215 3 3 
                                       f32_2 %219 = OpFMul %216 %218 
                                       f32_4 %220 = OpLoad %66 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %222 = OpFAdd %219 %221 
                                       f32_4 %223 = OpLoad %66 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 2 3 
                                                      OpStore %66 %224 
                  read_only Texture2DSampled %226 = OpLoad %200 
                                       f32_4 %227 = OpLoad %66 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                                       f32_4 %229 = OpImageSampleImplicitLod %226 %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                                      OpStore %225 %230 
                                Uniform f32* %232 = OpAccessChain %40 %231 
                                         f32 %233 = OpLoad %232 
                                         f32 %235 = OpFAdd %233 %234 
                                Private f32* %236 = OpAccessChain %32 %28 
                                                      OpStore %236 %235 
                                  Input f32* %240 = OpAccessChain %239 %88 
                                         f32 %241 = OpLoad %240 
                                         f32 %243 = OpFMul %241 %242 
                                                      OpStore %237 %243 
                                Private f32* %246 = OpAccessChain %32 %245 
                                         f32 %247 = OpLoad %246 
                                         f32 %249 = OpFMul %247 %248 
                                         f32 %250 = OpLoad %237 
                                         f32 %251 = OpFAdd %249 %250 
                                                      OpStore %244 %251 
                                         f32 %252 = OpLoad %244 
                                         f32 %253 = OpExtInst %1 13 %252 
                                                      OpStore %244 %253 
                                         f32 %254 = OpLoad %244 
                                         f32 %256 = OpFMul %254 %255 
                                Private f32* %257 = OpAccessChain %106 %28 
                                                      OpStore %257 %256 
                                Private f32* %259 = OpAccessChain %106 %88 
                                                      OpStore %259 %258 
                                       f32_4 %260 = OpLoad %106 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_4 %262 = OpLoad %239 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %106 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %106 %266 
                                       f32_4 %267 = OpLoad %106 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %271 = OpFAdd %268 %270 
                                       f32_4 %272 = OpLoad %106 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 2 3 
                                                      OpStore %106 %273 
                  read_only Texture2DSampled %276 = OpLoad %275 
                                       f32_4 %277 = OpLoad %106 
                                       f32_2 %278 = OpVectorShuffle %277 %277 0 1 
                                       f32_4 %279 = OpImageSampleImplicitLod %276 %278 
                                                      OpStore %274 %279 
                                       f32_3 %281 = OpLoad %87 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 1 
                                       f32_3 %286 = OpFMul %282 %285 
                                                      OpStore %280 %286 
                                  Input f32* %288 = OpAccessChain %87 %28 
                                         f32 %289 = OpLoad %288 
                                         f32 %291 = OpFMul %289 %290 
                                Private f32* %292 = OpAccessChain %32 %88 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %287 %28 
                                                      OpStore %295 %294 
                                Private f32* %296 = OpAccessChain %287 %28 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpExtInst %1 13 %297 
                                Private f32* %299 = OpAccessChain %287 %28 
                                                      OpStore %299 %298 
                                Private f32* %300 = OpAccessChain %280 %28 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpExtInst %1 14 %301 
                                                      OpStore %244 %302 
                                         f32 %303 = OpLoad %244 
                                Private f32* %304 = OpAccessChain %287 %28 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFMul %303 %305 
                                Private f32* %307 = OpAccessChain %287 %28 
                                                      OpStore %307 %306 
                                Private f32* %308 = OpAccessChain %287 %28 
                                         f32 %309 = OpLoad %308 
                                         f32 %311 = OpFMul %309 %310 
                                Uniform f32* %313 = OpAccessChain %40 %312 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFAdd %311 %314 
                                Private f32* %316 = OpAccessChain %287 %28 
                                                      OpStore %316 %315 
                                  Input f32* %321 = OpAccessChain %320 %28 
                                         f32 %322 = OpLoad %321 
                                Private f32* %323 = OpAccessChain %287 %28 
                                         f32 %324 = OpLoad %323 
                                        bool %325 = OpFOrdLessThan %322 %324 
                                                      OpStore %319 %325 
                                       f32_3 %326 = OpLoad %280 
                                       f32_2 %327 = OpVectorShuffle %326 %326 1 2 
                                       f32_2 %328 = OpExtInst %1 8 %327 
                                       f32_3 %329 = OpLoad %280 
                                       f32_3 %330 = OpVectorShuffle %329 %328 3 4 2 
                                                      OpStore %280 %330 
                                       f32_3 %331 = OpLoad %280 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                       f32_2 %334 = OpFMul %332 %333 
                                       f32_3 %335 = OpLoad %280 
                                       f32_3 %336 = OpVectorShuffle %335 %334 3 4 2 
                                                      OpStore %280 %336 
                                       f32_3 %337 = OpLoad %280 
                                       f32_2 %338 = OpVectorShuffle %337 %337 0 1 
                                         f32 %342 = OpDot %338 %341 
                                                      OpStore %237 %342 
                                         f32 %343 = OpLoad %237 
                                         f32 %344 = OpExtInst %1 13 %343 
                                                      OpStore %237 %344 
                                         f32 %345 = OpLoad %237 
                                         f32 %347 = OpFMul %345 %346 
                                                      OpStore %237 %347 
                                         f32 %348 = OpLoad %237 
                                         f32 %349 = OpExtInst %1 10 %348 
                                                      OpStore %237 %349 
                                         f32 %350 = OpLoad %237 
                                         f32 %351 = OpFMul %350 %145 
                                         f32 %352 = OpFAdd %351 %145 
                                                      OpStore %237 %352 
                                         f32 %353 = OpLoad %237 
                                         f32 %354 = OpFMul %353 %145 
                                                      OpStore %237 %354 
                                        bool %358 = OpLoad %319 
                                                      OpSelectionMerge %360 None 
                                                      OpBranchConditional %358 %359 %363 
                                             %359 = OpLabel 
                                         f32 %361 = OpLoad %237 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                                      OpStore %357 %362 
                                                      OpBranch %360 
                                             %363 = OpLabel 
                                       f32_4 %364 = OpLoad %96 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                                      OpStore %357 %365 
                                                      OpBranch %360 
                                             %360 = OpLabel 
                                       f32_3 %366 = OpLoad %357 
                                                      OpStore %355 %366 
                                       f32_2 %367 = OpLoad %287 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 0 
                                       f32_2 %372 = OpFAdd %368 %371 
                                                      OpStore %287 %372 
                                  Input f32* %374 = OpAccessChain %320 %28 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %287 %28 
                                         f32 %377 = OpLoad %376 
                                        bool %378 = OpFOrdLessThan %375 %377 
                                                      OpStore %373 %378 
                                       f32_3 %380 = OpLoad %355 
                                       f32_3 %381 = OpLoad %355 
                                       f32_3 %382 = OpFAdd %380 %381 
                                                      OpStore %379 %382 
                                        bool %384 = OpLoad %373 
                                                      OpSelectionMerge %386 None 
                                                      OpBranchConditional %384 %385 %388 
                                             %385 = OpLabel 
                                       f32_3 %387 = OpLoad %379 
                                                      OpStore %383 %387 
                                                      OpBranch %386 
                                             %388 = OpLabel 
                                       f32_3 %389 = OpLoad %355 
                                                      OpStore %383 %389 
                                                      OpBranch %386 
                                             %386 = OpLabel 
                                       f32_3 %390 = OpLoad %383 
                                                      OpStore %355 %390 
                                Private f32* %391 = OpAccessChain %287 %88 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain %320 %28 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdLessThan %392 %394 
                                                      OpStore %373 %395 
                                        bool %399 = OpLoad %373 
                                                      OpSelectionMerge %401 None 
                                                      OpBranchConditional %399 %400 %402 
                                             %400 = OpLabel 
                                                      OpStore %398 %234 
                                                      OpBranch %401 
                                             %402 = OpLabel 
                                Private f32* %403 = OpAccessChain %22 %28 
                                         f32 %404 = OpLoad %403 
                                                      OpStore %398 %404 
                                                      OpBranch %401 
                                             %401 = OpLabel 
                                         f32 %405 = OpLoad %398 
                                                      OpStore %396 %405 
                                Private f32* %408 = OpAccessChain %9 %407 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %396 
                                         f32 %411 = OpFMul %409 %410 
                                Private f32* %412 = OpAccessChain %406 %407 
                                                      OpStore %412 %411 
                                       f32_3 %413 = OpLoad %355 
                                Uniform f32* %415 = OpAccessChain %40 %414 
                                         f32 %416 = OpLoad %415 
                                       f32_3 %417 = OpCompositeConstruct %416 %416 %416 
                                       f32_3 %418 = OpFMul %413 %417 
                                                      OpStore %280 %418 
                                       f32_3 %419 = OpLoad %225 
                                Uniform f32* %421 = OpAccessChain %40 %420 
                                         f32 %422 = OpLoad %421 
                                Uniform f32* %423 = OpAccessChain %40 %420 
                                         f32 %424 = OpLoad %423 
                                Uniform f32* %425 = OpAccessChain %40 %420 
                                         f32 %426 = OpLoad %425 
                                       f32_3 %427 = OpCompositeConstruct %422 %424 %426 
                                         f32 %428 = OpCompositeExtract %427 0 
                                         f32 %429 = OpCompositeExtract %427 1 
                                         f32 %430 = OpCompositeExtract %427 2 
                                       f32_3 %431 = OpCompositeConstruct %428 %429 %430 
                                       f32_3 %432 = OpFMul %419 %431 
                                       f32_4 %433 = OpLoad %66 
                                       f32_4 %434 = OpVectorShuffle %433 %432 4 5 6 3 
                                                      OpStore %66 %434 
                                       f32_4 %435 = OpLoad %66 
                                       f32_3 %436 = OpVectorShuffle %435 %435 0 1 2 
                              Uniform f32_4* %438 = OpAccessChain %40 %437 
                                       f32_4 %439 = OpLoad %438 
                                       f32_3 %440 = OpVectorShuffle %439 %439 0 1 2 
                                       f32_3 %441 = OpFMul %436 %440 
                                       f32_4 %442 = OpLoad %66 
                                       f32_4 %443 = OpVectorShuffle %442 %441 4 5 6 3 
                                                      OpStore %66 %443 
                                       f32_3 %444 = OpLoad %280 
                              Uniform f32_4* %446 = OpAccessChain %40 %445 
                                       f32_4 %447 = OpLoad %446 
                                       f32_3 %448 = OpVectorShuffle %447 %447 0 1 2 
                                       f32_3 %449 = OpFMul %444 %448 
                                       f32_4 %450 = OpLoad %66 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                       f32_3 %452 = OpFNegate %451 
                                       f32_3 %453 = OpFAdd %449 %452 
                                       f32_4 %454 = OpLoad %66 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 6 3 
                                                      OpStore %66 %455 
                                       f32_3 %456 = OpLoad %48 
                                       f32_3 %457 = OpLoad %32 
                                       f32_3 %458 = OpVectorShuffle %457 %457 0 0 0 
                                       f32_3 %459 = OpFMul %456 %458 
                                                      OpStore %48 %459 
                                       f32_4 %460 = OpLoad %66 
                                       f32_3 %461 = OpVectorShuffle %460 %460 0 1 2 
                                         f32 %462 = OpLoad %396 
                                       f32_3 %463 = OpCompositeConstruct %462 %462 %462 
                                       f32_3 %464 = OpFMul %461 %463 
                                       f32_3 %465 = OpLoad %48 
                                       f32_3 %466 = OpFAdd %464 %465 
                                                      OpStore %48 %466 
                                       f32_3 %467 = OpLoad %48 
                                       f32_3 %470 = OpFMul %467 %469 
                                       f32_4 %471 = OpLoad %274 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 1 2 
                                       f32_3 %473 = OpFAdd %470 %472 
                                                      OpStore %355 %473 
                                Private f32* %475 = OpAccessChain %274 %407 
                                         f32 %476 = OpLoad %475 
                                Uniform f32* %478 = OpAccessChain %40 %477 
                                         f32 %479 = OpLoad %478 
                                         f32 %480 = OpFMul %476 %479 
                                                      OpStore %474 %480 
                                         f32 %481 = OpLoad %474 
                                Uniform f32* %483 = OpAccessChain %40 %482 
                                         f32 %484 = OpLoad %483 
                                         f32 %485 = OpFMul %481 %484 
                                                      OpStore %474 %485 
                                       f32_3 %486 = OpLoad %48 
                                       f32_3 %487 = OpFNegate %486 
                                       f32_3 %488 = OpLoad %355 
                                       f32_3 %489 = OpFAdd %487 %488 
                                                      OpStore %32 %489 
                                         f32 %490 = OpLoad %474 
                                       f32_3 %491 = OpCompositeConstruct %490 %490 %490 
                                       f32_3 %492 = OpLoad %32 
                                       f32_3 %493 = OpFMul %491 %492 
                                       f32_3 %494 = OpLoad %48 
                                       f32_3 %495 = OpFAdd %493 %494 
                                                      OpStore %48 %495 
                                Uniform f32* %498 = OpAccessChain %40 %497 %28 
                                         f32 %499 = OpLoad %498 
                                        bool %500 = OpFOrdEqual %499 %234 
                                                      OpStore %496 %500 
                                                      OpSelectionMerge %503 None 
                                                      OpBranchConditional %501 %502 %503 
                                             %502 = OpLabel 
                                        bool %504 = OpLoad %496 
                                                      OpSelectionMerge %506 None 
                                                      OpBranchConditional %504 %505 %506 
                                             %505 = OpLabel 
                                                      OpBranch %506 
                                             %506 = OpLabel 
                                                      OpBranch %503 
                                             %503 = OpLabel 
                                                      OpSelectionMerge %509 None 
                                                      OpBranchConditional %507 %508 %588 
                                             %508 = OpLabel 
                                Uniform f32* %510 = OpAccessChain %40 %497 %88 
                                         f32 %511 = OpLoad %510 
                                        bool %512 = OpFOrdEqual %511 %234 
                                                      OpStore %496 %512 
                                       f32_3 %513 = OpLoad %87 
                                       f32_3 %514 = OpVectorShuffle %513 %513 1 1 1 
                              Uniform f32_4* %517 = OpAccessChain %40 %515 %516 
                                       f32_4 %518 = OpLoad %517 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %520 = OpFMul %514 %519 
                                                      OpStore %32 %520 
                              Uniform f32_4* %521 = OpAccessChain %40 %515 %57 
                                       f32_4 %522 = OpLoad %521 
                                       f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
                                       f32_3 %524 = OpLoad %87 
                                       f32_3 %525 = OpVectorShuffle %524 %524 0 0 0 
                                       f32_3 %526 = OpFMul %523 %525 
                                       f32_3 %527 = OpLoad %32 
                                       f32_3 %528 = OpFAdd %526 %527 
                                                      OpStore %32 %528 
                              Uniform f32_4* %529 = OpAccessChain %40 %515 %497 
                                       f32_4 %530 = OpLoad %529 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
                                       f32_3 %532 = OpLoad %87 
                                       f32_3 %533 = OpVectorShuffle %532 %532 2 2 2 
                                       f32_3 %534 = OpFMul %531 %533 
                                       f32_3 %535 = OpLoad %32 
                                       f32_3 %536 = OpFAdd %534 %535 
                                                      OpStore %32 %536 
                                       f32_3 %537 = OpLoad %32 
                              Uniform f32_4* %538 = OpAccessChain %40 %515 %515 
                                       f32_4 %539 = OpLoad %538 
                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                                       f32_3 %541 = OpFAdd %537 %540 
                                                      OpStore %32 %541 
                                        bool %543 = OpLoad %496 
                                                      OpSelectionMerge %545 None 
                                                      OpBranchConditional %543 %544 %547 
                                             %544 = OpLabel 
                                       f32_3 %546 = OpLoad %32 
                                                      OpStore %542 %546 
                                                      OpBranch %545 
                                             %547 = OpLabel 
                                       f32_3 %548 = OpLoad %87 
                                                      OpStore %542 %548 
                                                      OpBranch %545 
                                             %545 = OpLabel 
                                       f32_3 %549 = OpLoad %542 
                                                      OpStore %32 %549 
                                       f32_3 %550 = OpLoad %32 
                              Uniform f32_3* %553 = OpAccessChain %40 %551 
                                       f32_3 %554 = OpLoad %553 
                                       f32_3 %555 = OpFNegate %554 
                                       f32_3 %556 = OpFAdd %550 %555 
                                                      OpStore %32 %556 
                                       f32_3 %557 = OpLoad %32 
                              Uniform f32_3* %559 = OpAccessChain %40 %558 
                                       f32_3 %560 = OpLoad %559 
                                       f32_3 %561 = OpFMul %557 %560 
                                       f32_4 %562 = OpLoad %66 
                                       f32_4 %563 = OpVectorShuffle %562 %561 0 4 5 6 
                                                      OpStore %66 %563 
                                Private f32* %564 = OpAccessChain %66 %88 
                                         f32 %565 = OpLoad %564 
                                         f32 %566 = OpFMul %565 %217 
                                         f32 %567 = OpFAdd %566 %468 
                                                      OpStore %474 %567 
                                Uniform f32* %568 = OpAccessChain %40 %497 %245 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %569 %145 
                                         f32 %571 = OpFAdd %570 %468 
                                Private f32* %572 = OpAccessChain %32 %28 
                                                      OpStore %572 %571 
                                         f32 %573 = OpLoad %474 
                                Private f32* %574 = OpAccessChain %32 %28 
                                         f32 %575 = OpLoad %574 
                                         f32 %576 = OpExtInst %1 40 %573 %575 
                                Private f32* %577 = OpAccessChain %66 %28 
                                                      OpStore %577 %576 
                  read_only Texture3DSampled %582 = OpLoad %581 
                                       f32_4 %583 = OpLoad %66 
                                       f32_3 %584 = OpVectorShuffle %583 %583 0 2 3 
                                       f32_4 %585 = OpImageSampleImplicitLod %582 %584 
                                                      OpStore %66 %585 
                                       f32_4 %587 = OpLoad %66 
                                                      OpStore %586 %587 
                                                      OpBranch %509 
                                             %588 = OpLabel 
                                Private f32* %589 = OpAccessChain %586 %28 
                                                      OpStore %589 %234 
                                Private f32* %590 = OpAccessChain %586 %88 
                                                      OpStore %590 %234 
                                Private f32* %591 = OpAccessChain %586 %245 
                                                      OpStore %591 %234 
                                Private f32* %592 = OpAccessChain %586 %407 
                                                      OpStore %592 %234 
                                                      OpBranch %509 
                                             %509 = OpLabel 
                                       f32_4 %593 = OpLoad %586 
                              Uniform f32_4* %594 = OpAccessChain %40 %516 
                                       f32_4 %595 = OpLoad %594 
                                         f32 %596 = OpDot %593 %595 
                                Private f32* %597 = OpAccessChain %355 %28 
                                                      OpStore %597 %596 
                                Private f32* %598 = OpAccessChain %355 %28 
                                         f32 %599 = OpLoad %598 
                                         f32 %600 = OpExtInst %1 43 %599 %258 %234 
                                Private f32* %601 = OpAccessChain %355 %28 
                                                      OpStore %601 %600 
                                       f32_3 %602 = OpLoad %48 
                                       f32_3 %604 = OpLoad %603 
                                       f32_3 %605 = OpFMul %602 %604 
                                       f32_4 %606 = OpLoad %586 
                                       f32_4 %607 = OpVectorShuffle %606 %605 4 5 6 3 
                                                      OpStore %586 %607 
                                       f32_3 %609 = OpLoad %48 
                              Uniform f32_4* %611 = OpAccessChain %40 %610 
                                       f32_4 %612 = OpLoad %611 
                                       f32_3 %613 = OpVectorShuffle %612 %612 0 1 2 
                                       f32_3 %614 = OpFMul %609 %613 
                                                      OpStore %608 %614 
                                       f32_3 %615 = OpLoad %355 
                                       f32_3 %616 = OpVectorShuffle %615 %615 0 0 0 
                                       f32_3 %617 = OpLoad %608 
                                       f32_3 %618 = OpFMul %616 %617 
                                       f32_4 %619 = OpLoad %406 
                                       f32_4 %620 = OpVectorShuffle %619 %618 4 5 6 3 
                                                      OpStore %406 %620 
                                Private f32* %621 = OpAccessChain %586 %407 
                                                      OpStore %621 %258 
                                       f32_4 %623 = OpLoad %406 
                                       f32_4 %624 = OpLoad %586 
                                       f32_4 %625 = OpFAdd %623 %624 
                                                      OpStore %622 %625 
                                Private f32* %627 = OpAccessChain %622 %88 
                                         f32 %628 = OpLoad %627 
                                Private f32* %629 = OpAccessChain %622 %245 
                                         f32 %630 = OpLoad %629 
                                        bool %631 = OpFOrdGreaterThanEqual %628 %630 
                                                      OpStore %626 %631 
                                        bool %633 = OpLoad %626 
                                                      OpSelectionMerge %635 None 
                                                      OpBranchConditional %633 %634 %636 
                                             %634 = OpLabel 
                                                      OpStore %632 %234 
                                                      OpBranch %635 
                                             %636 = OpLabel 
                                                      OpStore %632 %258 
                                                      OpBranch %635 
                                             %635 = OpLabel 
                                         f32 %637 = OpLoad %632 
                                Private f32* %638 = OpAccessChain %32 %28 
                                                      OpStore %638 %637 
                                       f32_4 %640 = OpLoad %622 
                                       f32_2 %641 = OpVectorShuffle %640 %640 2 1 
                                       f32_2 %642 = OpFNegate %641 
                                       f32_4 %643 = OpLoad %622 
                                       f32_2 %644 = OpVectorShuffle %643 %643 1 2 
                                       f32_2 %645 = OpFAdd %642 %644 
                                                      OpStore %639 %645 
                                Private f32* %646 = OpAccessChain %106 %28 
                                                      OpStore %646 %234 
                                Private f32* %648 = OpAccessChain %106 %88 
                                                      OpStore %648 %647 
                                       f32_3 %649 = OpLoad %32 
                                       f32_2 %650 = OpVectorShuffle %649 %649 0 0 
                                       f32_2 %651 = OpLoad %639 
                                       f32_2 %652 = OpFMul %650 %651 
                                       f32_4 %653 = OpLoad %622 
                                       f32_2 %654 = OpVectorShuffle %653 %653 2 1 
                                       f32_2 %655 = OpFAdd %652 %654 
                                       f32_4 %656 = OpLoad %66 
                                       f32_4 %657 = OpVectorShuffle %656 %655 4 5 2 3 
                                                      OpStore %66 %657 
                                       f32_3 %658 = OpLoad %32 
                                       f32_2 %659 = OpVectorShuffle %658 %658 0 0 
                                       f32_4 %660 = OpLoad %106 
                                       f32_2 %661 = OpVectorShuffle %660 %660 0 1 
                                       f32_2 %662 = OpFMul %659 %661 
                                       f32_2 %665 = OpFAdd %662 %664 
                                       f32_4 %666 = OpLoad %66 
                                       f32_4 %667 = OpVectorShuffle %666 %665 0 1 4 5 
                                                      OpStore %66 %667 
                                Private f32* %668 = OpAccessChain %622 %28 
                                         f32 %669 = OpLoad %668 
                                Private f32* %670 = OpAccessChain %66 %28 
                                         f32 %671 = OpLoad %670 
                                        bool %672 = OpFOrdGreaterThanEqual %669 %671 
                                                      OpStore %626 %672 
                                        bool %674 = OpLoad %626 
                                                      OpSelectionMerge %676 None 
                                                      OpBranchConditional %674 %675 %677 
                                             %675 = OpLabel 
                                                      OpStore %673 %234 
                                                      OpBranch %676 
                                             %677 = OpLabel 
                                                      OpStore %673 %258 
                                                      OpBranch %676 
                                             %676 = OpLabel 
                                         f32 %678 = OpLoad %673 
                                Private f32* %679 = OpAccessChain %32 %28 
                                                      OpStore %679 %678 
                                       f32_4 %680 = OpLoad %66 
                                       f32_3 %681 = OpVectorShuffle %680 %680 0 1 3 
                                       f32_3 %682 = OpFNegate %681 
                                       f32_4 %683 = OpLoad %96 
                                       f32_4 %684 = OpVectorShuffle %683 %682 4 5 6 3 
                                                      OpStore %96 %684 
                                Private f32* %685 = OpAccessChain %622 %28 
                                         f32 %686 = OpLoad %685 
                                         f32 %687 = OpFNegate %686 
                                Private f32* %688 = OpAccessChain %96 %407 
                                                      OpStore %688 %687 
                                Private f32* %689 = OpAccessChain %622 %28 
                                         f32 %690 = OpLoad %689 
                                Private f32* %691 = OpAccessChain %96 %28 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFAdd %690 %692 
                                Private f32* %694 = OpAccessChain %106 %28 
                                                      OpStore %694 %693 
                                       f32_4 %695 = OpLoad %66 
                                       f32_3 %696 = OpVectorShuffle %695 %695 1 2 0 
                                       f32_4 %697 = OpLoad %96 
                                       f32_3 %698 = OpVectorShuffle %697 %697 1 2 3 
                                       f32_3 %699 = OpFAdd %696 %698 
                                       f32_4 %700 = OpLoad %106 
                                       f32_4 %701 = OpVectorShuffle %700 %699 0 4 5 6 
                                                      OpStore %106 %701 
                                       f32_3 %702 = OpLoad %32 
                                       f32_3 %703 = OpVectorShuffle %702 %702 0 0 0 
                                       f32_4 %704 = OpLoad %106 
                                       f32_3 %705 = OpVectorShuffle %704 %704 0 1 2 
                                       f32_3 %706 = OpFMul %703 %705 
                                       f32_4 %707 = OpLoad %66 
                                       f32_3 %708 = OpVectorShuffle %707 %707 0 1 3 
                                       f32_3 %709 = OpFAdd %706 %708 
                                       f32_4 %710 = OpLoad %106 
                                       f32_4 %711 = OpVectorShuffle %710 %709 4 5 6 3 
                                                      OpStore %106 %711 
                                Private f32* %712 = OpAccessChain %32 %28 
                                         f32 %713 = OpLoad %712 
                                Private f32* %714 = OpAccessChain %106 %407 
                                         f32 %715 = OpLoad %714 
                                         f32 %716 = OpFMul %713 %715 
                                Private f32* %717 = OpAccessChain %622 %28 
                                         f32 %718 = OpLoad %717 
                                         f32 %719 = OpFAdd %716 %718 
                                Private f32* %720 = OpAccessChain %32 %28 
                                                      OpStore %720 %719 
                                Private f32* %721 = OpAccessChain %106 %88 
                                         f32 %722 = OpLoad %721 
                                Private f32* %723 = OpAccessChain %32 %28 
                                         f32 %724 = OpLoad %723 
                                         f32 %725 = OpExtInst %1 37 %722 %724 
                                Private f32* %726 = OpAccessChain %287 %28 
                                                      OpStore %726 %725 
                                Private f32* %727 = OpAccessChain %287 %28 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFNegate %728 
                                Private f32* %730 = OpAccessChain %106 %28 
                                         f32 %731 = OpLoad %730 
                                         f32 %732 = OpFAdd %729 %731 
                                Private f32* %733 = OpAccessChain %287 %28 
                                                      OpStore %733 %732 
                                Private f32* %734 = OpAccessChain %106 %88 
                                         f32 %735 = OpLoad %734 
                                         f32 %736 = OpFNegate %735 
                                Private f32* %737 = OpAccessChain %32 %28 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpFAdd %736 %738 
                                Private f32* %740 = OpAccessChain %32 %28 
                                                      OpStore %740 %739 
                                Private f32* %741 = OpAccessChain %287 %28 
                                         f32 %742 = OpLoad %741 
                                         f32 %743 = OpFMul %742 %290 
                                         f32 %745 = OpFAdd %743 %744 
                                                      OpStore %244 %745 
                                Private f32* %746 = OpAccessChain %32 %28 
                                         f32 %747 = OpLoad %746 
                                         f32 %748 = OpLoad %244 
                                         f32 %749 = OpFDiv %747 %748 
                                Private f32* %750 = OpAccessChain %32 %28 
                                                      OpStore %750 %749 
                                Private f32* %751 = OpAccessChain %32 %28 
                                         f32 %752 = OpLoad %751 
                                Private f32* %753 = OpAccessChain %106 %245 
                                         f32 %754 = OpLoad %753 
                                         f32 %755 = OpFAdd %752 %754 
                                Private f32* %756 = OpAccessChain %32 %28 
                                                      OpStore %756 %755 
                                Private f32* %757 = OpAccessChain %106 %28 
                                         f32 %758 = OpLoad %757 
                                         f32 %759 = OpFAdd %758 %744 
                                                      OpStore %244 %759 
                                Private f32* %760 = OpAccessChain %287 %28 
                                         f32 %761 = OpLoad %760 
                                         f32 %762 = OpLoad %244 
                                         f32 %763 = OpFDiv %761 %762 
                                Private f32* %764 = OpAccessChain %287 %28 
                                                      OpStore %764 %763 
                                Uniform f32* %765 = OpAccessChain %40 %42 %88 
                                         f32 %766 = OpLoad %765 
                                Uniform f32* %767 = OpAccessChain %40 %42 %245 
                                         f32 %768 = OpLoad %767 
                                        bool %769 = OpFOrdGreaterThanEqual %766 %768 
                                                      OpStore %319 %769 
                                        bool %771 = OpLoad %319 
                                                      OpSelectionMerge %773 None 
                                                      OpBranchConditional %771 %772 %774 
                                             %772 = OpLabel 
                                                      OpStore %770 %234 
                                                      OpBranch %773 
                                             %774 = OpLabel 
                                                      OpStore %770 %258 
                                                      OpBranch %773 
                                             %773 = OpLabel 
                                         f32 %775 = OpLoad %770 
                                                      OpStore %244 %775 
                                Uniform f32* %777 = OpAccessChain %40 %42 %245 
                                         f32 %778 = OpLoad %777 
                                         f32 %779 = OpFNegate %778 
                                Uniform f32* %780 = OpAccessChain %40 %42 %88 
                                         f32 %781 = OpLoad %780 
                                         f32 %782 = OpFAdd %779 %781 
                                                      OpStore %776 %782 
                                         f32 %783 = OpLoad %244 
                                         f32 %784 = OpLoad %776 
                                         f32 %785 = OpFMul %783 %784 
                                Uniform f32* %786 = OpAccessChain %40 %42 %245 
                                         f32 %787 = OpLoad %786 
                                         f32 %788 = OpFAdd %785 %787 
                                                      OpStore %244 %788 
                                Uniform f32* %790 = OpAccessChain %40 %42 %28 
                                         f32 %791 = OpLoad %790 
                                         f32 %792 = OpLoad %244 
                                        bool %793 = OpFOrdGreaterThanEqual %791 %792 
                                                      OpStore %789 %793 
                                        bool %795 = OpLoad %789 
                                                      OpSelectionMerge %797 None 
                                                      OpBranchConditional %795 %796 %798 
                                             %796 = OpLabel 
                                                      OpStore %794 %234 
                                                      OpBranch %797 
                                             %798 = OpLabel 
                                                      OpStore %794 %258 
                                                      OpBranch %797 
                                             %797 = OpLabel 
                                         f32 %799 = OpLoad %794 
                                                      OpStore %776 %799 
                                         f32 %801 = OpLoad %244 
                                         f32 %802 = OpFNegate %801 
                                Uniform f32* %803 = OpAccessChain %40 %42 %28 
                                         f32 %804 = OpLoad %803 
                                         f32 %805 = OpFAdd %802 %804 
                                                      OpStore %800 %805 
                                         f32 %806 = OpLoad %776 
                                         f32 %807 = OpLoad %800 
                                         f32 %808 = OpFMul %806 %807 
                                         f32 %809 = OpLoad %244 
                                         f32 %810 = OpFAdd %808 %809 
                                                      OpStore %244 %810 
                                         f32 %811 = OpLoad %244 
                                Uniform f32* %813 = OpAccessChain %40 %812 
                                         f32 %814 = OpLoad %813 
                                         f32 %815 = OpFMul %811 %814 
                                                      OpStore %776 %815 
                                         f32 %816 = OpLoad %776 
                                Private f32* %817 = OpAccessChain %106 %28 
                                         f32 %818 = OpLoad %817 
                                         f32 %819 = OpExtInst %1 40 %816 %818 
                                Private f32* %820 = OpAccessChain %106 %28 
                                                      OpStore %820 %819 
                                         f32 %821 = OpLoad %244 
                                Uniform f32* %823 = OpAccessChain %40 %822 
                                         f32 %824 = OpLoad %823 
                                         f32 %825 = OpFMul %821 %824 
                                                      OpStore %244 %825 
                                         f32 %826 = OpLoad %244 
                                Private f32* %827 = OpAccessChain %106 %28 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpExtInst %1 37 %826 %828 
                                                      OpStore %244 %829 
                                       f32_3 %830 = OpLoad %32 
                                       f32_3 %831 = OpVectorShuffle %830 %830 0 0 0 
                                       f32_3 %832 = OpExtInst %1 4 %831 
                                       f32_3 %835 = OpFAdd %832 %834 
                                       f32_4 %836 = OpLoad %106 
                                       f32_4 %837 = OpVectorShuffle %836 %835 4 5 6 3 
                                                      OpStore %106 %837 
                                       f32_4 %838 = OpLoad %106 
                                       f32_3 %839 = OpVectorShuffle %838 %838 0 1 2 
                                       f32_3 %840 = OpExtInst %1 10 %839 
                                       f32_4 %841 = OpLoad %106 
                                       f32_4 %842 = OpVectorShuffle %841 %840 4 5 6 3 
                                                      OpStore %106 %842 
                                       f32_4 %843 = OpLoad %106 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 2 
                                       f32_3 %846 = OpFMul %844 %845 
                                       f32_3 %849 = OpFAdd %846 %848 
                                       f32_4 %850 = OpLoad %106 
                                       f32_4 %851 = OpVectorShuffle %850 %849 4 5 6 3 
                                                      OpStore %106 %851 
                                       f32_4 %852 = OpLoad %106 
                                       f32_3 %853 = OpVectorShuffle %852 %852 0 1 2 
                                       f32_3 %854 = OpExtInst %1 4 %853 
                                       f32_3 %856 = OpFAdd %854 %855 
                                       f32_4 %857 = OpLoad %106 
                                       f32_4 %858 = OpVectorShuffle %857 %856 4 5 6 3 
                                                      OpStore %106 %858 
                                       f32_4 %859 = OpLoad %106 
                                       f32_3 %860 = OpVectorShuffle %859 %859 0 1 2 
                                       f32_3 %861 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %862 = OpCompositeConstruct %234 %234 %234 
                                       f32_3 %863 = OpExtInst %1 43 %860 %861 %862 
                                       f32_4 %864 = OpLoad %106 
                                       f32_4 %865 = OpVectorShuffle %864 %863 4 5 6 3 
                                                      OpStore %106 %865 
                                       f32_4 %866 = OpLoad %106 
                                       f32_3 %867 = OpVectorShuffle %866 %866 0 1 2 
                                       f32_3 %868 = OpFAdd %867 %855 
                                       f32_4 %869 = OpLoad %106 
                                       f32_4 %870 = OpVectorShuffle %869 %868 4 5 6 3 
                                                      OpStore %106 %870 
                                       f32_2 %871 = OpLoad %287 
                                       f32_3 %872 = OpVectorShuffle %871 %871 0 0 0 
                                       f32_4 %873 = OpLoad %106 
                                       f32_3 %874 = OpVectorShuffle %873 %873 0 1 2 
                                       f32_3 %875 = OpFMul %872 %874 
                                       f32_3 %877 = OpFAdd %875 %876 
                                       f32_4 %878 = OpLoad %106 
                                       f32_4 %879 = OpVectorShuffle %878 %877 4 5 6 3 
                                                      OpStore %106 %879 
                                         f32 %880 = OpLoad %244 
                                       f32_3 %881 = OpCompositeConstruct %880 %880 %880 
                                       f32_4 %882 = OpLoad %106 
                                       f32_3 %883 = OpVectorShuffle %882 %882 0 1 2 
                                       f32_3 %884 = OpFMul %881 %883 
                                       f32_4 %885 = OpLoad %622 
                                       f32_3 %886 = OpVectorShuffle %885 %885 0 1 2 
                                       f32_3 %887 = OpFNegate %886 
                                       f32_3 %888 = OpFAdd %884 %887 
                                                      OpStore %32 %888 
                                       f32_3 %889 = OpLoad %22 
                                       f32_3 %890 = OpVectorShuffle %889 %889 0 0 0 
                                       f32_3 %891 = OpLoad %32 
                                       f32_3 %892 = OpFMul %890 %891 
                                       f32_4 %893 = OpLoad %622 
                                       f32_3 %894 = OpVectorShuffle %893 %893 0 1 2 
                                       f32_3 %895 = OpFAdd %892 %894 
                                                      OpStore %22 %895 
                                       f32_3 %896 = OpLoad %22 
                                       f32_3 %898 = OpExtInst %1 40 %896 %897 
                                                      OpStore %22 %898 
                                       f32_3 %901 = OpLoad %22 
                                       f32_4 %902 = OpLoad %900 
                                       f32_4 %903 = OpVectorShuffle %902 %901 4 5 6 3 
                                                      OpStore %900 %903 
                                Private f32* %904 = OpAccessChain %622 %407 
                                         f32 %905 = OpLoad %904 
                                 Output f32* %907 = OpAccessChain %900 %407 
                                                      OpStore %907 %905 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_COLOR0;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _ValueMinimum;
uniform 	float _ValueMaximum;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = (-u_xlat10_0.xyz) + _CausticColor.xyz;
    u_xlat0.xyz = _CausticColor.www * u_xlat7.xyz + u_xlat10_0.xyz;
    u_xlat7.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat2 = u_xlat7.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat7.x = vs_TEXCOORD2.y + vs_TEXCOORD2.x;
    u_xlat3.x = u_xlat7.y * _TimeScale + u_xlat7.x;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat4.x * 0.111111112;
    u_xlat4.y = u_xlat3.x * 0.166666672;
    u_xlat3.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat15.xy = u_xlat2.zw * vec2(0.5, 0.125);
    u_xlat2.xy = u_xlat2.xy * vec2(1.25, 0.899999976) + u_xlat7.xx;
    u_xlat7.x = cos(u_xlat2.x);
    u_xlat4.x = u_xlat7.x * 0.111111112;
    u_xlat7.x = sin(u_xlat2.y);
    u_xlat4.y = u_xlat7.x * 0.166666672;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003) + u_xlat15.xy;
    u_xlat10_3 = texture(_CausticTex, u_xlat3.xy);
    u_xlat2.xy = u_xlat2.xy * vec2(0.142857149, 0.142857149);
    u_xlat2.xy = u_xlat2.ww * vec2(0.25, 0.166666672) + u_xlat2.xy;
    u_xlat10_2 = texture(_CausticTex, u_xlat2.xy);
    u_xlat7.x = _EmissiveBoost + 1.0;
    u_xlat20 = vs_TEXCOORD3.y * 500.0;
    u_xlat19 = u_xlat7.z * 5.0 + u_xlat20;
    u_xlat19 = sin(u_xlat19);
    u_xlat4.x = u_xlat19 * 0.00150000001;
    u_xlat4.y = 0.0;
    u_xlat4.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.0, 0.075000003);
    u_xlat10_4 = texture(_ReflMapFromPixelator, u_xlat4.xy);
    u_xlat5.xyz = vs_TEXCOORD2.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat13.x = vs_TEXCOORD2.x * 6.0 + u_xlat7.y;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat19 = cos(u_xlat5.x);
    u_xlat13.x = u_xlat19 * u_xlat13.x;
    u_xlat13.x = u_xlat13.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb19 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xy = floor(u_xlat5.yz);
    u_xlat5.xy = u_xlat5.xy * vec2(0.0625, 0.0625);
    u_xlat20 = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat20 = fract(u_xlat20);
    u_xlat20 = u_xlat20 * 0.5 + 0.5;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(u_xlat20) : u_xlat10_3.xyz;
    u_xlat13.xy = u_xlat13.xx + vec2(-0.0625, -0.25);
    u_xlatb13 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlatb13 = u_xlat13.y<vs_COLOR0.x;
    u_xlat13.x = (u_xlatb13) ? 1.0 : u_xlat10_1.x;
    u_xlat5.w = u_xlat10_0.w * u_xlat13.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LightCausticPower);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat13.xxx + u_xlat0.xyz;
    u_xlat7.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_4.xyz;
    u_xlat18 = u_xlat10_4.w * _ReflPower;
    u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
    u_xlat7.xyz = (-u_xlat0.xyz) + u_xlat7.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat7.xyz = (bool(u_xlatb18)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25 + 0.75;
        u_xlat7.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat18, u_xlat7.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat18 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat5 + u_xlat2;
    u_xlatb7 = u_xlat0.y>=u_xlat0.z;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.zy;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat7.xxxx * u_xlat3 + u_xlat2;
    u_xlatb7 = u_xlat0.x>=u_xlat2.x;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat2.xyw;
    u_xlat3.w = u_xlat0.x;
    u_xlat2.xyw = u_xlat3.wyx;
    u_xlat2 = (-u_xlat3) + u_xlat2;
    u_xlat2 = u_xlat7.xxxx * u_xlat2 + u_xlat3;
    u_xlat7.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat13.x = (-u_xlat2.y) + u_xlat2.w;
    u_xlat19 = u_xlat7.x * 6.0 + 1.00000001e-010;
    u_xlat13.x = u_xlat13.x / u_xlat19;
    u_xlat13.x = u_xlat13.x + u_xlat2.z;
    u_xlat19 = u_xlat2.x + 1.00000001e-010;
    u_xlat7.x = u_xlat7.x / u_xlat19;
    u_xlatb19 = _CausticColor.y>=_CausticColor.z;
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat8 = (-_CausticColor.z) + _CausticColor.y;
    u_xlat19 = u_xlat19 * u_xlat8 + _CausticColor.z;
    u_xlatb8 = _CausticColor.x>=u_xlat19;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat14 = (-u_xlat19) + _CausticColor.x;
    u_xlat19 = u_xlat8 * u_xlat14 + u_xlat19;
    u_xlat8 = u_xlat19 * _ValueMinimum;
    u_xlat2.x = max(u_xlat8, u_xlat2.x);
    u_xlat19 = u_xlat19 * _ValueMaximum;
    u_xlat19 = min(u_xlat19, u_xlat2.x);
    u_xlat2.xyz = abs(u_xlat13.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat7.xyz = vec3(u_xlat19) * u_xlat2.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat10_1.xxx * u_xlat7.xyz + u_xlat0.xyz;
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 304
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %94 %100 %101 %114 %152 %170 %182 %183 %293 %296 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 RelaxedPrecision 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpMemberDecorate %19 10 Offset 19 
                                                      OpMemberDecorate %19 11 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpMemberDecorate %92 0 BuiltIn 92 
                                                      OpMemberDecorate %92 1 BuiltIn 92 
                                                      OpMemberDecorate %92 2 BuiltIn 92 
                                                      OpDecorate %92 Block 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate %114 Location 114 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %170 Location 170 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %182 Location 182 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %293 Location 293 
                                                      OpDecorate %296 Location 296 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 8 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %29 = OpConstant 0 
                                          i32 %37 = OpConstant 2 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                                              %51 = OpTypeVector %6 3 
                                              %52 = OpTypePointer Output %51 
                                Output f32_3* %53 = OpVariable Output 
                                          i32 %65 = OpConstant 10 
                                          u32 %90 = OpConstant 1 
                                              %91 = OpTypeArray %6 %90 
                                              %92 = OpTypeStruct %7 %6 %91 
                                              %93 = OpTypePointer Output %92 
         Output struct {f32_4; f32; f32[1];}* %94 = OpVariable Output 
                                              %96 = OpTypePointer Output %7 
                                              %98 = OpTypeVector %6 2 
                                              %99 = OpTypePointer Output %98 
                               Output f32_2* %100 = OpVariable Output 
                                Input f32_4* %101 = OpVariable Input 
                                         i32 %104 = OpConstant 11 
                                             %113 = OpTypePointer Input %51 
                                Input f32_3* %114 = OpVariable Input 
                                         i32 %116 = OpConstant 9 
                                         u32 %121 = OpConstant 0 
                                             %122 = OpTypePointer Private %6 
                                         u32 %135 = OpConstant 2 
                                Private f32* %137 = OpVariable Private 
                               Output f32_3* %152 = OpVariable Output 
                                             %157 = OpTypePointer Uniform %6 
                              Private f32_4* %162 = OpVariable Private 
                                         f32 %165 = OpConstant 3.67402E-40 
                                       f32_3 %166 = OpConstantComposite %165 %165 %165 
                               Output f32_4* %170 = OpVariable Output 
                               Output f32_4* %182 = OpVariable Output 
                                Input f32_4* %183 = OpVariable Input 
                                             %185 = OpTypePointer Private %51 
                              Private f32_3* %186 = OpVariable Private 
                              Private f32_4* %203 = OpVariable Private 
                              Private f32_3* %209 = OpVariable Private 
                                         i32 %210 = OpConstant 4 
                                         i32 %216 = OpConstant 5 
                                         i32 %222 = OpConstant 6 
                                         i32 %228 = OpConstant 7 
                                         f32 %237 = OpConstant 3.67402E-40 
                                         u32 %238 = OpConstant 3 
                                         f32 %259 = OpConstant 3.67402E-40 
                                       f32_3 %260 = OpConstantComposite %259 %259 %259 
                                         f32 %268 = OpConstant 3.67402E-40 
                                       f32_3 %269 = OpConstantComposite %268 %268 %268 
                                         f32 %280 = OpConstant 3.67402E-40 
                                       f32_3 %281 = OpConstantComposite %280 %280 %280 
                                         f32 %283 = OpConstant 3.67402E-40 
                                       f32_3 %284 = OpConstantComposite %283 %283 %283 
                               Output f32_3* %293 = OpVariable Output 
                               Output f32_4* %296 = OpVariable Output 
                                       f32_4 %297 = OpConstantComposite %259 %259 %259 %259 
                                             %298 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %30 = OpAccessChain %21 %23 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %21 %23 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %46 = OpLoad %9 
                               Uniform f32_4* %48 = OpAccessChain %21 %23 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpFAdd %46 %49 
                                                      OpStore %45 %50 
                               Uniform f32_4* %54 = OpAccessChain %21 %23 %47 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_4 %57 = OpLoad %11 
                                        f32_3 %58 = OpVectorShuffle %57 %57 3 3 3 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFAdd %59 %61 
                                                      OpStore %53 %62 
                                        f32_4 %63 = OpLoad %45 
                                        f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %21 %65 %24 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFMul %64 %67 
                                                      OpStore %9 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %65 %29 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %45 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %76 = OpAccessChain %21 %65 %37 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpLoad %45 
                                        f32_4 %79 = OpVectorShuffle %78 %78 2 2 2 2 
                                        f32_4 %80 = OpFMul %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %9 %82 
                               Uniform f32_4* %83 = OpAccessChain %21 %65 %47 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpLoad %45 
                                        f32_4 %86 = OpVectorShuffle %85 %85 3 3 3 3 
                                        f32_4 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFAdd %87 %88 
                                                      OpStore %9 %89 
                                        f32_4 %95 = OpLoad %9 
                                Output f32_4* %97 = OpAccessChain %94 %29 
                                                      OpStore %97 %95 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                              Uniform f32_4* %105 = OpAccessChain %21 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFMul %103 %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %104 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                       f32_2 %112 = OpFAdd %108 %111 
                                                      OpStore %100 %112 
                                       f32_3 %115 = OpLoad %114 
                              Uniform f32_4* %117 = OpAccessChain %21 %116 %29 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %115 %119 
                                Private f32* %123 = OpAccessChain %45 %121 
                                                      OpStore %123 %120 
                                       f32_3 %124 = OpLoad %114 
                              Uniform f32_4* %125 = OpAccessChain %21 %116 %24 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                         f32 %128 = OpDot %124 %127 
                                Private f32* %129 = OpAccessChain %45 %90 
                                                      OpStore %129 %128 
                                       f32_3 %130 = OpLoad %114 
                              Uniform f32_4* %131 = OpAccessChain %21 %116 %37 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %130 %133 
                                Private f32* %136 = OpAccessChain %45 %135 
                                                      OpStore %136 %134 
                                       f32_4 %138 = OpLoad %45 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_4 %140 = OpLoad %45 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                         f32 %142 = OpDot %139 %141 
                                                      OpStore %137 %142 
                                         f32 %143 = OpLoad %137 
                                         f32 %144 = OpExtInst %1 32 %143 
                                                      OpStore %137 %144 
                                         f32 %145 = OpLoad %137 
                                       f32_3 %146 = OpCompositeConstruct %145 %145 %145 
                                       f32_4 %147 = OpLoad %45 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %146 %148 
                                       f32_4 %150 = OpLoad %45 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %45 %151 
                                       f32_4 %153 = OpLoad %45 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                Private f32* %155 = OpAccessChain %9 %90 
                                         f32 %156 = OpLoad %155 
                                Uniform f32* %158 = OpAccessChain %21 %29 %121 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFMul %156 %159 
                                Private f32* %161 = OpAccessChain %9 %90 
                                                      OpStore %161 %160 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 3 1 
                                       f32_3 %167 = OpFMul %164 %166 
                                       f32_4 %168 = OpLoad %162 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 1 5 6 
                                                      OpStore %162 %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_2 %172 = OpVectorShuffle %171 %171 2 3 
                                       f32_4 %173 = OpLoad %170 
                                       f32_4 %174 = OpVectorShuffle %173 %172 0 1 4 5 
                                                      OpStore %170 %174 
                                       f32_4 %175 = OpLoad %162 
                                       f32_2 %176 = OpVectorShuffle %175 %175 2 2 
                                       f32_4 %177 = OpLoad %162 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 3 
                                       f32_2 %179 = OpFAdd %176 %178 
                                       f32_4 %180 = OpLoad %170 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 2 3 
                                                      OpStore %170 %181 
                                       f32_4 %184 = OpLoad %183 
                                                      OpStore %182 %184 
                                Private f32* %187 = OpAccessChain %45 %90 
                                         f32 %188 = OpLoad %187 
                                Private f32* %189 = OpAccessChain %45 %90 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpFMul %188 %190 
                                Private f32* %192 = OpAccessChain %186 %121 
                                                      OpStore %192 %191 
                                Private f32* %193 = OpAccessChain %45 %121 
                                         f32 %194 = OpLoad %193 
                                Private f32* %195 = OpAccessChain %45 %121 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %194 %196 
                                Private f32* %198 = OpAccessChain %186 %121 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFNegate %199 
                                         f32 %201 = OpFAdd %197 %200 
                                Private f32* %202 = OpAccessChain %186 %121 
                                                      OpStore %202 %201 
                                       f32_4 %204 = OpLoad %45 
                                       f32_4 %205 = OpVectorShuffle %204 %204 1 2 2 0 
                                       f32_4 %206 = OpLoad %45 
                                       f32_4 %207 = OpVectorShuffle %206 %206 0 1 2 2 
                                       f32_4 %208 = OpFMul %205 %207 
                                                      OpStore %203 %208 
                              Uniform f32_4* %211 = OpAccessChain %21 %210 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %203 
                                         f32 %214 = OpDot %212 %213 
                                Private f32* %215 = OpAccessChain %209 %121 
                                                      OpStore %215 %214 
                              Uniform f32_4* %217 = OpAccessChain %21 %216 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpLoad %203 
                                         f32 %220 = OpDot %218 %219 
                                Private f32* %221 = OpAccessChain %209 %90 
                                                      OpStore %221 %220 
                              Uniform f32_4* %223 = OpAccessChain %21 %222 
                                       f32_4 %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %203 
                                         f32 %226 = OpDot %224 %225 
                                Private f32* %227 = OpAccessChain %209 %135 
                                                      OpStore %227 %226 
                              Uniform f32_4* %229 = OpAccessChain %21 %228 
                                       f32_4 %230 = OpLoad %229 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %232 = OpLoad %186 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 0 0 
                                       f32_3 %234 = OpFMul %231 %233 
                                       f32_3 %235 = OpLoad %209 
                                       f32_3 %236 = OpFAdd %234 %235 
                                                      OpStore %186 %236 
                                Private f32* %239 = OpAccessChain %45 %238 
                                                      OpStore %239 %237 
                              Uniform f32_4* %240 = OpAccessChain %21 %24 
                                       f32_4 %241 = OpLoad %240 
                                       f32_4 %242 = OpLoad %45 
                                         f32 %243 = OpDot %241 %242 
                                Private f32* %244 = OpAccessChain %209 %121 
                                                      OpStore %244 %243 
                              Uniform f32_4* %245 = OpAccessChain %21 %37 
                                       f32_4 %246 = OpLoad %245 
                                       f32_4 %247 = OpLoad %45 
                                         f32 %248 = OpDot %246 %247 
                                Private f32* %249 = OpAccessChain %209 %90 
                                                      OpStore %249 %248 
                              Uniform f32_4* %250 = OpAccessChain %21 %47 
                                       f32_4 %251 = OpLoad %250 
                                       f32_4 %252 = OpLoad %45 
                                         f32 %253 = OpDot %251 %252 
                                Private f32* %254 = OpAccessChain %209 %135 
                                                      OpStore %254 %253 
                                       f32_3 %255 = OpLoad %186 
                                       f32_3 %256 = OpLoad %209 
                                       f32_3 %257 = OpFAdd %255 %256 
                                                      OpStore %186 %257 
                                       f32_3 %258 = OpLoad %186 
                                       f32_3 %261 = OpExtInst %1 40 %258 %260 
                                                      OpStore %186 %261 
                                       f32_3 %262 = OpLoad %186 
                                       f32_3 %263 = OpExtInst %1 30 %262 
                                       f32_4 %264 = OpLoad %45 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %45 %265 
                                       f32_4 %266 = OpLoad %45 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %270 = OpFMul %267 %269 
                                       f32_4 %271 = OpLoad %45 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                                      OpStore %45 %272 
                                       f32_4 %273 = OpLoad %45 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpExtInst %1 29 %274 
                                       f32_4 %276 = OpLoad %45 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %45 %277 
                                       f32_4 %278 = OpLoad %45 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %282 = OpFMul %279 %281 
                                       f32_3 %285 = OpFAdd %282 %284 
                                       f32_4 %286 = OpLoad %45 
                                       f32_4 %287 = OpVectorShuffle %286 %285 4 5 6 3 
                                                      OpStore %45 %287 
                                       f32_4 %288 = OpLoad %45 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                       f32_3 %290 = OpExtInst %1 40 %289 %260 
                                       f32_4 %291 = OpLoad %45 
                                       f32_4 %292 = OpVectorShuffle %291 %290 4 5 6 3 
                                                      OpStore %45 %292 
                                       f32_4 %294 = OpLoad %45 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                                                      OpStore %293 %295 
                                                      OpStore %296 %297 
                                 Output f32* %299 = OpAccessChain %94 %29 %90 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpFNegate %300 
                                 Output f32* %302 = OpAccessChain %94 %29 %90 
                                                      OpStore %302 %301 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 909
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %87 %239 %320 %603 %900 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpMemberDecorate %38 0 Offset 38 
                                                      OpMemberDecorate %38 1 RelaxedPrecision 
                                                      OpMemberDecorate %38 1 Offset 38 
                                                      OpMemberDecorate %38 2 Offset 38 
                                                      OpMemberDecorate %38 3 Offset 38 
                                                      OpMemberDecorate %38 4 Offset 38 
                                                      OpMemberDecorate %38 5 Offset 38 
                                                      OpMemberDecorate %38 6 RelaxedPrecision 
                                                      OpMemberDecorate %38 6 Offset 38 
                                                      OpMemberDecorate %38 7 Offset 38 
                                                      OpMemberDecorate %38 8 Offset 38 
                                                      OpMemberDecorate %38 9 Offset 38 
                                                      OpMemberDecorate %38 10 Offset 38 
                                                      OpMemberDecorate %38 11 Offset 38 
                                                      OpMemberDecorate %38 12 Offset 38 
                                                      OpMemberDecorate %38 13 Offset 38 
                                                      OpMemberDecorate %38 14 Offset 38 
                                                      OpMemberDecorate %38 15 Offset 38 
                                                      OpMemberDecorate %38 16 Offset 38 
                                                      OpMemberDecorate %38 17 Offset 38 
                                                      OpMemberDecorate %38 18 Offset 38 
                                                      OpMemberDecorate %38 19 Offset 38 
                                                      OpMemberDecorate %38 20 Offset 38 
                                                      OpDecorate %38 Block 
                                                      OpDecorate %40 DescriptorSet 40 
                                                      OpDecorate %40 Binding 40 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %87 Location 87 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %275 DescriptorSet 275 
                                                      OpDecorate %275 Binding 275 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %320 Location 320 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %406 RelaxedPrecision 
                                                      OpDecorate %409 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %413 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %418 RelaxedPrecision 
                                                      OpDecorate %419 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %429 RelaxedPrecision 
                                                      OpDecorate %430 RelaxedPrecision 
                                                      OpDecorate %431 RelaxedPrecision 
                                                      OpDecorate %432 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %488 RelaxedPrecision 
                                                      OpDecorate %507 SpecId 507 
                                                      OpDecorate %581 DescriptorSet 581 
                                                      OpDecorate %581 Binding 581 
                                                      OpDecorate %586 RelaxedPrecision 
                                                      OpDecorate %593 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %596 RelaxedPrecision 
                                                      OpDecorate %599 RelaxedPrecision 
                                                      OpDecorate %600 RelaxedPrecision 
                                                      OpDecorate %603 RelaxedPrecision 
                                                      OpDecorate %603 Location 603 
                                                      OpDecorate %604 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %615 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %617 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %622 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                                      OpDecorate %624 RelaxedPrecision 
                                                      OpDecorate %625 RelaxedPrecision 
                                                      OpDecorate %628 RelaxedPrecision 
                                                      OpDecorate %630 RelaxedPrecision 
                                                      OpDecorate %639 RelaxedPrecision 
                                                      OpDecorate %640 RelaxedPrecision 
                                                      OpDecorate %641 RelaxedPrecision 
                                                      OpDecorate %642 RelaxedPrecision 
                                                      OpDecorate %643 RelaxedPrecision 
                                                      OpDecorate %644 RelaxedPrecision 
                                                      OpDecorate %645 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate %653 RelaxedPrecision 
                                                      OpDecorate %654 RelaxedPrecision 
                                                      OpDecorate %669 RelaxedPrecision 
                                                      OpDecorate %686 RelaxedPrecision 
                                                      OpDecorate %687 RelaxedPrecision 
                                                      OpDecorate %690 RelaxedPrecision 
                                                      OpDecorate %718 RelaxedPrecision 
                                                      OpDecorate %885 RelaxedPrecision 
                                                      OpDecorate %886 RelaxedPrecision 
                                                      OpDecorate %887 RelaxedPrecision 
                                                      OpDecorate %893 RelaxedPrecision 
                                                      OpDecorate %894 RelaxedPrecision 
                                                      OpDecorate %900 RelaxedPrecision 
                                                      OpDecorate %900 Location 900 
                                                      OpDecorate %905 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Private %20 
                               Private f32_3* %22 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %23 = OpVariable UniformConstant 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                               Private f32_3* %32 = OpVariable Private 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %7 %36 
                                              %38 = OpTypeStruct %7 %7 %7 %37 %20 %20 %7 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
                                              %41 = OpTypeInt 32 1 
                                          i32 %42 = OpConstant 8 
                                              %43 = OpTypePointer Uniform %7 
                               Private f32_3* %48 = OpVariable Private 
                                          i32 %57 = OpConstant 0 
                                          i32 %61 = OpConstant 20 
                               Private f32_4* %66 = OpVariable Private 
                                          i32 %69 = OpConstant 10 
                                              %70 = OpTypePointer Uniform %6 
                                              %86 = OpTypePointer Input %20 
                                 Input f32_3* %87 = OpVariable Input 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypePointer Input %6 
                               Private f32_4* %96 = OpVariable Private 
                              Private f32_4* %106 = OpVariable Private 
                                         f32 %117 = OpConstant 3.67402E-40 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         i32 %134 = OpConstant 7 
                                             %141 = OpTypePointer Private %15 
                              Private f32_2* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                       f32_2 %147 = OpConstantComposite %145 %146 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_2 %153 = OpConstantComposite %151 %152 
                                         f32 %193 = OpConstant 3.67402E-40 
                                       f32_2 %194 = OpConstantComposite %193 %193 
 UniformConstant read_only Texture2DSampled* %200 = OpVariable UniformConstant 
                                         f32 %210 = OpConstant 3.67402E-40 
                                       f32_2 %211 = OpConstantComposite %210 %210 
                                         f32 %217 = OpConstant 3.67402E-40 
                                       f32_2 %218 = OpConstantComposite %217 %122 
                              Private f32_3* %225 = OpVariable Private 
                                         i32 %231 = OpConstant 15 
                                         f32 %234 = OpConstant 3.67402E-40 
                                Private f32* %237 = OpVariable Private 
                                             %238 = OpTypePointer Input %7 
                                Input f32_4* %239 = OpVariable Input 
                                         f32 %242 = OpConstant 3.67402E-40 
                                Private f32* %244 = OpVariable Private 
                                         u32 %245 = OpConstant 2 
                                         f32 %248 = OpConstant 3.67402E-40 
                                         f32 %255 = OpConstant 3.67402E-40 
                                         f32 %258 = OpConstant 3.67402E-40 
                                         f32 %269 = OpConstant 3.67402E-40 
                                       f32_2 %270 = OpConstantComposite %258 %269 
                              Private f32_4* %274 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %275 = OpVariable UniformConstant 
                              Private f32_3* %280 = OpVariable Private 
                                         f32 %283 = OpConstant 3.67402E-40 
                                         f32 %284 = OpConstant 3.67402E-40 
                                       f32_3 %285 = OpConstantComposite %283 %284 %284 
                              Private f32_2* %287 = OpVariable Private 
                                         f32 %290 = OpConstant 3.67402E-40 
                                         f32 %310 = OpConstant 3.67402E-40 
                                         i32 %312 = OpConstant 19 
                                             %317 = OpTypeBool 
                                             %318 = OpTypePointer Private %317 
                               Private bool* %319 = OpVariable Private 
                                Input f32_4* %320 = OpVariable Input 
                                       f32_2 %333 = OpConstantComposite %310 %310 
                                         f32 %339 = OpConstant 3.67402E-40 
                                         f32 %340 = OpConstant 3.67402E-40 
                                       f32_2 %341 = OpConstantComposite %339 %340 
                                         f32 %346 = OpConstant 3.67402E-40 
                              Private f32_3* %355 = OpVariable Private 
                                             %356 = OpTypePointer Function %20 
                                         f32 %369 = OpConstant 3.67402E-40 
                                         f32 %370 = OpConstant 3.67402E-40 
                                       f32_2 %371 = OpConstantComposite %369 %370 
                               Private bool* %373 = OpVariable Private 
                              Private f32_3* %379 = OpVariable Private 
                                Private f32* %396 = OpVariable Private 
                                             %397 = OpTypePointer Function %6 
                              Private f32_4* %406 = OpVariable Private 
                                         u32 %407 = OpConstant 3 
                                         i32 %414 = OpConstant 13 
                                         i32 %420 = OpConstant 14 
                                         i32 %437 = OpConstant 12 
                                         i32 %445 = OpConstant 11 
                                         f32 %468 = OpConstant 3.67402E-40 
                                       f32_3 %469 = OpConstantComposite %468 %468 %468 
                                Private f32* %474 = OpVariable Private 
                                         i32 %477 = OpConstant 9 
                                         i32 %482 = OpConstant 18 
                               Private bool* %496 = OpVariable Private 
                                         i32 %497 = OpConstant 2 
                                        bool %501 = OpConstantFalse 
                                        bool %507 = OpSpecConstantFalse 
                                         i32 %515 = OpConstant 3 
                                         i32 %516 = OpConstant 1 
                                         i32 %551 = OpConstant 5 
                                             %552 = OpTypePointer Uniform %20 
                                         i32 %558 = OpConstant 4 
                                             %578 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %579 = OpTypeSampledImage %578 
                                             %580 = OpTypePointer UniformConstant %579 
 UniformConstant read_only Texture3DSampled* %581 = OpVariable UniformConstant 
                              Private f32_4* %586 = OpVariable Private 
                                Input f32_3* %603 = OpVariable Input 
                              Private f32_3* %608 = OpVariable Private 
                                         i32 %610 = OpConstant 6 
                              Private f32_4* %622 = OpVariable Private 
                               Private bool* %626 = OpVariable Private 
                              Private f32_2* %639 = OpVariable Private 
                                         f32 %647 = OpConstant 3.67402E-40 
                                         f32 %663 = OpConstant 3.67402E-40 
                                       f32_2 %664 = OpConstantComposite %647 %663 
                                         f32 %744 = OpConstant 3.67402E-40 
                                Private f32* %776 = OpVariable Private 
                               Private bool* %789 = OpVariable Private 
                                Private f32* %800 = OpVariable Private 
                                         i32 %812 = OpConstant 16 
                                         i32 %822 = OpConstant 17 
                                         f32 %833 = OpConstant 3.67402E-40 
                                       f32_3 %834 = OpConstantComposite %234 %663 %833 
                                       f32_3 %845 = OpConstantComposite %290 %290 %290 
                                         f32 %847 = OpConstant 3.67402E-40 
                                       f32_3 %848 = OpConstantComposite %847 %847 %847 
                                       f32_3 %855 = OpConstantComposite %647 %647 %647 
                                       f32_3 %876 = OpConstantComposite %234 %234 %234 
                                       f32_3 %897 = OpConstantComposite %258 %258 %258 
                                             %899 = OpTypePointer Output %7 
                               Output f32_4* %900 = OpVariable Output 
                                             %906 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %357 = OpVariable Function 
                             Function f32_3* %383 = OpVariable Function 
                               Function f32* %398 = OpVariable Function 
                             Function f32_3* %542 = OpVariable Function 
                               Function f32* %632 = OpVariable Function 
                               Function f32* %673 = OpVariable Function 
                               Function f32* %770 = OpVariable Function 
                               Function f32* %794 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %24 = OpLoad %23 
                                        f32_2 %25 = OpLoad %17 
                                        f32_4 %26 = OpImageSampleImplicitLod %24 %25 
                                          f32 %29 = OpCompositeExtract %26 0 
                                 Private f32* %31 = OpAccessChain %22 %28 
                                                      OpStore %31 %29 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_3 %35 = OpFNegate %34 
                               Uniform f32_4* %44 = OpAccessChain %40 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFAdd %35 %46 
                                                      OpStore %32 %47 
                               Uniform f32_4* %49 = OpAccessChain %40 %42 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 3 3 3 
                                        f32_3 %52 = OpLoad %32 
                                        f32_3 %53 = OpFMul %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFAdd %53 %55 
                                                      OpStore %48 %56 
                               Uniform f32_4* %58 = OpAccessChain %40 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                               Uniform f32_4* %62 = OpAccessChain %40 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %60 %64 
                                                      OpStore %32 %65 
                                        f32_3 %67 = OpLoad %32 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 0 0 
                                 Uniform f32* %71 = OpAccessChain %40 %69 
                                          f32 %72 = OpLoad %71 
                                 Uniform f32* %73 = OpAccessChain %40 %69 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %75 = OpAccessChain %40 %69 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %77 = OpAccessChain %40 %69 
                                          f32 %78 = OpLoad %77 
                                        f32_4 %79 = OpCompositeConstruct %72 %74 %76 %78 
                                          f32 %80 = OpCompositeExtract %79 0 
                                          f32 %81 = OpCompositeExtract %79 1 
                                          f32 %82 = OpCompositeExtract %79 2 
                                          f32 %83 = OpCompositeExtract %79 3 
                                        f32_4 %84 = OpCompositeConstruct %80 %81 %82 %83 
                                        f32_4 %85 = OpFMul %68 %84 
                                                      OpStore %66 %85 
                                   Input f32* %90 = OpAccessChain %87 %88 
                                          f32 %91 = OpLoad %90 
                                   Input f32* %92 = OpAccessChain %87 %28 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFAdd %91 %93 
                                 Private f32* %95 = OpAccessChain %32 %28 
                                                      OpStore %95 %94 
                                 Private f32* %97 = OpAccessChain %32 %88 
                                          f32 %98 = OpLoad %97 
                                 Uniform f32* %99 = OpAccessChain %40 %69 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFMul %98 %100 
                                Private f32* %102 = OpAccessChain %32 %28 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                Private f32* %105 = OpAccessChain %96 %28 
                                                      OpStore %105 %104 
                                Private f32* %107 = OpAccessChain %96 %28 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpExtInst %1 14 %108 
                                Private f32* %110 = OpAccessChain %106 %28 
                                                      OpStore %110 %109 
                                Private f32* %111 = OpAccessChain %96 %28 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpExtInst %1 13 %112 
                                Private f32* %114 = OpAccessChain %96 %28 
                                                      OpStore %114 %113 
                                Private f32* %115 = OpAccessChain %106 %28 
                                         f32 %116 = OpLoad %115 
                                         f32 %118 = OpFMul %116 %117 
                                Private f32* %119 = OpAccessChain %106 %28 
                                                      OpStore %119 %118 
                                Private f32* %120 = OpAccessChain %96 %28 
                                         f32 %121 = OpLoad %120 
                                         f32 %123 = OpFMul %121 %122 
                                Private f32* %124 = OpAccessChain %106 %88 
                                                      OpStore %124 %123 
                                       f32_4 %125 = OpLoad %106 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                                       f32_3 %127 = OpLoad %87 
                                       f32_2 %128 = OpVectorShuffle %127 %127 0 1 
                                       f32_2 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %96 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 2 3 
                                                      OpStore %96 %131 
                                       f32_4 %132 = OpLoad %96 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                Uniform f32* %135 = OpAccessChain %40 %134 
                                         f32 %136 = OpLoad %135 
                                       f32_2 %137 = OpCompositeConstruct %136 %136 
                                       f32_2 %138 = OpFMul %133 %137 
                                       f32_4 %139 = OpLoad %96 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 2 3 
                                                      OpStore %96 %140 
                                       f32_4 %143 = OpLoad %66 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %148 = OpFMul %144 %147 
                                                      OpStore %142 %148 
                                       f32_4 %149 = OpLoad %66 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %154 = OpFMul %150 %153 
                                       f32_3 %155 = OpLoad %32 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 0 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %66 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %66 %159 
                                Private f32* %160 = OpAccessChain %66 %28 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 14 %161 
                                Private f32* %163 = OpAccessChain %32 %28 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %32 %28 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %165 %117 
                                Private f32* %167 = OpAccessChain %106 %28 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %66 %88 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpExtInst %1 13 %169 
                                Private f32* %171 = OpAccessChain %32 %28 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %32 %28 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %173 %122 
                                Private f32* %175 = OpAccessChain %106 %88 
                                                      OpStore %175 %174 
                                       f32_4 %176 = OpLoad %106 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                                       f32_3 %178 = OpLoad %87 
                                       f32_2 %179 = OpVectorShuffle %178 %178 0 1 
                                       f32_2 %180 = OpFAdd %177 %179 
                                       f32_4 %181 = OpLoad %66 
                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 2 3 
                                                      OpStore %66 %182 
                                       f32_4 %183 = OpLoad %66 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
                                Uniform f32* %185 = OpAccessChain %40 %134 
                                         f32 %186 = OpLoad %185 
                                       f32_2 %187 = OpCompositeConstruct %186 %186 
                                       f32_2 %188 = OpFMul %184 %187 
                                       f32_4 %189 = OpLoad %66 
                                       f32_4 %190 = OpVectorShuffle %189 %188 4 5 2 3 
                                                      OpStore %66 %190 
                                       f32_4 %191 = OpLoad %96 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %195 = OpFMul %192 %194 
                                       f32_2 %196 = OpLoad %142 
                                       f32_2 %197 = OpFAdd %195 %196 
                                       f32_4 %198 = OpLoad %96 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 2 3 
                                                      OpStore %96 %199 
                  read_only Texture2DSampled %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %96 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                                       f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_4 %206 = OpLoad %96 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %96 %207 
                                       f32_4 %208 = OpLoad %66 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_2 %212 = OpFMul %209 %211 
                                       f32_4 %213 = OpLoad %66 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                                      OpStore %66 %214 
                                       f32_4 %215 = OpLoad %66 
                                       f32_2 %216 = OpVectorShuffle %215 %215 3 3 
                                       f32_2 %219 = OpFMul %216 %218 
                                       f32_4 %220 = OpLoad %66 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %222 = OpFAdd %219 %221 
                                       f32_4 %223 = OpLoad %66 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 2 3 
                                                      OpStore %66 %224 
                  read_only Texture2DSampled %226 = OpLoad %200 
                                       f32_4 %227 = OpLoad %66 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                                       f32_4 %229 = OpImageSampleImplicitLod %226 %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                                      OpStore %225 %230 
                                Uniform f32* %232 = OpAccessChain %40 %231 
                                         f32 %233 = OpLoad %232 
                                         f32 %235 = OpFAdd %233 %234 
                                Private f32* %236 = OpAccessChain %32 %28 
                                                      OpStore %236 %235 
                                  Input f32* %240 = OpAccessChain %239 %88 
                                         f32 %241 = OpLoad %240 
                                         f32 %243 = OpFMul %241 %242 
                                                      OpStore %237 %243 
                                Private f32* %246 = OpAccessChain %32 %245 
                                         f32 %247 = OpLoad %246 
                                         f32 %249 = OpFMul %247 %248 
                                         f32 %250 = OpLoad %237 
                                         f32 %251 = OpFAdd %249 %250 
                                                      OpStore %244 %251 
                                         f32 %252 = OpLoad %244 
                                         f32 %253 = OpExtInst %1 13 %252 
                                                      OpStore %244 %253 
                                         f32 %254 = OpLoad %244 
                                         f32 %256 = OpFMul %254 %255 
                                Private f32* %257 = OpAccessChain %106 %28 
                                                      OpStore %257 %256 
                                Private f32* %259 = OpAccessChain %106 %88 
                                                      OpStore %259 %258 
                                       f32_4 %260 = OpLoad %106 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_4 %262 = OpLoad %239 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %106 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %106 %266 
                                       f32_4 %267 = OpLoad %106 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %271 = OpFAdd %268 %270 
                                       f32_4 %272 = OpLoad %106 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 2 3 
                                                      OpStore %106 %273 
                  read_only Texture2DSampled %276 = OpLoad %275 
                                       f32_4 %277 = OpLoad %106 
                                       f32_2 %278 = OpVectorShuffle %277 %277 0 1 
                                       f32_4 %279 = OpImageSampleImplicitLod %276 %278 
                                                      OpStore %274 %279 
                                       f32_3 %281 = OpLoad %87 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 1 
                                       f32_3 %286 = OpFMul %282 %285 
                                                      OpStore %280 %286 
                                  Input f32* %288 = OpAccessChain %87 %28 
                                         f32 %289 = OpLoad %288 
                                         f32 %291 = OpFMul %289 %290 
                                Private f32* %292 = OpAccessChain %32 %88 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %287 %28 
                                                      OpStore %295 %294 
                                Private f32* %296 = OpAccessChain %287 %28 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpExtInst %1 13 %297 
                                Private f32* %299 = OpAccessChain %287 %28 
                                                      OpStore %299 %298 
                                Private f32* %300 = OpAccessChain %280 %28 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpExtInst %1 14 %301 
                                                      OpStore %244 %302 
                                         f32 %303 = OpLoad %244 
                                Private f32* %304 = OpAccessChain %287 %28 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFMul %303 %305 
                                Private f32* %307 = OpAccessChain %287 %28 
                                                      OpStore %307 %306 
                                Private f32* %308 = OpAccessChain %287 %28 
                                         f32 %309 = OpLoad %308 
                                         f32 %311 = OpFMul %309 %310 
                                Uniform f32* %313 = OpAccessChain %40 %312 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFAdd %311 %314 
                                Private f32* %316 = OpAccessChain %287 %28 
                                                      OpStore %316 %315 
                                  Input f32* %321 = OpAccessChain %320 %28 
                                         f32 %322 = OpLoad %321 
                                Private f32* %323 = OpAccessChain %287 %28 
                                         f32 %324 = OpLoad %323 
                                        bool %325 = OpFOrdLessThan %322 %324 
                                                      OpStore %319 %325 
                                       f32_3 %326 = OpLoad %280 
                                       f32_2 %327 = OpVectorShuffle %326 %326 1 2 
                                       f32_2 %328 = OpExtInst %1 8 %327 
                                       f32_3 %329 = OpLoad %280 
                                       f32_3 %330 = OpVectorShuffle %329 %328 3 4 2 
                                                      OpStore %280 %330 
                                       f32_3 %331 = OpLoad %280 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                       f32_2 %334 = OpFMul %332 %333 
                                       f32_3 %335 = OpLoad %280 
                                       f32_3 %336 = OpVectorShuffle %335 %334 3 4 2 
                                                      OpStore %280 %336 
                                       f32_3 %337 = OpLoad %280 
                                       f32_2 %338 = OpVectorShuffle %337 %337 0 1 
                                         f32 %342 = OpDot %338 %341 
                                                      OpStore %237 %342 
                                         f32 %343 = OpLoad %237 
                                         f32 %344 = OpExtInst %1 13 %343 
                                                      OpStore %237 %344 
                                         f32 %345 = OpLoad %237 
                                         f32 %347 = OpFMul %345 %346 
                                                      OpStore %237 %347 
                                         f32 %348 = OpLoad %237 
                                         f32 %349 = OpExtInst %1 10 %348 
                                                      OpStore %237 %349 
                                         f32 %350 = OpLoad %237 
                                         f32 %351 = OpFMul %350 %145 
                                         f32 %352 = OpFAdd %351 %145 
                                                      OpStore %237 %352 
                                         f32 %353 = OpLoad %237 
                                         f32 %354 = OpFMul %353 %145 
                                                      OpStore %237 %354 
                                        bool %358 = OpLoad %319 
                                                      OpSelectionMerge %360 None 
                                                      OpBranchConditional %358 %359 %363 
                                             %359 = OpLabel 
                                         f32 %361 = OpLoad %237 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                                      OpStore %357 %362 
                                                      OpBranch %360 
                                             %363 = OpLabel 
                                       f32_4 %364 = OpLoad %96 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                                      OpStore %357 %365 
                                                      OpBranch %360 
                                             %360 = OpLabel 
                                       f32_3 %366 = OpLoad %357 
                                                      OpStore %355 %366 
                                       f32_2 %367 = OpLoad %287 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 0 
                                       f32_2 %372 = OpFAdd %368 %371 
                                                      OpStore %287 %372 
                                  Input f32* %374 = OpAccessChain %320 %28 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %287 %28 
                                         f32 %377 = OpLoad %376 
                                        bool %378 = OpFOrdLessThan %375 %377 
                                                      OpStore %373 %378 
                                       f32_3 %380 = OpLoad %355 
                                       f32_3 %381 = OpLoad %355 
                                       f32_3 %382 = OpFAdd %380 %381 
                                                      OpStore %379 %382 
                                        bool %384 = OpLoad %373 
                                                      OpSelectionMerge %386 None 
                                                      OpBranchConditional %384 %385 %388 
                                             %385 = OpLabel 
                                       f32_3 %387 = OpLoad %379 
                                                      OpStore %383 %387 
                                                      OpBranch %386 
                                             %388 = OpLabel 
                                       f32_3 %389 = OpLoad %355 
                                                      OpStore %383 %389 
                                                      OpBranch %386 
                                             %386 = OpLabel 
                                       f32_3 %390 = OpLoad %383 
                                                      OpStore %355 %390 
                                Private f32* %391 = OpAccessChain %287 %88 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain %320 %28 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdLessThan %392 %394 
                                                      OpStore %373 %395 
                                        bool %399 = OpLoad %373 
                                                      OpSelectionMerge %401 None 
                                                      OpBranchConditional %399 %400 %402 
                                             %400 = OpLabel 
                                                      OpStore %398 %234 
                                                      OpBranch %401 
                                             %402 = OpLabel 
                                Private f32* %403 = OpAccessChain %22 %28 
                                         f32 %404 = OpLoad %403 
                                                      OpStore %398 %404 
                                                      OpBranch %401 
                                             %401 = OpLabel 
                                         f32 %405 = OpLoad %398 
                                                      OpStore %396 %405 
                                Private f32* %408 = OpAccessChain %9 %407 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %396 
                                         f32 %411 = OpFMul %409 %410 
                                Private f32* %412 = OpAccessChain %406 %407 
                                                      OpStore %412 %411 
                                       f32_3 %413 = OpLoad %355 
                                Uniform f32* %415 = OpAccessChain %40 %414 
                                         f32 %416 = OpLoad %415 
                                       f32_3 %417 = OpCompositeConstruct %416 %416 %416 
                                       f32_3 %418 = OpFMul %413 %417 
                                                      OpStore %280 %418 
                                       f32_3 %419 = OpLoad %225 
                                Uniform f32* %421 = OpAccessChain %40 %420 
                                         f32 %422 = OpLoad %421 
                                Uniform f32* %423 = OpAccessChain %40 %420 
                                         f32 %424 = OpLoad %423 
                                Uniform f32* %425 = OpAccessChain %40 %420 
                                         f32 %426 = OpLoad %425 
                                       f32_3 %427 = OpCompositeConstruct %422 %424 %426 
                                         f32 %428 = OpCompositeExtract %427 0 
                                         f32 %429 = OpCompositeExtract %427 1 
                                         f32 %430 = OpCompositeExtract %427 2 
                                       f32_3 %431 = OpCompositeConstruct %428 %429 %430 
                                       f32_3 %432 = OpFMul %419 %431 
                                       f32_4 %433 = OpLoad %66 
                                       f32_4 %434 = OpVectorShuffle %433 %432 4 5 6 3 
                                                      OpStore %66 %434 
                                       f32_4 %435 = OpLoad %66 
                                       f32_3 %436 = OpVectorShuffle %435 %435 0 1 2 
                              Uniform f32_4* %438 = OpAccessChain %40 %437 
                                       f32_4 %439 = OpLoad %438 
                                       f32_3 %440 = OpVectorShuffle %439 %439 0 1 2 
                                       f32_3 %441 = OpFMul %436 %440 
                                       f32_4 %442 = OpLoad %66 
                                       f32_4 %443 = OpVectorShuffle %442 %441 4 5 6 3 
                                                      OpStore %66 %443 
                                       f32_3 %444 = OpLoad %280 
                              Uniform f32_4* %446 = OpAccessChain %40 %445 
                                       f32_4 %447 = OpLoad %446 
                                       f32_3 %448 = OpVectorShuffle %447 %447 0 1 2 
                                       f32_3 %449 = OpFMul %444 %448 
                                       f32_4 %450 = OpLoad %66 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                       f32_3 %452 = OpFNegate %451 
                                       f32_3 %453 = OpFAdd %449 %452 
                                       f32_4 %454 = OpLoad %66 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 6 3 
                                                      OpStore %66 %455 
                                       f32_3 %456 = OpLoad %48 
                                       f32_3 %457 = OpLoad %32 
                                       f32_3 %458 = OpVectorShuffle %457 %457 0 0 0 
                                       f32_3 %459 = OpFMul %456 %458 
                                                      OpStore %48 %459 
                                       f32_4 %460 = OpLoad %66 
                                       f32_3 %461 = OpVectorShuffle %460 %460 0 1 2 
                                         f32 %462 = OpLoad %396 
                                       f32_3 %463 = OpCompositeConstruct %462 %462 %462 
                                       f32_3 %464 = OpFMul %461 %463 
                                       f32_3 %465 = OpLoad %48 
                                       f32_3 %466 = OpFAdd %464 %465 
                                                      OpStore %48 %466 
                                       f32_3 %467 = OpLoad %48 
                                       f32_3 %470 = OpFMul %467 %469 
                                       f32_4 %471 = OpLoad %274 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 1 2 
                                       f32_3 %473 = OpFAdd %470 %472 
                                                      OpStore %355 %473 
                                Private f32* %475 = OpAccessChain %274 %407 
                                         f32 %476 = OpLoad %475 
                                Uniform f32* %478 = OpAccessChain %40 %477 
                                         f32 %479 = OpLoad %478 
                                         f32 %480 = OpFMul %476 %479 
                                                      OpStore %474 %480 
                                         f32 %481 = OpLoad %474 
                                Uniform f32* %483 = OpAccessChain %40 %482 
                                         f32 %484 = OpLoad %483 
                                         f32 %485 = OpFMul %481 %484 
                                                      OpStore %474 %485 
                                       f32_3 %486 = OpLoad %48 
                                       f32_3 %487 = OpFNegate %486 
                                       f32_3 %488 = OpLoad %355 
                                       f32_3 %489 = OpFAdd %487 %488 
                                                      OpStore %32 %489 
                                         f32 %490 = OpLoad %474 
                                       f32_3 %491 = OpCompositeConstruct %490 %490 %490 
                                       f32_3 %492 = OpLoad %32 
                                       f32_3 %493 = OpFMul %491 %492 
                                       f32_3 %494 = OpLoad %48 
                                       f32_3 %495 = OpFAdd %493 %494 
                                                      OpStore %48 %495 
                                Uniform f32* %498 = OpAccessChain %40 %497 %28 
                                         f32 %499 = OpLoad %498 
                                        bool %500 = OpFOrdEqual %499 %234 
                                                      OpStore %496 %500 
                                                      OpSelectionMerge %503 None 
                                                      OpBranchConditional %501 %502 %503 
                                             %502 = OpLabel 
                                        bool %504 = OpLoad %496 
                                                      OpSelectionMerge %506 None 
                                                      OpBranchConditional %504 %505 %506 
                                             %505 = OpLabel 
                                                      OpBranch %506 
                                             %506 = OpLabel 
                                                      OpBranch %503 
                                             %503 = OpLabel 
                                                      OpSelectionMerge %509 None 
                                                      OpBranchConditional %507 %508 %588 
                                             %508 = OpLabel 
                                Uniform f32* %510 = OpAccessChain %40 %497 %88 
                                         f32 %511 = OpLoad %510 
                                        bool %512 = OpFOrdEqual %511 %234 
                                                      OpStore %496 %512 
                                       f32_3 %513 = OpLoad %87 
                                       f32_3 %514 = OpVectorShuffle %513 %513 1 1 1 
                              Uniform f32_4* %517 = OpAccessChain %40 %515 %516 
                                       f32_4 %518 = OpLoad %517 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %520 = OpFMul %514 %519 
                                                      OpStore %32 %520 
                              Uniform f32_4* %521 = OpAccessChain %40 %515 %57 
                                       f32_4 %522 = OpLoad %521 
                                       f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
                                       f32_3 %524 = OpLoad %87 
                                       f32_3 %525 = OpVectorShuffle %524 %524 0 0 0 
                                       f32_3 %526 = OpFMul %523 %525 
                                       f32_3 %527 = OpLoad %32 
                                       f32_3 %528 = OpFAdd %526 %527 
                                                      OpStore %32 %528 
                              Uniform f32_4* %529 = OpAccessChain %40 %515 %497 
                                       f32_4 %530 = OpLoad %529 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
                                       f32_3 %532 = OpLoad %87 
                                       f32_3 %533 = OpVectorShuffle %532 %532 2 2 2 
                                       f32_3 %534 = OpFMul %531 %533 
                                       f32_3 %535 = OpLoad %32 
                                       f32_3 %536 = OpFAdd %534 %535 
                                                      OpStore %32 %536 
                                       f32_3 %537 = OpLoad %32 
                              Uniform f32_4* %538 = OpAccessChain %40 %515 %515 
                                       f32_4 %539 = OpLoad %538 
                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                                       f32_3 %541 = OpFAdd %537 %540 
                                                      OpStore %32 %541 
                                        bool %543 = OpLoad %496 
                                                      OpSelectionMerge %545 None 
                                                      OpBranchConditional %543 %544 %547 
                                             %544 = OpLabel 
                                       f32_3 %546 = OpLoad %32 
                                                      OpStore %542 %546 
                                                      OpBranch %545 
                                             %547 = OpLabel 
                                       f32_3 %548 = OpLoad %87 
                                                      OpStore %542 %548 
                                                      OpBranch %545 
                                             %545 = OpLabel 
                                       f32_3 %549 = OpLoad %542 
                                                      OpStore %32 %549 
                                       f32_3 %550 = OpLoad %32 
                              Uniform f32_3* %553 = OpAccessChain %40 %551 
                                       f32_3 %554 = OpLoad %553 
                                       f32_3 %555 = OpFNegate %554 
                                       f32_3 %556 = OpFAdd %550 %555 
                                                      OpStore %32 %556 
                                       f32_3 %557 = OpLoad %32 
                              Uniform f32_3* %559 = OpAccessChain %40 %558 
                                       f32_3 %560 = OpLoad %559 
                                       f32_3 %561 = OpFMul %557 %560 
                                       f32_4 %562 = OpLoad %66 
                                       f32_4 %563 = OpVectorShuffle %562 %561 0 4 5 6 
                                                      OpStore %66 %563 
                                Private f32* %564 = OpAccessChain %66 %88 
                                         f32 %565 = OpLoad %564 
                                         f32 %566 = OpFMul %565 %217 
                                         f32 %567 = OpFAdd %566 %468 
                                                      OpStore %474 %567 
                                Uniform f32* %568 = OpAccessChain %40 %497 %245 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %569 %145 
                                         f32 %571 = OpFAdd %570 %468 
                                Private f32* %572 = OpAccessChain %32 %28 
                                                      OpStore %572 %571 
                                         f32 %573 = OpLoad %474 
                                Private f32* %574 = OpAccessChain %32 %28 
                                         f32 %575 = OpLoad %574 
                                         f32 %576 = OpExtInst %1 40 %573 %575 
                                Private f32* %577 = OpAccessChain %66 %28 
                                                      OpStore %577 %576 
                  read_only Texture3DSampled %582 = OpLoad %581 
                                       f32_4 %583 = OpLoad %66 
                                       f32_3 %584 = OpVectorShuffle %583 %583 0 2 3 
                                       f32_4 %585 = OpImageSampleImplicitLod %582 %584 
                                                      OpStore %66 %585 
                                       f32_4 %587 = OpLoad %66 
                                                      OpStore %586 %587 
                                                      OpBranch %509 
                                             %588 = OpLabel 
                                Private f32* %589 = OpAccessChain %586 %28 
                                                      OpStore %589 %234 
                                Private f32* %590 = OpAccessChain %586 %88 
                                                      OpStore %590 %234 
                                Private f32* %591 = OpAccessChain %586 %245 
                                                      OpStore %591 %234 
                                Private f32* %592 = OpAccessChain %586 %407 
                                                      OpStore %592 %234 
                                                      OpBranch %509 
                                             %509 = OpLabel 
                                       f32_4 %593 = OpLoad %586 
                              Uniform f32_4* %594 = OpAccessChain %40 %516 
                                       f32_4 %595 = OpLoad %594 
                                         f32 %596 = OpDot %593 %595 
                                Private f32* %597 = OpAccessChain %355 %28 
                                                      OpStore %597 %596 
                                Private f32* %598 = OpAccessChain %355 %28 
                                         f32 %599 = OpLoad %598 
                                         f32 %600 = OpExtInst %1 43 %599 %258 %234 
                                Private f32* %601 = OpAccessChain %355 %28 
                                                      OpStore %601 %600 
                                       f32_3 %602 = OpLoad %48 
                                       f32_3 %604 = OpLoad %603 
                                       f32_3 %605 = OpFMul %602 %604 
                                       f32_4 %606 = OpLoad %586 
                                       f32_4 %607 = OpVectorShuffle %606 %605 4 5 6 3 
                                                      OpStore %586 %607 
                                       f32_3 %609 = OpLoad %48 
                              Uniform f32_4* %611 = OpAccessChain %40 %610 
                                       f32_4 %612 = OpLoad %611 
                                       f32_3 %613 = OpVectorShuffle %612 %612 0 1 2 
                                       f32_3 %614 = OpFMul %609 %613 
                                                      OpStore %608 %614 
                                       f32_3 %615 = OpLoad %355 
                                       f32_3 %616 = OpVectorShuffle %615 %615 0 0 0 
                                       f32_3 %617 = OpLoad %608 
                                       f32_3 %618 = OpFMul %616 %617 
                                       f32_4 %619 = OpLoad %406 
                                       f32_4 %620 = OpVectorShuffle %619 %618 4 5 6 3 
                                                      OpStore %406 %620 
                                Private f32* %621 = OpAccessChain %586 %407 
                                                      OpStore %621 %258 
                                       f32_4 %623 = OpLoad %406 
                                       f32_4 %624 = OpLoad %586 
                                       f32_4 %625 = OpFAdd %623 %624 
                                                      OpStore %622 %625 
                                Private f32* %627 = OpAccessChain %622 %88 
                                         f32 %628 = OpLoad %627 
                                Private f32* %629 = OpAccessChain %622 %245 
                                         f32 %630 = OpLoad %629 
                                        bool %631 = OpFOrdGreaterThanEqual %628 %630 
                                                      OpStore %626 %631 
                                        bool %633 = OpLoad %626 
                                                      OpSelectionMerge %635 None 
                                                      OpBranchConditional %633 %634 %636 
                                             %634 = OpLabel 
                                                      OpStore %632 %234 
                                                      OpBranch %635 
                                             %636 = OpLabel 
                                                      OpStore %632 %258 
                                                      OpBranch %635 
                                             %635 = OpLabel 
                                         f32 %637 = OpLoad %632 
                                Private f32* %638 = OpAccessChain %32 %28 
                                                      OpStore %638 %637 
                                       f32_4 %640 = OpLoad %622 
                                       f32_2 %641 = OpVectorShuffle %640 %640 2 1 
                                       f32_2 %642 = OpFNegate %641 
                                       f32_4 %643 = OpLoad %622 
                                       f32_2 %644 = OpVectorShuffle %643 %643 1 2 
                                       f32_2 %645 = OpFAdd %642 %644 
                                                      OpStore %639 %645 
                                Private f32* %646 = OpAccessChain %106 %28 
                                                      OpStore %646 %234 
                                Private f32* %648 = OpAccessChain %106 %88 
                                                      OpStore %648 %647 
                                       f32_3 %649 = OpLoad %32 
                                       f32_2 %650 = OpVectorShuffle %649 %649 0 0 
                                       f32_2 %651 = OpLoad %639 
                                       f32_2 %652 = OpFMul %650 %651 
                                       f32_4 %653 = OpLoad %622 
                                       f32_2 %654 = OpVectorShuffle %653 %653 2 1 
                                       f32_2 %655 = OpFAdd %652 %654 
                                       f32_4 %656 = OpLoad %66 
                                       f32_4 %657 = OpVectorShuffle %656 %655 4 5 2 3 
                                                      OpStore %66 %657 
                                       f32_3 %658 = OpLoad %32 
                                       f32_2 %659 = OpVectorShuffle %658 %658 0 0 
                                       f32_4 %660 = OpLoad %106 
                                       f32_2 %661 = OpVectorShuffle %660 %660 0 1 
                                       f32_2 %662 = OpFMul %659 %661 
                                       f32_2 %665 = OpFAdd %662 %664 
                                       f32_4 %666 = OpLoad %66 
                                       f32_4 %667 = OpVectorShuffle %666 %665 0 1 4 5 
                                                      OpStore %66 %667 
                                Private f32* %668 = OpAccessChain %622 %28 
                                         f32 %669 = OpLoad %668 
                                Private f32* %670 = OpAccessChain %66 %28 
                                         f32 %671 = OpLoad %670 
                                        bool %672 = OpFOrdGreaterThanEqual %669 %671 
                                                      OpStore %626 %672 
                                        bool %674 = OpLoad %626 
                                                      OpSelectionMerge %676 None 
                                                      OpBranchConditional %674 %675 %677 
                                             %675 = OpLabel 
                                                      OpStore %673 %234 
                                                      OpBranch %676 
                                             %677 = OpLabel 
                                                      OpStore %673 %258 
                                                      OpBranch %676 
                                             %676 = OpLabel 
                                         f32 %678 = OpLoad %673 
                                Private f32* %679 = OpAccessChain %32 %28 
                                                      OpStore %679 %678 
                                       f32_4 %680 = OpLoad %66 
                                       f32_3 %681 = OpVectorShuffle %680 %680 0 1 3 
                                       f32_3 %682 = OpFNegate %681 
                                       f32_4 %683 = OpLoad %96 
                                       f32_4 %684 = OpVectorShuffle %683 %682 4 5 6 3 
                                                      OpStore %96 %684 
                                Private f32* %685 = OpAccessChain %622 %28 
                                         f32 %686 = OpLoad %685 
                                         f32 %687 = OpFNegate %686 
                                Private f32* %688 = OpAccessChain %96 %407 
                                                      OpStore %688 %687 
                                Private f32* %689 = OpAccessChain %622 %28 
                                         f32 %690 = OpLoad %689 
                                Private f32* %691 = OpAccessChain %96 %28 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFAdd %690 %692 
                                Private f32* %694 = OpAccessChain %106 %28 
                                                      OpStore %694 %693 
                                       f32_4 %695 = OpLoad %66 
                                       f32_3 %696 = OpVectorShuffle %695 %695 1 2 0 
                                       f32_4 %697 = OpLoad %96 
                                       f32_3 %698 = OpVectorShuffle %697 %697 1 2 3 
                                       f32_3 %699 = OpFAdd %696 %698 
                                       f32_4 %700 = OpLoad %106 
                                       f32_4 %701 = OpVectorShuffle %700 %699 0 4 5 6 
                                                      OpStore %106 %701 
                                       f32_3 %702 = OpLoad %32 
                                       f32_3 %703 = OpVectorShuffle %702 %702 0 0 0 
                                       f32_4 %704 = OpLoad %106 
                                       f32_3 %705 = OpVectorShuffle %704 %704 0 1 2 
                                       f32_3 %706 = OpFMul %703 %705 
                                       f32_4 %707 = OpLoad %66 
                                       f32_3 %708 = OpVectorShuffle %707 %707 0 1 3 
                                       f32_3 %709 = OpFAdd %706 %708 
                                       f32_4 %710 = OpLoad %106 
                                       f32_4 %711 = OpVectorShuffle %710 %709 4 5 6 3 
                                                      OpStore %106 %711 
                                Private f32* %712 = OpAccessChain %32 %28 
                                         f32 %713 = OpLoad %712 
                                Private f32* %714 = OpAccessChain %106 %407 
                                         f32 %715 = OpLoad %714 
                                         f32 %716 = OpFMul %713 %715 
                                Private f32* %717 = OpAccessChain %622 %28 
                                         f32 %718 = OpLoad %717 
                                         f32 %719 = OpFAdd %716 %718 
                                Private f32* %720 = OpAccessChain %32 %28 
                                                      OpStore %720 %719 
                                Private f32* %721 = OpAccessChain %106 %88 
                                         f32 %722 = OpLoad %721 
                                Private f32* %723 = OpAccessChain %32 %28 
                                         f32 %724 = OpLoad %723 
                                         f32 %725 = OpExtInst %1 37 %722 %724 
                                Private f32* %726 = OpAccessChain %287 %28 
                                                      OpStore %726 %725 
                                Private f32* %727 = OpAccessChain %287 %28 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFNegate %728 
                                Private f32* %730 = OpAccessChain %106 %28 
                                         f32 %731 = OpLoad %730 
                                         f32 %732 = OpFAdd %729 %731 
                                Private f32* %733 = OpAccessChain %287 %28 
                                                      OpStore %733 %732 
                                Private f32* %734 = OpAccessChain %106 %88 
                                         f32 %735 = OpLoad %734 
                                         f32 %736 = OpFNegate %735 
                                Private f32* %737 = OpAccessChain %32 %28 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpFAdd %736 %738 
                                Private f32* %740 = OpAccessChain %32 %28 
                                                      OpStore %740 %739 
                                Private f32* %741 = OpAccessChain %287 %28 
                                         f32 %742 = OpLoad %741 
                                         f32 %743 = OpFMul %742 %290 
                                         f32 %745 = OpFAdd %743 %744 
                                                      OpStore %244 %745 
                                Private f32* %746 = OpAccessChain %32 %28 
                                         f32 %747 = OpLoad %746 
                                         f32 %748 = OpLoad %244 
                                         f32 %749 = OpFDiv %747 %748 
                                Private f32* %750 = OpAccessChain %32 %28 
                                                      OpStore %750 %749 
                                Private f32* %751 = OpAccessChain %32 %28 
                                         f32 %752 = OpLoad %751 
                                Private f32* %753 = OpAccessChain %106 %245 
                                         f32 %754 = OpLoad %753 
                                         f32 %755 = OpFAdd %752 %754 
                                Private f32* %756 = OpAccessChain %32 %28 
                                                      OpStore %756 %755 
                                Private f32* %757 = OpAccessChain %106 %28 
                                         f32 %758 = OpLoad %757 
                                         f32 %759 = OpFAdd %758 %744 
                                                      OpStore %244 %759 
                                Private f32* %760 = OpAccessChain %287 %28 
                                         f32 %761 = OpLoad %760 
                                         f32 %762 = OpLoad %244 
                                         f32 %763 = OpFDiv %761 %762 
                                Private f32* %764 = OpAccessChain %287 %28 
                                                      OpStore %764 %763 
                                Uniform f32* %765 = OpAccessChain %40 %42 %88 
                                         f32 %766 = OpLoad %765 
                                Uniform f32* %767 = OpAccessChain %40 %42 %245 
                                         f32 %768 = OpLoad %767 
                                        bool %769 = OpFOrdGreaterThanEqual %766 %768 
                                                      OpStore %319 %769 
                                        bool %771 = OpLoad %319 
                                                      OpSelectionMerge %773 None 
                                                      OpBranchConditional %771 %772 %774 
                                             %772 = OpLabel 
                                                      OpStore %770 %234 
                                                      OpBranch %773 
                                             %774 = OpLabel 
                                                      OpStore %770 %258 
                                                      OpBranch %773 
                                             %773 = OpLabel 
                                         f32 %775 = OpLoad %770 
                                                      OpStore %244 %775 
                                Uniform f32* %777 = OpAccessChain %40 %42 %245 
                                         f32 %778 = OpLoad %777 
                                         f32 %779 = OpFNegate %778 
                                Uniform f32* %780 = OpAccessChain %40 %42 %88 
                                         f32 %781 = OpLoad %780 
                                         f32 %782 = OpFAdd %779 %781 
                                                      OpStore %776 %782 
                                         f32 %783 = OpLoad %244 
                                         f32 %784 = OpLoad %776 
                                         f32 %785 = OpFMul %783 %784 
                                Uniform f32* %786 = OpAccessChain %40 %42 %245 
                                         f32 %787 = OpLoad %786 
                                         f32 %788 = OpFAdd %785 %787 
                                                      OpStore %244 %788 
                                Uniform f32* %790 = OpAccessChain %40 %42 %28 
                                         f32 %791 = OpLoad %790 
                                         f32 %792 = OpLoad %244 
                                        bool %793 = OpFOrdGreaterThanEqual %791 %792 
                                                      OpStore %789 %793 
                                        bool %795 = OpLoad %789 
                                                      OpSelectionMerge %797 None 
                                                      OpBranchConditional %795 %796 %798 
                                             %796 = OpLabel 
                                                      OpStore %794 %234 
                                                      OpBranch %797 
                                             %798 = OpLabel 
                                                      OpStore %794 %258 
                                                      OpBranch %797 
                                             %797 = OpLabel 
                                         f32 %799 = OpLoad %794 
                                                      OpStore %776 %799 
                                         f32 %801 = OpLoad %244 
                                         f32 %802 = OpFNegate %801 
                                Uniform f32* %803 = OpAccessChain %40 %42 %28 
                                         f32 %804 = OpLoad %803 
                                         f32 %805 = OpFAdd %802 %804 
                                                      OpStore %800 %805 
                                         f32 %806 = OpLoad %776 
                                         f32 %807 = OpLoad %800 
                                         f32 %808 = OpFMul %806 %807 
                                         f32 %809 = OpLoad %244 
                                         f32 %810 = OpFAdd %808 %809 
                                                      OpStore %244 %810 
                                         f32 %811 = OpLoad %244 
                                Uniform f32* %813 = OpAccessChain %40 %812 
                                         f32 %814 = OpLoad %813 
                                         f32 %815 = OpFMul %811 %814 
                                                      OpStore %776 %815 
                                         f32 %816 = OpLoad %776 
                                Private f32* %817 = OpAccessChain %106 %28 
                                         f32 %818 = OpLoad %817 
                                         f32 %819 = OpExtInst %1 40 %816 %818 
                                Private f32* %820 = OpAccessChain %106 %28 
                                                      OpStore %820 %819 
                                         f32 %821 = OpLoad %244 
                                Uniform f32* %823 = OpAccessChain %40 %822 
                                         f32 %824 = OpLoad %823 
                                         f32 %825 = OpFMul %821 %824 
                                                      OpStore %244 %825 
                                         f32 %826 = OpLoad %244 
                                Private f32* %827 = OpAccessChain %106 %28 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpExtInst %1 37 %826 %828 
                                                      OpStore %244 %829 
                                       f32_3 %830 = OpLoad %32 
                                       f32_3 %831 = OpVectorShuffle %830 %830 0 0 0 
                                       f32_3 %832 = OpExtInst %1 4 %831 
                                       f32_3 %835 = OpFAdd %832 %834 
                                       f32_4 %836 = OpLoad %106 
                                       f32_4 %837 = OpVectorShuffle %836 %835 4 5 6 3 
                                                      OpStore %106 %837 
                                       f32_4 %838 = OpLoad %106 
                                       f32_3 %839 = OpVectorShuffle %838 %838 0 1 2 
                                       f32_3 %840 = OpExtInst %1 10 %839 
                                       f32_4 %841 = OpLoad %106 
                                       f32_4 %842 = OpVectorShuffle %841 %840 4 5 6 3 
                                                      OpStore %106 %842 
                                       f32_4 %843 = OpLoad %106 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 2 
                                       f32_3 %846 = OpFMul %844 %845 
                                       f32_3 %849 = OpFAdd %846 %848 
                                       f32_4 %850 = OpLoad %106 
                                       f32_4 %851 = OpVectorShuffle %850 %849 4 5 6 3 
                                                      OpStore %106 %851 
                                       f32_4 %852 = OpLoad %106 
                                       f32_3 %853 = OpVectorShuffle %852 %852 0 1 2 
                                       f32_3 %854 = OpExtInst %1 4 %853 
                                       f32_3 %856 = OpFAdd %854 %855 
                                       f32_4 %857 = OpLoad %106 
                                       f32_4 %858 = OpVectorShuffle %857 %856 4 5 6 3 
                                                      OpStore %106 %858 
                                       f32_4 %859 = OpLoad %106 
                                       f32_3 %860 = OpVectorShuffle %859 %859 0 1 2 
                                       f32_3 %861 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %862 = OpCompositeConstruct %234 %234 %234 
                                       f32_3 %863 = OpExtInst %1 43 %860 %861 %862 
                                       f32_4 %864 = OpLoad %106 
                                       f32_4 %865 = OpVectorShuffle %864 %863 4 5 6 3 
                                                      OpStore %106 %865 
                                       f32_4 %866 = OpLoad %106 
                                       f32_3 %867 = OpVectorShuffle %866 %866 0 1 2 
                                       f32_3 %868 = OpFAdd %867 %855 
                                       f32_4 %869 = OpLoad %106 
                                       f32_4 %870 = OpVectorShuffle %869 %868 4 5 6 3 
                                                      OpStore %106 %870 
                                       f32_2 %871 = OpLoad %287 
                                       f32_3 %872 = OpVectorShuffle %871 %871 0 0 0 
                                       f32_4 %873 = OpLoad %106 
                                       f32_3 %874 = OpVectorShuffle %873 %873 0 1 2 
                                       f32_3 %875 = OpFMul %872 %874 
                                       f32_3 %877 = OpFAdd %875 %876 
                                       f32_4 %878 = OpLoad %106 
                                       f32_4 %879 = OpVectorShuffle %878 %877 4 5 6 3 
                                                      OpStore %106 %879 
                                         f32 %880 = OpLoad %244 
                                       f32_3 %881 = OpCompositeConstruct %880 %880 %880 
                                       f32_4 %882 = OpLoad %106 
                                       f32_3 %883 = OpVectorShuffle %882 %882 0 1 2 
                                       f32_3 %884 = OpFMul %881 %883 
                                       f32_4 %885 = OpLoad %622 
                                       f32_3 %886 = OpVectorShuffle %885 %885 0 1 2 
                                       f32_3 %887 = OpFNegate %886 
                                       f32_3 %888 = OpFAdd %884 %887 
                                                      OpStore %32 %888 
                                       f32_3 %889 = OpLoad %22 
                                       f32_3 %890 = OpVectorShuffle %889 %889 0 0 0 
                                       f32_3 %891 = OpLoad %32 
                                       f32_3 %892 = OpFMul %890 %891 
                                       f32_4 %893 = OpLoad %622 
                                       f32_3 %894 = OpVectorShuffle %893 %893 0 1 2 
                                       f32_3 %895 = OpFAdd %892 %894 
                                                      OpStore %22 %895 
                                       f32_3 %896 = OpLoad %22 
                                       f32_3 %898 = OpExtInst %1 40 %896 %897 
                                                      OpStore %22 %898 
                                       f32_3 %901 = OpLoad %22 
                                       f32_4 %902 = OpLoad %900 
                                       f32_4 %903 = OpVectorShuffle %902 %901 4 5 6 3 
                                                      OpStore %900 %903 
                                Private f32* %904 = OpAccessChain %622 %407 
                                         f32 %905 = OpLoad %904 
                                 Output f32* %907 = OpAccessChain %900 %407 
                                                      OpStore %907 %905 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_COLOR0;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat18 = u_xlat1.y * _ProjectionParams.x;
    u_xlat3.w = u_xlat18 * 0.5;
    u_xlat3.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat3.zz + u_xlat3.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat18 = u_xlat2.y * u_xlat2.y;
    u_xlat18 = u_xlat2.x * u_xlat2.x + (-u_xlat18);
    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat1);
    u_xlat3.y = dot(unity_SHBg, u_xlat1);
    u_xlat3.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _ValueMinimum;
uniform 	float _ValueMaximum;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = (-u_xlat10_0.xyz) + _CausticColor.xyz;
    u_xlat0.xyz = _CausticColor.www * u_xlat7.xyz + u_xlat10_0.xyz;
    u_xlat7.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat2 = u_xlat7.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat7.x = vs_TEXCOORD2.y + vs_TEXCOORD2.x;
    u_xlat3.x = u_xlat7.y * _TimeScale + u_xlat7.x;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat4.x * 0.111111112;
    u_xlat4.y = u_xlat3.x * 0.166666672;
    u_xlat3.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat15.xy = u_xlat2.zw * vec2(0.5, 0.125);
    u_xlat2.xy = u_xlat2.xy * vec2(1.25, 0.899999976) + u_xlat7.xx;
    u_xlat7.x = cos(u_xlat2.x);
    u_xlat4.x = u_xlat7.x * 0.111111112;
    u_xlat7.x = sin(u_xlat2.y);
    u_xlat4.y = u_xlat7.x * 0.166666672;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003) + u_xlat15.xy;
    u_xlat10_3 = texture(_CausticTex, u_xlat3.xy);
    u_xlat2.xy = u_xlat2.xy * vec2(0.142857149, 0.142857149);
    u_xlat2.xy = u_xlat2.ww * vec2(0.25, 0.166666672) + u_xlat2.xy;
    u_xlat10_2 = texture(_CausticTex, u_xlat2.xy);
    u_xlat7.x = _EmissiveBoost + 1.0;
    u_xlat20 = vs_TEXCOORD3.y * 500.0;
    u_xlat19 = u_xlat7.z * 5.0 + u_xlat20;
    u_xlat19 = sin(u_xlat19);
    u_xlat4.x = u_xlat19 * 0.00150000001;
    u_xlat4.y = 0.0;
    u_xlat4.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.0, 0.075000003);
    u_xlat10_4 = texture(_ReflMapFromPixelator, u_xlat4.xy);
    u_xlat5.xyz = vs_TEXCOORD2.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat13.x = vs_TEXCOORD2.x * 6.0 + u_xlat7.y;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat19 = cos(u_xlat5.x);
    u_xlat13.x = u_xlat19 * u_xlat13.x;
    u_xlat13.x = u_xlat13.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb19 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xy = floor(u_xlat5.yz);
    u_xlat5.xy = u_xlat5.xy * vec2(0.0625, 0.0625);
    u_xlat20 = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat20 = fract(u_xlat20);
    u_xlat20 = u_xlat20 * 0.5 + 0.5;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(u_xlat20) : u_xlat10_3.xyz;
    u_xlat13.xy = u_xlat13.xx + vec2(-0.0625, -0.25);
    u_xlatb13 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlatb13 = u_xlat13.y<vs_COLOR0.x;
    u_xlat13.x = (u_xlatb13) ? 1.0 : u_xlat10_1.x;
    u_xlat5.w = u_xlat10_0.w * u_xlat13.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LightCausticPower);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat13.xxx + u_xlat0.xyz;
    u_xlat7.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_4.xyz;
    u_xlat18 = u_xlat10_4.w * _ReflPower;
    u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
    u_xlat7.xyz = (-u_xlat0.xyz) + u_xlat7.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat7.xyz = (bool(u_xlatb18)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat7.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25 + 0.75;
        u_xlat7.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat18, u_xlat7.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat18 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat5 + u_xlat2;
    u_xlatb7 = u_xlat0.y>=u_xlat0.z;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.zy;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat7.xxxx * u_xlat3 + u_xlat2;
    u_xlatb7 = u_xlat0.x>=u_xlat2.x;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat2.xyw;
    u_xlat3.w = u_xlat0.x;
    u_xlat2.xyw = u_xlat3.wyx;
    u_xlat2 = (-u_xlat3) + u_xlat2;
    u_xlat2 = u_xlat7.xxxx * u_xlat2 + u_xlat3;
    u_xlat7.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat13.x = (-u_xlat2.y) + u_xlat2.w;
    u_xlat19 = u_xlat7.x * 6.0 + 1.00000001e-010;
    u_xlat13.x = u_xlat13.x / u_xlat19;
    u_xlat13.x = u_xlat13.x + u_xlat2.z;
    u_xlat19 = u_xlat2.x + 1.00000001e-010;
    u_xlat7.x = u_xlat7.x / u_xlat19;
    u_xlatb19 = _CausticColor.y>=_CausticColor.z;
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat8 = (-_CausticColor.z) + _CausticColor.y;
    u_xlat19 = u_xlat19 * u_xlat8 + _CausticColor.z;
    u_xlatb8 = _CausticColor.x>=u_xlat19;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat14 = (-u_xlat19) + _CausticColor.x;
    u_xlat19 = u_xlat8 * u_xlat14 + u_xlat19;
    u_xlat8 = u_xlat19 * _ValueMinimum;
    u_xlat2.x = max(u_xlat8, u_xlat2.x);
    u_xlat19 = u_xlat19 * _ValueMaximum;
    u_xlat19 = min(u_xlat19, u_xlat2.x);
    u_xlat2.xyz = abs(u_xlat13.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat7.xyz = vec3(u_xlat19) * u_xlat2.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat10_1.xxx * u_xlat7.xyz + u_xlat0.xyz;
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 437
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %97 %103 %104 %117 %156 %159 %180 %192 %193 %427 %430 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 RelaxedPrecision 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 RelaxedPrecision 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 RelaxedPrecision 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 RelaxedPrecision 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpMemberDecorate %21 9 RelaxedPrecision 
                                                      OpMemberDecorate %21 9 Offset 21 
                                                      OpMemberDecorate %21 10 RelaxedPrecision 
                                                      OpMemberDecorate %21 10 Offset 21 
                                                      OpMemberDecorate %21 11 RelaxedPrecision 
                                                      OpMemberDecorate %21 11 Offset 21 
                                                      OpMemberDecorate %21 12 RelaxedPrecision 
                                                      OpMemberDecorate %21 12 Offset 21 
                                                      OpMemberDecorate %21 13 Offset 21 
                                                      OpMemberDecorate %21 14 Offset 21 
                                                      OpMemberDecorate %21 15 Offset 21 
                                                      OpMemberDecorate %21 16 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %95 0 BuiltIn 95 
                                                      OpMemberDecorate %95 1 BuiltIn 95 
                                                      OpMemberDecorate %95 2 BuiltIn 95 
                                                      OpDecorate %95 Block 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %104 Location 104 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %156 Location 156 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %180 Location 180 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %427 Location 427 
                                                      OpDecorate %430 Location 430 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 8 
                                              %16 = OpTypeArray %7 %15 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeStruct %7 %7 %7 %7 %7 %16 %7 %7 %7 %7 %7 %7 %7 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 13 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                                              %53 = OpTypeVector %6 3 
                               Private f32_4* %65 = OpVariable Private 
                                          i32 %68 = OpConstant 15 
                                          u32 %93 = OpConstant 1 
                                              %94 = OpTypeArray %6 %93 
                                              %95 = OpTypeStruct %7 %6 %94 
                                              %96 = OpTypePointer Output %95 
         Output struct {f32_4; f32; f32[1];}* %97 = OpVariable Output 
                                              %99 = OpTypePointer Output %7 
                                             %101 = OpTypeVector %6 2 
                                             %102 = OpTypePointer Output %101 
                               Output f32_2* %103 = OpVariable Output 
                                Input f32_4* %104 = OpVariable Input 
                                         i32 %107 = OpConstant 16 
                                             %116 = OpTypePointer Input %53 
                                Input f32_3* %117 = OpVariable Input 
                                         i32 %119 = OpConstant 14 
                                         u32 %124 = OpConstant 0 
                                             %125 = OpTypePointer Private %6 
                                         u32 %138 = OpConstant 2 
                                Private f32* %140 = OpVariable Private 
                                             %155 = OpTypePointer Output %53 
                               Output f32_3* %156 = OpVariable Output 
                               Output f32_3* %159 = OpVariable Output 
                                             %164 = OpTypePointer Uniform %6 
                              Private f32_4* %168 = OpVariable Private 
                                         f32 %170 = OpConstant 3.67402E-40 
                                         u32 %172 = OpConstant 3 
                                       f32_2 %176 = OpConstantComposite %170 %170 
                               Output f32_4* %180 = OpVariable Output 
                               Output f32_4* %192 = OpVariable Output 
                                Input f32_4* %193 = OpVariable Input 
                                             %195 = OpTypePointer Private %53 
                              Private f32_3* %196 = OpVariable Private 
                              Private f32_4* %213 = OpVariable Private 
                              Private f32_3* %219 = OpVariable Private 
                                         i32 %220 = OpConstant 9 
                                         i32 %226 = OpConstant 10 
                                         i32 %232 = OpConstant 11 
                                         i32 %238 = OpConstant 12 
                                         f32 %247 = OpConstant 3.67402E-40 
                                         i32 %249 = OpConstant 6 
                                         i32 %255 = OpConstant 7 
                                         i32 %261 = OpConstant 8 
                                         f32 %271 = OpConstant 3.67402E-40 
                                       f32_3 %272 = OpConstantComposite %271 %271 %271 
                                         f32 %280 = OpConstant 3.67402E-40 
                                       f32_3 %281 = OpConstantComposite %280 %280 %280 
                                         f32 %292 = OpConstant 3.67402E-40 
                                       f32_3 %293 = OpConstantComposite %292 %292 %292 
                                         f32 %295 = OpConstant 3.67402E-40 
                                       f32_3 %296 = OpConstantComposite %295 %295 %295 
                              Private f32_4* %311 = OpVariable Private 
                              Private f32_4* %319 = OpVariable Private 
                                         f32 %355 = OpConstant 3.67402E-40 
                                       f32_4 %356 = OpConstantComposite %355 %355 %355 %355 
                                         i32 %361 = OpConstant 4 
                                       f32_4 %365 = OpConstantComposite %247 %247 %247 %247 
                                       f32_4 %373 = OpConstantComposite %271 %271 %271 %271 
                                         i32 %380 = OpConstant 5 
                               Output f32_3* %427 = OpVariable Output 
                               Output f32_4* %430 = OpVariable Output 
                                             %431 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %23 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %32 = OpAccessChain %23 %25 %31 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpLoad %11 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %40 = OpAccessChain %23 %25 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpLoad %11 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %41 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                                        f32_4 %48 = OpLoad %9 
                               Uniform f32_4* %50 = OpAccessChain %23 %25 %49 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpFAdd %48 %51 
                                                      OpStore %47 %52 
                               Uniform f32_4* %54 = OpAccessChain %23 %25 %49 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_4 %57 = OpLoad %11 
                                        f32_3 %58 = OpVectorShuffle %57 %57 3 3 3 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFAdd %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                      OpStore %9 %64 
                                        f32_4 %66 = OpLoad %47 
                                        f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %23 %68 %26 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %67 %70 
                                                      OpStore %65 %71 
                               Uniform f32_4* %72 = OpAccessChain %23 %68 %31 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %47 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %65 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %65 %78 
                               Uniform f32_4* %79 = OpAccessChain %23 %68 %39 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %47 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %65 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %65 %85 
                               Uniform f32_4* %86 = OpAccessChain %23 %68 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %65 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %47 %92 
                                        f32_4 %98 = OpLoad %47 
                               Output f32_4* %100 = OpAccessChain %97 %31 
                                                      OpStore %100 %98 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                              Uniform f32_4* %108 = OpAccessChain %23 %107 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                       f32_2 %111 = OpFMul %106 %110 
                              Uniform f32_4* %112 = OpAccessChain %23 %107 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 2 3 
                                       f32_2 %115 = OpFAdd %111 %114 
                                                      OpStore %103 %115 
                                       f32_3 %118 = OpLoad %117 
                              Uniform f32_4* %120 = OpAccessChain %23 %119 %31 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %118 %122 
                                Private f32* %126 = OpAccessChain %65 %124 
                                                      OpStore %126 %123 
                                       f32_3 %127 = OpLoad %117 
                              Uniform f32_4* %128 = OpAccessChain %23 %119 %26 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %132 = OpAccessChain %65 %93 
                                                      OpStore %132 %131 
                                       f32_3 %133 = OpLoad %117 
                              Uniform f32_4* %134 = OpAccessChain %23 %119 %39 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %133 %136 
                                Private f32* %139 = OpAccessChain %65 %138 
                                                      OpStore %139 %137 
                                       f32_4 %141 = OpLoad %65 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_4 %143 = OpLoad %65 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                         f32 %145 = OpDot %142 %144 
                                                      OpStore %140 %145 
                                         f32 %146 = OpLoad %140 
                                         f32 %147 = OpExtInst %1 32 %146 
                                                      OpStore %140 %147 
                                         f32 %148 = OpLoad %140 
                                       f32_3 %149 = OpCompositeConstruct %148 %148 %148 
                                       f32_4 %150 = OpLoad %65 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %65 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %65 %154 
                                       f32_4 %157 = OpLoad %65 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                                      OpStore %156 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                                      OpStore %159 %161 
                                Private f32* %162 = OpAccessChain %47 %93 
                                         f32 %163 = OpLoad %162 
                                Uniform f32* %165 = OpAccessChain %23 %31 %124 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %163 %166 
                                                      OpStore %140 %167 
                                         f32 %169 = OpLoad %140 
                                         f32 %171 = OpFMul %169 %170 
                                Private f32* %173 = OpAccessChain %168 %172 
                                                      OpStore %173 %171 
                                       f32_4 %174 = OpLoad %47 
                                       f32_2 %175 = OpVectorShuffle %174 %174 0 3 
                                       f32_2 %177 = OpFMul %175 %176 
                                       f32_4 %178 = OpLoad %168 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 1 5 3 
                                                      OpStore %168 %179 
                                       f32_4 %181 = OpLoad %47 
                                       f32_2 %182 = OpVectorShuffle %181 %181 2 3 
                                       f32_4 %183 = OpLoad %180 
                                       f32_4 %184 = OpVectorShuffle %183 %182 0 1 4 5 
                                                      OpStore %180 %184 
                                       f32_4 %185 = OpLoad %168 
                                       f32_2 %186 = OpVectorShuffle %185 %185 2 2 
                                       f32_4 %187 = OpLoad %168 
                                       f32_2 %188 = OpVectorShuffle %187 %187 0 3 
                                       f32_2 %189 = OpFAdd %186 %188 
                                       f32_4 %190 = OpLoad %180 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 2 3 
                                                      OpStore %180 %191 
                                       f32_4 %194 = OpLoad %193 
                                                      OpStore %192 %194 
                                Private f32* %197 = OpAccessChain %65 %93 
                                         f32 %198 = OpLoad %197 
                                Private f32* %199 = OpAccessChain %65 %93 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %198 %200 
                                Private f32* %202 = OpAccessChain %196 %124 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %65 %124 
                                         f32 %204 = OpLoad %203 
                                Private f32* %205 = OpAccessChain %65 %124 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFMul %204 %206 
                                Private f32* %208 = OpAccessChain %196 %124 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFNegate %209 
                                         f32 %211 = OpFAdd %207 %210 
                                Private f32* %212 = OpAccessChain %196 %124 
                                                      OpStore %212 %211 
                                       f32_4 %214 = OpLoad %65 
                                       f32_4 %215 = OpVectorShuffle %214 %214 1 2 2 0 
                                       f32_4 %216 = OpLoad %65 
                                       f32_4 %217 = OpVectorShuffle %216 %216 0 1 2 2 
                                       f32_4 %218 = OpFMul %215 %217 
                                                      OpStore %213 %218 
                              Uniform f32_4* %221 = OpAccessChain %23 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %213 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %219 %124 
                                                      OpStore %225 %224 
                              Uniform f32_4* %227 = OpAccessChain %23 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %213 
                                         f32 %230 = OpDot %228 %229 
                                Private f32* %231 = OpAccessChain %219 %93 
                                                      OpStore %231 %230 
                              Uniform f32_4* %233 = OpAccessChain %23 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_4 %235 = OpLoad %213 
                                         f32 %236 = OpDot %234 %235 
                                Private f32* %237 = OpAccessChain %219 %138 
                                                      OpStore %237 %236 
                              Uniform f32_4* %239 = OpAccessChain %23 %238 
                                       f32_4 %240 = OpLoad %239 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                       f32_3 %242 = OpLoad %196 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 0 0 
                                       f32_3 %244 = OpFMul %241 %243 
                                       f32_3 %245 = OpLoad %219 
                                       f32_3 %246 = OpFAdd %244 %245 
                                                      OpStore %196 %246 
                                Private f32* %248 = OpAccessChain %65 %172 
                                                      OpStore %248 %247 
                              Uniform f32_4* %250 = OpAccessChain %23 %249 
                                       f32_4 %251 = OpLoad %250 
                                       f32_4 %252 = OpLoad %65 
                                         f32 %253 = OpDot %251 %252 
                                Private f32* %254 = OpAccessChain %219 %124 
                                                      OpStore %254 %253 
                              Uniform f32_4* %256 = OpAccessChain %23 %255 
                                       f32_4 %257 = OpLoad %256 
                                       f32_4 %258 = OpLoad %65 
                                         f32 %259 = OpDot %257 %258 
                                Private f32* %260 = OpAccessChain %219 %93 
                                                      OpStore %260 %259 
                              Uniform f32_4* %262 = OpAccessChain %23 %261 
                                       f32_4 %263 = OpLoad %262 
                                       f32_4 %264 = OpLoad %65 
                                         f32 %265 = OpDot %263 %264 
                                Private f32* %266 = OpAccessChain %219 %138 
                                                      OpStore %266 %265 
                                       f32_3 %267 = OpLoad %196 
                                       f32_3 %268 = OpLoad %219 
                                       f32_3 %269 = OpFAdd %267 %268 
                                                      OpStore %196 %269 
                                       f32_3 %270 = OpLoad %196 
                                       f32_3 %273 = OpExtInst %1 40 %270 %272 
                                                      OpStore %196 %273 
                                       f32_3 %274 = OpLoad %196 
                                       f32_3 %275 = OpExtInst %1 30 %274 
                                       f32_4 %276 = OpLoad %168 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %168 %277 
                                       f32_4 %278 = OpLoad %168 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %282 = OpFMul %279 %281 
                                       f32_4 %283 = OpLoad %168 
                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
                                                      OpStore %168 %284 
                                       f32_4 %285 = OpLoad %168 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpExtInst %1 29 %286 
                                       f32_4 %288 = OpLoad %168 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %168 %289 
                                       f32_4 %290 = OpLoad %168 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                                       f32_3 %294 = OpFMul %291 %293 
                                       f32_3 %297 = OpFAdd %294 %296 
                                       f32_4 %298 = OpLoad %168 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
                                                      OpStore %168 %299 
                                       f32_4 %300 = OpLoad %168 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %302 = OpExtInst %1 40 %301 %272 
                                       f32_4 %303 = OpLoad %168 
                                       f32_4 %304 = OpVectorShuffle %303 %302 4 5 6 3 
                                                      OpStore %168 %304 
                                       f32_4 %305 = OpLoad %9 
                                       f32_4 %306 = OpVectorShuffle %305 %305 1 1 1 1 
                                       f32_4 %307 = OpFNegate %306 
                              Uniform f32_4* %308 = OpAccessChain %23 %39 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpFAdd %307 %309 
                                                      OpStore %47 %310 
                                       f32_4 %312 = OpLoad %65 
                                       f32_4 %313 = OpVectorShuffle %312 %312 1 1 1 1 
                                       f32_4 %314 = OpLoad %47 
                                       f32_4 %315 = OpFMul %313 %314 
                                                      OpStore %311 %315 
                                       f32_4 %316 = OpLoad %47 
                                       f32_4 %317 = OpLoad %47 
                                       f32_4 %318 = OpFMul %316 %317 
                                                      OpStore %47 %318 
                                       f32_4 %320 = OpLoad %9 
                                       f32_4 %321 = OpVectorShuffle %320 %320 0 0 0 0 
                                       f32_4 %322 = OpFNegate %321 
                              Uniform f32_4* %323 = OpAccessChain %23 %26 
                                       f32_4 %324 = OpLoad %323 
                                       f32_4 %325 = OpFAdd %322 %324 
                                                      OpStore %319 %325 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpVectorShuffle %326 %326 2 2 2 2 
                                       f32_4 %328 = OpFNegate %327 
                              Uniform f32_4* %329 = OpAccessChain %23 %49 
                                       f32_4 %330 = OpLoad %329 
                                       f32_4 %331 = OpFAdd %328 %330 
                                                      OpStore %9 %331 
                                       f32_4 %332 = OpLoad %319 
                                       f32_4 %333 = OpLoad %65 
                                       f32_4 %334 = OpVectorShuffle %333 %333 0 0 0 0 
                                       f32_4 %335 = OpFMul %332 %334 
                                       f32_4 %336 = OpLoad %311 
                                       f32_4 %337 = OpFAdd %335 %336 
                                                      OpStore %311 %337 
                                       f32_4 %338 = OpLoad %9 
                                       f32_4 %339 = OpLoad %65 
                                       f32_4 %340 = OpVectorShuffle %339 %339 2 2 2 2 
                                       f32_4 %341 = OpFMul %338 %340 
                                       f32_4 %342 = OpLoad %311 
                                       f32_4 %343 = OpFAdd %341 %342 
                                                      OpStore %65 %343 
                                       f32_4 %344 = OpLoad %319 
                                       f32_4 %345 = OpLoad %319 
                                       f32_4 %346 = OpFMul %344 %345 
                                       f32_4 %347 = OpLoad %47 
                                       f32_4 %348 = OpFAdd %346 %347 
                                                      OpStore %47 %348 
                                       f32_4 %349 = OpLoad %9 
                                       f32_4 %350 = OpLoad %9 
                                       f32_4 %351 = OpFMul %349 %350 
                                       f32_4 %352 = OpLoad %47 
                                       f32_4 %353 = OpFAdd %351 %352 
                                                      OpStore %9 %353 
                                       f32_4 %354 = OpLoad %9 
                                       f32_4 %357 = OpExtInst %1 40 %354 %356 
                                                      OpStore %9 %357 
                                       f32_4 %358 = OpLoad %9 
                                       f32_4 %359 = OpExtInst %1 32 %358 
                                                      OpStore %47 %359 
                                       f32_4 %360 = OpLoad %9 
                              Uniform f32_4* %362 = OpAccessChain %23 %361 
                                       f32_4 %363 = OpLoad %362 
                                       f32_4 %364 = OpFMul %360 %363 
                                       f32_4 %366 = OpFAdd %364 %365 
                                                      OpStore %9 %366 
                                       f32_4 %367 = OpLoad %9 
                                       f32_4 %368 = OpFDiv %365 %367 
                                                      OpStore %9 %368 
                                       f32_4 %369 = OpLoad %47 
                                       f32_4 %370 = OpLoad %65 
                                       f32_4 %371 = OpFMul %369 %370 
                                                      OpStore %47 %371 
                                       f32_4 %372 = OpLoad %47 
                                       f32_4 %374 = OpExtInst %1 40 %372 %373 
                                                      OpStore %47 %374 
                                       f32_4 %375 = OpLoad %9 
                                       f32_4 %376 = OpLoad %47 
                                       f32_4 %377 = OpFMul %375 %376 
                                                      OpStore %9 %377 
                                       f32_4 %378 = OpLoad %9 
                                       f32_3 %379 = OpVectorShuffle %378 %378 1 1 1 
                              Uniform f32_4* %381 = OpAccessChain %23 %380 %26 
                                       f32_4 %382 = OpLoad %381 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                       f32_3 %384 = OpFMul %379 %383 
                                       f32_4 %385 = OpLoad %65 
                                       f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
                                                      OpStore %65 %386 
                              Uniform f32_4* %387 = OpAccessChain %23 %380 %31 
                                       f32_4 %388 = OpLoad %387 
                                       f32_3 %389 = OpVectorShuffle %388 %388 0 1 2 
                                       f32_4 %390 = OpLoad %9 
                                       f32_3 %391 = OpVectorShuffle %390 %390 0 0 0 
                                       f32_3 %392 = OpFMul %389 %391 
                                       f32_4 %393 = OpLoad %65 
                                       f32_3 %394 = OpVectorShuffle %393 %393 0 1 2 
                                       f32_3 %395 = OpFAdd %392 %394 
                                       f32_4 %396 = OpLoad %65 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 5 6 3 
                                                      OpStore %65 %397 
                              Uniform f32_4* %398 = OpAccessChain %23 %380 %39 
                                       f32_4 %399 = OpLoad %398 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                       f32_4 %401 = OpLoad %9 
                                       f32_3 %402 = OpVectorShuffle %401 %401 2 2 2 
                                       f32_3 %403 = OpFMul %400 %402 
                                       f32_4 %404 = OpLoad %65 
                                       f32_3 %405 = OpVectorShuffle %404 %404 0 1 2 
                                       f32_3 %406 = OpFAdd %403 %405 
                                       f32_4 %407 = OpLoad %9 
                                       f32_4 %408 = OpVectorShuffle %407 %406 4 5 6 3 
                                                      OpStore %9 %408 
                              Uniform f32_4* %409 = OpAccessChain %23 %380 %49 
                                       f32_4 %410 = OpLoad %409 
                                       f32_3 %411 = OpVectorShuffle %410 %410 0 1 2 
                                       f32_4 %412 = OpLoad %9 
                                       f32_3 %413 = OpVectorShuffle %412 %412 3 3 3 
                                       f32_3 %414 = OpFMul %411 %413 
                                       f32_4 %415 = OpLoad %9 
                                       f32_3 %416 = OpVectorShuffle %415 %415 0 1 2 
                                       f32_3 %417 = OpFAdd %414 %416 
                                       f32_4 %418 = OpLoad %9 
                                       f32_4 %419 = OpVectorShuffle %418 %417 4 5 6 3 
                                                      OpStore %9 %419 
                                       f32_4 %420 = OpLoad %9 
                                       f32_3 %421 = OpVectorShuffle %420 %420 0 1 2 
                                       f32_4 %422 = OpLoad %168 
                                       f32_3 %423 = OpVectorShuffle %422 %422 0 1 2 
                                       f32_3 %424 = OpFAdd %421 %423 
                                       f32_4 %425 = OpLoad %9 
                                       f32_4 %426 = OpVectorShuffle %425 %424 4 5 6 3 
                                                      OpStore %9 %426 
                                       f32_4 %428 = OpLoad %9 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                                                      OpStore %427 %429 
                                                      OpStore %430 %373 
                                 Output f32* %432 = OpAccessChain %97 %31 %93 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                 Output f32* %435 = OpAccessChain %97 %31 %93 
                                                      OpStore %435 %434 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 909
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %87 %239 %320 %603 %900 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpMemberDecorate %38 0 Offset 38 
                                                      OpMemberDecorate %38 1 RelaxedPrecision 
                                                      OpMemberDecorate %38 1 Offset 38 
                                                      OpMemberDecorate %38 2 Offset 38 
                                                      OpMemberDecorate %38 3 Offset 38 
                                                      OpMemberDecorate %38 4 Offset 38 
                                                      OpMemberDecorate %38 5 Offset 38 
                                                      OpMemberDecorate %38 6 RelaxedPrecision 
                                                      OpMemberDecorate %38 6 Offset 38 
                                                      OpMemberDecorate %38 7 Offset 38 
                                                      OpMemberDecorate %38 8 Offset 38 
                                                      OpMemberDecorate %38 9 Offset 38 
                                                      OpMemberDecorate %38 10 Offset 38 
                                                      OpMemberDecorate %38 11 Offset 38 
                                                      OpMemberDecorate %38 12 Offset 38 
                                                      OpMemberDecorate %38 13 Offset 38 
                                                      OpMemberDecorate %38 14 Offset 38 
                                                      OpMemberDecorate %38 15 Offset 38 
                                                      OpMemberDecorate %38 16 Offset 38 
                                                      OpMemberDecorate %38 17 Offset 38 
                                                      OpMemberDecorate %38 18 Offset 38 
                                                      OpMemberDecorate %38 19 Offset 38 
                                                      OpMemberDecorate %38 20 Offset 38 
                                                      OpDecorate %38 Block 
                                                      OpDecorate %40 DescriptorSet 40 
                                                      OpDecorate %40 Binding 40 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %87 Location 87 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %275 DescriptorSet 275 
                                                      OpDecorate %275 Binding 275 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %320 Location 320 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %406 RelaxedPrecision 
                                                      OpDecorate %409 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %413 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %418 RelaxedPrecision 
                                                      OpDecorate %419 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %429 RelaxedPrecision 
                                                      OpDecorate %430 RelaxedPrecision 
                                                      OpDecorate %431 RelaxedPrecision 
                                                      OpDecorate %432 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %488 RelaxedPrecision 
                                                      OpDecorate %507 SpecId 507 
                                                      OpDecorate %581 DescriptorSet 581 
                                                      OpDecorate %581 Binding 581 
                                                      OpDecorate %586 RelaxedPrecision 
                                                      OpDecorate %593 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %596 RelaxedPrecision 
                                                      OpDecorate %599 RelaxedPrecision 
                                                      OpDecorate %600 RelaxedPrecision 
                                                      OpDecorate %603 RelaxedPrecision 
                                                      OpDecorate %603 Location 603 
                                                      OpDecorate %604 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %615 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %617 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %622 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                                      OpDecorate %624 RelaxedPrecision 
                                                      OpDecorate %625 RelaxedPrecision 
                                                      OpDecorate %628 RelaxedPrecision 
                                                      OpDecorate %630 RelaxedPrecision 
                                                      OpDecorate %639 RelaxedPrecision 
                                                      OpDecorate %640 RelaxedPrecision 
                                                      OpDecorate %641 RelaxedPrecision 
                                                      OpDecorate %642 RelaxedPrecision 
                                                      OpDecorate %643 RelaxedPrecision 
                                                      OpDecorate %644 RelaxedPrecision 
                                                      OpDecorate %645 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate %653 RelaxedPrecision 
                                                      OpDecorate %654 RelaxedPrecision 
                                                      OpDecorate %669 RelaxedPrecision 
                                                      OpDecorate %686 RelaxedPrecision 
                                                      OpDecorate %687 RelaxedPrecision 
                                                      OpDecorate %690 RelaxedPrecision 
                                                      OpDecorate %718 RelaxedPrecision 
                                                      OpDecorate %885 RelaxedPrecision 
                                                      OpDecorate %886 RelaxedPrecision 
                                                      OpDecorate %887 RelaxedPrecision 
                                                      OpDecorate %893 RelaxedPrecision 
                                                      OpDecorate %894 RelaxedPrecision 
                                                      OpDecorate %900 RelaxedPrecision 
                                                      OpDecorate %900 Location 900 
                                                      OpDecorate %905 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Private %20 
                               Private f32_3* %22 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %23 = OpVariable UniformConstant 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                               Private f32_3* %32 = OpVariable Private 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %7 %36 
                                              %38 = OpTypeStruct %7 %7 %7 %37 %20 %20 %7 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
                                              %41 = OpTypeInt 32 1 
                                          i32 %42 = OpConstant 8 
                                              %43 = OpTypePointer Uniform %7 
                               Private f32_3* %48 = OpVariable Private 
                                          i32 %57 = OpConstant 0 
                                          i32 %61 = OpConstant 20 
                               Private f32_4* %66 = OpVariable Private 
                                          i32 %69 = OpConstant 10 
                                              %70 = OpTypePointer Uniform %6 
                                              %86 = OpTypePointer Input %20 
                                 Input f32_3* %87 = OpVariable Input 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypePointer Input %6 
                               Private f32_4* %96 = OpVariable Private 
                              Private f32_4* %106 = OpVariable Private 
                                         f32 %117 = OpConstant 3.67402E-40 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         i32 %134 = OpConstant 7 
                                             %141 = OpTypePointer Private %15 
                              Private f32_2* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                       f32_2 %147 = OpConstantComposite %145 %146 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_2 %153 = OpConstantComposite %151 %152 
                                         f32 %193 = OpConstant 3.67402E-40 
                                       f32_2 %194 = OpConstantComposite %193 %193 
 UniformConstant read_only Texture2DSampled* %200 = OpVariable UniformConstant 
                                         f32 %210 = OpConstant 3.67402E-40 
                                       f32_2 %211 = OpConstantComposite %210 %210 
                                         f32 %217 = OpConstant 3.67402E-40 
                                       f32_2 %218 = OpConstantComposite %217 %122 
                              Private f32_3* %225 = OpVariable Private 
                                         i32 %231 = OpConstant 15 
                                         f32 %234 = OpConstant 3.67402E-40 
                                Private f32* %237 = OpVariable Private 
                                             %238 = OpTypePointer Input %7 
                                Input f32_4* %239 = OpVariable Input 
                                         f32 %242 = OpConstant 3.67402E-40 
                                Private f32* %244 = OpVariable Private 
                                         u32 %245 = OpConstant 2 
                                         f32 %248 = OpConstant 3.67402E-40 
                                         f32 %255 = OpConstant 3.67402E-40 
                                         f32 %258 = OpConstant 3.67402E-40 
                                         f32 %269 = OpConstant 3.67402E-40 
                                       f32_2 %270 = OpConstantComposite %258 %269 
                              Private f32_4* %274 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %275 = OpVariable UniformConstant 
                              Private f32_3* %280 = OpVariable Private 
                                         f32 %283 = OpConstant 3.67402E-40 
                                         f32 %284 = OpConstant 3.67402E-40 
                                       f32_3 %285 = OpConstantComposite %283 %284 %284 
                              Private f32_2* %287 = OpVariable Private 
                                         f32 %290 = OpConstant 3.67402E-40 
                                         f32 %310 = OpConstant 3.67402E-40 
                                         i32 %312 = OpConstant 19 
                                             %317 = OpTypeBool 
                                             %318 = OpTypePointer Private %317 
                               Private bool* %319 = OpVariable Private 
                                Input f32_4* %320 = OpVariable Input 
                                       f32_2 %333 = OpConstantComposite %310 %310 
                                         f32 %339 = OpConstant 3.67402E-40 
                                         f32 %340 = OpConstant 3.67402E-40 
                                       f32_2 %341 = OpConstantComposite %339 %340 
                                         f32 %346 = OpConstant 3.67402E-40 
                              Private f32_3* %355 = OpVariable Private 
                                             %356 = OpTypePointer Function %20 
                                         f32 %369 = OpConstant 3.67402E-40 
                                         f32 %370 = OpConstant 3.67402E-40 
                                       f32_2 %371 = OpConstantComposite %369 %370 
                               Private bool* %373 = OpVariable Private 
                              Private f32_3* %379 = OpVariable Private 
                                Private f32* %396 = OpVariable Private 
                                             %397 = OpTypePointer Function %6 
                              Private f32_4* %406 = OpVariable Private 
                                         u32 %407 = OpConstant 3 
                                         i32 %414 = OpConstant 13 
                                         i32 %420 = OpConstant 14 
                                         i32 %437 = OpConstant 12 
                                         i32 %445 = OpConstant 11 
                                         f32 %468 = OpConstant 3.67402E-40 
                                       f32_3 %469 = OpConstantComposite %468 %468 %468 
                                Private f32* %474 = OpVariable Private 
                                         i32 %477 = OpConstant 9 
                                         i32 %482 = OpConstant 18 
                               Private bool* %496 = OpVariable Private 
                                         i32 %497 = OpConstant 2 
                                        bool %501 = OpConstantFalse 
                                        bool %507 = OpSpecConstantFalse 
                                         i32 %515 = OpConstant 3 
                                         i32 %516 = OpConstant 1 
                                         i32 %551 = OpConstant 5 
                                             %552 = OpTypePointer Uniform %20 
                                         i32 %558 = OpConstant 4 
                                             %578 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %579 = OpTypeSampledImage %578 
                                             %580 = OpTypePointer UniformConstant %579 
 UniformConstant read_only Texture3DSampled* %581 = OpVariable UniformConstant 
                              Private f32_4* %586 = OpVariable Private 
                                Input f32_3* %603 = OpVariable Input 
                              Private f32_3* %608 = OpVariable Private 
                                         i32 %610 = OpConstant 6 
                              Private f32_4* %622 = OpVariable Private 
                               Private bool* %626 = OpVariable Private 
                              Private f32_2* %639 = OpVariable Private 
                                         f32 %647 = OpConstant 3.67402E-40 
                                         f32 %663 = OpConstant 3.67402E-40 
                                       f32_2 %664 = OpConstantComposite %647 %663 
                                         f32 %744 = OpConstant 3.67402E-40 
                                Private f32* %776 = OpVariable Private 
                               Private bool* %789 = OpVariable Private 
                                Private f32* %800 = OpVariable Private 
                                         i32 %812 = OpConstant 16 
                                         i32 %822 = OpConstant 17 
                                         f32 %833 = OpConstant 3.67402E-40 
                                       f32_3 %834 = OpConstantComposite %234 %663 %833 
                                       f32_3 %845 = OpConstantComposite %290 %290 %290 
                                         f32 %847 = OpConstant 3.67402E-40 
                                       f32_3 %848 = OpConstantComposite %847 %847 %847 
                                       f32_3 %855 = OpConstantComposite %647 %647 %647 
                                       f32_3 %876 = OpConstantComposite %234 %234 %234 
                                       f32_3 %897 = OpConstantComposite %258 %258 %258 
                                             %899 = OpTypePointer Output %7 
                               Output f32_4* %900 = OpVariable Output 
                                             %906 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %357 = OpVariable Function 
                             Function f32_3* %383 = OpVariable Function 
                               Function f32* %398 = OpVariable Function 
                             Function f32_3* %542 = OpVariable Function 
                               Function f32* %632 = OpVariable Function 
                               Function f32* %673 = OpVariable Function 
                               Function f32* %770 = OpVariable Function 
                               Function f32* %794 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %24 = OpLoad %23 
                                        f32_2 %25 = OpLoad %17 
                                        f32_4 %26 = OpImageSampleImplicitLod %24 %25 
                                          f32 %29 = OpCompositeExtract %26 0 
                                 Private f32* %31 = OpAccessChain %22 %28 
                                                      OpStore %31 %29 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_3 %35 = OpFNegate %34 
                               Uniform f32_4* %44 = OpAccessChain %40 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFAdd %35 %46 
                                                      OpStore %32 %47 
                               Uniform f32_4* %49 = OpAccessChain %40 %42 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 3 3 3 
                                        f32_3 %52 = OpLoad %32 
                                        f32_3 %53 = OpFMul %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFAdd %53 %55 
                                                      OpStore %48 %56 
                               Uniform f32_4* %58 = OpAccessChain %40 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                               Uniform f32_4* %62 = OpAccessChain %40 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %60 %64 
                                                      OpStore %32 %65 
                                        f32_3 %67 = OpLoad %32 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 0 0 
                                 Uniform f32* %71 = OpAccessChain %40 %69 
                                          f32 %72 = OpLoad %71 
                                 Uniform f32* %73 = OpAccessChain %40 %69 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %75 = OpAccessChain %40 %69 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %77 = OpAccessChain %40 %69 
                                          f32 %78 = OpLoad %77 
                                        f32_4 %79 = OpCompositeConstruct %72 %74 %76 %78 
                                          f32 %80 = OpCompositeExtract %79 0 
                                          f32 %81 = OpCompositeExtract %79 1 
                                          f32 %82 = OpCompositeExtract %79 2 
                                          f32 %83 = OpCompositeExtract %79 3 
                                        f32_4 %84 = OpCompositeConstruct %80 %81 %82 %83 
                                        f32_4 %85 = OpFMul %68 %84 
                                                      OpStore %66 %85 
                                   Input f32* %90 = OpAccessChain %87 %88 
                                          f32 %91 = OpLoad %90 
                                   Input f32* %92 = OpAccessChain %87 %28 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFAdd %91 %93 
                                 Private f32* %95 = OpAccessChain %32 %28 
                                                      OpStore %95 %94 
                                 Private f32* %97 = OpAccessChain %32 %88 
                                          f32 %98 = OpLoad %97 
                                 Uniform f32* %99 = OpAccessChain %40 %69 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFMul %98 %100 
                                Private f32* %102 = OpAccessChain %32 %28 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                Private f32* %105 = OpAccessChain %96 %28 
                                                      OpStore %105 %104 
                                Private f32* %107 = OpAccessChain %96 %28 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpExtInst %1 14 %108 
                                Private f32* %110 = OpAccessChain %106 %28 
                                                      OpStore %110 %109 
                                Private f32* %111 = OpAccessChain %96 %28 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpExtInst %1 13 %112 
                                Private f32* %114 = OpAccessChain %96 %28 
                                                      OpStore %114 %113 
                                Private f32* %115 = OpAccessChain %106 %28 
                                         f32 %116 = OpLoad %115 
                                         f32 %118 = OpFMul %116 %117 
                                Private f32* %119 = OpAccessChain %106 %28 
                                                      OpStore %119 %118 
                                Private f32* %120 = OpAccessChain %96 %28 
                                         f32 %121 = OpLoad %120 
                                         f32 %123 = OpFMul %121 %122 
                                Private f32* %124 = OpAccessChain %106 %88 
                                                      OpStore %124 %123 
                                       f32_4 %125 = OpLoad %106 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                                       f32_3 %127 = OpLoad %87 
                                       f32_2 %128 = OpVectorShuffle %127 %127 0 1 
                                       f32_2 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %96 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 2 3 
                                                      OpStore %96 %131 
                                       f32_4 %132 = OpLoad %96 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                Uniform f32* %135 = OpAccessChain %40 %134 
                                         f32 %136 = OpLoad %135 
                                       f32_2 %137 = OpCompositeConstruct %136 %136 
                                       f32_2 %138 = OpFMul %133 %137 
                                       f32_4 %139 = OpLoad %96 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 2 3 
                                                      OpStore %96 %140 
                                       f32_4 %143 = OpLoad %66 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %148 = OpFMul %144 %147 
                                                      OpStore %142 %148 
                                       f32_4 %149 = OpLoad %66 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %154 = OpFMul %150 %153 
                                       f32_3 %155 = OpLoad %32 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 0 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %66 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %66 %159 
                                Private f32* %160 = OpAccessChain %66 %28 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 14 %161 
                                Private f32* %163 = OpAccessChain %32 %28 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %32 %28 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %165 %117 
                                Private f32* %167 = OpAccessChain %106 %28 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %66 %88 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpExtInst %1 13 %169 
                                Private f32* %171 = OpAccessChain %32 %28 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %32 %28 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %173 %122 
                                Private f32* %175 = OpAccessChain %106 %88 
                                                      OpStore %175 %174 
                                       f32_4 %176 = OpLoad %106 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                                       f32_3 %178 = OpLoad %87 
                                       f32_2 %179 = OpVectorShuffle %178 %178 0 1 
                                       f32_2 %180 = OpFAdd %177 %179 
                                       f32_4 %181 = OpLoad %66 
                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 2 3 
                                                      OpStore %66 %182 
                                       f32_4 %183 = OpLoad %66 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
                                Uniform f32* %185 = OpAccessChain %40 %134 
                                         f32 %186 = OpLoad %185 
                                       f32_2 %187 = OpCompositeConstruct %186 %186 
                                       f32_2 %188 = OpFMul %184 %187 
                                       f32_4 %189 = OpLoad %66 
                                       f32_4 %190 = OpVectorShuffle %189 %188 4 5 2 3 
                                                      OpStore %66 %190 
                                       f32_4 %191 = OpLoad %96 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %195 = OpFMul %192 %194 
                                       f32_2 %196 = OpLoad %142 
                                       f32_2 %197 = OpFAdd %195 %196 
                                       f32_4 %198 = OpLoad %96 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 2 3 
                                                      OpStore %96 %199 
                  read_only Texture2DSampled %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %96 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                                       f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_4 %206 = OpLoad %96 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %96 %207 
                                       f32_4 %208 = OpLoad %66 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_2 %212 = OpFMul %209 %211 
                                       f32_4 %213 = OpLoad %66 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                                      OpStore %66 %214 
                                       f32_4 %215 = OpLoad %66 
                                       f32_2 %216 = OpVectorShuffle %215 %215 3 3 
                                       f32_2 %219 = OpFMul %216 %218 
                                       f32_4 %220 = OpLoad %66 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %222 = OpFAdd %219 %221 
                                       f32_4 %223 = OpLoad %66 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 2 3 
                                                      OpStore %66 %224 
                  read_only Texture2DSampled %226 = OpLoad %200 
                                       f32_4 %227 = OpLoad %66 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                                       f32_4 %229 = OpImageSampleImplicitLod %226 %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                                      OpStore %225 %230 
                                Uniform f32* %232 = OpAccessChain %40 %231 
                                         f32 %233 = OpLoad %232 
                                         f32 %235 = OpFAdd %233 %234 
                                Private f32* %236 = OpAccessChain %32 %28 
                                                      OpStore %236 %235 
                                  Input f32* %240 = OpAccessChain %239 %88 
                                         f32 %241 = OpLoad %240 
                                         f32 %243 = OpFMul %241 %242 
                                                      OpStore %237 %243 
                                Private f32* %246 = OpAccessChain %32 %245 
                                         f32 %247 = OpLoad %246 
                                         f32 %249 = OpFMul %247 %248 
                                         f32 %250 = OpLoad %237 
                                         f32 %251 = OpFAdd %249 %250 
                                                      OpStore %244 %251 
                                         f32 %252 = OpLoad %244 
                                         f32 %253 = OpExtInst %1 13 %252 
                                                      OpStore %244 %253 
                                         f32 %254 = OpLoad %244 
                                         f32 %256 = OpFMul %254 %255 
                                Private f32* %257 = OpAccessChain %106 %28 
                                                      OpStore %257 %256 
                                Private f32* %259 = OpAccessChain %106 %88 
                                                      OpStore %259 %258 
                                       f32_4 %260 = OpLoad %106 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_4 %262 = OpLoad %239 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %106 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %106 %266 
                                       f32_4 %267 = OpLoad %106 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %271 = OpFAdd %268 %270 
                                       f32_4 %272 = OpLoad %106 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 2 3 
                                                      OpStore %106 %273 
                  read_only Texture2DSampled %276 = OpLoad %275 
                                       f32_4 %277 = OpLoad %106 
                                       f32_2 %278 = OpVectorShuffle %277 %277 0 1 
                                       f32_4 %279 = OpImageSampleImplicitLod %276 %278 
                                                      OpStore %274 %279 
                                       f32_3 %281 = OpLoad %87 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 1 
                                       f32_3 %286 = OpFMul %282 %285 
                                                      OpStore %280 %286 
                                  Input f32* %288 = OpAccessChain %87 %28 
                                         f32 %289 = OpLoad %288 
                                         f32 %291 = OpFMul %289 %290 
                                Private f32* %292 = OpAccessChain %32 %88 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFAdd %291 %293 
                                Private f32* %295 = OpAccessChain %287 %28 
                                                      OpStore %295 %294 
                                Private f32* %296 = OpAccessChain %287 %28 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpExtInst %1 13 %297 
                                Private f32* %299 = OpAccessChain %287 %28 
                                                      OpStore %299 %298 
                                Private f32* %300 = OpAccessChain %280 %28 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpExtInst %1 14 %301 
                                                      OpStore %244 %302 
                                         f32 %303 = OpLoad %244 
                                Private f32* %304 = OpAccessChain %287 %28 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFMul %303 %305 
                                Private f32* %307 = OpAccessChain %287 %28 
                                                      OpStore %307 %306 
                                Private f32* %308 = OpAccessChain %287 %28 
                                         f32 %309 = OpLoad %308 
                                         f32 %311 = OpFMul %309 %310 
                                Uniform f32* %313 = OpAccessChain %40 %312 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFAdd %311 %314 
                                Private f32* %316 = OpAccessChain %287 %28 
                                                      OpStore %316 %315 
                                  Input f32* %321 = OpAccessChain %320 %28 
                                         f32 %322 = OpLoad %321 
                                Private f32* %323 = OpAccessChain %287 %28 
                                         f32 %324 = OpLoad %323 
                                        bool %325 = OpFOrdLessThan %322 %324 
                                                      OpStore %319 %325 
                                       f32_3 %326 = OpLoad %280 
                                       f32_2 %327 = OpVectorShuffle %326 %326 1 2 
                                       f32_2 %328 = OpExtInst %1 8 %327 
                                       f32_3 %329 = OpLoad %280 
                                       f32_3 %330 = OpVectorShuffle %329 %328 3 4 2 
                                                      OpStore %280 %330 
                                       f32_3 %331 = OpLoad %280 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                       f32_2 %334 = OpFMul %332 %333 
                                       f32_3 %335 = OpLoad %280 
                                       f32_3 %336 = OpVectorShuffle %335 %334 3 4 2 
                                                      OpStore %280 %336 
                                       f32_3 %337 = OpLoad %280 
                                       f32_2 %338 = OpVectorShuffle %337 %337 0 1 
                                         f32 %342 = OpDot %338 %341 
                                                      OpStore %237 %342 
                                         f32 %343 = OpLoad %237 
                                         f32 %344 = OpExtInst %1 13 %343 
                                                      OpStore %237 %344 
                                         f32 %345 = OpLoad %237 
                                         f32 %347 = OpFMul %345 %346 
                                                      OpStore %237 %347 
                                         f32 %348 = OpLoad %237 
                                         f32 %349 = OpExtInst %1 10 %348 
                                                      OpStore %237 %349 
                                         f32 %350 = OpLoad %237 
                                         f32 %351 = OpFMul %350 %145 
                                         f32 %352 = OpFAdd %351 %145 
                                                      OpStore %237 %352 
                                         f32 %353 = OpLoad %237 
                                         f32 %354 = OpFMul %353 %145 
                                                      OpStore %237 %354 
                                        bool %358 = OpLoad %319 
                                                      OpSelectionMerge %360 None 
                                                      OpBranchConditional %358 %359 %363 
                                             %359 = OpLabel 
                                         f32 %361 = OpLoad %237 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                                      OpStore %357 %362 
                                                      OpBranch %360 
                                             %363 = OpLabel 
                                       f32_4 %364 = OpLoad %96 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                                      OpStore %357 %365 
                                                      OpBranch %360 
                                             %360 = OpLabel 
                                       f32_3 %366 = OpLoad %357 
                                                      OpStore %355 %366 
                                       f32_2 %367 = OpLoad %287 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 0 
                                       f32_2 %372 = OpFAdd %368 %371 
                                                      OpStore %287 %372 
                                  Input f32* %374 = OpAccessChain %320 %28 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %287 %28 
                                         f32 %377 = OpLoad %376 
                                        bool %378 = OpFOrdLessThan %375 %377 
                                                      OpStore %373 %378 
                                       f32_3 %380 = OpLoad %355 
                                       f32_3 %381 = OpLoad %355 
                                       f32_3 %382 = OpFAdd %380 %381 
                                                      OpStore %379 %382 
                                        bool %384 = OpLoad %373 
                                                      OpSelectionMerge %386 None 
                                                      OpBranchConditional %384 %385 %388 
                                             %385 = OpLabel 
                                       f32_3 %387 = OpLoad %379 
                                                      OpStore %383 %387 
                                                      OpBranch %386 
                                             %388 = OpLabel 
                                       f32_3 %389 = OpLoad %355 
                                                      OpStore %383 %389 
                                                      OpBranch %386 
                                             %386 = OpLabel 
                                       f32_3 %390 = OpLoad %383 
                                                      OpStore %355 %390 
                                Private f32* %391 = OpAccessChain %287 %88 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain %320 %28 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdLessThan %392 %394 
                                                      OpStore %373 %395 
                                        bool %399 = OpLoad %373 
                                                      OpSelectionMerge %401 None 
                                                      OpBranchConditional %399 %400 %402 
                                             %400 = OpLabel 
                                                      OpStore %398 %234 
                                                      OpBranch %401 
                                             %402 = OpLabel 
                                Private f32* %403 = OpAccessChain %22 %28 
                                         f32 %404 = OpLoad %403 
                                                      OpStore %398 %404 
                                                      OpBranch %401 
                                             %401 = OpLabel 
                                         f32 %405 = OpLoad %398 
                                                      OpStore %396 %405 
                                Private f32* %408 = OpAccessChain %9 %407 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %396 
                                         f32 %411 = OpFMul %409 %410 
                                Private f32* %412 = OpAccessChain %406 %407 
                                                      OpStore %412 %411 
                                       f32_3 %413 = OpLoad %355 
                                Uniform f32* %415 = OpAccessChain %40 %414 
                                         f32 %416 = OpLoad %415 
                                       f32_3 %417 = OpCompositeConstruct %416 %416 %416 
                                       f32_3 %418 = OpFMul %413 %417 
                                                      OpStore %280 %418 
                                       f32_3 %419 = OpLoad %225 
                                Uniform f32* %421 = OpAccessChain %40 %420 
                                         f32 %422 = OpLoad %421 
                                Uniform f32* %423 = OpAccessChain %40 %420 
                                         f32 %424 = OpLoad %423 
                                Uniform f32* %425 = OpAccessChain %40 %420 
                                         f32 %426 = OpLoad %425 
                                       f32_3 %427 = OpCompositeConstruct %422 %424 %426 
                                         f32 %428 = OpCompositeExtract %427 0 
                                         f32 %429 = OpCompositeExtract %427 1 
                                         f32 %430 = OpCompositeExtract %427 2 
                                       f32_3 %431 = OpCompositeConstruct %428 %429 %430 
                                       f32_3 %432 = OpFMul %419 %431 
                                       f32_4 %433 = OpLoad %66 
                                       f32_4 %434 = OpVectorShuffle %433 %432 4 5 6 3 
                                                      OpStore %66 %434 
                                       f32_4 %435 = OpLoad %66 
                                       f32_3 %436 = OpVectorShuffle %435 %435 0 1 2 
                              Uniform f32_4* %438 = OpAccessChain %40 %437 
                                       f32_4 %439 = OpLoad %438 
                                       f32_3 %440 = OpVectorShuffle %439 %439 0 1 2 
                                       f32_3 %441 = OpFMul %436 %440 
                                       f32_4 %442 = OpLoad %66 
                                       f32_4 %443 = OpVectorShuffle %442 %441 4 5 6 3 
                                                      OpStore %66 %443 
                                       f32_3 %444 = OpLoad %280 
                              Uniform f32_4* %446 = OpAccessChain %40 %445 
                                       f32_4 %447 = OpLoad %446 
                                       f32_3 %448 = OpVectorShuffle %447 %447 0 1 2 
                                       f32_3 %449 = OpFMul %444 %448 
                                       f32_4 %450 = OpLoad %66 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                       f32_3 %452 = OpFNegate %451 
                                       f32_3 %453 = OpFAdd %449 %452 
                                       f32_4 %454 = OpLoad %66 
                                       f32_4 %455 = OpVectorShuffle %454 %453 4 5 6 3 
                                                      OpStore %66 %455 
                                       f32_3 %456 = OpLoad %48 
                                       f32_3 %457 = OpLoad %32 
                                       f32_3 %458 = OpVectorShuffle %457 %457 0 0 0 
                                       f32_3 %459 = OpFMul %456 %458 
                                                      OpStore %48 %459 
                                       f32_4 %460 = OpLoad %66 
                                       f32_3 %461 = OpVectorShuffle %460 %460 0 1 2 
                                         f32 %462 = OpLoad %396 
                                       f32_3 %463 = OpCompositeConstruct %462 %462 %462 
                                       f32_3 %464 = OpFMul %461 %463 
                                       f32_3 %465 = OpLoad %48 
                                       f32_3 %466 = OpFAdd %464 %465 
                                                      OpStore %48 %466 
                                       f32_3 %467 = OpLoad %48 
                                       f32_3 %470 = OpFMul %467 %469 
                                       f32_4 %471 = OpLoad %274 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 1 2 
                                       f32_3 %473 = OpFAdd %470 %472 
                                                      OpStore %355 %473 
                                Private f32* %475 = OpAccessChain %274 %407 
                                         f32 %476 = OpLoad %475 
                                Uniform f32* %478 = OpAccessChain %40 %477 
                                         f32 %479 = OpLoad %478 
                                         f32 %480 = OpFMul %476 %479 
                                                      OpStore %474 %480 
                                         f32 %481 = OpLoad %474 
                                Uniform f32* %483 = OpAccessChain %40 %482 
                                         f32 %484 = OpLoad %483 
                                         f32 %485 = OpFMul %481 %484 
                                                      OpStore %474 %485 
                                       f32_3 %486 = OpLoad %48 
                                       f32_3 %487 = OpFNegate %486 
                                       f32_3 %488 = OpLoad %355 
                                       f32_3 %489 = OpFAdd %487 %488 
                                                      OpStore %32 %489 
                                         f32 %490 = OpLoad %474 
                                       f32_3 %491 = OpCompositeConstruct %490 %490 %490 
                                       f32_3 %492 = OpLoad %32 
                                       f32_3 %493 = OpFMul %491 %492 
                                       f32_3 %494 = OpLoad %48 
                                       f32_3 %495 = OpFAdd %493 %494 
                                                      OpStore %48 %495 
                                Uniform f32* %498 = OpAccessChain %40 %497 %28 
                                         f32 %499 = OpLoad %498 
                                        bool %500 = OpFOrdEqual %499 %234 
                                                      OpStore %496 %500 
                                                      OpSelectionMerge %503 None 
                                                      OpBranchConditional %501 %502 %503 
                                             %502 = OpLabel 
                                        bool %504 = OpLoad %496 
                                                      OpSelectionMerge %506 None 
                                                      OpBranchConditional %504 %505 %506 
                                             %505 = OpLabel 
                                                      OpBranch %506 
                                             %506 = OpLabel 
                                                      OpBranch %503 
                                             %503 = OpLabel 
                                                      OpSelectionMerge %509 None 
                                                      OpBranchConditional %507 %508 %588 
                                             %508 = OpLabel 
                                Uniform f32* %510 = OpAccessChain %40 %497 %88 
                                         f32 %511 = OpLoad %510 
                                        bool %512 = OpFOrdEqual %511 %234 
                                                      OpStore %496 %512 
                                       f32_3 %513 = OpLoad %87 
                                       f32_3 %514 = OpVectorShuffle %513 %513 1 1 1 
                              Uniform f32_4* %517 = OpAccessChain %40 %515 %516 
                                       f32_4 %518 = OpLoad %517 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %520 = OpFMul %514 %519 
                                                      OpStore %32 %520 
                              Uniform f32_4* %521 = OpAccessChain %40 %515 %57 
                                       f32_4 %522 = OpLoad %521 
                                       f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
                                       f32_3 %524 = OpLoad %87 
                                       f32_3 %525 = OpVectorShuffle %524 %524 0 0 0 
                                       f32_3 %526 = OpFMul %523 %525 
                                       f32_3 %527 = OpLoad %32 
                                       f32_3 %528 = OpFAdd %526 %527 
                                                      OpStore %32 %528 
                              Uniform f32_4* %529 = OpAccessChain %40 %515 %497 
                                       f32_4 %530 = OpLoad %529 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
                                       f32_3 %532 = OpLoad %87 
                                       f32_3 %533 = OpVectorShuffle %532 %532 2 2 2 
                                       f32_3 %534 = OpFMul %531 %533 
                                       f32_3 %535 = OpLoad %32 
                                       f32_3 %536 = OpFAdd %534 %535 
                                                      OpStore %32 %536 
                                       f32_3 %537 = OpLoad %32 
                              Uniform f32_4* %538 = OpAccessChain %40 %515 %515 
                                       f32_4 %539 = OpLoad %538 
                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                                       f32_3 %541 = OpFAdd %537 %540 
                                                      OpStore %32 %541 
                                        bool %543 = OpLoad %496 
                                                      OpSelectionMerge %545 None 
                                                      OpBranchConditional %543 %544 %547 
                                             %544 = OpLabel 
                                       f32_3 %546 = OpLoad %32 
                                                      OpStore %542 %546 
                                                      OpBranch %545 
                                             %547 = OpLabel 
                                       f32_3 %548 = OpLoad %87 
                                                      OpStore %542 %548 
                                                      OpBranch %545 
                                             %545 = OpLabel 
                                       f32_3 %549 = OpLoad %542 
                                                      OpStore %32 %549 
                                       f32_3 %550 = OpLoad %32 
                              Uniform f32_3* %553 = OpAccessChain %40 %551 
                                       f32_3 %554 = OpLoad %553 
                                       f32_3 %555 = OpFNegate %554 
                                       f32_3 %556 = OpFAdd %550 %555 
                                                      OpStore %32 %556 
                                       f32_3 %557 = OpLoad %32 
                              Uniform f32_3* %559 = OpAccessChain %40 %558 
                                       f32_3 %560 = OpLoad %559 
                                       f32_3 %561 = OpFMul %557 %560 
                                       f32_4 %562 = OpLoad %66 
                                       f32_4 %563 = OpVectorShuffle %562 %561 0 4 5 6 
                                                      OpStore %66 %563 
                                Private f32* %564 = OpAccessChain %66 %88 
                                         f32 %565 = OpLoad %564 
                                         f32 %566 = OpFMul %565 %217 
                                         f32 %567 = OpFAdd %566 %468 
                                                      OpStore %474 %567 
                                Uniform f32* %568 = OpAccessChain %40 %497 %245 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %569 %145 
                                         f32 %571 = OpFAdd %570 %468 
                                Private f32* %572 = OpAccessChain %32 %28 
                                                      OpStore %572 %571 
                                         f32 %573 = OpLoad %474 
                                Private f32* %574 = OpAccessChain %32 %28 
                                         f32 %575 = OpLoad %574 
                                         f32 %576 = OpExtInst %1 40 %573 %575 
                                Private f32* %577 = OpAccessChain %66 %28 
                                                      OpStore %577 %576 
                  read_only Texture3DSampled %582 = OpLoad %581 
                                       f32_4 %583 = OpLoad %66 
                                       f32_3 %584 = OpVectorShuffle %583 %583 0 2 3 
                                       f32_4 %585 = OpImageSampleImplicitLod %582 %584 
                                                      OpStore %66 %585 
                                       f32_4 %587 = OpLoad %66 
                                                      OpStore %586 %587 
                                                      OpBranch %509 
                                             %588 = OpLabel 
                                Private f32* %589 = OpAccessChain %586 %28 
                                                      OpStore %589 %234 
                                Private f32* %590 = OpAccessChain %586 %88 
                                                      OpStore %590 %234 
                                Private f32* %591 = OpAccessChain %586 %245 
                                                      OpStore %591 %234 
                                Private f32* %592 = OpAccessChain %586 %407 
                                                      OpStore %592 %234 
                                                      OpBranch %509 
                                             %509 = OpLabel 
                                       f32_4 %593 = OpLoad %586 
                              Uniform f32_4* %594 = OpAccessChain %40 %516 
                                       f32_4 %595 = OpLoad %594 
                                         f32 %596 = OpDot %593 %595 
                                Private f32* %597 = OpAccessChain %355 %28 
                                                      OpStore %597 %596 
                                Private f32* %598 = OpAccessChain %355 %28 
                                         f32 %599 = OpLoad %598 
                                         f32 %600 = OpExtInst %1 43 %599 %258 %234 
                                Private f32* %601 = OpAccessChain %355 %28 
                                                      OpStore %601 %600 
                                       f32_3 %602 = OpLoad %48 
                                       f32_3 %604 = OpLoad %603 
                                       f32_3 %605 = OpFMul %602 %604 
                                       f32_4 %606 = OpLoad %586 
                                       f32_4 %607 = OpVectorShuffle %606 %605 4 5 6 3 
                                                      OpStore %586 %607 
                                       f32_3 %609 = OpLoad %48 
                              Uniform f32_4* %611 = OpAccessChain %40 %610 
                                       f32_4 %612 = OpLoad %611 
                                       f32_3 %613 = OpVectorShuffle %612 %612 0 1 2 
                                       f32_3 %614 = OpFMul %609 %613 
                                                      OpStore %608 %614 
                                       f32_3 %615 = OpLoad %355 
                                       f32_3 %616 = OpVectorShuffle %615 %615 0 0 0 
                                       f32_3 %617 = OpLoad %608 
                                       f32_3 %618 = OpFMul %616 %617 
                                       f32_4 %619 = OpLoad %406 
                                       f32_4 %620 = OpVectorShuffle %619 %618 4 5 6 3 
                                                      OpStore %406 %620 
                                Private f32* %621 = OpAccessChain %586 %407 
                                                      OpStore %621 %258 
                                       f32_4 %623 = OpLoad %406 
                                       f32_4 %624 = OpLoad %586 
                                       f32_4 %625 = OpFAdd %623 %624 
                                                      OpStore %622 %625 
                                Private f32* %627 = OpAccessChain %622 %88 
                                         f32 %628 = OpLoad %627 
                                Private f32* %629 = OpAccessChain %622 %245 
                                         f32 %630 = OpLoad %629 
                                        bool %631 = OpFOrdGreaterThanEqual %628 %630 
                                                      OpStore %626 %631 
                                        bool %633 = OpLoad %626 
                                                      OpSelectionMerge %635 None 
                                                      OpBranchConditional %633 %634 %636 
                                             %634 = OpLabel 
                                                      OpStore %632 %234 
                                                      OpBranch %635 
                                             %636 = OpLabel 
                                                      OpStore %632 %258 
                                                      OpBranch %635 
                                             %635 = OpLabel 
                                         f32 %637 = OpLoad %632 
                                Private f32* %638 = OpAccessChain %32 %28 
                                                      OpStore %638 %637 
                                       f32_4 %640 = OpLoad %622 
                                       f32_2 %641 = OpVectorShuffle %640 %640 2 1 
                                       f32_2 %642 = OpFNegate %641 
                                       f32_4 %643 = OpLoad %622 
                                       f32_2 %644 = OpVectorShuffle %643 %643 1 2 
                                       f32_2 %645 = OpFAdd %642 %644 
                                                      OpStore %639 %645 
                                Private f32* %646 = OpAccessChain %106 %28 
                                                      OpStore %646 %234 
                                Private f32* %648 = OpAccessChain %106 %88 
                                                      OpStore %648 %647 
                                       f32_3 %649 = OpLoad %32 
                                       f32_2 %650 = OpVectorShuffle %649 %649 0 0 
                                       f32_2 %651 = OpLoad %639 
                                       f32_2 %652 = OpFMul %650 %651 
                                       f32_4 %653 = OpLoad %622 
                                       f32_2 %654 = OpVectorShuffle %653 %653 2 1 
                                       f32_2 %655 = OpFAdd %652 %654 
                                       f32_4 %656 = OpLoad %66 
                                       f32_4 %657 = OpVectorShuffle %656 %655 4 5 2 3 
                                                      OpStore %66 %657 
                                       f32_3 %658 = OpLoad %32 
                                       f32_2 %659 = OpVectorShuffle %658 %658 0 0 
                                       f32_4 %660 = OpLoad %106 
                                       f32_2 %661 = OpVectorShuffle %660 %660 0 1 
                                       f32_2 %662 = OpFMul %659 %661 
                                       f32_2 %665 = OpFAdd %662 %664 
                                       f32_4 %666 = OpLoad %66 
                                       f32_4 %667 = OpVectorShuffle %666 %665 0 1 4 5 
                                                      OpStore %66 %667 
                                Private f32* %668 = OpAccessChain %622 %28 
                                         f32 %669 = OpLoad %668 
                                Private f32* %670 = OpAccessChain %66 %28 
                                         f32 %671 = OpLoad %670 
                                        bool %672 = OpFOrdGreaterThanEqual %669 %671 
                                                      OpStore %626 %672 
                                        bool %674 = OpLoad %626 
                                                      OpSelectionMerge %676 None 
                                                      OpBranchConditional %674 %675 %677 
                                             %675 = OpLabel 
                                                      OpStore %673 %234 
                                                      OpBranch %676 
                                             %677 = OpLabel 
                                                      OpStore %673 %258 
                                                      OpBranch %676 
                                             %676 = OpLabel 
                                         f32 %678 = OpLoad %673 
                                Private f32* %679 = OpAccessChain %32 %28 
                                                      OpStore %679 %678 
                                       f32_4 %680 = OpLoad %66 
                                       f32_3 %681 = OpVectorShuffle %680 %680 0 1 3 
                                       f32_3 %682 = OpFNegate %681 
                                       f32_4 %683 = OpLoad %96 
                                       f32_4 %684 = OpVectorShuffle %683 %682 4 5 6 3 
                                                      OpStore %96 %684 
                                Private f32* %685 = OpAccessChain %622 %28 
                                         f32 %686 = OpLoad %685 
                                         f32 %687 = OpFNegate %686 
                                Private f32* %688 = OpAccessChain %96 %407 
                                                      OpStore %688 %687 
                                Private f32* %689 = OpAccessChain %622 %28 
                                         f32 %690 = OpLoad %689 
                                Private f32* %691 = OpAccessChain %96 %28 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFAdd %690 %692 
                                Private f32* %694 = OpAccessChain %106 %28 
                                                      OpStore %694 %693 
                                       f32_4 %695 = OpLoad %66 
                                       f32_3 %696 = OpVectorShuffle %695 %695 1 2 0 
                                       f32_4 %697 = OpLoad %96 
                                       f32_3 %698 = OpVectorShuffle %697 %697 1 2 3 
                                       f32_3 %699 = OpFAdd %696 %698 
                                       f32_4 %700 = OpLoad %106 
                                       f32_4 %701 = OpVectorShuffle %700 %699 0 4 5 6 
                                                      OpStore %106 %701 
                                       f32_3 %702 = OpLoad %32 
                                       f32_3 %703 = OpVectorShuffle %702 %702 0 0 0 
                                       f32_4 %704 = OpLoad %106 
                                       f32_3 %705 = OpVectorShuffle %704 %704 0 1 2 
                                       f32_3 %706 = OpFMul %703 %705 
                                       f32_4 %707 = OpLoad %66 
                                       f32_3 %708 = OpVectorShuffle %707 %707 0 1 3 
                                       f32_3 %709 = OpFAdd %706 %708 
                                       f32_4 %710 = OpLoad %106 
                                       f32_4 %711 = OpVectorShuffle %710 %709 4 5 6 3 
                                                      OpStore %106 %711 
                                Private f32* %712 = OpAccessChain %32 %28 
                                         f32 %713 = OpLoad %712 
                                Private f32* %714 = OpAccessChain %106 %407 
                                         f32 %715 = OpLoad %714 
                                         f32 %716 = OpFMul %713 %715 
                                Private f32* %717 = OpAccessChain %622 %28 
                                         f32 %718 = OpLoad %717 
                                         f32 %719 = OpFAdd %716 %718 
                                Private f32* %720 = OpAccessChain %32 %28 
                                                      OpStore %720 %719 
                                Private f32* %721 = OpAccessChain %106 %88 
                                         f32 %722 = OpLoad %721 
                                Private f32* %723 = OpAccessChain %32 %28 
                                         f32 %724 = OpLoad %723 
                                         f32 %725 = OpExtInst %1 37 %722 %724 
                                Private f32* %726 = OpAccessChain %287 %28 
                                                      OpStore %726 %725 
                                Private f32* %727 = OpAccessChain %287 %28 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFNegate %728 
                                Private f32* %730 = OpAccessChain %106 %28 
                                         f32 %731 = OpLoad %730 
                                         f32 %732 = OpFAdd %729 %731 
                                Private f32* %733 = OpAccessChain %287 %28 
                                                      OpStore %733 %732 
                                Private f32* %734 = OpAccessChain %106 %88 
                                         f32 %735 = OpLoad %734 
                                         f32 %736 = OpFNegate %735 
                                Private f32* %737 = OpAccessChain %32 %28 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpFAdd %736 %738 
                                Private f32* %740 = OpAccessChain %32 %28 
                                                      OpStore %740 %739 
                                Private f32* %741 = OpAccessChain %287 %28 
                                         f32 %742 = OpLoad %741 
                                         f32 %743 = OpFMul %742 %290 
                                         f32 %745 = OpFAdd %743 %744 
                                                      OpStore %244 %745 
                                Private f32* %746 = OpAccessChain %32 %28 
                                         f32 %747 = OpLoad %746 
                                         f32 %748 = OpLoad %244 
                                         f32 %749 = OpFDiv %747 %748 
                                Private f32* %750 = OpAccessChain %32 %28 
                                                      OpStore %750 %749 
                                Private f32* %751 = OpAccessChain %32 %28 
                                         f32 %752 = OpLoad %751 
                                Private f32* %753 = OpAccessChain %106 %245 
                                         f32 %754 = OpLoad %753 
                                         f32 %755 = OpFAdd %752 %754 
                                Private f32* %756 = OpAccessChain %32 %28 
                                                      OpStore %756 %755 
                                Private f32* %757 = OpAccessChain %106 %28 
                                         f32 %758 = OpLoad %757 
                                         f32 %759 = OpFAdd %758 %744 
                                                      OpStore %244 %759 
                                Private f32* %760 = OpAccessChain %287 %28 
                                         f32 %761 = OpLoad %760 
                                         f32 %762 = OpLoad %244 
                                         f32 %763 = OpFDiv %761 %762 
                                Private f32* %764 = OpAccessChain %287 %28 
                                                      OpStore %764 %763 
                                Uniform f32* %765 = OpAccessChain %40 %42 %88 
                                         f32 %766 = OpLoad %765 
                                Uniform f32* %767 = OpAccessChain %40 %42 %245 
                                         f32 %768 = OpLoad %767 
                                        bool %769 = OpFOrdGreaterThanEqual %766 %768 
                                                      OpStore %319 %769 
                                        bool %771 = OpLoad %319 
                                                      OpSelectionMerge %773 None 
                                                      OpBranchConditional %771 %772 %774 
                                             %772 = OpLabel 
                                                      OpStore %770 %234 
                                                      OpBranch %773 
                                             %774 = OpLabel 
                                                      OpStore %770 %258 
                                                      OpBranch %773 
                                             %773 = OpLabel 
                                         f32 %775 = OpLoad %770 
                                                      OpStore %244 %775 
                                Uniform f32* %777 = OpAccessChain %40 %42 %245 
                                         f32 %778 = OpLoad %777 
                                         f32 %779 = OpFNegate %778 
                                Uniform f32* %780 = OpAccessChain %40 %42 %88 
                                         f32 %781 = OpLoad %780 
                                         f32 %782 = OpFAdd %779 %781 
                                                      OpStore %776 %782 
                                         f32 %783 = OpLoad %244 
                                         f32 %784 = OpLoad %776 
                                         f32 %785 = OpFMul %783 %784 
                                Uniform f32* %786 = OpAccessChain %40 %42 %245 
                                         f32 %787 = OpLoad %786 
                                         f32 %788 = OpFAdd %785 %787 
                                                      OpStore %244 %788 
                                Uniform f32* %790 = OpAccessChain %40 %42 %28 
                                         f32 %791 = OpLoad %790 
                                         f32 %792 = OpLoad %244 
                                        bool %793 = OpFOrdGreaterThanEqual %791 %792 
                                                      OpStore %789 %793 
                                        bool %795 = OpLoad %789 
                                                      OpSelectionMerge %797 None 
                                                      OpBranchConditional %795 %796 %798 
                                             %796 = OpLabel 
                                                      OpStore %794 %234 
                                                      OpBranch %797 
                                             %798 = OpLabel 
                                                      OpStore %794 %258 
                                                      OpBranch %797 
                                             %797 = OpLabel 
                                         f32 %799 = OpLoad %794 
                                                      OpStore %776 %799 
                                         f32 %801 = OpLoad %244 
                                         f32 %802 = OpFNegate %801 
                                Uniform f32* %803 = OpAccessChain %40 %42 %28 
                                         f32 %804 = OpLoad %803 
                                         f32 %805 = OpFAdd %802 %804 
                                                      OpStore %800 %805 
                                         f32 %806 = OpLoad %776 
                                         f32 %807 = OpLoad %800 
                                         f32 %808 = OpFMul %806 %807 
                                         f32 %809 = OpLoad %244 
                                         f32 %810 = OpFAdd %808 %809 
                                                      OpStore %244 %810 
                                         f32 %811 = OpLoad %244 
                                Uniform f32* %813 = OpAccessChain %40 %812 
                                         f32 %814 = OpLoad %813 
                                         f32 %815 = OpFMul %811 %814 
                                                      OpStore %776 %815 
                                         f32 %816 = OpLoad %776 
                                Private f32* %817 = OpAccessChain %106 %28 
                                         f32 %818 = OpLoad %817 
                                         f32 %819 = OpExtInst %1 40 %816 %818 
                                Private f32* %820 = OpAccessChain %106 %28 
                                                      OpStore %820 %819 
                                         f32 %821 = OpLoad %244 
                                Uniform f32* %823 = OpAccessChain %40 %822 
                                         f32 %824 = OpLoad %823 
                                         f32 %825 = OpFMul %821 %824 
                                                      OpStore %244 %825 
                                         f32 %826 = OpLoad %244 
                                Private f32* %827 = OpAccessChain %106 %28 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpExtInst %1 37 %826 %828 
                                                      OpStore %244 %829 
                                       f32_3 %830 = OpLoad %32 
                                       f32_3 %831 = OpVectorShuffle %830 %830 0 0 0 
                                       f32_3 %832 = OpExtInst %1 4 %831 
                                       f32_3 %835 = OpFAdd %832 %834 
                                       f32_4 %836 = OpLoad %106 
                                       f32_4 %837 = OpVectorShuffle %836 %835 4 5 6 3 
                                                      OpStore %106 %837 
                                       f32_4 %838 = OpLoad %106 
                                       f32_3 %839 = OpVectorShuffle %838 %838 0 1 2 
                                       f32_3 %840 = OpExtInst %1 10 %839 
                                       f32_4 %841 = OpLoad %106 
                                       f32_4 %842 = OpVectorShuffle %841 %840 4 5 6 3 
                                                      OpStore %106 %842 
                                       f32_4 %843 = OpLoad %106 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 2 
                                       f32_3 %846 = OpFMul %844 %845 
                                       f32_3 %849 = OpFAdd %846 %848 
                                       f32_4 %850 = OpLoad %106 
                                       f32_4 %851 = OpVectorShuffle %850 %849 4 5 6 3 
                                                      OpStore %106 %851 
                                       f32_4 %852 = OpLoad %106 
                                       f32_3 %853 = OpVectorShuffle %852 %852 0 1 2 
                                       f32_3 %854 = OpExtInst %1 4 %853 
                                       f32_3 %856 = OpFAdd %854 %855 
                                       f32_4 %857 = OpLoad %106 
                                       f32_4 %858 = OpVectorShuffle %857 %856 4 5 6 3 
                                                      OpStore %106 %858 
                                       f32_4 %859 = OpLoad %106 
                                       f32_3 %860 = OpVectorShuffle %859 %859 0 1 2 
                                       f32_3 %861 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %862 = OpCompositeConstruct %234 %234 %234 
                                       f32_3 %863 = OpExtInst %1 43 %860 %861 %862 
                                       f32_4 %864 = OpLoad %106 
                                       f32_4 %865 = OpVectorShuffle %864 %863 4 5 6 3 
                                                      OpStore %106 %865 
                                       f32_4 %866 = OpLoad %106 
                                       f32_3 %867 = OpVectorShuffle %866 %866 0 1 2 
                                       f32_3 %868 = OpFAdd %867 %855 
                                       f32_4 %869 = OpLoad %106 
                                       f32_4 %870 = OpVectorShuffle %869 %868 4 5 6 3 
                                                      OpStore %106 %870 
                                       f32_2 %871 = OpLoad %287 
                                       f32_3 %872 = OpVectorShuffle %871 %871 0 0 0 
                                       f32_4 %873 = OpLoad %106 
                                       f32_3 %874 = OpVectorShuffle %873 %873 0 1 2 
                                       f32_3 %875 = OpFMul %872 %874 
                                       f32_3 %877 = OpFAdd %875 %876 
                                       f32_4 %878 = OpLoad %106 
                                       f32_4 %879 = OpVectorShuffle %878 %877 4 5 6 3 
                                                      OpStore %106 %879 
                                         f32 %880 = OpLoad %244 
                                       f32_3 %881 = OpCompositeConstruct %880 %880 %880 
                                       f32_4 %882 = OpLoad %106 
                                       f32_3 %883 = OpVectorShuffle %882 %882 0 1 2 
                                       f32_3 %884 = OpFMul %881 %883 
                                       f32_4 %885 = OpLoad %622 
                                       f32_3 %886 = OpVectorShuffle %885 %885 0 1 2 
                                       f32_3 %887 = OpFNegate %886 
                                       f32_3 %888 = OpFAdd %884 %887 
                                                      OpStore %32 %888 
                                       f32_3 %889 = OpLoad %22 
                                       f32_3 %890 = OpVectorShuffle %889 %889 0 0 0 
                                       f32_3 %891 = OpLoad %32 
                                       f32_3 %892 = OpFMul %890 %891 
                                       f32_4 %893 = OpLoad %622 
                                       f32_3 %894 = OpVectorShuffle %893 %893 0 1 2 
                                       f32_3 %895 = OpFAdd %892 %894 
                                                      OpStore %22 %895 
                                       f32_3 %896 = OpLoad %22 
                                       f32_3 %898 = OpExtInst %1 40 %896 %897 
                                                      OpStore %22 %898 
                                       f32_3 %901 = OpLoad %22 
                                       f32_4 %902 = OpLoad %900 
                                       f32_4 %903 = OpVectorShuffle %902 %901 4 5 6 3 
                                                      OpStore %900 %903 
                                Private f32* %904 = OpAccessChain %622 %407 
                                         f32 %905 = OpLoad %904 
                                 Output f32* %907 = OpAccessChain %900 %407 
                                                      OpStore %907 %905 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 91177
Program "vp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat7;
vec2 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = (-u_xlat10_0.xyz) + _CausticColor.xyz;
    u_xlat0.xyz = _CausticColor.www * u_xlat7.xyz + u_xlat10_0.xyz;
    u_xlat7.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat2 = u_xlat7.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat7.x = vs_TEXCOORD2.y + vs_TEXCOORD2.x;
    u_xlat3.x = u_xlat7.y * _TimeScale + u_xlat7.x;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat4.x * 0.111111112;
    u_xlat4.y = u_xlat3.x * 0.166666672;
    u_xlat3.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat15.xy = u_xlat2.zw * vec2(0.5, 0.125);
    u_xlat2.xy = u_xlat2.xy * vec2(1.25, 0.899999976) + u_xlat7.xx;
    u_xlat7.x = cos(u_xlat2.x);
    u_xlat4.x = u_xlat7.x * 0.111111112;
    u_xlat7.x = sin(u_xlat2.y);
    u_xlat4.y = u_xlat7.x * 0.166666672;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003) + u_xlat15.xy;
    u_xlat10_3 = texture(_CausticTex, u_xlat3.xy);
    u_xlat2.xy = u_xlat2.xy * vec2(0.142857149, 0.142857149);
    u_xlat2.xy = u_xlat2.ww * vec2(0.25, 0.166666672) + u_xlat2.xy;
    u_xlat10_2 = texture(_CausticTex, u_xlat2.xy);
    u_xlat7.x = _EmissiveBoost + 1.0;
    u_xlat20 = vs_TEXCOORD3.y * 500.0;
    u_xlat19 = u_xlat7.z * 5.0 + u_xlat20;
    u_xlat19 = sin(u_xlat19);
    u_xlat4.x = u_xlat19 * 0.00150000001;
    u_xlat4.y = 0.0;
    u_xlat4.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.0, 0.075000003);
    u_xlat10_4 = texture(_ReflMapFromPixelator, u_xlat4.xy);
    u_xlat5.xyz = vs_TEXCOORD2.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat13.x = vs_TEXCOORD2.x * 6.0 + u_xlat7.y;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat19 = cos(u_xlat5.x);
    u_xlat13.x = u_xlat19 * u_xlat13.x;
    u_xlat13.x = u_xlat13.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb19 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xy = floor(u_xlat5.yz);
    u_xlat5.xy = u_xlat5.xy * vec2(0.0625, 0.0625);
    u_xlat20 = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat20 = fract(u_xlat20);
    u_xlat20 = u_xlat20 * 0.5 + 0.5;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(u_xlat20) : u_xlat10_3.xyz;
    u_xlat13.xy = u_xlat13.xx + vec2(-0.0625, -0.25);
    u_xlatb13 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlatb13 = u_xlat13.y<vs_COLOR0.x;
    u_xlat1.x = (u_xlatb13) ? 1.0 : u_xlat10_1.x;
    SV_Target0.w = u_xlat10_0.w * u_xlat1.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LightCausticPower);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_4.xyz;
    u_xlat18 = u_xlat10_4.w * _ReflPower;
    u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25 + 0.75;
        u_xlat19 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat18, u_xlat19);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat18 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat18 = u_xlat18 * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 183
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %98 %99 %112 %142 %162 %174 %175 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %162 Location 162 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 4 
                                             %111 = OpTypePointer Input %50 
                                Input f32_3* %112 = OpVariable Input 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                               Output f32_3* %142 = OpVariable Output 
                                             %150 = OpTypePointer Uniform %6 
                                         f32 %157 = OpConstant 3.67402E-40 
                                       f32_3 %158 = OpConstantComposite %157 %157 %157 
                               Output f32_4* %162 = OpVariable Output 
                               Output f32_4* %174 = OpVariable Output 
                                Input f32_4* %175 = OpVariable Input 
                                             %177 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %114 = OpAccessChain %21 %36 %28 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %113 %116 
                                Private f32* %120 = OpAccessChain %44 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %112 
                              Uniform f32_4* %122 = OpAccessChain %21 %36 %23 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %44 %88 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %112 
                              Uniform f32_4* %128 = OpAccessChain %21 %36 %36 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %44 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %44 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %44 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %143 = OpLoad %134 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                                      OpStore %142 %147 
                                Private f32* %148 = OpAccessChain %9 %88 
                                         f32 %149 = OpLoad %148 
                                Uniform f32* %151 = OpAccessChain %21 %28 %118 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %149 %152 
                                Private f32* %154 = OpAccessChain %9 %88 
                                                      OpStore %154 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 3 1 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %44 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %44 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_2 %164 = OpVectorShuffle %163 %163 2 3 
                                       f32_4 %165 = OpLoad %162 
                                       f32_4 %166 = OpVectorShuffle %165 %164 0 1 4 5 
                                                      OpStore %162 %166 
                                       f32_4 %167 = OpLoad %44 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 2 
                                       f32_4 %169 = OpLoad %44 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 3 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %162 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %162 %173 
                                       f32_4 %176 = OpLoad %175 
                                                      OpStore %174 %176 
                                 Output f32* %178 = OpAccessChain %92 %28 %88 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFNegate %179 
                                 Output f32* %181 = OpAccessChain %92 %28 %88 
                                                      OpStore %181 %180 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 682
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %88 %236 %310 %396 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 RelaxedPrecision 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 RelaxedPrecision 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpMemberDecorate %39 12 Offset 39 
                                                      OpMemberDecorate %39 13 Offset 39 
                                                      OpMemberDecorate %39 14 Offset 39 
                                                      OpMemberDecorate %39 15 Offset 39 
                                                      OpMemberDecorate %39 16 Offset 39 
                                                      OpMemberDecorate %39 17 Offset 39 
                                                      OpMemberDecorate %39 18 Offset 39 
                                                      OpMemberDecorate %39 19 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %199 DescriptorSet 199 
                                                      OpDecorate %199 Binding 199 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %266 DescriptorSet 266 
                                                      OpDecorate %266 Binding 266 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %310 Location 310 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %396 Location 396 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %404 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %409 RelaxedPrecision 
                                                      OpDecorate %412 RelaxedPrecision 
                                                      OpDecorate %420 RelaxedPrecision 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %423 RelaxedPrecision 
                                                      OpDecorate %424 RelaxedPrecision 
                                                      OpDecorate %425 RelaxedPrecision 
                                                      OpDecorate %456 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %545 SpecId 545 
                                                      OpDecorate %633 DescriptorSet 633 
                                                      OpDecorate %633 Binding 633 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %645 RelaxedPrecision 
                                                      OpDecorate %647 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate %652 RelaxedPrecision 
                                                      OpDecorate %659 DescriptorSet 659 
                                                      OpDecorate %659 Binding 659 
                                                      OpDecorate %666 RelaxedPrecision 
                                                      OpDecorate %672 RelaxedPrecision 
                                                      OpDecorate %673 RelaxedPrecision 
                                                      OpDecorate %676 RelaxedPrecision 
                                                      OpDecorate %677 RelaxedPrecision 
                                                      OpDecorate %678 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypePointer Private %30 
                               Private f32_3* %32 = OpVariable Private 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %7 %36 
                                              %38 = OpTypeArray %7 %36 
                                              %39 = OpTypeStruct %7 %7 %7 %37 %30 %30 %7 %38 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %7 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32_4;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 9 
                                              %44 = OpTypePointer Uniform %7 
                               Private f32_3* %49 = OpVariable Private 
                                          i32 %58 = OpConstant 0 
                                          i32 %62 = OpConstant 19 
                               Private f32_4* %67 = OpVariable Private 
                                          i32 %70 = OpConstant 11 
                                              %71 = OpTypePointer Uniform %6 
                                              %87 = OpTypePointer Input %30 
                                 Input f32_3* %88 = OpVariable Input 
                                          u32 %89 = OpConstant 1 
                                              %90 = OpTypePointer Input %6 
                               Private f32_3* %97 = OpVariable Private 
                                             %107 = OpTypePointer Private %15 
                              Private f32_2* %108 = OpVariable Private 
                                         f32 %119 = OpConstant 3.67402E-40 
                                         f32 %124 = OpConstant 3.67402E-40 
                                         i32 %135 = OpConstant 8 
                              Private f32_2* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                       f32_2 %147 = OpConstantComposite %145 %146 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_2 %153 = OpConstantComposite %151 %152 
                                         f32 %192 = OpConstant 3.67402E-40 
                                       f32_2 %193 = OpConstantComposite %192 %192 
 UniformConstant read_only Texture2DSampled* %199 = OpVariable UniformConstant 
                                         f32 %207 = OpConstant 3.67402E-40 
                                       f32_2 %208 = OpConstantComposite %207 %207 
                                         f32 %214 = OpConstant 3.67402E-40 
                                       f32_2 %215 = OpConstantComposite %214 %124 
                              Private f32_3* %222 = OpVariable Private 
                                         i32 %228 = OpConstant 16 
                                         f32 %231 = OpConstant 3.67402E-40 
                                Private f32* %234 = OpVariable Private 
                                             %235 = OpTypePointer Input %7 
                                Input f32_4* %236 = OpVariable Input 
                                         f32 %239 = OpConstant 3.67402E-40 
                                Private f32* %241 = OpVariable Private 
                                         u32 %242 = OpConstant 2 
                                         f32 %245 = OpConstant 3.67402E-40 
                                         f32 %252 = OpConstant 3.67402E-40 
                                         f32 %255 = OpConstant 3.67402E-40 
                                         f32 %262 = OpConstant 3.67402E-40 
                                       f32_2 %263 = OpConstantComposite %255 %262 
                              Private f32_4* %265 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %266 = OpVariable UniformConstant 
                              Private f32_3* %270 = OpVariable Private 
                                         f32 %273 = OpConstant 3.67402E-40 
                                         f32 %274 = OpConstant 3.67402E-40 
                                       f32_3 %275 = OpConstantComposite %273 %274 %274 
                              Private f32_2* %277 = OpVariable Private 
                                         f32 %280 = OpConstant 3.67402E-40 
                                         f32 %300 = OpConstant 3.67402E-40 
                                         i32 %302 = OpConstant 18 
                                             %307 = OpTypeBool 
                                             %308 = OpTypePointer Private %307 
                               Private bool* %309 = OpVariable Private 
                                Input f32_4* %310 = OpVariable Input 
                                       f32_2 %323 = OpConstantComposite %300 %300 
                                         f32 %329 = OpConstant 3.67402E-40 
                                         f32 %330 = OpConstant 3.67402E-40 
                                       f32_2 %331 = OpConstantComposite %329 %330 
                                         f32 %336 = OpConstant 3.67402E-40 
                              Private f32_3* %345 = OpVariable Private 
                                             %346 = OpTypePointer Function %30 
                                         f32 %358 = OpConstant 3.67402E-40 
                                         f32 %359 = OpConstant 3.67402E-40 
                                       f32_2 %360 = OpConstantComposite %358 %359 
                               Private bool* %362 = OpVariable Private 
                              Private f32_3* %368 = OpVariable Private 
                                Private f32* %385 = OpVariable Private 
                                             %386 = OpTypePointer Function %6 
                                             %395 = OpTypePointer Output %7 
                               Output f32_4* %396 = OpVariable Output 
                                         u32 %397 = OpConstant 3 
                                             %402 = OpTypePointer Output %6 
                                         i32 %405 = OpConstant 14 
                                         i32 %413 = OpConstant 15 
                                         i32 %430 = OpConstant 13 
                                         i32 %439 = OpConstant 12 
                                         f32 %462 = OpConstant 3.67402E-40 
                                       f32_3 %463 = OpConstantComposite %462 %462 %462 
                                Private f32* %468 = OpVariable Private 
                                         i32 %471 = OpConstant 10 
                                         i32 %476 = OpConstant 17 
                                         i32 %495 = OpConstant 7 
                                         i32 %496 = OpConstant 1 
                                         i32 %514 = OpConstant 2 
                                         i32 %528 = OpConstant 3 
                               Private bool* %535 = OpVariable Private 
                                        bool %539 = OpConstantFalse 
                                        bool %545 = OpSpecConstantFalse 
                                         i32 %602 = OpConstant 5 
                                             %603 = OpTypePointer Uniform %30 
                                         i32 %612 = OpConstant 4 
                                             %630 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %631 = OpTypeSampledImage %630 
                                             %632 = OpTypePointer UniformConstant %631 
 UniformConstant read_only Texture3DSampled* %633 = OpVariable UniformConstant 
                              Private f32_4* %638 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %659 = OpVariable UniformConstant 
                                         i32 %670 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %347 = OpVariable Function 
                             Function f32_3* %372 = OpVariable Function 
                               Function f32* %387 = OpVariable Function 
                             Function f32_3* %589 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %22 = OpLoad %21 
                                        f32_2 %23 = OpLoad %17 
                                        f32_4 %24 = OpImageSampleImplicitLod %22 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %20 %26 
                                                      OpStore %29 %27 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_3 %35 = OpFNegate %34 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %35 %47 
                                                      OpStore %32 %48 
                               Uniform f32_4* %50 = OpAccessChain %41 %43 
                                        f32_4 %51 = OpLoad %50 
                                        f32_3 %52 = OpVectorShuffle %51 %51 3 3 3 
                                        f32_3 %53 = OpLoad %32 
                                        f32_3 %54 = OpFMul %52 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFAdd %54 %56 
                                                      OpStore %49 %57 
                               Uniform f32_4* %59 = OpAccessChain %41 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               Uniform f32_4* %63 = OpAccessChain %41 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFAdd %61 %65 
                                                      OpStore %32 %66 
                                        f32_3 %68 = OpLoad %32 
                                        f32_4 %69 = OpVectorShuffle %68 %68 1 1 0 0 
                                 Uniform f32* %72 = OpAccessChain %41 %70 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %41 %70 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %76 = OpAccessChain %41 %70 
                                          f32 %77 = OpLoad %76 
                                 Uniform f32* %78 = OpAccessChain %41 %70 
                                          f32 %79 = OpLoad %78 
                                        f32_4 %80 = OpCompositeConstruct %73 %75 %77 %79 
                                          f32 %81 = OpCompositeExtract %80 0 
                                          f32 %82 = OpCompositeExtract %80 1 
                                          f32 %83 = OpCompositeExtract %80 2 
                                          f32 %84 = OpCompositeExtract %80 3 
                                        f32_4 %85 = OpCompositeConstruct %81 %82 %83 %84 
                                        f32_4 %86 = OpFMul %69 %85 
                                                      OpStore %67 %86 
                                   Input f32* %91 = OpAccessChain %88 %89 
                                          f32 %92 = OpLoad %91 
                                   Input f32* %93 = OpAccessChain %88 %26 
                                          f32 %94 = OpLoad %93 
                                          f32 %95 = OpFAdd %92 %94 
                                 Private f32* %96 = OpAccessChain %32 %26 
                                                      OpStore %96 %95 
                                 Private f32* %98 = OpAccessChain %32 %89 
                                          f32 %99 = OpLoad %98 
                                Uniform f32* %100 = OpAccessChain %41 %70 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFMul %99 %101 
                                Private f32* %103 = OpAccessChain %32 %26 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %97 %26 
                                                      OpStore %106 %105 
                                Private f32* %109 = OpAccessChain %97 %26 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpExtInst %1 14 %110 
                                Private f32* %112 = OpAccessChain %108 %26 
                                                      OpStore %112 %111 
                                Private f32* %113 = OpAccessChain %97 %26 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpExtInst %1 13 %114 
                                Private f32* %116 = OpAccessChain %97 %26 
                                                      OpStore %116 %115 
                                Private f32* %117 = OpAccessChain %108 %26 
                                         f32 %118 = OpLoad %117 
                                         f32 %120 = OpFMul %118 %119 
                                Private f32* %121 = OpAccessChain %108 %26 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %97 %26 
                                         f32 %123 = OpLoad %122 
                                         f32 %125 = OpFMul %123 %124 
                                Private f32* %126 = OpAccessChain %108 %89 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %108 
                                       f32_3 %128 = OpLoad %88 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_3 %131 = OpLoad %97 
                                       f32_3 %132 = OpVectorShuffle %131 %130 3 4 2 
                                                      OpStore %97 %132 
                                       f32_3 %133 = OpLoad %97 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                                Uniform f32* %136 = OpAccessChain %41 %135 
                                         f32 %137 = OpLoad %136 
                                       f32_2 %138 = OpCompositeConstruct %137 %137 
                                       f32_2 %139 = OpFMul %134 %138 
                                       f32_3 %140 = OpLoad %97 
                                       f32_3 %141 = OpVectorShuffle %140 %139 3 4 2 
                                                      OpStore %97 %141 
                                       f32_4 %143 = OpLoad %67 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %148 = OpFMul %144 %147 
                                                      OpStore %142 %148 
                                       f32_4 %149 = OpLoad %67 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %154 = OpFMul %150 %153 
                                       f32_3 %155 = OpLoad %32 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 0 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %67 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %67 %159 
                                Private f32* %160 = OpAccessChain %67 %26 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 14 %161 
                                Private f32* %163 = OpAccessChain %32 %26 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %32 %26 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %165 %119 
                                Private f32* %167 = OpAccessChain %108 %26 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %67 %89 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpExtInst %1 13 %169 
                                Private f32* %171 = OpAccessChain %32 %26 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %32 %26 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %173 %124 
                                Private f32* %175 = OpAccessChain %108 %89 
                                                      OpStore %175 %174 
                                       f32_2 %176 = OpLoad %108 
                                       f32_3 %177 = OpLoad %88 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 1 
                                       f32_2 %179 = OpFAdd %176 %178 
                                       f32_4 %180 = OpLoad %67 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 2 3 
                                                      OpStore %67 %181 
                                       f32_4 %182 = OpLoad %67 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                Uniform f32* %184 = OpAccessChain %41 %135 
                                         f32 %185 = OpLoad %184 
                                       f32_2 %186 = OpCompositeConstruct %185 %185 
                                       f32_2 %187 = OpFMul %183 %186 
                                       f32_4 %188 = OpLoad %67 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 2 3 
                                                      OpStore %67 %189 
                                       f32_3 %190 = OpLoad %97 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %194 = OpFMul %191 %193 
                                       f32_2 %195 = OpLoad %142 
                                       f32_2 %196 = OpFAdd %194 %195 
                                       f32_3 %197 = OpLoad %97 
                                       f32_3 %198 = OpVectorShuffle %197 %196 3 4 2 
                                                      OpStore %97 %198 
                  read_only Texture2DSampled %200 = OpLoad %199 
                                       f32_3 %201 = OpLoad %97 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_4 %203 = OpImageSampleImplicitLod %200 %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                                      OpStore %97 %204 
                                       f32_4 %205 = OpLoad %67 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                                       f32_2 %209 = OpFMul %206 %208 
                                       f32_4 %210 = OpLoad %67 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 5 2 3 
                                                      OpStore %67 %211 
                                       f32_4 %212 = OpLoad %67 
                                       f32_2 %213 = OpVectorShuffle %212 %212 3 3 
                                       f32_2 %216 = OpFMul %213 %215 
                                       f32_4 %217 = OpLoad %67 
                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
                                       f32_2 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %67 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 2 3 
                                                      OpStore %67 %221 
                  read_only Texture2DSampled %223 = OpLoad %199 
                                       f32_4 %224 = OpLoad %67 
                                       f32_2 %225 = OpVectorShuffle %224 %224 0 1 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                                      OpStore %222 %227 
                                Uniform f32* %229 = OpAccessChain %41 %228 
                                         f32 %230 = OpLoad %229 
                                         f32 %232 = OpFAdd %230 %231 
                                Private f32* %233 = OpAccessChain %32 %26 
                                                      OpStore %233 %232 
                                  Input f32* %237 = OpAccessChain %236 %89 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                                      OpStore %234 %240 
                                Private f32* %243 = OpAccessChain %32 %242 
                                         f32 %244 = OpLoad %243 
                                         f32 %246 = OpFMul %244 %245 
                                         f32 %247 = OpLoad %234 
                                         f32 %248 = OpFAdd %246 %247 
                                                      OpStore %241 %248 
                                         f32 %249 = OpLoad %241 
                                         f32 %250 = OpExtInst %1 13 %249 
                                                      OpStore %241 %250 
                                         f32 %251 = OpLoad %241 
                                         f32 %253 = OpFMul %251 %252 
                                Private f32* %254 = OpAccessChain %108 %26 
                                                      OpStore %254 %253 
                                Private f32* %256 = OpAccessChain %108 %89 
                                                      OpStore %256 %255 
                                       f32_2 %257 = OpLoad %108 
                                       f32_4 %258 = OpLoad %236 
                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
                                       f32_2 %260 = OpFAdd %257 %259 
                                                      OpStore %108 %260 
                                       f32_2 %261 = OpLoad %108 
                                       f32_2 %264 = OpFAdd %261 %263 
                                                      OpStore %108 %264 
                  read_only Texture2DSampled %267 = OpLoad %266 
                                       f32_2 %268 = OpLoad %108 
                                       f32_4 %269 = OpImageSampleImplicitLod %267 %268 
                                                      OpStore %265 %269 
                                       f32_3 %271 = OpLoad %88 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 0 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %270 %276 
                                  Input f32* %278 = OpAccessChain %88 %26 
                                         f32 %279 = OpLoad %278 
                                         f32 %281 = OpFMul %279 %280 
                                Private f32* %282 = OpAccessChain %32 %89 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFAdd %281 %283 
                                Private f32* %285 = OpAccessChain %277 %26 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %277 %26 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpExtInst %1 13 %287 
                                Private f32* %289 = OpAccessChain %277 %26 
                                                      OpStore %289 %288 
                                Private f32* %290 = OpAccessChain %270 %26 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpExtInst %1 14 %291 
                                                      OpStore %241 %292 
                                         f32 %293 = OpLoad %241 
                                Private f32* %294 = OpAccessChain %277 %26 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFMul %293 %295 
                                Private f32* %297 = OpAccessChain %277 %26 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %277 %26 
                                         f32 %299 = OpLoad %298 
                                         f32 %301 = OpFMul %299 %300 
                                Uniform f32* %303 = OpAccessChain %41 %302 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpFAdd %301 %304 
                                Private f32* %306 = OpAccessChain %277 %26 
                                                      OpStore %306 %305 
                                  Input f32* %311 = OpAccessChain %310 %26 
                                         f32 %312 = OpLoad %311 
                                Private f32* %313 = OpAccessChain %277 %26 
                                         f32 %314 = OpLoad %313 
                                        bool %315 = OpFOrdLessThan %312 %314 
                                                      OpStore %309 %315 
                                       f32_3 %316 = OpLoad %270 
                                       f32_2 %317 = OpVectorShuffle %316 %316 1 2 
                                       f32_2 %318 = OpExtInst %1 8 %317 
                                       f32_3 %319 = OpLoad %270 
                                       f32_3 %320 = OpVectorShuffle %319 %318 3 4 2 
                                                      OpStore %270 %320 
                                       f32_3 %321 = OpLoad %270 
                                       f32_2 %322 = OpVectorShuffle %321 %321 0 1 
                                       f32_2 %324 = OpFMul %322 %323 
                                       f32_3 %325 = OpLoad %270 
                                       f32_3 %326 = OpVectorShuffle %325 %324 3 4 2 
                                                      OpStore %270 %326 
                                       f32_3 %327 = OpLoad %270 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
                                         f32 %332 = OpDot %328 %331 
                                                      OpStore %234 %332 
                                         f32 %333 = OpLoad %234 
                                         f32 %334 = OpExtInst %1 13 %333 
                                                      OpStore %234 %334 
                                         f32 %335 = OpLoad %234 
                                         f32 %337 = OpFMul %335 %336 
                                                      OpStore %234 %337 
                                         f32 %338 = OpLoad %234 
                                         f32 %339 = OpExtInst %1 10 %338 
                                                      OpStore %234 %339 
                                         f32 %340 = OpLoad %234 
                                         f32 %341 = OpFMul %340 %145 
                                         f32 %342 = OpFAdd %341 %145 
                                                      OpStore %234 %342 
                                         f32 %343 = OpLoad %234 
                                         f32 %344 = OpFMul %343 %145 
                                                      OpStore %234 %344 
                                        bool %348 = OpLoad %309 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %348 %349 %353 
                                             %349 = OpLabel 
                                         f32 %351 = OpLoad %234 
                                       f32_3 %352 = OpCompositeConstruct %351 %351 %351 
                                                      OpStore %347 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                                       f32_3 %354 = OpLoad %97 
                                                      OpStore %347 %354 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                       f32_3 %355 = OpLoad %347 
                                                      OpStore %345 %355 
                                       f32_2 %356 = OpLoad %277 
                                       f32_2 %357 = OpVectorShuffle %356 %356 0 0 
                                       f32_2 %361 = OpFAdd %357 %360 
                                                      OpStore %277 %361 
                                  Input f32* %363 = OpAccessChain %310 %26 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %277 %26 
                                         f32 %366 = OpLoad %365 
                                        bool %367 = OpFOrdLessThan %364 %366 
                                                      OpStore %362 %367 
                                       f32_3 %369 = OpLoad %345 
                                       f32_3 %370 = OpLoad %345 
                                       f32_3 %371 = OpFAdd %369 %370 
                                                      OpStore %368 %371 
                                        bool %373 = OpLoad %362 
                                                      OpSelectionMerge %375 None 
                                                      OpBranchConditional %373 %374 %377 
                                             %374 = OpLabel 
                                       f32_3 %376 = OpLoad %368 
                                                      OpStore %372 %376 
                                                      OpBranch %375 
                                             %377 = OpLabel 
                                       f32_3 %378 = OpLoad %345 
                                                      OpStore %372 %378 
                                                      OpBranch %375 
                                             %375 = OpLabel 
                                       f32_3 %379 = OpLoad %372 
                                                      OpStore %345 %379 
                                Private f32* %380 = OpAccessChain %277 %89 
                                         f32 %381 = OpLoad %380 
                                  Input f32* %382 = OpAccessChain %310 %26 
                                         f32 %383 = OpLoad %382 
                                        bool %384 = OpFOrdLessThan %381 %383 
                                                      OpStore %362 %384 
                                        bool %388 = OpLoad %362 
                                                      OpSelectionMerge %390 None 
                                                      OpBranchConditional %388 %389 %391 
                                             %389 = OpLabel 
                                                      OpStore %387 %231 
                                                      OpBranch %390 
                                             %391 = OpLabel 
                                Private f32* %392 = OpAccessChain %20 %26 
                                         f32 %393 = OpLoad %392 
                                                      OpStore %387 %393 
                                                      OpBranch %390 
                                             %390 = OpLabel 
                                         f32 %394 = OpLoad %387 
                                                      OpStore %385 %394 
                                Private f32* %398 = OpAccessChain %9 %397 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpLoad %385 
                                         f32 %401 = OpFMul %399 %400 
                                 Output f32* %403 = OpAccessChain %396 %397 
                                                      OpStore %403 %401 
                                       f32_3 %404 = OpLoad %345 
                                Uniform f32* %406 = OpAccessChain %41 %405 
                                         f32 %407 = OpLoad %406 
                                       f32_3 %408 = OpCompositeConstruct %407 %407 %407 
                                       f32_3 %409 = OpFMul %404 %408 
                                       f32_4 %410 = OpLoad %20 
                                       f32_4 %411 = OpVectorShuffle %410 %409 4 1 5 6 
                                                      OpStore %20 %411 
                                       f32_3 %412 = OpLoad %222 
                                Uniform f32* %414 = OpAccessChain %41 %413 
                                         f32 %415 = OpLoad %414 
                                Uniform f32* %416 = OpAccessChain %41 %413 
                                         f32 %417 = OpLoad %416 
                                Uniform f32* %418 = OpAccessChain %41 %413 
                                         f32 %419 = OpLoad %418 
                                       f32_3 %420 = OpCompositeConstruct %415 %417 %419 
                                         f32 %421 = OpCompositeExtract %420 0 
                                         f32 %422 = OpCompositeExtract %420 1 
                                         f32 %423 = OpCompositeExtract %420 2 
                                       f32_3 %424 = OpCompositeConstruct %421 %422 %423 
                                       f32_3 %425 = OpFMul %412 %424 
                                       f32_4 %426 = OpLoad %67 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 6 3 
                                                      OpStore %67 %427 
                                       f32_4 %428 = OpLoad %67 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                              Uniform f32_4* %431 = OpAccessChain %41 %430 
                                       f32_4 %432 = OpLoad %431 
                                       f32_3 %433 = OpVectorShuffle %432 %432 0 1 2 
                                       f32_3 %434 = OpFMul %429 %433 
                                       f32_4 %435 = OpLoad %67 
                                       f32_4 %436 = OpVectorShuffle %435 %434 4 5 6 3 
                                                      OpStore %67 %436 
                                       f32_4 %437 = OpLoad %20 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 2 3 
                              Uniform f32_4* %440 = OpAccessChain %41 %439 
                                       f32_4 %441 = OpLoad %440 
                                       f32_3 %442 = OpVectorShuffle %441 %441 0 1 2 
                                       f32_3 %443 = OpFMul %438 %442 
                                       f32_4 %444 = OpLoad %67 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_3 %446 = OpFNegate %445 
                                       f32_3 %447 = OpFAdd %443 %446 
                                       f32_4 %448 = OpLoad %20 
                                       f32_4 %449 = OpVectorShuffle %448 %447 4 1 5 6 
                                                      OpStore %20 %449 
                                       f32_3 %450 = OpLoad %49 
                                       f32_3 %451 = OpLoad %32 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 0 0 
                                       f32_3 %453 = OpFMul %450 %452 
                                                      OpStore %49 %453 
                                       f32_4 %454 = OpLoad %20 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 2 3 
                                         f32 %456 = OpLoad %385 
                                       f32_3 %457 = OpCompositeConstruct %456 %456 %456 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %459 = OpLoad %49 
                                       f32_3 %460 = OpFAdd %458 %459 
                                                      OpStore %49 %460 
                                       f32_3 %461 = OpLoad %49 
                                       f32_3 %464 = OpFMul %461 %463 
                                       f32_4 %465 = OpLoad %265 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_3 %467 = OpFAdd %464 %466 
                                                      OpStore %345 %467 
                                Private f32* %469 = OpAccessChain %265 %397 
                                         f32 %470 = OpLoad %469 
                                Uniform f32* %472 = OpAccessChain %41 %471 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFMul %470 %473 
                                                      OpStore %468 %474 
                                         f32 %475 = OpLoad %468 
                                Uniform f32* %477 = OpAccessChain %41 %476 
                                         f32 %478 = OpLoad %477 
                                         f32 %479 = OpFMul %475 %478 
                                                      OpStore %468 %479 
                                       f32_3 %480 = OpLoad %49 
                                       f32_3 %481 = OpFNegate %480 
                                       f32_3 %482 = OpLoad %345 
                                       f32_3 %483 = OpFAdd %481 %482 
                                       f32_4 %484 = OpLoad %20 
                                       f32_4 %485 = OpVectorShuffle %484 %483 4 5 6 3 
                                                      OpStore %20 %485 
                                         f32 %486 = OpLoad %468 
                                       f32_3 %487 = OpCompositeConstruct %486 %486 %486 
                                       f32_4 %488 = OpLoad %20 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 1 2 
                                       f32_3 %490 = OpFMul %487 %489 
                                       f32_3 %491 = OpLoad %49 
                                       f32_3 %492 = OpFAdd %490 %491 
                                                      OpStore %49 %492 
                                       f32_3 %493 = OpLoad %88 
                                       f32_3 %494 = OpVectorShuffle %493 %493 1 1 1 
                              Uniform f32_4* %497 = OpAccessChain %41 %495 %496 
                                       f32_4 %498 = OpLoad %497 
                                       f32_3 %499 = OpVectorShuffle %498 %498 0 1 2 
                                       f32_3 %500 = OpFMul %494 %499 
                                       f32_4 %501 = OpLoad %20 
                                       f32_4 %502 = OpVectorShuffle %501 %500 4 5 6 3 
                                                      OpStore %20 %502 
                              Uniform f32_4* %503 = OpAccessChain %41 %495 %58 
                                       f32_4 %504 = OpLoad %503 
                                       f32_3 %505 = OpVectorShuffle %504 %504 0 1 2 
                                       f32_3 %506 = OpLoad %88 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 0 0 
                                       f32_3 %508 = OpFMul %505 %507 
                                       f32_4 %509 = OpLoad %20 
                                       f32_3 %510 = OpVectorShuffle %509 %509 0 1 2 
                                       f32_3 %511 = OpFAdd %508 %510 
                                       f32_4 %512 = OpLoad %20 
                                       f32_4 %513 = OpVectorShuffle %512 %511 4 5 6 3 
                                                      OpStore %20 %513 
                              Uniform f32_4* %515 = OpAccessChain %41 %495 %514 
                                       f32_4 %516 = OpLoad %515 
                                       f32_3 %517 = OpVectorShuffle %516 %516 0 1 2 
                                       f32_3 %518 = OpLoad %88 
                                       f32_3 %519 = OpVectorShuffle %518 %518 2 2 2 
                                       f32_3 %520 = OpFMul %517 %519 
                                       f32_4 %521 = OpLoad %20 
                                       f32_3 %522 = OpVectorShuffle %521 %521 0 1 2 
                                       f32_3 %523 = OpFAdd %520 %522 
                                       f32_4 %524 = OpLoad %20 
                                       f32_4 %525 = OpVectorShuffle %524 %523 4 5 6 3 
                                                      OpStore %20 %525 
                                       f32_4 %526 = OpLoad %20 
                                       f32_3 %527 = OpVectorShuffle %526 %526 0 1 2 
                              Uniform f32_4* %529 = OpAccessChain %41 %495 %528 
                                       f32_4 %530 = OpLoad %529 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
                                       f32_3 %532 = OpFAdd %527 %531 
                                       f32_4 %533 = OpLoad %20 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %20 %534 
                                Uniform f32* %536 = OpAccessChain %41 %514 %26 
                                         f32 %537 = OpLoad %536 
                                        bool %538 = OpFOrdEqual %537 %231 
                                                      OpStore %535 %538 
                                                      OpSelectionMerge %541 None 
                                                      OpBranchConditional %539 %540 %541 
                                             %540 = OpLabel 
                                        bool %542 = OpLoad %535 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %542 %543 %544 
                                             %543 = OpLabel 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                                      OpBranch %541 
                                             %541 = OpLabel 
                                                      OpSelectionMerge %547 None 
                                                      OpBranchConditional %545 %546 %640 
                                             %546 = OpLabel 
                                Uniform f32* %548 = OpAccessChain %41 %514 %89 
                                         f32 %549 = OpLoad %548 
                                        bool %550 = OpFOrdEqual %549 %231 
                                                      OpStore %535 %550 
                                       f32_3 %551 = OpLoad %88 
                                       f32_3 %552 = OpVectorShuffle %551 %551 1 1 1 
                              Uniform f32_4* %553 = OpAccessChain %41 %528 %496 
                                       f32_4 %554 = OpLoad %553 
                                       f32_3 %555 = OpVectorShuffle %554 %554 0 1 2 
                                       f32_3 %556 = OpFMul %552 %555 
                                       f32_4 %557 = OpLoad %67 
                                       f32_4 %558 = OpVectorShuffle %557 %556 4 5 6 3 
                                                      OpStore %67 %558 
                              Uniform f32_4* %559 = OpAccessChain %41 %528 %58 
                                       f32_4 %560 = OpLoad %559 
                                       f32_3 %561 = OpVectorShuffle %560 %560 0 1 2 
                                       f32_3 %562 = OpLoad %88 
                                       f32_3 %563 = OpVectorShuffle %562 %562 0 0 0 
                                       f32_3 %564 = OpFMul %561 %563 
                                       f32_4 %565 = OpLoad %67 
                                       f32_3 %566 = OpVectorShuffle %565 %565 0 1 2 
                                       f32_3 %567 = OpFAdd %564 %566 
                                       f32_4 %568 = OpLoad %67 
                                       f32_4 %569 = OpVectorShuffle %568 %567 4 5 6 3 
                                                      OpStore %67 %569 
                              Uniform f32_4* %570 = OpAccessChain %41 %528 %514 
                                       f32_4 %571 = OpLoad %570 
                                       f32_3 %572 = OpVectorShuffle %571 %571 0 1 2 
                                       f32_3 %573 = OpLoad %88 
                                       f32_3 %574 = OpVectorShuffle %573 %573 2 2 2 
                                       f32_3 %575 = OpFMul %572 %574 
                                       f32_4 %576 = OpLoad %67 
                                       f32_3 %577 = OpVectorShuffle %576 %576 0 1 2 
                                       f32_3 %578 = OpFAdd %575 %577 
                                       f32_4 %579 = OpLoad %67 
                                       f32_4 %580 = OpVectorShuffle %579 %578 4 5 6 3 
                                                      OpStore %67 %580 
                                       f32_4 %581 = OpLoad %67 
                                       f32_3 %582 = OpVectorShuffle %581 %581 0 1 2 
                              Uniform f32_4* %583 = OpAccessChain %41 %528 %528 
                                       f32_4 %584 = OpLoad %583 
                                       f32_3 %585 = OpVectorShuffle %584 %584 0 1 2 
                                       f32_3 %586 = OpFAdd %582 %585 
                                       f32_4 %587 = OpLoad %67 
                                       f32_4 %588 = OpVectorShuffle %587 %586 4 5 6 3 
                                                      OpStore %67 %588 
                                        bool %590 = OpLoad %535 
                                                      OpSelectionMerge %592 None 
                                                      OpBranchConditional %590 %591 %595 
                                             %591 = OpLabel 
                                       f32_4 %593 = OpLoad %67 
                                       f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
                                                      OpStore %589 %594 
                                                      OpBranch %592 
                                             %595 = OpLabel 
                                       f32_3 %596 = OpLoad %88 
                                                      OpStore %589 %596 
                                                      OpBranch %592 
                                             %592 = OpLabel 
                                       f32_3 %597 = OpLoad %589 
                                       f32_4 %598 = OpLoad %67 
                                       f32_4 %599 = OpVectorShuffle %598 %597 4 5 6 3 
                                                      OpStore %67 %599 
                                       f32_4 %600 = OpLoad %67 
                                       f32_3 %601 = OpVectorShuffle %600 %600 0 1 2 
                              Uniform f32_3* %604 = OpAccessChain %41 %602 
                                       f32_3 %605 = OpLoad %604 
                                       f32_3 %606 = OpFNegate %605 
                                       f32_3 %607 = OpFAdd %601 %606 
                                       f32_4 %608 = OpLoad %67 
                                       f32_4 %609 = OpVectorShuffle %608 %607 4 5 6 3 
                                                      OpStore %67 %609 
                                       f32_4 %610 = OpLoad %67 
                                       f32_3 %611 = OpVectorShuffle %610 %610 0 1 2 
                              Uniform f32_3* %613 = OpAccessChain %41 %612 
                                       f32_3 %614 = OpLoad %613 
                                       f32_3 %615 = OpFMul %611 %614 
                                       f32_4 %616 = OpLoad %67 
                                       f32_4 %617 = OpVectorShuffle %616 %615 0 4 5 6 
                                                      OpStore %67 %617 
                                Private f32* %618 = OpAccessChain %67 %89 
                                         f32 %619 = OpLoad %618 
                                         f32 %620 = OpFMul %619 %214 
                                         f32 %621 = OpFAdd %620 %462 
                                                      OpStore %468 %621 
                                Uniform f32* %622 = OpAccessChain %41 %514 %242 
                                         f32 %623 = OpLoad %622 
                                         f32 %624 = OpFMul %623 %145 
                                         f32 %625 = OpFAdd %624 %462 
                                                      OpStore %241 %625 
                                         f32 %626 = OpLoad %468 
                                         f32 %627 = OpLoad %241 
                                         f32 %628 = OpExtInst %1 40 %626 %627 
                                Private f32* %629 = OpAccessChain %67 %26 
                                                      OpStore %629 %628 
                  read_only Texture3DSampled %634 = OpLoad %633 
                                       f32_4 %635 = OpLoad %67 
                                       f32_3 %636 = OpVectorShuffle %635 %635 0 2 3 
                                       f32_4 %637 = OpImageSampleImplicitLod %634 %636 
                                                      OpStore %67 %637 
                                       f32_4 %639 = OpLoad %67 
                                                      OpStore %638 %639 
                                                      OpBranch %547 
                                             %640 = OpLabel 
                                Private f32* %641 = OpAccessChain %638 %26 
                                                      OpStore %641 %231 
                                Private f32* %642 = OpAccessChain %638 %89 
                                                      OpStore %642 %231 
                                Private f32* %643 = OpAccessChain %638 %242 
                                                      OpStore %643 %231 
                                Private f32* %644 = OpAccessChain %638 %397 
                                                      OpStore %644 %231 
                                                      OpBranch %547 
                                             %547 = OpLabel 
                                       f32_4 %645 = OpLoad %638 
                              Uniform f32_4* %646 = OpAccessChain %41 %496 
                                       f32_4 %647 = OpLoad %646 
                                         f32 %648 = OpDot %645 %647 
                                Private f32* %649 = OpAccessChain %345 %26 
                                                      OpStore %649 %648 
                                Private f32* %650 = OpAccessChain %345 %26 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpExtInst %1 43 %651 %255 %231 
                                Private f32* %653 = OpAccessChain %345 %26 
                                                      OpStore %653 %652 
                                       f32_4 %654 = OpLoad %20 
                                       f32_3 %655 = OpVectorShuffle %654 %654 0 1 2 
                                       f32_4 %656 = OpLoad %20 
                                       f32_3 %657 = OpVectorShuffle %656 %656 0 1 2 
                                         f32 %658 = OpDot %655 %657 
                                                      OpStore %468 %658 
                  read_only Texture2DSampled %660 = OpLoad %659 
                                         f32 %661 = OpLoad %468 
                                       f32_2 %662 = OpCompositeConstruct %661 %661 
                                       f32_4 %663 = OpImageSampleImplicitLod %660 %662 
                                         f32 %664 = OpCompositeExtract %663 3 
                                                      OpStore %468 %664 
                                Private f32* %665 = OpAccessChain %345 %26 
                                         f32 %666 = OpLoad %665 
                                         f32 %667 = OpLoad %468 
                                         f32 %668 = OpFMul %666 %667 
                                                      OpStore %468 %668 
                                       f32_3 %669 = OpLoad %49 
                              Uniform f32_4* %671 = OpAccessChain %41 %670 
                                       f32_4 %672 = OpLoad %671 
                                       f32_3 %673 = OpVectorShuffle %672 %672 0 1 2 
                                       f32_3 %674 = OpFMul %669 %673 
                                                      OpStore %345 %674 
                                         f32 %675 = OpLoad %468 
                                       f32_3 %676 = OpCompositeConstruct %675 %675 %675 
                                       f32_3 %677 = OpLoad %345 
                                       f32_3 %678 = OpFMul %676 %677 
                                       f32_4 %679 = OpLoad %396 
                                       f32_4 %680 = OpVectorShuffle %679 %678 4 5 6 3 
                                                      OpStore %396 %680 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat7;
vec2 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = (-u_xlat10_0.xyz) + _CausticColor.xyz;
    u_xlat0.xyz = _CausticColor.www * u_xlat7.xyz + u_xlat10_0.xyz;
    u_xlat7.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat2 = u_xlat7.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat7.x = vs_TEXCOORD2.y + vs_TEXCOORD2.x;
    u_xlat3.x = u_xlat7.y * _TimeScale + u_xlat7.x;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat4.x * 0.111111112;
    u_xlat4.y = u_xlat3.x * 0.166666672;
    u_xlat3.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat15.xy = u_xlat2.zw * vec2(0.5, 0.125);
    u_xlat2.xy = u_xlat2.xy * vec2(1.25, 0.899999976) + u_xlat7.xx;
    u_xlat7.x = cos(u_xlat2.x);
    u_xlat4.x = u_xlat7.x * 0.111111112;
    u_xlat7.x = sin(u_xlat2.y);
    u_xlat4.y = u_xlat7.x * 0.166666672;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003) + u_xlat15.xy;
    u_xlat10_3 = texture(_CausticTex, u_xlat3.xy);
    u_xlat2.xy = u_xlat2.xy * vec2(0.142857149, 0.142857149);
    u_xlat2.xy = u_xlat2.ww * vec2(0.25, 0.166666672) + u_xlat2.xy;
    u_xlat10_2 = texture(_CausticTex, u_xlat2.xy);
    u_xlat7.x = _EmissiveBoost + 1.0;
    u_xlat20 = vs_TEXCOORD3.y * 500.0;
    u_xlat19 = u_xlat7.z * 5.0 + u_xlat20;
    u_xlat19 = sin(u_xlat19);
    u_xlat4.x = u_xlat19 * 0.00150000001;
    u_xlat4.y = 0.0;
    u_xlat4.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.0, 0.075000003);
    u_xlat10_4 = texture(_ReflMapFromPixelator, u_xlat4.xy);
    u_xlat5.xyz = vs_TEXCOORD2.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat13.x = vs_TEXCOORD2.x * 6.0 + u_xlat7.y;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat19 = cos(u_xlat5.x);
    u_xlat13.x = u_xlat19 * u_xlat13.x;
    u_xlat13.x = u_xlat13.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb19 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xy = floor(u_xlat5.yz);
    u_xlat5.xy = u_xlat5.xy * vec2(0.0625, 0.0625);
    u_xlat20 = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat20 = fract(u_xlat20);
    u_xlat20 = u_xlat20 * 0.5 + 0.5;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(u_xlat20) : u_xlat10_3.xyz;
    u_xlat13.xy = u_xlat13.xx + vec2(-0.0625, -0.25);
    u_xlatb13 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlatb13 = u_xlat13.y<vs_COLOR0.x;
    u_xlat1.x = (u_xlatb13) ? 1.0 : u_xlat10_1.x;
    SV_Target0.w = u_xlat10_0.w * u_xlat1.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LightCausticPower);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_4.xyz;
    u_xlat18 = u_xlat10_4.w * _ReflPower;
    u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat1.y * 0.25 + 0.75;
        u_xlat7.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat18, u_xlat7.x);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat18 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 183
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %98 %99 %112 %142 %162 %174 %175 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %162 Location 162 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 4 
                                             %111 = OpTypePointer Input %50 
                                Input f32_3* %112 = OpVariable Input 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                               Output f32_3* %142 = OpVariable Output 
                                             %150 = OpTypePointer Uniform %6 
                                         f32 %157 = OpConstant 3.67402E-40 
                                       f32_3 %158 = OpConstantComposite %157 %157 %157 
                               Output f32_4* %162 = OpVariable Output 
                               Output f32_4* %174 = OpVariable Output 
                                Input f32_4* %175 = OpVariable Input 
                                             %177 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %114 = OpAccessChain %21 %36 %28 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %113 %116 
                                Private f32* %120 = OpAccessChain %44 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %112 
                              Uniform f32_4* %122 = OpAccessChain %21 %36 %23 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %44 %88 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %112 
                              Uniform f32_4* %128 = OpAccessChain %21 %36 %36 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %44 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %44 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %44 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %143 = OpLoad %134 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                                      OpStore %142 %147 
                                Private f32* %148 = OpAccessChain %9 %88 
                                         f32 %149 = OpLoad %148 
                                Uniform f32* %151 = OpAccessChain %21 %28 %118 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %149 %152 
                                Private f32* %154 = OpAccessChain %9 %88 
                                                      OpStore %154 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 3 1 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %44 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %44 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_2 %164 = OpVectorShuffle %163 %163 2 3 
                                       f32_4 %165 = OpLoad %162 
                                       f32_4 %166 = OpVectorShuffle %165 %164 0 1 4 5 
                                                      OpStore %162 %166 
                                       f32_4 %167 = OpLoad %44 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 2 
                                       f32_4 %169 = OpLoad %44 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 3 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %162 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %162 %173 
                                       f32_4 %176 = OpLoad %175 
                                                      OpStore %174 %176 
                                 Output f32* %178 = OpAccessChain %92 %28 %88 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFNegate %179 
                                 Output f32* %181 = OpAccessChain %92 %28 %88 
                                                      OpStore %181 %180 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 630
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %87 %235 %309 %395 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpMemberDecorate %38 0 Offset 38 
                                                      OpMemberDecorate %38 1 RelaxedPrecision 
                                                      OpMemberDecorate %38 1 Offset 38 
                                                      OpMemberDecorate %38 2 Offset 38 
                                                      OpMemberDecorate %38 3 Offset 38 
                                                      OpMemberDecorate %38 4 Offset 38 
                                                      OpMemberDecorate %38 5 Offset 38 
                                                      OpMemberDecorate %38 6 RelaxedPrecision 
                                                      OpMemberDecorate %38 6 Offset 38 
                                                      OpMemberDecorate %38 7 Offset 38 
                                                      OpMemberDecorate %38 8 Offset 38 
                                                      OpMemberDecorate %38 9 Offset 38 
                                                      OpMemberDecorate %38 10 Offset 38 
                                                      OpMemberDecorate %38 11 Offset 38 
                                                      OpMemberDecorate %38 12 Offset 38 
                                                      OpMemberDecorate %38 13 Offset 38 
                                                      OpMemberDecorate %38 14 Offset 38 
                                                      OpMemberDecorate %38 15 Offset 38 
                                                      OpMemberDecorate %38 16 Offset 38 
                                                      OpMemberDecorate %38 17 Offset 38 
                                                      OpMemberDecorate %38 18 Offset 38 
                                                      OpDecorate %38 Block 
                                                      OpDecorate %40 DescriptorSet 40 
                                                      OpDecorate %40 Binding 40 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %87 Location 87 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %198 DescriptorSet 198 
                                                      OpDecorate %198 Binding 198 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %235 Location 235 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %265 DescriptorSet 265 
                                                      OpDecorate %265 Binding 265 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 Location 309 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %395 Location 395 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %403 RelaxedPrecision 
                                                      OpDecorate %407 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %419 RelaxedPrecision 
                                                      OpDecorate %420 RelaxedPrecision 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %423 RelaxedPrecision 
                                                      OpDecorate %424 RelaxedPrecision 
                                                      OpDecorate %455 RelaxedPrecision 
                                                      OpDecorate %464 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %481 RelaxedPrecision 
                                                      OpDecorate %503 SpecId 503 
                                                      OpDecorate %595 DescriptorSet 595 
                                                      OpDecorate %595 Binding 595 
                                                      OpDecorate %600 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %610 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %614 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %620 RelaxedPrecision 
                                                      OpDecorate %621 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                                      OpDecorate %624 RelaxedPrecision 
                                                      OpDecorate %625 RelaxedPrecision 
                                                      OpDecorate %626 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypePointer Private %30 
                               Private f32_3* %32 = OpVariable Private 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %7 %36 
                                              %38 = OpTypeStruct %7 %7 %7 %37 %30 %30 %7 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %7 
                                              %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
                                              %41 = OpTypeInt 32 1 
                                          i32 %42 = OpConstant 8 
                                              %43 = OpTypePointer Uniform %7 
                               Private f32_3* %48 = OpVariable Private 
                                          i32 %57 = OpConstant 0 
                                          i32 %61 = OpConstant 18 
                               Private f32_4* %66 = OpVariable Private 
                                          i32 %69 = OpConstant 10 
                                              %70 = OpTypePointer Uniform %6 
                                              %86 = OpTypePointer Input %30 
                                 Input f32_3* %87 = OpVariable Input 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypePointer Input %6 
                               Private f32_3* %96 = OpVariable Private 
                                             %106 = OpTypePointer Private %15 
                              Private f32_2* %107 = OpVariable Private 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %123 = OpConstant 3.67402E-40 
                                         i32 %134 = OpConstant 7 
                              Private f32_2* %141 = OpVariable Private 
                                         f32 %144 = OpConstant 3.67402E-40 
                                         f32 %145 = OpConstant 3.67402E-40 
                                       f32_2 %146 = OpConstantComposite %144 %145 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %151 = OpConstant 3.67402E-40 
                                       f32_2 %152 = OpConstantComposite %150 %151 
                                         f32 %191 = OpConstant 3.67402E-40 
                                       f32_2 %192 = OpConstantComposite %191 %191 
 UniformConstant read_only Texture2DSampled* %198 = OpVariable UniformConstant 
                                         f32 %206 = OpConstant 3.67402E-40 
                                       f32_2 %207 = OpConstantComposite %206 %206 
                                         f32 %213 = OpConstant 3.67402E-40 
                                       f32_2 %214 = OpConstantComposite %213 %123 
                              Private f32_3* %221 = OpVariable Private 
                                         i32 %227 = OpConstant 15 
                                         f32 %230 = OpConstant 3.67402E-40 
                                Private f32* %233 = OpVariable Private 
                                             %234 = OpTypePointer Input %7 
                                Input f32_4* %235 = OpVariable Input 
                                         f32 %238 = OpConstant 3.67402E-40 
                                Private f32* %240 = OpVariable Private 
                                         u32 %241 = OpConstant 2 
                                         f32 %244 = OpConstant 3.67402E-40 
                                         f32 %251 = OpConstant 3.67402E-40 
                                         f32 %254 = OpConstant 3.67402E-40 
                                         f32 %261 = OpConstant 3.67402E-40 
                                       f32_2 %262 = OpConstantComposite %254 %261 
                              Private f32_4* %264 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %265 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                         f32 %272 = OpConstant 3.67402E-40 
                                         f32 %273 = OpConstant 3.67402E-40 
                                       f32_3 %274 = OpConstantComposite %272 %273 %273 
                              Private f32_2* %276 = OpVariable Private 
                                         f32 %279 = OpConstant 3.67402E-40 
                                         f32 %299 = OpConstant 3.67402E-40 
                                         i32 %301 = OpConstant 17 
                                             %306 = OpTypeBool 
                                             %307 = OpTypePointer Private %306 
                               Private bool* %308 = OpVariable Private 
                                Input f32_4* %309 = OpVariable Input 
                                       f32_2 %322 = OpConstantComposite %299 %299 
                                         f32 %328 = OpConstant 3.67402E-40 
                                         f32 %329 = OpConstant 3.67402E-40 
                                       f32_2 %330 = OpConstantComposite %328 %329 
                                         f32 %335 = OpConstant 3.67402E-40 
                              Private f32_3* %344 = OpVariable Private 
                                             %345 = OpTypePointer Function %30 
                                         f32 %357 = OpConstant 3.67402E-40 
                                         f32 %358 = OpConstant 3.67402E-40 
                                       f32_2 %359 = OpConstantComposite %357 %358 
                               Private bool* %361 = OpVariable Private 
                              Private f32_3* %367 = OpVariable Private 
                                Private f32* %384 = OpVariable Private 
                                             %385 = OpTypePointer Function %6 
                                             %394 = OpTypePointer Output %7 
                               Output f32_4* %395 = OpVariable Output 
                                         u32 %396 = OpConstant 3 
                                             %401 = OpTypePointer Output %6 
                                         i32 %404 = OpConstant 13 
                                         i32 %412 = OpConstant 14 
                                         i32 %429 = OpConstant 12 
                                         i32 %438 = OpConstant 11 
                                         f32 %461 = OpConstant 3.67402E-40 
                                       f32_3 %462 = OpConstantComposite %461 %461 %461 
                                Private f32* %467 = OpVariable Private 
                                         i32 %470 = OpConstant 9 
                                         i32 %475 = OpConstant 16 
                               Private bool* %492 = OpVariable Private 
                                         i32 %493 = OpConstant 2 
                                        bool %497 = OpConstantFalse 
                                        bool %503 = OpSpecConstantFalse 
                                         i32 %511 = OpConstant 3 
                                         i32 %512 = OpConstant 1 
                                         i32 %562 = OpConstant 5 
                                             %563 = OpTypePointer Uniform %30 
                                         i32 %572 = OpConstant 4 
                                             %592 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %593 = OpTypeSampledImage %592 
                                             %594 = OpTypePointer UniformConstant %593 
 UniformConstant read_only Texture3DSampled* %595 = OpVariable UniformConstant 
                              Private f32_4* %600 = OpVariable Private 
                              Private f32_3* %616 = OpVariable Private 
                                         i32 %618 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %346 = OpVariable Function 
                             Function f32_3* %371 = OpVariable Function 
                               Function f32* %386 = OpVariable Function 
                             Function f32_3* %549 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %22 = OpLoad %21 
                                        f32_2 %23 = OpLoad %17 
                                        f32_4 %24 = OpImageSampleImplicitLod %22 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %20 %26 
                                                      OpStore %29 %27 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_3 %35 = OpFNegate %34 
                               Uniform f32_4* %44 = OpAccessChain %40 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFAdd %35 %46 
                                                      OpStore %32 %47 
                               Uniform f32_4* %49 = OpAccessChain %40 %42 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 3 3 3 
                                        f32_3 %52 = OpLoad %32 
                                        f32_3 %53 = OpFMul %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFAdd %53 %55 
                                                      OpStore %48 %56 
                               Uniform f32_4* %58 = OpAccessChain %40 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                               Uniform f32_4* %62 = OpAccessChain %40 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %60 %64 
                                                      OpStore %32 %65 
                                        f32_3 %67 = OpLoad %32 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 0 0 
                                 Uniform f32* %71 = OpAccessChain %40 %69 
                                          f32 %72 = OpLoad %71 
                                 Uniform f32* %73 = OpAccessChain %40 %69 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %75 = OpAccessChain %40 %69 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %77 = OpAccessChain %40 %69 
                                          f32 %78 = OpLoad %77 
                                        f32_4 %79 = OpCompositeConstruct %72 %74 %76 %78 
                                          f32 %80 = OpCompositeExtract %79 0 
                                          f32 %81 = OpCompositeExtract %79 1 
                                          f32 %82 = OpCompositeExtract %79 2 
                                          f32 %83 = OpCompositeExtract %79 3 
                                        f32_4 %84 = OpCompositeConstruct %80 %81 %82 %83 
                                        f32_4 %85 = OpFMul %68 %84 
                                                      OpStore %66 %85 
                                   Input f32* %90 = OpAccessChain %87 %88 
                                          f32 %91 = OpLoad %90 
                                   Input f32* %92 = OpAccessChain %87 %26 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFAdd %91 %93 
                                 Private f32* %95 = OpAccessChain %32 %26 
                                                      OpStore %95 %94 
                                 Private f32* %97 = OpAccessChain %32 %88 
                                          f32 %98 = OpLoad %97 
                                 Uniform f32* %99 = OpAccessChain %40 %69 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFMul %98 %100 
                                Private f32* %102 = OpAccessChain %32 %26 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                Private f32* %105 = OpAccessChain %96 %26 
                                                      OpStore %105 %104 
                                Private f32* %108 = OpAccessChain %96 %26 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpExtInst %1 14 %109 
                                Private f32* %111 = OpAccessChain %107 %26 
                                                      OpStore %111 %110 
                                Private f32* %112 = OpAccessChain %96 %26 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpExtInst %1 13 %113 
                                Private f32* %115 = OpAccessChain %96 %26 
                                                      OpStore %115 %114 
                                Private f32* %116 = OpAccessChain %107 %26 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                Private f32* %120 = OpAccessChain %107 %26 
                                                      OpStore %120 %119 
                                Private f32* %121 = OpAccessChain %96 %26 
                                         f32 %122 = OpLoad %121 
                                         f32 %124 = OpFMul %122 %123 
                                Private f32* %125 = OpAccessChain %107 %88 
                                                      OpStore %125 %124 
                                       f32_2 %126 = OpLoad %107 
                                       f32_3 %127 = OpLoad %87 
                                       f32_2 %128 = OpVectorShuffle %127 %127 0 1 
                                       f32_2 %129 = OpFAdd %126 %128 
                                       f32_3 %130 = OpLoad %96 
                                       f32_3 %131 = OpVectorShuffle %130 %129 3 4 2 
                                                      OpStore %96 %131 
                                       f32_3 %132 = OpLoad %96 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                Uniform f32* %135 = OpAccessChain %40 %134 
                                         f32 %136 = OpLoad %135 
                                       f32_2 %137 = OpCompositeConstruct %136 %136 
                                       f32_2 %138 = OpFMul %133 %137 
                                       f32_3 %139 = OpLoad %96 
                                       f32_3 %140 = OpVectorShuffle %139 %138 3 4 2 
                                                      OpStore %96 %140 
                                       f32_4 %142 = OpLoad %66 
                                       f32_2 %143 = OpVectorShuffle %142 %142 2 3 
                                       f32_2 %147 = OpFMul %143 %146 
                                                      OpStore %141 %147 
                                       f32_4 %148 = OpLoad %66 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                       f32_2 %153 = OpFMul %149 %152 
                                       f32_3 %154 = OpLoad %32 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 0 
                                       f32_2 %156 = OpFAdd %153 %155 
                                       f32_4 %157 = OpLoad %66 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 2 3 
                                                      OpStore %66 %158 
                                Private f32* %159 = OpAccessChain %66 %26 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpExtInst %1 14 %160 
                                Private f32* %162 = OpAccessChain %32 %26 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %32 %26 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFMul %164 %118 
                                Private f32* %166 = OpAccessChain %107 %26 
                                                      OpStore %166 %165 
                                Private f32* %167 = OpAccessChain %66 %88 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpExtInst %1 13 %168 
                                Private f32* %170 = OpAccessChain %32 %26 
                                                      OpStore %170 %169 
                                Private f32* %171 = OpAccessChain %32 %26 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %172 %123 
                                Private f32* %174 = OpAccessChain %107 %88 
                                                      OpStore %174 %173 
                                       f32_2 %175 = OpLoad %107 
                                       f32_3 %176 = OpLoad %87 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                                       f32_2 %178 = OpFAdd %175 %177 
                                       f32_4 %179 = OpLoad %66 
                                       f32_4 %180 = OpVectorShuffle %179 %178 4 5 2 3 
                                                      OpStore %66 %180 
                                       f32_4 %181 = OpLoad %66 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                                Uniform f32* %183 = OpAccessChain %40 %134 
                                         f32 %184 = OpLoad %183 
                                       f32_2 %185 = OpCompositeConstruct %184 %184 
                                       f32_2 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %66 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 2 3 
                                                      OpStore %66 %188 
                                       f32_3 %189 = OpLoad %96 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %193 = OpFMul %190 %192 
                                       f32_2 %194 = OpLoad %141 
                                       f32_2 %195 = OpFAdd %193 %194 
                                       f32_3 %196 = OpLoad %96 
                                       f32_3 %197 = OpVectorShuffle %196 %195 3 4 2 
                                                      OpStore %96 %197 
                  read_only Texture2DSampled %199 = OpLoad %198 
                                       f32_3 %200 = OpLoad %96 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
                                       f32_4 %202 = OpImageSampleImplicitLod %199 %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                                      OpStore %96 %203 
                                       f32_4 %204 = OpLoad %66 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 1 
                                       f32_2 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %66 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 2 3 
                                                      OpStore %66 %210 
                                       f32_4 %211 = OpLoad %66 
                                       f32_2 %212 = OpVectorShuffle %211 %211 3 3 
                                       f32_2 %215 = OpFMul %212 %214 
                                       f32_4 %216 = OpLoad %66 
                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
                                       f32_2 %218 = OpFAdd %215 %217 
                                       f32_4 %219 = OpLoad %66 
                                       f32_4 %220 = OpVectorShuffle %219 %218 4 5 2 3 
                                                      OpStore %66 %220 
                  read_only Texture2DSampled %222 = OpLoad %198 
                                       f32_4 %223 = OpLoad %66 
                                       f32_2 %224 = OpVectorShuffle %223 %223 0 1 
                                       f32_4 %225 = OpImageSampleImplicitLod %222 %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                                      OpStore %221 %226 
                                Uniform f32* %228 = OpAccessChain %40 %227 
                                         f32 %229 = OpLoad %228 
                                         f32 %231 = OpFAdd %229 %230 
                                Private f32* %232 = OpAccessChain %32 %26 
                                                      OpStore %232 %231 
                                  Input f32* %236 = OpAccessChain %235 %88 
                                         f32 %237 = OpLoad %236 
                                         f32 %239 = OpFMul %237 %238 
                                                      OpStore %233 %239 
                                Private f32* %242 = OpAccessChain %32 %241 
                                         f32 %243 = OpLoad %242 
                                         f32 %245 = OpFMul %243 %244 
                                         f32 %246 = OpLoad %233 
                                         f32 %247 = OpFAdd %245 %246 
                                                      OpStore %240 %247 
                                         f32 %248 = OpLoad %240 
                                         f32 %249 = OpExtInst %1 13 %248 
                                                      OpStore %240 %249 
                                         f32 %250 = OpLoad %240 
                                         f32 %252 = OpFMul %250 %251 
                                Private f32* %253 = OpAccessChain %107 %26 
                                                      OpStore %253 %252 
                                Private f32* %255 = OpAccessChain %107 %88 
                                                      OpStore %255 %254 
                                       f32_2 %256 = OpLoad %107 
                                       f32_4 %257 = OpLoad %235 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 1 
                                       f32_2 %259 = OpFAdd %256 %258 
                                                      OpStore %107 %259 
                                       f32_2 %260 = OpLoad %107 
                                       f32_2 %263 = OpFAdd %260 %262 
                                                      OpStore %107 %263 
                  read_only Texture2DSampled %266 = OpLoad %265 
                                       f32_2 %267 = OpLoad %107 
                                       f32_4 %268 = OpImageSampleImplicitLod %266 %267 
                                                      OpStore %264 %268 
                                       f32_3 %270 = OpLoad %87 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 0 1 
                                       f32_3 %275 = OpFMul %271 %274 
                                                      OpStore %269 %275 
                                  Input f32* %277 = OpAccessChain %87 %26 
                                         f32 %278 = OpLoad %277 
                                         f32 %280 = OpFMul %278 %279 
                                Private f32* %281 = OpAccessChain %32 %88 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpFAdd %280 %282 
                                Private f32* %284 = OpAccessChain %276 %26 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %276 %26 
                                         f32 %286 = OpLoad %285 
                                         f32 %287 = OpExtInst %1 13 %286 
                                Private f32* %288 = OpAccessChain %276 %26 
                                                      OpStore %288 %287 
                                Private f32* %289 = OpAccessChain %269 %26 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpExtInst %1 14 %290 
                                                      OpStore %240 %291 
                                         f32 %292 = OpLoad %240 
                                Private f32* %293 = OpAccessChain %276 %26 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFMul %292 %294 
                                Private f32* %296 = OpAccessChain %276 %26 
                                                      OpStore %296 %295 
                                Private f32* %297 = OpAccessChain %276 %26 
                                         f32 %298 = OpLoad %297 
                                         f32 %300 = OpFMul %298 %299 
                                Uniform f32* %302 = OpAccessChain %40 %301 
                                         f32 %303 = OpLoad %302 
                                         f32 %304 = OpFAdd %300 %303 
                                Private f32* %305 = OpAccessChain %276 %26 
                                                      OpStore %305 %304 
                                  Input f32* %310 = OpAccessChain %309 %26 
                                         f32 %311 = OpLoad %310 
                                Private f32* %312 = OpAccessChain %276 %26 
                                         f32 %313 = OpLoad %312 
                                        bool %314 = OpFOrdLessThan %311 %313 
                                                      OpStore %308 %314 
                                       f32_3 %315 = OpLoad %269 
                                       f32_2 %316 = OpVectorShuffle %315 %315 1 2 
                                       f32_2 %317 = OpExtInst %1 8 %316 
                                       f32_3 %318 = OpLoad %269 
                                       f32_3 %319 = OpVectorShuffle %318 %317 3 4 2 
                                                      OpStore %269 %319 
                                       f32_3 %320 = OpLoad %269 
                                       f32_2 %321 = OpVectorShuffle %320 %320 0 1 
                                       f32_2 %323 = OpFMul %321 %322 
                                       f32_3 %324 = OpLoad %269 
                                       f32_3 %325 = OpVectorShuffle %324 %323 3 4 2 
                                                      OpStore %269 %325 
                                       f32_3 %326 = OpLoad %269 
                                       f32_2 %327 = OpVectorShuffle %326 %326 0 1 
                                         f32 %331 = OpDot %327 %330 
                                                      OpStore %233 %331 
                                         f32 %332 = OpLoad %233 
                                         f32 %333 = OpExtInst %1 13 %332 
                                                      OpStore %233 %333 
                                         f32 %334 = OpLoad %233 
                                         f32 %336 = OpFMul %334 %335 
                                                      OpStore %233 %336 
                                         f32 %337 = OpLoad %233 
                                         f32 %338 = OpExtInst %1 10 %337 
                                                      OpStore %233 %338 
                                         f32 %339 = OpLoad %233 
                                         f32 %340 = OpFMul %339 %144 
                                         f32 %341 = OpFAdd %340 %144 
                                                      OpStore %233 %341 
                                         f32 %342 = OpLoad %233 
                                         f32 %343 = OpFMul %342 %144 
                                                      OpStore %233 %343 
                                        bool %347 = OpLoad %308 
                                                      OpSelectionMerge %349 None 
                                                      OpBranchConditional %347 %348 %352 
                                             %348 = OpLabel 
                                         f32 %350 = OpLoad %233 
                                       f32_3 %351 = OpCompositeConstruct %350 %350 %350 
                                                      OpStore %346 %351 
                                                      OpBranch %349 
                                             %352 = OpLabel 
                                       f32_3 %353 = OpLoad %96 
                                                      OpStore %346 %353 
                                                      OpBranch %349 
                                             %349 = OpLabel 
                                       f32_3 %354 = OpLoad %346 
                                                      OpStore %344 %354 
                                       f32_2 %355 = OpLoad %276 
                                       f32_2 %356 = OpVectorShuffle %355 %355 0 0 
                                       f32_2 %360 = OpFAdd %356 %359 
                                                      OpStore %276 %360 
                                  Input f32* %362 = OpAccessChain %309 %26 
                                         f32 %363 = OpLoad %362 
                                Private f32* %364 = OpAccessChain %276 %26 
                                         f32 %365 = OpLoad %364 
                                        bool %366 = OpFOrdLessThan %363 %365 
                                                      OpStore %361 %366 
                                       f32_3 %368 = OpLoad %344 
                                       f32_3 %369 = OpLoad %344 
                                       f32_3 %370 = OpFAdd %368 %369 
                                                      OpStore %367 %370 
                                        bool %372 = OpLoad %361 
                                                      OpSelectionMerge %374 None 
                                                      OpBranchConditional %372 %373 %376 
                                             %373 = OpLabel 
                                       f32_3 %375 = OpLoad %367 
                                                      OpStore %371 %375 
                                                      OpBranch %374 
                                             %376 = OpLabel 
                                       f32_3 %377 = OpLoad %344 
                                                      OpStore %371 %377 
                                                      OpBranch %374 
                                             %374 = OpLabel 
                                       f32_3 %378 = OpLoad %371 
                                                      OpStore %344 %378 
                                Private f32* %379 = OpAccessChain %276 %88 
                                         f32 %380 = OpLoad %379 
                                  Input f32* %381 = OpAccessChain %309 %26 
                                         f32 %382 = OpLoad %381 
                                        bool %383 = OpFOrdLessThan %380 %382 
                                                      OpStore %361 %383 
                                        bool %387 = OpLoad %361 
                                                      OpSelectionMerge %389 None 
                                                      OpBranchConditional %387 %388 %390 
                                             %388 = OpLabel 
                                                      OpStore %386 %230 
                                                      OpBranch %389 
                                             %390 = OpLabel 
                                Private f32* %391 = OpAccessChain %20 %26 
                                         f32 %392 = OpLoad %391 
                                                      OpStore %386 %392 
                                                      OpBranch %389 
                                             %389 = OpLabel 
                                         f32 %393 = OpLoad %386 
                                                      OpStore %384 %393 
                                Private f32* %397 = OpAccessChain %9 %396 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpLoad %384 
                                         f32 %400 = OpFMul %398 %399 
                                 Output f32* %402 = OpAccessChain %395 %396 
                                                      OpStore %402 %400 
                                       f32_3 %403 = OpLoad %344 
                                Uniform f32* %405 = OpAccessChain %40 %404 
                                         f32 %406 = OpLoad %405 
                                       f32_3 %407 = OpCompositeConstruct %406 %406 %406 
                                       f32_3 %408 = OpFMul %403 %407 
                                       f32_4 %409 = OpLoad %20 
                                       f32_4 %410 = OpVectorShuffle %409 %408 4 1 5 6 
                                                      OpStore %20 %410 
                                       f32_3 %411 = OpLoad %221 
                                Uniform f32* %413 = OpAccessChain %40 %412 
                                         f32 %414 = OpLoad %413 
                                Uniform f32* %415 = OpAccessChain %40 %412 
                                         f32 %416 = OpLoad %415 
                                Uniform f32* %417 = OpAccessChain %40 %412 
                                         f32 %418 = OpLoad %417 
                                       f32_3 %419 = OpCompositeConstruct %414 %416 %418 
                                         f32 %420 = OpCompositeExtract %419 0 
                                         f32 %421 = OpCompositeExtract %419 1 
                                         f32 %422 = OpCompositeExtract %419 2 
                                       f32_3 %423 = OpCompositeConstruct %420 %421 %422 
                                       f32_3 %424 = OpFMul %411 %423 
                                       f32_4 %425 = OpLoad %66 
                                       f32_4 %426 = OpVectorShuffle %425 %424 4 5 6 3 
                                                      OpStore %66 %426 
                                       f32_4 %427 = OpLoad %66 
                                       f32_3 %428 = OpVectorShuffle %427 %427 0 1 2 
                              Uniform f32_4* %430 = OpAccessChain %40 %429 
                                       f32_4 %431 = OpLoad %430 
                                       f32_3 %432 = OpVectorShuffle %431 %431 0 1 2 
                                       f32_3 %433 = OpFMul %428 %432 
                                       f32_4 %434 = OpLoad %66 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 6 3 
                                                      OpStore %66 %435 
                                       f32_4 %436 = OpLoad %20 
                                       f32_3 %437 = OpVectorShuffle %436 %436 0 2 3 
                              Uniform f32_4* %439 = OpAccessChain %40 %438 
                                       f32_4 %440 = OpLoad %439 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 2 
                                       f32_3 %442 = OpFMul %437 %441 
                                       f32_4 %443 = OpLoad %66 
                                       f32_3 %444 = OpVectorShuffle %443 %443 0 1 2 
                                       f32_3 %445 = OpFNegate %444 
                                       f32_3 %446 = OpFAdd %442 %445 
                                       f32_4 %447 = OpLoad %20 
                                       f32_4 %448 = OpVectorShuffle %447 %446 4 1 5 6 
                                                      OpStore %20 %448 
                                       f32_3 %449 = OpLoad %48 
                                       f32_3 %450 = OpLoad %32 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 0 0 
                                       f32_3 %452 = OpFMul %449 %451 
                                                      OpStore %48 %452 
                                       f32_4 %453 = OpLoad %20 
                                       f32_3 %454 = OpVectorShuffle %453 %453 0 2 3 
                                         f32 %455 = OpLoad %384 
                                       f32_3 %456 = OpCompositeConstruct %455 %455 %455 
                                       f32_3 %457 = OpFMul %454 %456 
                                       f32_3 %458 = OpLoad %48 
                                       f32_3 %459 = OpFAdd %457 %458 
                                                      OpStore %48 %459 
                                       f32_3 %460 = OpLoad %48 
                                       f32_3 %463 = OpFMul %460 %462 
                                       f32_4 %464 = OpLoad %264 
                                       f32_3 %465 = OpVectorShuffle %464 %464 0 1 2 
                                       f32_3 %466 = OpFAdd %463 %465 
                                                      OpStore %344 %466 
                                Private f32* %468 = OpAccessChain %264 %396 
                                         f32 %469 = OpLoad %468 
                                Uniform f32* %471 = OpAccessChain %40 %470 
                                         f32 %472 = OpLoad %471 
                                         f32 %473 = OpFMul %469 %472 
                                                      OpStore %467 %473 
                                         f32 %474 = OpLoad %467 
                                Uniform f32* %476 = OpAccessChain %40 %475 
                                         f32 %477 = OpLoad %476 
                                         f32 %478 = OpFMul %474 %477 
                                                      OpStore %467 %478 
                                       f32_3 %479 = OpLoad %48 
                                       f32_3 %480 = OpFNegate %479 
                                       f32_3 %481 = OpLoad %344 
                                       f32_3 %482 = OpFAdd %480 %481 
                                       f32_4 %483 = OpLoad %20 
                                       f32_4 %484 = OpVectorShuffle %483 %482 4 5 6 3 
                                                      OpStore %20 %484 
                                         f32 %485 = OpLoad %467 
                                       f32_3 %486 = OpCompositeConstruct %485 %485 %485 
                                       f32_4 %487 = OpLoad %20 
                                       f32_3 %488 = OpVectorShuffle %487 %487 0 1 2 
                                       f32_3 %489 = OpFMul %486 %488 
                                       f32_3 %490 = OpLoad %48 
                                       f32_3 %491 = OpFAdd %489 %490 
                                                      OpStore %48 %491 
                                Uniform f32* %494 = OpAccessChain %40 %493 %26 
                                         f32 %495 = OpLoad %494 
                                        bool %496 = OpFOrdEqual %495 %230 
                                                      OpStore %492 %496 
                                                      OpSelectionMerge %499 None 
                                                      OpBranchConditional %497 %498 %499 
                                             %498 = OpLabel 
                                        bool %500 = OpLoad %492 
                                                      OpSelectionMerge %502 None 
                                                      OpBranchConditional %500 %501 %502 
                                             %501 = OpLabel 
                                                      OpBranch %502 
                                             %502 = OpLabel 
                                                      OpBranch %499 
                                             %499 = OpLabel 
                                                      OpSelectionMerge %505 None 
                                                      OpBranchConditional %503 %504 %602 
                                             %504 = OpLabel 
                                Uniform f32* %506 = OpAccessChain %40 %493 %88 
                                         f32 %507 = OpLoad %506 
                                        bool %508 = OpFOrdEqual %507 %230 
                                                      OpStore %492 %508 
                                       f32_3 %509 = OpLoad %87 
                                       f32_3 %510 = OpVectorShuffle %509 %509 1 1 1 
                              Uniform f32_4* %513 = OpAccessChain %40 %511 %512 
                                       f32_4 %514 = OpLoad %513 
                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
                                       f32_3 %516 = OpFMul %510 %515 
                                       f32_4 %517 = OpLoad %20 
                                       f32_4 %518 = OpVectorShuffle %517 %516 4 5 6 3 
                                                      OpStore %20 %518 
                              Uniform f32_4* %519 = OpAccessChain %40 %511 %57 
                                       f32_4 %520 = OpLoad %519 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %522 = OpLoad %87 
                                       f32_3 %523 = OpVectorShuffle %522 %522 0 0 0 
                                       f32_3 %524 = OpFMul %521 %523 
                                       f32_4 %525 = OpLoad %20 
                                       f32_3 %526 = OpVectorShuffle %525 %525 0 1 2 
                                       f32_3 %527 = OpFAdd %524 %526 
                                       f32_4 %528 = OpLoad %20 
                                       f32_4 %529 = OpVectorShuffle %528 %527 4 5 6 3 
                                                      OpStore %20 %529 
                              Uniform f32_4* %530 = OpAccessChain %40 %511 %493 
                                       f32_4 %531 = OpLoad %530 
                                       f32_3 %532 = OpVectorShuffle %531 %531 0 1 2 
                                       f32_3 %533 = OpLoad %87 
                                       f32_3 %534 = OpVectorShuffle %533 %533 2 2 2 
                                       f32_3 %535 = OpFMul %532 %534 
                                       f32_4 %536 = OpLoad %20 
                                       f32_3 %537 = OpVectorShuffle %536 %536 0 1 2 
                                       f32_3 %538 = OpFAdd %535 %537 
                                       f32_4 %539 = OpLoad %20 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                      OpStore %20 %540 
                                       f32_4 %541 = OpLoad %20 
                                       f32_3 %542 = OpVectorShuffle %541 %541 0 1 2 
                              Uniform f32_4* %543 = OpAccessChain %40 %511 %511 
                                       f32_4 %544 = OpLoad %543 
                                       f32_3 %545 = OpVectorShuffle %544 %544 0 1 2 
                                       f32_3 %546 = OpFAdd %542 %545 
                                       f32_4 %547 = OpLoad %20 
                                       f32_4 %548 = OpVectorShuffle %547 %546 4 5 6 3 
                                                      OpStore %20 %548 
                                        bool %550 = OpLoad %492 
                                                      OpSelectionMerge %552 None 
                                                      OpBranchConditional %550 %551 %555 
                                             %551 = OpLabel 
                                       f32_4 %553 = OpLoad %20 
                                       f32_3 %554 = OpVectorShuffle %553 %553 0 1 2 
                                                      OpStore %549 %554 
                                                      OpBranch %552 
                                             %555 = OpLabel 
                                       f32_3 %556 = OpLoad %87 
                                                      OpStore %549 %556 
                                                      OpBranch %552 
                                             %552 = OpLabel 
                                       f32_3 %557 = OpLoad %549 
                                       f32_4 %558 = OpLoad %20 
                                       f32_4 %559 = OpVectorShuffle %558 %557 4 5 6 3 
                                                      OpStore %20 %559 
                                       f32_4 %560 = OpLoad %20 
                                       f32_3 %561 = OpVectorShuffle %560 %560 0 1 2 
                              Uniform f32_3* %564 = OpAccessChain %40 %562 
                                       f32_3 %565 = OpLoad %564 
                                       f32_3 %566 = OpFNegate %565 
                                       f32_3 %567 = OpFAdd %561 %566 
                                       f32_4 %568 = OpLoad %20 
                                       f32_4 %569 = OpVectorShuffle %568 %567 4 5 6 3 
                                                      OpStore %20 %569 
                                       f32_4 %570 = OpLoad %20 
                                       f32_3 %571 = OpVectorShuffle %570 %570 0 1 2 
                              Uniform f32_3* %573 = OpAccessChain %40 %572 
                                       f32_3 %574 = OpLoad %573 
                                       f32_3 %575 = OpFMul %571 %574 
                                       f32_4 %576 = OpLoad %20 
                                       f32_4 %577 = OpVectorShuffle %576 %575 0 4 5 6 
                                                      OpStore %20 %577 
                                Private f32* %578 = OpAccessChain %20 %88 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFMul %579 %213 
                                         f32 %581 = OpFAdd %580 %461 
                                                      OpStore %467 %581 
                                Uniform f32* %582 = OpAccessChain %40 %493 %241 
                                         f32 %583 = OpLoad %582 
                                         f32 %584 = OpFMul %583 %144 
                                         f32 %585 = OpFAdd %584 %461 
                                Private f32* %586 = OpAccessChain %32 %26 
                                                      OpStore %586 %585 
                                         f32 %587 = OpLoad %467 
                                Private f32* %588 = OpAccessChain %32 %26 
                                         f32 %589 = OpLoad %588 
                                         f32 %590 = OpExtInst %1 40 %587 %589 
                                Private f32* %591 = OpAccessChain %20 %26 
                                                      OpStore %591 %590 
                  read_only Texture3DSampled %596 = OpLoad %595 
                                       f32_4 %597 = OpLoad %20 
                                       f32_3 %598 = OpVectorShuffle %597 %597 0 2 3 
                                       f32_4 %599 = OpImageSampleImplicitLod %596 %598 
                                                      OpStore %20 %599 
                                       f32_4 %601 = OpLoad %20 
                                                      OpStore %600 %601 
                                                      OpBranch %505 
                                             %602 = OpLabel 
                                Private f32* %603 = OpAccessChain %600 %26 
                                                      OpStore %603 %230 
                                Private f32* %604 = OpAccessChain %600 %88 
                                                      OpStore %604 %230 
                                Private f32* %605 = OpAccessChain %600 %241 
                                                      OpStore %605 %230 
                                Private f32* %606 = OpAccessChain %600 %396 
                                                      OpStore %606 %230 
                                                      OpBranch %505 
                                             %505 = OpLabel 
                                       f32_4 %607 = OpLoad %600 
                              Uniform f32_4* %608 = OpAccessChain %40 %512 
                                       f32_4 %609 = OpLoad %608 
                                         f32 %610 = OpDot %607 %609 
                                Private f32* %611 = OpAccessChain %344 %26 
                                                      OpStore %611 %610 
                                Private f32* %612 = OpAccessChain %344 %26 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpExtInst %1 43 %613 %254 %230 
                                Private f32* %615 = OpAccessChain %344 %26 
                                                      OpStore %615 %614 
                                       f32_3 %617 = OpLoad %48 
                              Uniform f32_4* %619 = OpAccessChain %40 %618 
                                       f32_4 %620 = OpLoad %619 
                                       f32_3 %621 = OpVectorShuffle %620 %620 0 1 2 
                                       f32_3 %622 = OpFMul %617 %621 
                                                      OpStore %616 %622 
                                       f32_3 %623 = OpLoad %344 
                                       f32_3 %624 = OpVectorShuffle %623 %623 0 0 0 
                                       f32_3 %625 = OpLoad %616 
                                       f32_3 %626 = OpFMul %624 %625 
                                       f32_4 %627 = OpLoad %395 
                                       f32_4 %628 = OpVectorShuffle %627 %626 4 5 6 3 
                                                      OpStore %395 %628 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat7;
vec2 u_xlat8;
vec2 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = (-u_xlat10_0.xyz) + _CausticColor.xyz;
    u_xlat0.xyz = _CausticColor.www * u_xlat7.xyz + u_xlat10_0.xyz;
    u_xlat7.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat2 = u_xlat7.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat7.x = vs_TEXCOORD2.y + vs_TEXCOORD2.x;
    u_xlat3.x = u_xlat7.y * _TimeScale + u_xlat7.x;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat4.x * 0.111111112;
    u_xlat4.y = u_xlat3.x * 0.166666672;
    u_xlat3.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat15.xy = u_xlat2.zw * vec2(0.5, 0.125);
    u_xlat2.xy = u_xlat2.xy * vec2(1.25, 0.899999976) + u_xlat7.xx;
    u_xlat7.x = cos(u_xlat2.x);
    u_xlat4.x = u_xlat7.x * 0.111111112;
    u_xlat7.x = sin(u_xlat2.y);
    u_xlat4.y = u_xlat7.x * 0.166666672;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003) + u_xlat15.xy;
    u_xlat10_3 = texture(_CausticTex, u_xlat3.xy);
    u_xlat2.xy = u_xlat2.xy * vec2(0.142857149, 0.142857149);
    u_xlat2.xy = u_xlat2.ww * vec2(0.25, 0.166666672) + u_xlat2.xy;
    u_xlat10_2 = texture(_CausticTex, u_xlat2.xy);
    u_xlat7.x = _EmissiveBoost + 1.0;
    u_xlat20 = vs_TEXCOORD3.y * 500.0;
    u_xlat19 = u_xlat7.z * 5.0 + u_xlat20;
    u_xlat19 = sin(u_xlat19);
    u_xlat4.x = u_xlat19 * 0.00150000001;
    u_xlat4.y = 0.0;
    u_xlat4.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.0, 0.075000003);
    u_xlat10_4 = texture(_ReflMapFromPixelator, u_xlat4.xy);
    u_xlat5.xyz = vs_TEXCOORD2.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat13.x = vs_TEXCOORD2.x * 6.0 + u_xlat7.y;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat19 = cos(u_xlat5.x);
    u_xlat13.x = u_xlat19 * u_xlat13.x;
    u_xlat13.x = u_xlat13.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb19 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xy = floor(u_xlat5.yz);
    u_xlat5.xy = u_xlat5.xy * vec2(0.0625, 0.0625);
    u_xlat20 = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat20 = fract(u_xlat20);
    u_xlat20 = u_xlat20 * 0.5 + 0.5;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(u_xlat20) : u_xlat10_3.xyz;
    u_xlat13.xy = u_xlat13.xx + vec2(-0.0625, -0.25);
    u_xlatb13 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlatb13 = u_xlat13.y<vs_COLOR0.x;
    u_xlat1.x = (u_xlatb13) ? 1.0 : u_xlat10_1.x;
    SV_Target0.w = u_xlat10_0.w * u_xlat1.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LightCausticPower);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_4.xyz;
    u_xlat18 = u_xlat10_4.w * _ReflPower;
    u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25 + 0.75;
        u_xlat8.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat18, u_xlat8.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat18 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb2 = 0.0<u_xlat1.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat8.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat10_3 = texture(_LightTexture0, u_xlat8.xy);
    u_xlat19 = u_xlat2.x * u_xlat10_3.w;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat1.x = u_xlat19 * u_xlat10_2.w;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 183
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %98 %99 %112 %142 %162 %174 %175 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %162 Location 162 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 4 
                                             %111 = OpTypePointer Input %50 
                                Input f32_3* %112 = OpVariable Input 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                               Output f32_3* %142 = OpVariable Output 
                                             %150 = OpTypePointer Uniform %6 
                                         f32 %157 = OpConstant 3.67402E-40 
                                       f32_3 %158 = OpConstantComposite %157 %157 %157 
                               Output f32_4* %162 = OpVariable Output 
                               Output f32_4* %174 = OpVariable Output 
                                Input f32_4* %175 = OpVariable Input 
                                             %177 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %114 = OpAccessChain %21 %36 %28 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %113 %116 
                                Private f32* %120 = OpAccessChain %44 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %112 
                              Uniform f32_4* %122 = OpAccessChain %21 %36 %23 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %44 %88 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %112 
                              Uniform f32_4* %128 = OpAccessChain %21 %36 %36 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %44 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %44 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %44 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %143 = OpLoad %134 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                                      OpStore %142 %147 
                                Private f32* %148 = OpAccessChain %9 %88 
                                         f32 %149 = OpLoad %148 
                                Uniform f32* %151 = OpAccessChain %21 %28 %118 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %149 %152 
                                Private f32* %154 = OpAccessChain %9 %88 
                                                      OpStore %154 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 3 1 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %44 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %44 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_2 %164 = OpVectorShuffle %163 %163 2 3 
                                       f32_4 %165 = OpLoad %162 
                                       f32_4 %166 = OpVectorShuffle %165 %164 0 1 4 5 
                                                      OpStore %162 %166 
                                       f32_4 %167 = OpLoad %44 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 2 
                                       f32_4 %169 = OpLoad %44 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 3 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %162 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %162 %173 
                                       f32_4 %176 = OpLoad %175 
                                                      OpStore %174 %176 
                                 Output f32* %178 = OpAccessChain %92 %28 %88 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFNegate %179 
                                 Output f32* %181 = OpAccessChain %92 %28 %88 
                                                      OpStore %181 %180 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 710
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %88 %236 %310 %396 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 RelaxedPrecision 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 RelaxedPrecision 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpMemberDecorate %39 12 Offset 39 
                                                      OpMemberDecorate %39 13 Offset 39 
                                                      OpMemberDecorate %39 14 Offset 39 
                                                      OpMemberDecorate %39 15 Offset 39 
                                                      OpMemberDecorate %39 16 Offset 39 
                                                      OpMemberDecorate %39 17 Offset 39 
                                                      OpMemberDecorate %39 18 Offset 39 
                                                      OpMemberDecorate %39 19 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %199 DescriptorSet 199 
                                                      OpDecorate %199 Binding 199 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %266 DescriptorSet 266 
                                                      OpDecorate %266 Binding 266 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %310 Location 310 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %396 Location 396 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %404 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %409 RelaxedPrecision 
                                                      OpDecorate %412 RelaxedPrecision 
                                                      OpDecorate %420 RelaxedPrecision 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %423 RelaxedPrecision 
                                                      OpDecorate %424 RelaxedPrecision 
                                                      OpDecorate %425 RelaxedPrecision 
                                                      OpDecorate %456 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %530 SpecId 530 
                                                      OpDecorate %619 DescriptorSet 619 
                                                      OpDecorate %619 Binding 619 
                                                      OpDecorate %624 RelaxedPrecision 
                                                      OpDecorate %631 RelaxedPrecision 
                                                      OpDecorate %633 RelaxedPrecision 
                                                      OpDecorate %634 RelaxedPrecision 
                                                      OpDecorate %637 RelaxedPrecision 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %643 RelaxedPrecision 
                                                      OpDecorate %649 RelaxedPrecision 
                                                      OpDecorate %664 DescriptorSet 664 
                                                      OpDecorate %664 Binding 664 
                                                      OpDecorate %672 RelaxedPrecision 
                                                      OpDecorate %680 DescriptorSet 680 
                                                      OpDecorate %680 Binding 680 
                                                      OpDecorate %688 RelaxedPrecision 
                                                      OpDecorate %692 RelaxedPrecision 
                                                      OpDecorate %694 RelaxedPrecision 
                                                      OpDecorate %695 RelaxedPrecision 
                                                      OpDecorate %700 RelaxedPrecision 
                                                      OpDecorate %701 RelaxedPrecision 
                                                      OpDecorate %703 RelaxedPrecision 
                                                      OpDecorate %704 RelaxedPrecision 
                                                      OpDecorate %705 RelaxedPrecision 
                                                      OpDecorate %706 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypePointer Private %30 
                               Private f32_3* %32 = OpVariable Private 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %7 %36 
                                              %38 = OpTypeArray %7 %36 
                                              %39 = OpTypeStruct %7 %7 %7 %37 %30 %30 %7 %38 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %7 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32_4;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 9 
                                              %44 = OpTypePointer Uniform %7 
                               Private f32_3* %49 = OpVariable Private 
                                          i32 %58 = OpConstant 0 
                                          i32 %62 = OpConstant 19 
                               Private f32_4* %67 = OpVariable Private 
                                          i32 %70 = OpConstant 11 
                                              %71 = OpTypePointer Uniform %6 
                                              %87 = OpTypePointer Input %30 
                                 Input f32_3* %88 = OpVariable Input 
                                          u32 %89 = OpConstant 1 
                                              %90 = OpTypePointer Input %6 
                               Private f32_3* %97 = OpVariable Private 
                                             %107 = OpTypePointer Private %15 
                              Private f32_2* %108 = OpVariable Private 
                                         f32 %119 = OpConstant 3.67402E-40 
                                         f32 %124 = OpConstant 3.67402E-40 
                                         i32 %135 = OpConstant 8 
                              Private f32_2* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                       f32_2 %147 = OpConstantComposite %145 %146 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_2 %153 = OpConstantComposite %151 %152 
                                         f32 %192 = OpConstant 3.67402E-40 
                                       f32_2 %193 = OpConstantComposite %192 %192 
 UniformConstant read_only Texture2DSampled* %199 = OpVariable UniformConstant 
                                         f32 %207 = OpConstant 3.67402E-40 
                                       f32_2 %208 = OpConstantComposite %207 %207 
                                         f32 %214 = OpConstant 3.67402E-40 
                                       f32_2 %215 = OpConstantComposite %214 %124 
                              Private f32_3* %222 = OpVariable Private 
                                         i32 %228 = OpConstant 16 
                                         f32 %231 = OpConstant 3.67402E-40 
                                Private f32* %234 = OpVariable Private 
                                             %235 = OpTypePointer Input %7 
                                Input f32_4* %236 = OpVariable Input 
                                         f32 %239 = OpConstant 3.67402E-40 
                                Private f32* %241 = OpVariable Private 
                                         u32 %242 = OpConstant 2 
                                         f32 %245 = OpConstant 3.67402E-40 
                                         f32 %252 = OpConstant 3.67402E-40 
                                         f32 %255 = OpConstant 3.67402E-40 
                                         f32 %262 = OpConstant 3.67402E-40 
                                       f32_2 %263 = OpConstantComposite %255 %262 
                              Private f32_4* %265 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %266 = OpVariable UniformConstant 
                              Private f32_3* %270 = OpVariable Private 
                                         f32 %273 = OpConstant 3.67402E-40 
                                         f32 %274 = OpConstant 3.67402E-40 
                                       f32_3 %275 = OpConstantComposite %273 %274 %274 
                              Private f32_2* %277 = OpVariable Private 
                                         f32 %280 = OpConstant 3.67402E-40 
                                         f32 %300 = OpConstant 3.67402E-40 
                                         i32 %302 = OpConstant 18 
                                             %307 = OpTypeBool 
                                             %308 = OpTypePointer Private %307 
                               Private bool* %309 = OpVariable Private 
                                Input f32_4* %310 = OpVariable Input 
                                       f32_2 %323 = OpConstantComposite %300 %300 
                                         f32 %329 = OpConstant 3.67402E-40 
                                         f32 %330 = OpConstant 3.67402E-40 
                                       f32_2 %331 = OpConstantComposite %329 %330 
                                         f32 %336 = OpConstant 3.67402E-40 
                              Private f32_3* %345 = OpVariable Private 
                                             %346 = OpTypePointer Function %30 
                                         f32 %358 = OpConstant 3.67402E-40 
                                         f32 %359 = OpConstant 3.67402E-40 
                                       f32_2 %360 = OpConstantComposite %358 %359 
                               Private bool* %362 = OpVariable Private 
                              Private f32_3* %368 = OpVariable Private 
                                Private f32* %385 = OpVariable Private 
                                             %386 = OpTypePointer Function %6 
                                             %395 = OpTypePointer Output %7 
                               Output f32_4* %396 = OpVariable Output 
                                         u32 %397 = OpConstant 3 
                                             %402 = OpTypePointer Output %6 
                                         i32 %405 = OpConstant 14 
                                         i32 %413 = OpConstant 15 
                                         i32 %430 = OpConstant 13 
                                         i32 %439 = OpConstant 12 
                                         f32 %462 = OpConstant 3.67402E-40 
                                       f32_3 %463 = OpConstantComposite %462 %462 %462 
                                Private f32* %468 = OpVariable Private 
                                         i32 %471 = OpConstant 10 
                                         i32 %476 = OpConstant 17 
                                         i32 %495 = OpConstant 7 
                                         i32 %496 = OpConstant 1 
                                         i32 %507 = OpConstant 2 
                                         i32 %516 = OpConstant 3 
                               Private bool* %520 = OpVariable Private 
                                        bool %524 = OpConstantFalse 
                                        bool %530 = OpSpecConstantFalse 
                                         i32 %587 = OpConstant 5 
                                             %588 = OpTypePointer Uniform %30 
                                         i32 %597 = OpConstant 4 
                                Private f32* %607 = OpVariable Private 
                                             %616 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %617 = OpTypeSampledImage %616 
                                             %618 = OpTypePointer UniformConstant %617 
 UniformConstant read_only Texture3DSampled* %619 = OpVariable UniformConstant 
                              Private f32_4* %624 = OpVariable Private 
                              Private f32_3* %643 = OpVariable Private 
                                       f32_2 %660 = OpConstantComposite %145 %145 
 UniformConstant read_only Texture2DSampled* %664 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %680 = OpVariable UniformConstant 
                                         i32 %698 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %347 = OpVariable Function 
                             Function f32_3* %372 = OpVariable Function 
                               Function f32* %387 = OpVariable Function 
                             Function f32_3* %574 = OpVariable Function 
                               Function f32* %644 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %22 = OpLoad %21 
                                        f32_2 %23 = OpLoad %17 
                                        f32_4 %24 = OpImageSampleImplicitLod %22 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %20 %26 
                                                      OpStore %29 %27 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_3 %35 = OpFNegate %34 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %35 %47 
                                                      OpStore %32 %48 
                               Uniform f32_4* %50 = OpAccessChain %41 %43 
                                        f32_4 %51 = OpLoad %50 
                                        f32_3 %52 = OpVectorShuffle %51 %51 3 3 3 
                                        f32_3 %53 = OpLoad %32 
                                        f32_3 %54 = OpFMul %52 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFAdd %54 %56 
                                                      OpStore %49 %57 
                               Uniform f32_4* %59 = OpAccessChain %41 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               Uniform f32_4* %63 = OpAccessChain %41 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFAdd %61 %65 
                                                      OpStore %32 %66 
                                        f32_3 %68 = OpLoad %32 
                                        f32_4 %69 = OpVectorShuffle %68 %68 1 1 0 0 
                                 Uniform f32* %72 = OpAccessChain %41 %70 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %41 %70 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %76 = OpAccessChain %41 %70 
                                          f32 %77 = OpLoad %76 
                                 Uniform f32* %78 = OpAccessChain %41 %70 
                                          f32 %79 = OpLoad %78 
                                        f32_4 %80 = OpCompositeConstruct %73 %75 %77 %79 
                                          f32 %81 = OpCompositeExtract %80 0 
                                          f32 %82 = OpCompositeExtract %80 1 
                                          f32 %83 = OpCompositeExtract %80 2 
                                          f32 %84 = OpCompositeExtract %80 3 
                                        f32_4 %85 = OpCompositeConstruct %81 %82 %83 %84 
                                        f32_4 %86 = OpFMul %69 %85 
                                                      OpStore %67 %86 
                                   Input f32* %91 = OpAccessChain %88 %89 
                                          f32 %92 = OpLoad %91 
                                   Input f32* %93 = OpAccessChain %88 %26 
                                          f32 %94 = OpLoad %93 
                                          f32 %95 = OpFAdd %92 %94 
                                 Private f32* %96 = OpAccessChain %32 %26 
                                                      OpStore %96 %95 
                                 Private f32* %98 = OpAccessChain %32 %89 
                                          f32 %99 = OpLoad %98 
                                Uniform f32* %100 = OpAccessChain %41 %70 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFMul %99 %101 
                                Private f32* %103 = OpAccessChain %32 %26 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %97 %26 
                                                      OpStore %106 %105 
                                Private f32* %109 = OpAccessChain %97 %26 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpExtInst %1 14 %110 
                                Private f32* %112 = OpAccessChain %108 %26 
                                                      OpStore %112 %111 
                                Private f32* %113 = OpAccessChain %97 %26 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpExtInst %1 13 %114 
                                Private f32* %116 = OpAccessChain %97 %26 
                                                      OpStore %116 %115 
                                Private f32* %117 = OpAccessChain %108 %26 
                                         f32 %118 = OpLoad %117 
                                         f32 %120 = OpFMul %118 %119 
                                Private f32* %121 = OpAccessChain %108 %26 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %97 %26 
                                         f32 %123 = OpLoad %122 
                                         f32 %125 = OpFMul %123 %124 
                                Private f32* %126 = OpAccessChain %108 %89 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %108 
                                       f32_3 %128 = OpLoad %88 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_3 %131 = OpLoad %97 
                                       f32_3 %132 = OpVectorShuffle %131 %130 3 4 2 
                                                      OpStore %97 %132 
                                       f32_3 %133 = OpLoad %97 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                                Uniform f32* %136 = OpAccessChain %41 %135 
                                         f32 %137 = OpLoad %136 
                                       f32_2 %138 = OpCompositeConstruct %137 %137 
                                       f32_2 %139 = OpFMul %134 %138 
                                       f32_3 %140 = OpLoad %97 
                                       f32_3 %141 = OpVectorShuffle %140 %139 3 4 2 
                                                      OpStore %97 %141 
                                       f32_4 %143 = OpLoad %67 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %148 = OpFMul %144 %147 
                                                      OpStore %142 %148 
                                       f32_4 %149 = OpLoad %67 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %154 = OpFMul %150 %153 
                                       f32_3 %155 = OpLoad %32 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 0 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %67 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %67 %159 
                                Private f32* %160 = OpAccessChain %67 %26 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 14 %161 
                                Private f32* %163 = OpAccessChain %32 %26 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %32 %26 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %165 %119 
                                Private f32* %167 = OpAccessChain %108 %26 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %67 %89 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpExtInst %1 13 %169 
                                Private f32* %171 = OpAccessChain %32 %26 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %32 %26 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %173 %124 
                                Private f32* %175 = OpAccessChain %108 %89 
                                                      OpStore %175 %174 
                                       f32_2 %176 = OpLoad %108 
                                       f32_3 %177 = OpLoad %88 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 1 
                                       f32_2 %179 = OpFAdd %176 %178 
                                       f32_4 %180 = OpLoad %67 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 2 3 
                                                      OpStore %67 %181 
                                       f32_4 %182 = OpLoad %67 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                Uniform f32* %184 = OpAccessChain %41 %135 
                                         f32 %185 = OpLoad %184 
                                       f32_2 %186 = OpCompositeConstruct %185 %185 
                                       f32_2 %187 = OpFMul %183 %186 
                                       f32_4 %188 = OpLoad %67 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 2 3 
                                                      OpStore %67 %189 
                                       f32_3 %190 = OpLoad %97 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %194 = OpFMul %191 %193 
                                       f32_2 %195 = OpLoad %142 
                                       f32_2 %196 = OpFAdd %194 %195 
                                       f32_3 %197 = OpLoad %97 
                                       f32_3 %198 = OpVectorShuffle %197 %196 3 4 2 
                                                      OpStore %97 %198 
                  read_only Texture2DSampled %200 = OpLoad %199 
                                       f32_3 %201 = OpLoad %97 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_4 %203 = OpImageSampleImplicitLod %200 %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                                      OpStore %97 %204 
                                       f32_4 %205 = OpLoad %67 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                                       f32_2 %209 = OpFMul %206 %208 
                                       f32_4 %210 = OpLoad %67 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 5 2 3 
                                                      OpStore %67 %211 
                                       f32_4 %212 = OpLoad %67 
                                       f32_2 %213 = OpVectorShuffle %212 %212 3 3 
                                       f32_2 %216 = OpFMul %213 %215 
                                       f32_4 %217 = OpLoad %67 
                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
                                       f32_2 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %67 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 2 3 
                                                      OpStore %67 %221 
                  read_only Texture2DSampled %223 = OpLoad %199 
                                       f32_4 %224 = OpLoad %67 
                                       f32_2 %225 = OpVectorShuffle %224 %224 0 1 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                                      OpStore %222 %227 
                                Uniform f32* %229 = OpAccessChain %41 %228 
                                         f32 %230 = OpLoad %229 
                                         f32 %232 = OpFAdd %230 %231 
                                Private f32* %233 = OpAccessChain %32 %26 
                                                      OpStore %233 %232 
                                  Input f32* %237 = OpAccessChain %236 %89 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                                      OpStore %234 %240 
                                Private f32* %243 = OpAccessChain %32 %242 
                                         f32 %244 = OpLoad %243 
                                         f32 %246 = OpFMul %244 %245 
                                         f32 %247 = OpLoad %234 
                                         f32 %248 = OpFAdd %246 %247 
                                                      OpStore %241 %248 
                                         f32 %249 = OpLoad %241 
                                         f32 %250 = OpExtInst %1 13 %249 
                                                      OpStore %241 %250 
                                         f32 %251 = OpLoad %241 
                                         f32 %253 = OpFMul %251 %252 
                                Private f32* %254 = OpAccessChain %108 %26 
                                                      OpStore %254 %253 
                                Private f32* %256 = OpAccessChain %108 %89 
                                                      OpStore %256 %255 
                                       f32_2 %257 = OpLoad %108 
                                       f32_4 %258 = OpLoad %236 
                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
                                       f32_2 %260 = OpFAdd %257 %259 
                                                      OpStore %108 %260 
                                       f32_2 %261 = OpLoad %108 
                                       f32_2 %264 = OpFAdd %261 %263 
                                                      OpStore %108 %264 
                  read_only Texture2DSampled %267 = OpLoad %266 
                                       f32_2 %268 = OpLoad %108 
                                       f32_4 %269 = OpImageSampleImplicitLod %267 %268 
                                                      OpStore %265 %269 
                                       f32_3 %271 = OpLoad %88 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 0 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %270 %276 
                                  Input f32* %278 = OpAccessChain %88 %26 
                                         f32 %279 = OpLoad %278 
                                         f32 %281 = OpFMul %279 %280 
                                Private f32* %282 = OpAccessChain %32 %89 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFAdd %281 %283 
                                Private f32* %285 = OpAccessChain %277 %26 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %277 %26 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpExtInst %1 13 %287 
                                Private f32* %289 = OpAccessChain %277 %26 
                                                      OpStore %289 %288 
                                Private f32* %290 = OpAccessChain %270 %26 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpExtInst %1 14 %291 
                                                      OpStore %241 %292 
                                         f32 %293 = OpLoad %241 
                                Private f32* %294 = OpAccessChain %277 %26 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFMul %293 %295 
                                Private f32* %297 = OpAccessChain %277 %26 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %277 %26 
                                         f32 %299 = OpLoad %298 
                                         f32 %301 = OpFMul %299 %300 
                                Uniform f32* %303 = OpAccessChain %41 %302 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpFAdd %301 %304 
                                Private f32* %306 = OpAccessChain %277 %26 
                                                      OpStore %306 %305 
                                  Input f32* %311 = OpAccessChain %310 %26 
                                         f32 %312 = OpLoad %311 
                                Private f32* %313 = OpAccessChain %277 %26 
                                         f32 %314 = OpLoad %313 
                                        bool %315 = OpFOrdLessThan %312 %314 
                                                      OpStore %309 %315 
                                       f32_3 %316 = OpLoad %270 
                                       f32_2 %317 = OpVectorShuffle %316 %316 1 2 
                                       f32_2 %318 = OpExtInst %1 8 %317 
                                       f32_3 %319 = OpLoad %270 
                                       f32_3 %320 = OpVectorShuffle %319 %318 3 4 2 
                                                      OpStore %270 %320 
                                       f32_3 %321 = OpLoad %270 
                                       f32_2 %322 = OpVectorShuffle %321 %321 0 1 
                                       f32_2 %324 = OpFMul %322 %323 
                                       f32_3 %325 = OpLoad %270 
                                       f32_3 %326 = OpVectorShuffle %325 %324 3 4 2 
                                                      OpStore %270 %326 
                                       f32_3 %327 = OpLoad %270 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
                                         f32 %332 = OpDot %328 %331 
                                                      OpStore %234 %332 
                                         f32 %333 = OpLoad %234 
                                         f32 %334 = OpExtInst %1 13 %333 
                                                      OpStore %234 %334 
                                         f32 %335 = OpLoad %234 
                                         f32 %337 = OpFMul %335 %336 
                                                      OpStore %234 %337 
                                         f32 %338 = OpLoad %234 
                                         f32 %339 = OpExtInst %1 10 %338 
                                                      OpStore %234 %339 
                                         f32 %340 = OpLoad %234 
                                         f32 %341 = OpFMul %340 %145 
                                         f32 %342 = OpFAdd %341 %145 
                                                      OpStore %234 %342 
                                         f32 %343 = OpLoad %234 
                                         f32 %344 = OpFMul %343 %145 
                                                      OpStore %234 %344 
                                        bool %348 = OpLoad %309 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %348 %349 %353 
                                             %349 = OpLabel 
                                         f32 %351 = OpLoad %234 
                                       f32_3 %352 = OpCompositeConstruct %351 %351 %351 
                                                      OpStore %347 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                                       f32_3 %354 = OpLoad %97 
                                                      OpStore %347 %354 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                       f32_3 %355 = OpLoad %347 
                                                      OpStore %345 %355 
                                       f32_2 %356 = OpLoad %277 
                                       f32_2 %357 = OpVectorShuffle %356 %356 0 0 
                                       f32_2 %361 = OpFAdd %357 %360 
                                                      OpStore %277 %361 
                                  Input f32* %363 = OpAccessChain %310 %26 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %277 %26 
                                         f32 %366 = OpLoad %365 
                                        bool %367 = OpFOrdLessThan %364 %366 
                                                      OpStore %362 %367 
                                       f32_3 %369 = OpLoad %345 
                                       f32_3 %370 = OpLoad %345 
                                       f32_3 %371 = OpFAdd %369 %370 
                                                      OpStore %368 %371 
                                        bool %373 = OpLoad %362 
                                                      OpSelectionMerge %375 None 
                                                      OpBranchConditional %373 %374 %377 
                                             %374 = OpLabel 
                                       f32_3 %376 = OpLoad %368 
                                                      OpStore %372 %376 
                                                      OpBranch %375 
                                             %377 = OpLabel 
                                       f32_3 %378 = OpLoad %345 
                                                      OpStore %372 %378 
                                                      OpBranch %375 
                                             %375 = OpLabel 
                                       f32_3 %379 = OpLoad %372 
                                                      OpStore %345 %379 
                                Private f32* %380 = OpAccessChain %277 %89 
                                         f32 %381 = OpLoad %380 
                                  Input f32* %382 = OpAccessChain %310 %26 
                                         f32 %383 = OpLoad %382 
                                        bool %384 = OpFOrdLessThan %381 %383 
                                                      OpStore %362 %384 
                                        bool %388 = OpLoad %362 
                                                      OpSelectionMerge %390 None 
                                                      OpBranchConditional %388 %389 %391 
                                             %389 = OpLabel 
                                                      OpStore %387 %231 
                                                      OpBranch %390 
                                             %391 = OpLabel 
                                Private f32* %392 = OpAccessChain %20 %26 
                                         f32 %393 = OpLoad %392 
                                                      OpStore %387 %393 
                                                      OpBranch %390 
                                             %390 = OpLabel 
                                         f32 %394 = OpLoad %387 
                                                      OpStore %385 %394 
                                Private f32* %398 = OpAccessChain %9 %397 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpLoad %385 
                                         f32 %401 = OpFMul %399 %400 
                                 Output f32* %403 = OpAccessChain %396 %397 
                                                      OpStore %403 %401 
                                       f32_3 %404 = OpLoad %345 
                                Uniform f32* %406 = OpAccessChain %41 %405 
                                         f32 %407 = OpLoad %406 
                                       f32_3 %408 = OpCompositeConstruct %407 %407 %407 
                                       f32_3 %409 = OpFMul %404 %408 
                                       f32_4 %410 = OpLoad %20 
                                       f32_4 %411 = OpVectorShuffle %410 %409 4 1 5 6 
                                                      OpStore %20 %411 
                                       f32_3 %412 = OpLoad %222 
                                Uniform f32* %414 = OpAccessChain %41 %413 
                                         f32 %415 = OpLoad %414 
                                Uniform f32* %416 = OpAccessChain %41 %413 
                                         f32 %417 = OpLoad %416 
                                Uniform f32* %418 = OpAccessChain %41 %413 
                                         f32 %419 = OpLoad %418 
                                       f32_3 %420 = OpCompositeConstruct %415 %417 %419 
                                         f32 %421 = OpCompositeExtract %420 0 
                                         f32 %422 = OpCompositeExtract %420 1 
                                         f32 %423 = OpCompositeExtract %420 2 
                                       f32_3 %424 = OpCompositeConstruct %421 %422 %423 
                                       f32_3 %425 = OpFMul %412 %424 
                                       f32_4 %426 = OpLoad %67 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 6 3 
                                                      OpStore %67 %427 
                                       f32_4 %428 = OpLoad %67 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                              Uniform f32_4* %431 = OpAccessChain %41 %430 
                                       f32_4 %432 = OpLoad %431 
                                       f32_3 %433 = OpVectorShuffle %432 %432 0 1 2 
                                       f32_3 %434 = OpFMul %429 %433 
                                       f32_4 %435 = OpLoad %67 
                                       f32_4 %436 = OpVectorShuffle %435 %434 4 5 6 3 
                                                      OpStore %67 %436 
                                       f32_4 %437 = OpLoad %20 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 2 3 
                              Uniform f32_4* %440 = OpAccessChain %41 %439 
                                       f32_4 %441 = OpLoad %440 
                                       f32_3 %442 = OpVectorShuffle %441 %441 0 1 2 
                                       f32_3 %443 = OpFMul %438 %442 
                                       f32_4 %444 = OpLoad %67 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_3 %446 = OpFNegate %445 
                                       f32_3 %447 = OpFAdd %443 %446 
                                       f32_4 %448 = OpLoad %20 
                                       f32_4 %449 = OpVectorShuffle %448 %447 4 1 5 6 
                                                      OpStore %20 %449 
                                       f32_3 %450 = OpLoad %49 
                                       f32_3 %451 = OpLoad %32 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 0 0 
                                       f32_3 %453 = OpFMul %450 %452 
                                                      OpStore %49 %453 
                                       f32_4 %454 = OpLoad %20 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 2 3 
                                         f32 %456 = OpLoad %385 
                                       f32_3 %457 = OpCompositeConstruct %456 %456 %456 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %459 = OpLoad %49 
                                       f32_3 %460 = OpFAdd %458 %459 
                                                      OpStore %49 %460 
                                       f32_3 %461 = OpLoad %49 
                                       f32_3 %464 = OpFMul %461 %463 
                                       f32_4 %465 = OpLoad %265 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_3 %467 = OpFAdd %464 %466 
                                                      OpStore %345 %467 
                                Private f32* %469 = OpAccessChain %265 %397 
                                         f32 %470 = OpLoad %469 
                                Uniform f32* %472 = OpAccessChain %41 %471 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFMul %470 %473 
                                                      OpStore %468 %474 
                                         f32 %475 = OpLoad %468 
                                Uniform f32* %477 = OpAccessChain %41 %476 
                                         f32 %478 = OpLoad %477 
                                         f32 %479 = OpFMul %475 %478 
                                                      OpStore %468 %479 
                                       f32_3 %480 = OpLoad %49 
                                       f32_3 %481 = OpFNegate %480 
                                       f32_3 %482 = OpLoad %345 
                                       f32_3 %483 = OpFAdd %481 %482 
                                       f32_4 %484 = OpLoad %20 
                                       f32_4 %485 = OpVectorShuffle %484 %483 4 5 6 3 
                                                      OpStore %20 %485 
                                         f32 %486 = OpLoad %468 
                                       f32_3 %487 = OpCompositeConstruct %486 %486 %486 
                                       f32_4 %488 = OpLoad %20 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 1 2 
                                       f32_3 %490 = OpFMul %487 %489 
                                       f32_3 %491 = OpLoad %49 
                                       f32_3 %492 = OpFAdd %490 %491 
                                                      OpStore %49 %492 
                                       f32_3 %493 = OpLoad %88 
                                       f32_4 %494 = OpVectorShuffle %493 %493 1 1 1 1 
                              Uniform f32_4* %497 = OpAccessChain %41 %495 %496 
                                       f32_4 %498 = OpLoad %497 
                                       f32_4 %499 = OpFMul %494 %498 
                                                      OpStore %20 %499 
                              Uniform f32_4* %500 = OpAccessChain %41 %495 %58 
                                       f32_4 %501 = OpLoad %500 
                                       f32_3 %502 = OpLoad %88 
                                       f32_4 %503 = OpVectorShuffle %502 %502 0 0 0 0 
                                       f32_4 %504 = OpFMul %501 %503 
                                       f32_4 %505 = OpLoad %20 
                                       f32_4 %506 = OpFAdd %504 %505 
                                                      OpStore %20 %506 
                              Uniform f32_4* %508 = OpAccessChain %41 %495 %507 
                                       f32_4 %509 = OpLoad %508 
                                       f32_3 %510 = OpLoad %88 
                                       f32_4 %511 = OpVectorShuffle %510 %510 2 2 2 2 
                                       f32_4 %512 = OpFMul %509 %511 
                                       f32_4 %513 = OpLoad %20 
                                       f32_4 %514 = OpFAdd %512 %513 
                                                      OpStore %20 %514 
                                       f32_4 %515 = OpLoad %20 
                              Uniform f32_4* %517 = OpAccessChain %41 %495 %516 
                                       f32_4 %518 = OpLoad %517 
                                       f32_4 %519 = OpFAdd %515 %518 
                                                      OpStore %20 %519 
                                Uniform f32* %521 = OpAccessChain %41 %507 %26 
                                         f32 %522 = OpLoad %521 
                                        bool %523 = OpFOrdEqual %522 %231 
                                                      OpStore %520 %523 
                                                      OpSelectionMerge %526 None 
                                                      OpBranchConditional %524 %525 %526 
                                             %525 = OpLabel 
                                        bool %527 = OpLoad %520 
                                                      OpSelectionMerge %529 None 
                                                      OpBranchConditional %527 %528 %529 
                                             %528 = OpLabel 
                                                      OpBranch %529 
                                             %529 = OpLabel 
                                                      OpBranch %526 
                                             %526 = OpLabel 
                                                      OpSelectionMerge %532 None 
                                                      OpBranchConditional %530 %531 %626 
                                             %531 = OpLabel 
                                Uniform f32* %533 = OpAccessChain %41 %507 %89 
                                         f32 %534 = OpLoad %533 
                                        bool %535 = OpFOrdEqual %534 %231 
                                                      OpStore %520 %535 
                                       f32_3 %536 = OpLoad %88 
                                       f32_3 %537 = OpVectorShuffle %536 %536 1 1 1 
                              Uniform f32_4* %538 = OpAccessChain %41 %516 %496 
                                       f32_4 %539 = OpLoad %538 
                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                                       f32_3 %541 = OpFMul %537 %540 
                                       f32_4 %542 = OpLoad %67 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 6 3 
                                                      OpStore %67 %543 
                              Uniform f32_4* %544 = OpAccessChain %41 %516 %58 
                                       f32_4 %545 = OpLoad %544 
                                       f32_3 %546 = OpVectorShuffle %545 %545 0 1 2 
                                       f32_3 %547 = OpLoad %88 
                                       f32_3 %548 = OpVectorShuffle %547 %547 0 0 0 
                                       f32_3 %549 = OpFMul %546 %548 
                                       f32_4 %550 = OpLoad %67 
                                       f32_3 %551 = OpVectorShuffle %550 %550 0 1 2 
                                       f32_3 %552 = OpFAdd %549 %551 
                                       f32_4 %553 = OpLoad %67 
                                       f32_4 %554 = OpVectorShuffle %553 %552 4 5 6 3 
                                                      OpStore %67 %554 
                              Uniform f32_4* %555 = OpAccessChain %41 %516 %507 
                                       f32_4 %556 = OpLoad %555 
                                       f32_3 %557 = OpVectorShuffle %556 %556 0 1 2 
                                       f32_3 %558 = OpLoad %88 
                                       f32_3 %559 = OpVectorShuffle %558 %558 2 2 2 
                                       f32_3 %560 = OpFMul %557 %559 
                                       f32_4 %561 = OpLoad %67 
                                       f32_3 %562 = OpVectorShuffle %561 %561 0 1 2 
                                       f32_3 %563 = OpFAdd %560 %562 
                                       f32_4 %564 = OpLoad %67 
                                       f32_4 %565 = OpVectorShuffle %564 %563 4 5 6 3 
                                                      OpStore %67 %565 
                                       f32_4 %566 = OpLoad %67 
                                       f32_3 %567 = OpVectorShuffle %566 %566 0 1 2 
                              Uniform f32_4* %568 = OpAccessChain %41 %516 %516 
                                       f32_4 %569 = OpLoad %568 
                                       f32_3 %570 = OpVectorShuffle %569 %569 0 1 2 
                                       f32_3 %571 = OpFAdd %567 %570 
                                       f32_4 %572 = OpLoad %67 
                                       f32_4 %573 = OpVectorShuffle %572 %571 4 5 6 3 
                                                      OpStore %67 %573 
                                        bool %575 = OpLoad %520 
                                                      OpSelectionMerge %577 None 
                                                      OpBranchConditional %575 %576 %580 
                                             %576 = OpLabel 
                                       f32_4 %578 = OpLoad %67 
                                       f32_3 %579 = OpVectorShuffle %578 %578 0 1 2 
                                                      OpStore %574 %579 
                                                      OpBranch %577 
                                             %580 = OpLabel 
                                       f32_3 %581 = OpLoad %88 
                                                      OpStore %574 %581 
                                                      OpBranch %577 
                                             %577 = OpLabel 
                                       f32_3 %582 = OpLoad %574 
                                       f32_4 %583 = OpLoad %67 
                                       f32_4 %584 = OpVectorShuffle %583 %582 4 5 6 3 
                                                      OpStore %67 %584 
                                       f32_4 %585 = OpLoad %67 
                                       f32_3 %586 = OpVectorShuffle %585 %585 0 1 2 
                              Uniform f32_3* %589 = OpAccessChain %41 %587 
                                       f32_3 %590 = OpLoad %589 
                                       f32_3 %591 = OpFNegate %590 
                                       f32_3 %592 = OpFAdd %586 %591 
                                       f32_4 %593 = OpLoad %67 
                                       f32_4 %594 = OpVectorShuffle %593 %592 4 5 6 3 
                                                      OpStore %67 %594 
                                       f32_4 %595 = OpLoad %67 
                                       f32_3 %596 = OpVectorShuffle %595 %595 0 1 2 
                              Uniform f32_3* %598 = OpAccessChain %41 %597 
                                       f32_3 %599 = OpLoad %598 
                                       f32_3 %600 = OpFMul %596 %599 
                                       f32_4 %601 = OpLoad %67 
                                       f32_4 %602 = OpVectorShuffle %601 %600 0 4 5 6 
                                                      OpStore %67 %602 
                                Private f32* %603 = OpAccessChain %67 %89 
                                         f32 %604 = OpLoad %603 
                                         f32 %605 = OpFMul %604 %214 
                                         f32 %606 = OpFAdd %605 %462 
                                                      OpStore %468 %606 
                                Uniform f32* %608 = OpAccessChain %41 %507 %242 
                                         f32 %609 = OpLoad %608 
                                         f32 %610 = OpFMul %609 %145 
                                         f32 %611 = OpFAdd %610 %462 
                                                      OpStore %607 %611 
                                         f32 %612 = OpLoad %468 
                                         f32 %613 = OpLoad %607 
                                         f32 %614 = OpExtInst %1 40 %612 %613 
                                Private f32* %615 = OpAccessChain %67 %26 
                                                      OpStore %615 %614 
                  read_only Texture3DSampled %620 = OpLoad %619 
                                       f32_4 %621 = OpLoad %67 
                                       f32_3 %622 = OpVectorShuffle %621 %621 0 2 3 
                                       f32_4 %623 = OpImageSampleImplicitLod %620 %622 
                                                      OpStore %67 %623 
                                       f32_4 %625 = OpLoad %67 
                                                      OpStore %624 %625 
                                                      OpBranch %532 
                                             %626 = OpLabel 
                                Private f32* %627 = OpAccessChain %624 %26 
                                                      OpStore %627 %231 
                                Private f32* %628 = OpAccessChain %624 %89 
                                                      OpStore %628 %231 
                                Private f32* %629 = OpAccessChain %624 %242 
                                                      OpStore %629 %231 
                                Private f32* %630 = OpAccessChain %624 %397 
                                                      OpStore %630 %231 
                                                      OpBranch %532 
                                             %532 = OpLabel 
                                       f32_4 %631 = OpLoad %624 
                              Uniform f32_4* %632 = OpAccessChain %41 %496 
                                       f32_4 %633 = OpLoad %632 
                                         f32 %634 = OpDot %631 %633 
                                Private f32* %635 = OpAccessChain %345 %26 
                                                      OpStore %635 %634 
                                Private f32* %636 = OpAccessChain %345 %26 
                                         f32 %637 = OpLoad %636 
                                         f32 %638 = OpExtInst %1 43 %637 %255 %231 
                                Private f32* %639 = OpAccessChain %345 %26 
                                                      OpStore %639 %638 
                                Private f32* %640 = OpAccessChain %20 %242 
                                         f32 %641 = OpLoad %640 
                                        bool %642 = OpFOrdLessThan %255 %641 
                                                      OpStore %520 %642 
                                        bool %645 = OpLoad %520 
                                                      OpSelectionMerge %647 None 
                                                      OpBranchConditional %645 %646 %648 
                                             %646 = OpLabel 
                                                      OpStore %644 %231 
                                                      OpBranch %647 
                                             %648 = OpLabel 
                                                      OpStore %644 %255 
                                                      OpBranch %647 
                                             %647 = OpLabel 
                                         f32 %649 = OpLoad %644 
                                Private f32* %650 = OpAccessChain %643 %26 
                                                      OpStore %650 %649 
                                       f32_4 %651 = OpLoad %20 
                                       f32_2 %652 = OpVectorShuffle %651 %651 0 1 
                                       f32_4 %653 = OpLoad %20 
                                       f32_2 %654 = OpVectorShuffle %653 %653 3 3 
                                       f32_2 %655 = OpFDiv %652 %654 
                                       f32_3 %656 = OpLoad %97 
                                       f32_3 %657 = OpVectorShuffle %656 %655 3 4 2 
                                                      OpStore %97 %657 
                                       f32_3 %658 = OpLoad %97 
                                       f32_2 %659 = OpVectorShuffle %658 %658 0 1 
                                       f32_2 %661 = OpFAdd %659 %660 
                                       f32_3 %662 = OpLoad %97 
                                       f32_3 %663 = OpVectorShuffle %662 %661 3 4 2 
                                                      OpStore %97 %663 
                  read_only Texture2DSampled %665 = OpLoad %664 
                                       f32_3 %666 = OpLoad %97 
                                       f32_2 %667 = OpVectorShuffle %666 %666 0 1 
                                       f32_4 %668 = OpImageSampleImplicitLod %665 %667 
                                         f32 %669 = OpCompositeExtract %668 3 
                                                      OpStore %468 %669 
                                         f32 %670 = OpLoad %468 
                                Private f32* %671 = OpAccessChain %643 %26 
                                         f32 %672 = OpLoad %671 
                                         f32 %673 = OpFMul %670 %672 
                                Private f32* %674 = OpAccessChain %643 %26 
                                                      OpStore %674 %673 
                                       f32_4 %675 = OpLoad %20 
                                       f32_3 %676 = OpVectorShuffle %675 %675 0 1 2 
                                       f32_4 %677 = OpLoad %20 
                                       f32_3 %678 = OpVectorShuffle %677 %677 0 1 2 
                                         f32 %679 = OpDot %676 %678 
                                                      OpStore %468 %679 
                  read_only Texture2DSampled %681 = OpLoad %680 
                                         f32 %682 = OpLoad %468 
                                       f32_2 %683 = OpCompositeConstruct %682 %682 
                                       f32_4 %684 = OpImageSampleImplicitLod %681 %683 
                                         f32 %685 = OpCompositeExtract %684 3 
                                                      OpStore %468 %685 
                                         f32 %686 = OpLoad %468 
                                Private f32* %687 = OpAccessChain %643 %26 
                                         f32 %688 = OpLoad %687 
                                         f32 %689 = OpFMul %686 %688 
                                Private f32* %690 = OpAccessChain %643 %26 
                                                      OpStore %690 %689 
                                Private f32* %691 = OpAccessChain %345 %26 
                                         f32 %692 = OpLoad %691 
                                Private f32* %693 = OpAccessChain %643 %26 
                                         f32 %694 = OpLoad %693 
                                         f32 %695 = OpFMul %692 %694 
                                Private f32* %696 = OpAccessChain %345 %26 
                                                      OpStore %696 %695 
                                       f32_3 %697 = OpLoad %49 
                              Uniform f32_4* %699 = OpAccessChain %41 %698 
                                       f32_4 %700 = OpLoad %699 
                                       f32_3 %701 = OpVectorShuffle %700 %700 0 1 2 
                                       f32_3 %702 = OpFMul %697 %701 
                                                      OpStore %643 %702 
                                       f32_3 %703 = OpLoad %345 
                                       f32_3 %704 = OpVectorShuffle %703 %703 0 0 0 
                                       f32_3 %705 = OpLoad %643 
                                       f32_3 %706 = OpFMul %704 %705 
                                       f32_4 %707 = OpLoad %396 
                                       f32_4 %708 = OpVectorShuffle %707 %706 4 5 6 3 
                                                      OpStore %396 %708 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat7;
vec2 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = (-u_xlat10_0.xyz) + _CausticColor.xyz;
    u_xlat0.xyz = _CausticColor.www * u_xlat7.xyz + u_xlat10_0.xyz;
    u_xlat7.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat2 = u_xlat7.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat7.x = vs_TEXCOORD2.y + vs_TEXCOORD2.x;
    u_xlat3.x = u_xlat7.y * _TimeScale + u_xlat7.x;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat4.x * 0.111111112;
    u_xlat4.y = u_xlat3.x * 0.166666672;
    u_xlat3.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat15.xy = u_xlat2.zw * vec2(0.5, 0.125);
    u_xlat2.xy = u_xlat2.xy * vec2(1.25, 0.899999976) + u_xlat7.xx;
    u_xlat7.x = cos(u_xlat2.x);
    u_xlat4.x = u_xlat7.x * 0.111111112;
    u_xlat7.x = sin(u_xlat2.y);
    u_xlat4.y = u_xlat7.x * 0.166666672;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003) + u_xlat15.xy;
    u_xlat10_3 = texture(_CausticTex, u_xlat3.xy);
    u_xlat2.xy = u_xlat2.xy * vec2(0.142857149, 0.142857149);
    u_xlat2.xy = u_xlat2.ww * vec2(0.25, 0.166666672) + u_xlat2.xy;
    u_xlat10_2 = texture(_CausticTex, u_xlat2.xy);
    u_xlat7.x = _EmissiveBoost + 1.0;
    u_xlat20 = vs_TEXCOORD3.y * 500.0;
    u_xlat19 = u_xlat7.z * 5.0 + u_xlat20;
    u_xlat19 = sin(u_xlat19);
    u_xlat4.x = u_xlat19 * 0.00150000001;
    u_xlat4.y = 0.0;
    u_xlat4.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.0, 0.075000003);
    u_xlat10_4 = texture(_ReflMapFromPixelator, u_xlat4.xy);
    u_xlat5.xyz = vs_TEXCOORD2.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat13.x = vs_TEXCOORD2.x * 6.0 + u_xlat7.y;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat19 = cos(u_xlat5.x);
    u_xlat13.x = u_xlat19 * u_xlat13.x;
    u_xlat13.x = u_xlat13.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb19 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xy = floor(u_xlat5.yz);
    u_xlat5.xy = u_xlat5.xy * vec2(0.0625, 0.0625);
    u_xlat20 = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat20 = fract(u_xlat20);
    u_xlat20 = u_xlat20 * 0.5 + 0.5;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(u_xlat20) : u_xlat10_3.xyz;
    u_xlat13.xy = u_xlat13.xx + vec2(-0.0625, -0.25);
    u_xlatb13 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlatb13 = u_xlat13.y<vs_COLOR0.x;
    u_xlat1.x = (u_xlatb13) ? 1.0 : u_xlat10_1.x;
    SV_Target0.w = u_xlat10_0.w * u_xlat1.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LightCausticPower);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_4.xyz;
    u_xlat18 = u_xlat10_4.w * _ReflPower;
    u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25 + 0.75;
        u_xlat19 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat18, u_xlat19);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat18 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat19));
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xyz);
    u_xlat16_1 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat18 = u_xlat18 * u_xlat16_1;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 183
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %98 %99 %112 %142 %162 %174 %175 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %162 Location 162 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 4 
                                             %111 = OpTypePointer Input %50 
                                Input f32_3* %112 = OpVariable Input 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                               Output f32_3* %142 = OpVariable Output 
                                             %150 = OpTypePointer Uniform %6 
                                         f32 %157 = OpConstant 3.67402E-40 
                                       f32_3 %158 = OpConstantComposite %157 %157 %157 
                               Output f32_4* %162 = OpVariable Output 
                               Output f32_4* %174 = OpVariable Output 
                                Input f32_4* %175 = OpVariable Input 
                                             %177 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %114 = OpAccessChain %21 %36 %28 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %113 %116 
                                Private f32* %120 = OpAccessChain %44 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %112 
                              Uniform f32_4* %122 = OpAccessChain %21 %36 %23 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %44 %88 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %112 
                              Uniform f32_4* %128 = OpAccessChain %21 %36 %36 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %44 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %44 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %44 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %143 = OpLoad %134 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                                      OpStore %142 %147 
                                Private f32* %148 = OpAccessChain %9 %88 
                                         f32 %149 = OpLoad %148 
                                Uniform f32* %151 = OpAccessChain %21 %28 %118 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %149 %152 
                                Private f32* %154 = OpAccessChain %9 %88 
                                                      OpStore %154 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 3 1 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %44 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %44 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_2 %164 = OpVectorShuffle %163 %163 2 3 
                                       f32_4 %165 = OpLoad %162 
                                       f32_4 %166 = OpVectorShuffle %165 %164 0 1 4 5 
                                                      OpStore %162 %166 
                                       f32_4 %167 = OpLoad %44 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 2 
                                       f32_4 %169 = OpLoad %44 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 3 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %162 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %162 %173 
                                       f32_4 %176 = OpLoad %175 
                                                      OpStore %174 %176 
                                 Output f32* %178 = OpAccessChain %92 %28 %88 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFNegate %179 
                                 Output f32* %181 = OpAccessChain %92 %28 %88 
                                                      OpStore %181 %180 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 696
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %88 %236 %310 %396 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 RelaxedPrecision 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 RelaxedPrecision 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpMemberDecorate %39 12 Offset 39 
                                                      OpMemberDecorate %39 13 Offset 39 
                                                      OpMemberDecorate %39 14 Offset 39 
                                                      OpMemberDecorate %39 15 Offset 39 
                                                      OpMemberDecorate %39 16 Offset 39 
                                                      OpMemberDecorate %39 17 Offset 39 
                                                      OpMemberDecorate %39 18 Offset 39 
                                                      OpMemberDecorate %39 19 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %199 DescriptorSet 199 
                                                      OpDecorate %199 Binding 199 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %266 DescriptorSet 266 
                                                      OpDecorate %266 Binding 266 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %310 Location 310 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %396 Location 396 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %404 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %409 RelaxedPrecision 
                                                      OpDecorate %412 RelaxedPrecision 
                                                      OpDecorate %420 RelaxedPrecision 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %423 RelaxedPrecision 
                                                      OpDecorate %424 RelaxedPrecision 
                                                      OpDecorate %425 RelaxedPrecision 
                                                      OpDecorate %456 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %545 SpecId 545 
                                                      OpDecorate %633 DescriptorSet 633 
                                                      OpDecorate %633 Binding 633 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %645 RelaxedPrecision 
                                                      OpDecorate %647 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate %652 RelaxedPrecision 
                                                      OpDecorate %659 DescriptorSet 659 
                                                      OpDecorate %659 Binding 659 
                                                      OpDecorate %668 DescriptorSet 668 
                                                      OpDecorate %668 Binding 668 
                                                      OpDecorate %680 RelaxedPrecision 
                                                      OpDecorate %686 RelaxedPrecision 
                                                      OpDecorate %687 RelaxedPrecision 
                                                      OpDecorate %690 RelaxedPrecision 
                                                      OpDecorate %691 RelaxedPrecision 
                                                      OpDecorate %692 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypePointer Private %30 
                               Private f32_3* %32 = OpVariable Private 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %7 %36 
                                              %38 = OpTypeArray %7 %36 
                                              %39 = OpTypeStruct %7 %7 %7 %37 %30 %30 %7 %38 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %7 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32_4;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 9 
                                              %44 = OpTypePointer Uniform %7 
                               Private f32_3* %49 = OpVariable Private 
                                          i32 %58 = OpConstant 0 
                                          i32 %62 = OpConstant 19 
                               Private f32_4* %67 = OpVariable Private 
                                          i32 %70 = OpConstant 11 
                                              %71 = OpTypePointer Uniform %6 
                                              %87 = OpTypePointer Input %30 
                                 Input f32_3* %88 = OpVariable Input 
                                          u32 %89 = OpConstant 1 
                                              %90 = OpTypePointer Input %6 
                               Private f32_3* %97 = OpVariable Private 
                                             %107 = OpTypePointer Private %15 
                              Private f32_2* %108 = OpVariable Private 
                                         f32 %119 = OpConstant 3.67402E-40 
                                         f32 %124 = OpConstant 3.67402E-40 
                                         i32 %135 = OpConstant 8 
                              Private f32_2* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                       f32_2 %147 = OpConstantComposite %145 %146 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_2 %153 = OpConstantComposite %151 %152 
                                         f32 %192 = OpConstant 3.67402E-40 
                                       f32_2 %193 = OpConstantComposite %192 %192 
 UniformConstant read_only Texture2DSampled* %199 = OpVariable UniformConstant 
                                         f32 %207 = OpConstant 3.67402E-40 
                                       f32_2 %208 = OpConstantComposite %207 %207 
                                         f32 %214 = OpConstant 3.67402E-40 
                                       f32_2 %215 = OpConstantComposite %214 %124 
                              Private f32_3* %222 = OpVariable Private 
                                         i32 %228 = OpConstant 16 
                                         f32 %231 = OpConstant 3.67402E-40 
                                Private f32* %234 = OpVariable Private 
                                             %235 = OpTypePointer Input %7 
                                Input f32_4* %236 = OpVariable Input 
                                         f32 %239 = OpConstant 3.67402E-40 
                                Private f32* %241 = OpVariable Private 
                                         u32 %242 = OpConstant 2 
                                         f32 %245 = OpConstant 3.67402E-40 
                                         f32 %252 = OpConstant 3.67402E-40 
                                         f32 %255 = OpConstant 3.67402E-40 
                                         f32 %262 = OpConstant 3.67402E-40 
                                       f32_2 %263 = OpConstantComposite %255 %262 
                              Private f32_4* %265 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %266 = OpVariable UniformConstant 
                              Private f32_3* %270 = OpVariable Private 
                                         f32 %273 = OpConstant 3.67402E-40 
                                         f32 %274 = OpConstant 3.67402E-40 
                                       f32_3 %275 = OpConstantComposite %273 %274 %274 
                              Private f32_2* %277 = OpVariable Private 
                                         f32 %280 = OpConstant 3.67402E-40 
                                         f32 %300 = OpConstant 3.67402E-40 
                                         i32 %302 = OpConstant 18 
                                             %307 = OpTypeBool 
                                             %308 = OpTypePointer Private %307 
                               Private bool* %309 = OpVariable Private 
                                Input f32_4* %310 = OpVariable Input 
                                       f32_2 %323 = OpConstantComposite %300 %300 
                                         f32 %329 = OpConstant 3.67402E-40 
                                         f32 %330 = OpConstant 3.67402E-40 
                                       f32_2 %331 = OpConstantComposite %329 %330 
                                         f32 %336 = OpConstant 3.67402E-40 
                              Private f32_3* %345 = OpVariable Private 
                                             %346 = OpTypePointer Function %30 
                                         f32 %358 = OpConstant 3.67402E-40 
                                         f32 %359 = OpConstant 3.67402E-40 
                                       f32_2 %360 = OpConstantComposite %358 %359 
                               Private bool* %362 = OpVariable Private 
                              Private f32_3* %368 = OpVariable Private 
                                Private f32* %385 = OpVariable Private 
                                             %386 = OpTypePointer Function %6 
                                             %395 = OpTypePointer Output %7 
                               Output f32_4* %396 = OpVariable Output 
                                         u32 %397 = OpConstant 3 
                                             %402 = OpTypePointer Output %6 
                                         i32 %405 = OpConstant 14 
                                         i32 %413 = OpConstant 15 
                                         i32 %430 = OpConstant 13 
                                         i32 %439 = OpConstant 12 
                                         f32 %462 = OpConstant 3.67402E-40 
                                       f32_3 %463 = OpConstantComposite %462 %462 %462 
                                Private f32* %468 = OpVariable Private 
                                         i32 %471 = OpConstant 10 
                                         i32 %476 = OpConstant 17 
                                         i32 %495 = OpConstant 7 
                                         i32 %496 = OpConstant 1 
                                         i32 %514 = OpConstant 2 
                                         i32 %528 = OpConstant 3 
                               Private bool* %535 = OpVariable Private 
                                        bool %539 = OpConstantFalse 
                                        bool %545 = OpSpecConstantFalse 
                                         i32 %602 = OpConstant 5 
                                             %603 = OpTypePointer Uniform %30 
                                         i32 %612 = OpConstant 4 
                                             %630 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %631 = OpTypeSampledImage %630 
                                             %632 = OpTypePointer UniformConstant %631 
 UniformConstant read_only Texture3DSampled* %633 = OpVariable UniformConstant 
                              Private f32_4* %638 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %659 = OpVariable UniformConstant 
                                             %665 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %666 = OpTypeSampledImage %665 
                                             %667 = OpTypePointer UniformConstant %666 
UniformConstant read_only TextureCubeSampled* %668 = OpVariable UniformConstant 
                                         i32 %684 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %347 = OpVariable Function 
                             Function f32_3* %372 = OpVariable Function 
                               Function f32* %387 = OpVariable Function 
                             Function f32_3* %589 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %22 = OpLoad %21 
                                        f32_2 %23 = OpLoad %17 
                                        f32_4 %24 = OpImageSampleImplicitLod %22 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %20 %26 
                                                      OpStore %29 %27 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_3 %35 = OpFNegate %34 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %35 %47 
                                                      OpStore %32 %48 
                               Uniform f32_4* %50 = OpAccessChain %41 %43 
                                        f32_4 %51 = OpLoad %50 
                                        f32_3 %52 = OpVectorShuffle %51 %51 3 3 3 
                                        f32_3 %53 = OpLoad %32 
                                        f32_3 %54 = OpFMul %52 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFAdd %54 %56 
                                                      OpStore %49 %57 
                               Uniform f32_4* %59 = OpAccessChain %41 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               Uniform f32_4* %63 = OpAccessChain %41 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFAdd %61 %65 
                                                      OpStore %32 %66 
                                        f32_3 %68 = OpLoad %32 
                                        f32_4 %69 = OpVectorShuffle %68 %68 1 1 0 0 
                                 Uniform f32* %72 = OpAccessChain %41 %70 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %41 %70 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %76 = OpAccessChain %41 %70 
                                          f32 %77 = OpLoad %76 
                                 Uniform f32* %78 = OpAccessChain %41 %70 
                                          f32 %79 = OpLoad %78 
                                        f32_4 %80 = OpCompositeConstruct %73 %75 %77 %79 
                                          f32 %81 = OpCompositeExtract %80 0 
                                          f32 %82 = OpCompositeExtract %80 1 
                                          f32 %83 = OpCompositeExtract %80 2 
                                          f32 %84 = OpCompositeExtract %80 3 
                                        f32_4 %85 = OpCompositeConstruct %81 %82 %83 %84 
                                        f32_4 %86 = OpFMul %69 %85 
                                                      OpStore %67 %86 
                                   Input f32* %91 = OpAccessChain %88 %89 
                                          f32 %92 = OpLoad %91 
                                   Input f32* %93 = OpAccessChain %88 %26 
                                          f32 %94 = OpLoad %93 
                                          f32 %95 = OpFAdd %92 %94 
                                 Private f32* %96 = OpAccessChain %32 %26 
                                                      OpStore %96 %95 
                                 Private f32* %98 = OpAccessChain %32 %89 
                                          f32 %99 = OpLoad %98 
                                Uniform f32* %100 = OpAccessChain %41 %70 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFMul %99 %101 
                                Private f32* %103 = OpAccessChain %32 %26 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %97 %26 
                                                      OpStore %106 %105 
                                Private f32* %109 = OpAccessChain %97 %26 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpExtInst %1 14 %110 
                                Private f32* %112 = OpAccessChain %108 %26 
                                                      OpStore %112 %111 
                                Private f32* %113 = OpAccessChain %97 %26 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpExtInst %1 13 %114 
                                Private f32* %116 = OpAccessChain %97 %26 
                                                      OpStore %116 %115 
                                Private f32* %117 = OpAccessChain %108 %26 
                                         f32 %118 = OpLoad %117 
                                         f32 %120 = OpFMul %118 %119 
                                Private f32* %121 = OpAccessChain %108 %26 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %97 %26 
                                         f32 %123 = OpLoad %122 
                                         f32 %125 = OpFMul %123 %124 
                                Private f32* %126 = OpAccessChain %108 %89 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %108 
                                       f32_3 %128 = OpLoad %88 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_3 %131 = OpLoad %97 
                                       f32_3 %132 = OpVectorShuffle %131 %130 3 4 2 
                                                      OpStore %97 %132 
                                       f32_3 %133 = OpLoad %97 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                                Uniform f32* %136 = OpAccessChain %41 %135 
                                         f32 %137 = OpLoad %136 
                                       f32_2 %138 = OpCompositeConstruct %137 %137 
                                       f32_2 %139 = OpFMul %134 %138 
                                       f32_3 %140 = OpLoad %97 
                                       f32_3 %141 = OpVectorShuffle %140 %139 3 4 2 
                                                      OpStore %97 %141 
                                       f32_4 %143 = OpLoad %67 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %148 = OpFMul %144 %147 
                                                      OpStore %142 %148 
                                       f32_4 %149 = OpLoad %67 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %154 = OpFMul %150 %153 
                                       f32_3 %155 = OpLoad %32 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 0 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %67 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %67 %159 
                                Private f32* %160 = OpAccessChain %67 %26 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 14 %161 
                                Private f32* %163 = OpAccessChain %32 %26 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %32 %26 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %165 %119 
                                Private f32* %167 = OpAccessChain %108 %26 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %67 %89 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpExtInst %1 13 %169 
                                Private f32* %171 = OpAccessChain %32 %26 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %32 %26 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %173 %124 
                                Private f32* %175 = OpAccessChain %108 %89 
                                                      OpStore %175 %174 
                                       f32_2 %176 = OpLoad %108 
                                       f32_3 %177 = OpLoad %88 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 1 
                                       f32_2 %179 = OpFAdd %176 %178 
                                       f32_4 %180 = OpLoad %67 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 2 3 
                                                      OpStore %67 %181 
                                       f32_4 %182 = OpLoad %67 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                Uniform f32* %184 = OpAccessChain %41 %135 
                                         f32 %185 = OpLoad %184 
                                       f32_2 %186 = OpCompositeConstruct %185 %185 
                                       f32_2 %187 = OpFMul %183 %186 
                                       f32_4 %188 = OpLoad %67 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 2 3 
                                                      OpStore %67 %189 
                                       f32_3 %190 = OpLoad %97 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %194 = OpFMul %191 %193 
                                       f32_2 %195 = OpLoad %142 
                                       f32_2 %196 = OpFAdd %194 %195 
                                       f32_3 %197 = OpLoad %97 
                                       f32_3 %198 = OpVectorShuffle %197 %196 3 4 2 
                                                      OpStore %97 %198 
                  read_only Texture2DSampled %200 = OpLoad %199 
                                       f32_3 %201 = OpLoad %97 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_4 %203 = OpImageSampleImplicitLod %200 %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                                      OpStore %97 %204 
                                       f32_4 %205 = OpLoad %67 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                                       f32_2 %209 = OpFMul %206 %208 
                                       f32_4 %210 = OpLoad %67 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 5 2 3 
                                                      OpStore %67 %211 
                                       f32_4 %212 = OpLoad %67 
                                       f32_2 %213 = OpVectorShuffle %212 %212 3 3 
                                       f32_2 %216 = OpFMul %213 %215 
                                       f32_4 %217 = OpLoad %67 
                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
                                       f32_2 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %67 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 2 3 
                                                      OpStore %67 %221 
                  read_only Texture2DSampled %223 = OpLoad %199 
                                       f32_4 %224 = OpLoad %67 
                                       f32_2 %225 = OpVectorShuffle %224 %224 0 1 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                                      OpStore %222 %227 
                                Uniform f32* %229 = OpAccessChain %41 %228 
                                         f32 %230 = OpLoad %229 
                                         f32 %232 = OpFAdd %230 %231 
                                Private f32* %233 = OpAccessChain %32 %26 
                                                      OpStore %233 %232 
                                  Input f32* %237 = OpAccessChain %236 %89 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                                      OpStore %234 %240 
                                Private f32* %243 = OpAccessChain %32 %242 
                                         f32 %244 = OpLoad %243 
                                         f32 %246 = OpFMul %244 %245 
                                         f32 %247 = OpLoad %234 
                                         f32 %248 = OpFAdd %246 %247 
                                                      OpStore %241 %248 
                                         f32 %249 = OpLoad %241 
                                         f32 %250 = OpExtInst %1 13 %249 
                                                      OpStore %241 %250 
                                         f32 %251 = OpLoad %241 
                                         f32 %253 = OpFMul %251 %252 
                                Private f32* %254 = OpAccessChain %108 %26 
                                                      OpStore %254 %253 
                                Private f32* %256 = OpAccessChain %108 %89 
                                                      OpStore %256 %255 
                                       f32_2 %257 = OpLoad %108 
                                       f32_4 %258 = OpLoad %236 
                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
                                       f32_2 %260 = OpFAdd %257 %259 
                                                      OpStore %108 %260 
                                       f32_2 %261 = OpLoad %108 
                                       f32_2 %264 = OpFAdd %261 %263 
                                                      OpStore %108 %264 
                  read_only Texture2DSampled %267 = OpLoad %266 
                                       f32_2 %268 = OpLoad %108 
                                       f32_4 %269 = OpImageSampleImplicitLod %267 %268 
                                                      OpStore %265 %269 
                                       f32_3 %271 = OpLoad %88 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 0 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %270 %276 
                                  Input f32* %278 = OpAccessChain %88 %26 
                                         f32 %279 = OpLoad %278 
                                         f32 %281 = OpFMul %279 %280 
                                Private f32* %282 = OpAccessChain %32 %89 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFAdd %281 %283 
                                Private f32* %285 = OpAccessChain %277 %26 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %277 %26 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpExtInst %1 13 %287 
                                Private f32* %289 = OpAccessChain %277 %26 
                                                      OpStore %289 %288 
                                Private f32* %290 = OpAccessChain %270 %26 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpExtInst %1 14 %291 
                                                      OpStore %241 %292 
                                         f32 %293 = OpLoad %241 
                                Private f32* %294 = OpAccessChain %277 %26 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFMul %293 %295 
                                Private f32* %297 = OpAccessChain %277 %26 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %277 %26 
                                         f32 %299 = OpLoad %298 
                                         f32 %301 = OpFMul %299 %300 
                                Uniform f32* %303 = OpAccessChain %41 %302 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpFAdd %301 %304 
                                Private f32* %306 = OpAccessChain %277 %26 
                                                      OpStore %306 %305 
                                  Input f32* %311 = OpAccessChain %310 %26 
                                         f32 %312 = OpLoad %311 
                                Private f32* %313 = OpAccessChain %277 %26 
                                         f32 %314 = OpLoad %313 
                                        bool %315 = OpFOrdLessThan %312 %314 
                                                      OpStore %309 %315 
                                       f32_3 %316 = OpLoad %270 
                                       f32_2 %317 = OpVectorShuffle %316 %316 1 2 
                                       f32_2 %318 = OpExtInst %1 8 %317 
                                       f32_3 %319 = OpLoad %270 
                                       f32_3 %320 = OpVectorShuffle %319 %318 3 4 2 
                                                      OpStore %270 %320 
                                       f32_3 %321 = OpLoad %270 
                                       f32_2 %322 = OpVectorShuffle %321 %321 0 1 
                                       f32_2 %324 = OpFMul %322 %323 
                                       f32_3 %325 = OpLoad %270 
                                       f32_3 %326 = OpVectorShuffle %325 %324 3 4 2 
                                                      OpStore %270 %326 
                                       f32_3 %327 = OpLoad %270 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
                                         f32 %332 = OpDot %328 %331 
                                                      OpStore %234 %332 
                                         f32 %333 = OpLoad %234 
                                         f32 %334 = OpExtInst %1 13 %333 
                                                      OpStore %234 %334 
                                         f32 %335 = OpLoad %234 
                                         f32 %337 = OpFMul %335 %336 
                                                      OpStore %234 %337 
                                         f32 %338 = OpLoad %234 
                                         f32 %339 = OpExtInst %1 10 %338 
                                                      OpStore %234 %339 
                                         f32 %340 = OpLoad %234 
                                         f32 %341 = OpFMul %340 %145 
                                         f32 %342 = OpFAdd %341 %145 
                                                      OpStore %234 %342 
                                         f32 %343 = OpLoad %234 
                                         f32 %344 = OpFMul %343 %145 
                                                      OpStore %234 %344 
                                        bool %348 = OpLoad %309 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %348 %349 %353 
                                             %349 = OpLabel 
                                         f32 %351 = OpLoad %234 
                                       f32_3 %352 = OpCompositeConstruct %351 %351 %351 
                                                      OpStore %347 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                                       f32_3 %354 = OpLoad %97 
                                                      OpStore %347 %354 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                       f32_3 %355 = OpLoad %347 
                                                      OpStore %345 %355 
                                       f32_2 %356 = OpLoad %277 
                                       f32_2 %357 = OpVectorShuffle %356 %356 0 0 
                                       f32_2 %361 = OpFAdd %357 %360 
                                                      OpStore %277 %361 
                                  Input f32* %363 = OpAccessChain %310 %26 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %277 %26 
                                         f32 %366 = OpLoad %365 
                                        bool %367 = OpFOrdLessThan %364 %366 
                                                      OpStore %362 %367 
                                       f32_3 %369 = OpLoad %345 
                                       f32_3 %370 = OpLoad %345 
                                       f32_3 %371 = OpFAdd %369 %370 
                                                      OpStore %368 %371 
                                        bool %373 = OpLoad %362 
                                                      OpSelectionMerge %375 None 
                                                      OpBranchConditional %373 %374 %377 
                                             %374 = OpLabel 
                                       f32_3 %376 = OpLoad %368 
                                                      OpStore %372 %376 
                                                      OpBranch %375 
                                             %377 = OpLabel 
                                       f32_3 %378 = OpLoad %345 
                                                      OpStore %372 %378 
                                                      OpBranch %375 
                                             %375 = OpLabel 
                                       f32_3 %379 = OpLoad %372 
                                                      OpStore %345 %379 
                                Private f32* %380 = OpAccessChain %277 %89 
                                         f32 %381 = OpLoad %380 
                                  Input f32* %382 = OpAccessChain %310 %26 
                                         f32 %383 = OpLoad %382 
                                        bool %384 = OpFOrdLessThan %381 %383 
                                                      OpStore %362 %384 
                                        bool %388 = OpLoad %362 
                                                      OpSelectionMerge %390 None 
                                                      OpBranchConditional %388 %389 %391 
                                             %389 = OpLabel 
                                                      OpStore %387 %231 
                                                      OpBranch %390 
                                             %391 = OpLabel 
                                Private f32* %392 = OpAccessChain %20 %26 
                                         f32 %393 = OpLoad %392 
                                                      OpStore %387 %393 
                                                      OpBranch %390 
                                             %390 = OpLabel 
                                         f32 %394 = OpLoad %387 
                                                      OpStore %385 %394 
                                Private f32* %398 = OpAccessChain %9 %397 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpLoad %385 
                                         f32 %401 = OpFMul %399 %400 
                                 Output f32* %403 = OpAccessChain %396 %397 
                                                      OpStore %403 %401 
                                       f32_3 %404 = OpLoad %345 
                                Uniform f32* %406 = OpAccessChain %41 %405 
                                         f32 %407 = OpLoad %406 
                                       f32_3 %408 = OpCompositeConstruct %407 %407 %407 
                                       f32_3 %409 = OpFMul %404 %408 
                                       f32_4 %410 = OpLoad %20 
                                       f32_4 %411 = OpVectorShuffle %410 %409 4 1 5 6 
                                                      OpStore %20 %411 
                                       f32_3 %412 = OpLoad %222 
                                Uniform f32* %414 = OpAccessChain %41 %413 
                                         f32 %415 = OpLoad %414 
                                Uniform f32* %416 = OpAccessChain %41 %413 
                                         f32 %417 = OpLoad %416 
                                Uniform f32* %418 = OpAccessChain %41 %413 
                                         f32 %419 = OpLoad %418 
                                       f32_3 %420 = OpCompositeConstruct %415 %417 %419 
                                         f32 %421 = OpCompositeExtract %420 0 
                                         f32 %422 = OpCompositeExtract %420 1 
                                         f32 %423 = OpCompositeExtract %420 2 
                                       f32_3 %424 = OpCompositeConstruct %421 %422 %423 
                                       f32_3 %425 = OpFMul %412 %424 
                                       f32_4 %426 = OpLoad %67 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 6 3 
                                                      OpStore %67 %427 
                                       f32_4 %428 = OpLoad %67 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                              Uniform f32_4* %431 = OpAccessChain %41 %430 
                                       f32_4 %432 = OpLoad %431 
                                       f32_3 %433 = OpVectorShuffle %432 %432 0 1 2 
                                       f32_3 %434 = OpFMul %429 %433 
                                       f32_4 %435 = OpLoad %67 
                                       f32_4 %436 = OpVectorShuffle %435 %434 4 5 6 3 
                                                      OpStore %67 %436 
                                       f32_4 %437 = OpLoad %20 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 2 3 
                              Uniform f32_4* %440 = OpAccessChain %41 %439 
                                       f32_4 %441 = OpLoad %440 
                                       f32_3 %442 = OpVectorShuffle %441 %441 0 1 2 
                                       f32_3 %443 = OpFMul %438 %442 
                                       f32_4 %444 = OpLoad %67 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_3 %446 = OpFNegate %445 
                                       f32_3 %447 = OpFAdd %443 %446 
                                       f32_4 %448 = OpLoad %20 
                                       f32_4 %449 = OpVectorShuffle %448 %447 4 1 5 6 
                                                      OpStore %20 %449 
                                       f32_3 %450 = OpLoad %49 
                                       f32_3 %451 = OpLoad %32 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 0 0 
                                       f32_3 %453 = OpFMul %450 %452 
                                                      OpStore %49 %453 
                                       f32_4 %454 = OpLoad %20 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 2 3 
                                         f32 %456 = OpLoad %385 
                                       f32_3 %457 = OpCompositeConstruct %456 %456 %456 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %459 = OpLoad %49 
                                       f32_3 %460 = OpFAdd %458 %459 
                                                      OpStore %49 %460 
                                       f32_3 %461 = OpLoad %49 
                                       f32_3 %464 = OpFMul %461 %463 
                                       f32_4 %465 = OpLoad %265 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_3 %467 = OpFAdd %464 %466 
                                                      OpStore %345 %467 
                                Private f32* %469 = OpAccessChain %265 %397 
                                         f32 %470 = OpLoad %469 
                                Uniform f32* %472 = OpAccessChain %41 %471 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFMul %470 %473 
                                                      OpStore %468 %474 
                                         f32 %475 = OpLoad %468 
                                Uniform f32* %477 = OpAccessChain %41 %476 
                                         f32 %478 = OpLoad %477 
                                         f32 %479 = OpFMul %475 %478 
                                                      OpStore %468 %479 
                                       f32_3 %480 = OpLoad %49 
                                       f32_3 %481 = OpFNegate %480 
                                       f32_3 %482 = OpLoad %345 
                                       f32_3 %483 = OpFAdd %481 %482 
                                       f32_4 %484 = OpLoad %20 
                                       f32_4 %485 = OpVectorShuffle %484 %483 4 5 6 3 
                                                      OpStore %20 %485 
                                         f32 %486 = OpLoad %468 
                                       f32_3 %487 = OpCompositeConstruct %486 %486 %486 
                                       f32_4 %488 = OpLoad %20 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 1 2 
                                       f32_3 %490 = OpFMul %487 %489 
                                       f32_3 %491 = OpLoad %49 
                                       f32_3 %492 = OpFAdd %490 %491 
                                                      OpStore %49 %492 
                                       f32_3 %493 = OpLoad %88 
                                       f32_3 %494 = OpVectorShuffle %493 %493 1 1 1 
                              Uniform f32_4* %497 = OpAccessChain %41 %495 %496 
                                       f32_4 %498 = OpLoad %497 
                                       f32_3 %499 = OpVectorShuffle %498 %498 0 1 2 
                                       f32_3 %500 = OpFMul %494 %499 
                                       f32_4 %501 = OpLoad %20 
                                       f32_4 %502 = OpVectorShuffle %501 %500 4 5 6 3 
                                                      OpStore %20 %502 
                              Uniform f32_4* %503 = OpAccessChain %41 %495 %58 
                                       f32_4 %504 = OpLoad %503 
                                       f32_3 %505 = OpVectorShuffle %504 %504 0 1 2 
                                       f32_3 %506 = OpLoad %88 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 0 0 
                                       f32_3 %508 = OpFMul %505 %507 
                                       f32_4 %509 = OpLoad %20 
                                       f32_3 %510 = OpVectorShuffle %509 %509 0 1 2 
                                       f32_3 %511 = OpFAdd %508 %510 
                                       f32_4 %512 = OpLoad %20 
                                       f32_4 %513 = OpVectorShuffle %512 %511 4 5 6 3 
                                                      OpStore %20 %513 
                              Uniform f32_4* %515 = OpAccessChain %41 %495 %514 
                                       f32_4 %516 = OpLoad %515 
                                       f32_3 %517 = OpVectorShuffle %516 %516 0 1 2 
                                       f32_3 %518 = OpLoad %88 
                                       f32_3 %519 = OpVectorShuffle %518 %518 2 2 2 
                                       f32_3 %520 = OpFMul %517 %519 
                                       f32_4 %521 = OpLoad %20 
                                       f32_3 %522 = OpVectorShuffle %521 %521 0 1 2 
                                       f32_3 %523 = OpFAdd %520 %522 
                                       f32_4 %524 = OpLoad %20 
                                       f32_4 %525 = OpVectorShuffle %524 %523 4 5 6 3 
                                                      OpStore %20 %525 
                                       f32_4 %526 = OpLoad %20 
                                       f32_3 %527 = OpVectorShuffle %526 %526 0 1 2 
                              Uniform f32_4* %529 = OpAccessChain %41 %495 %528 
                                       f32_4 %530 = OpLoad %529 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
                                       f32_3 %532 = OpFAdd %527 %531 
                                       f32_4 %533 = OpLoad %20 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %20 %534 
                                Uniform f32* %536 = OpAccessChain %41 %514 %26 
                                         f32 %537 = OpLoad %536 
                                        bool %538 = OpFOrdEqual %537 %231 
                                                      OpStore %535 %538 
                                                      OpSelectionMerge %541 None 
                                                      OpBranchConditional %539 %540 %541 
                                             %540 = OpLabel 
                                        bool %542 = OpLoad %535 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %542 %543 %544 
                                             %543 = OpLabel 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                                      OpBranch %541 
                                             %541 = OpLabel 
                                                      OpSelectionMerge %547 None 
                                                      OpBranchConditional %545 %546 %640 
                                             %546 = OpLabel 
                                Uniform f32* %548 = OpAccessChain %41 %514 %89 
                                         f32 %549 = OpLoad %548 
                                        bool %550 = OpFOrdEqual %549 %231 
                                                      OpStore %535 %550 
                                       f32_3 %551 = OpLoad %88 
                                       f32_3 %552 = OpVectorShuffle %551 %551 1 1 1 
                              Uniform f32_4* %553 = OpAccessChain %41 %528 %496 
                                       f32_4 %554 = OpLoad %553 
                                       f32_3 %555 = OpVectorShuffle %554 %554 0 1 2 
                                       f32_3 %556 = OpFMul %552 %555 
                                       f32_4 %557 = OpLoad %67 
                                       f32_4 %558 = OpVectorShuffle %557 %556 4 5 6 3 
                                                      OpStore %67 %558 
                              Uniform f32_4* %559 = OpAccessChain %41 %528 %58 
                                       f32_4 %560 = OpLoad %559 
                                       f32_3 %561 = OpVectorShuffle %560 %560 0 1 2 
                                       f32_3 %562 = OpLoad %88 
                                       f32_3 %563 = OpVectorShuffle %562 %562 0 0 0 
                                       f32_3 %564 = OpFMul %561 %563 
                                       f32_4 %565 = OpLoad %67 
                                       f32_3 %566 = OpVectorShuffle %565 %565 0 1 2 
                                       f32_3 %567 = OpFAdd %564 %566 
                                       f32_4 %568 = OpLoad %67 
                                       f32_4 %569 = OpVectorShuffle %568 %567 4 5 6 3 
                                                      OpStore %67 %569 
                              Uniform f32_4* %570 = OpAccessChain %41 %528 %514 
                                       f32_4 %571 = OpLoad %570 
                                       f32_3 %572 = OpVectorShuffle %571 %571 0 1 2 
                                       f32_3 %573 = OpLoad %88 
                                       f32_3 %574 = OpVectorShuffle %573 %573 2 2 2 
                                       f32_3 %575 = OpFMul %572 %574 
                                       f32_4 %576 = OpLoad %67 
                                       f32_3 %577 = OpVectorShuffle %576 %576 0 1 2 
                                       f32_3 %578 = OpFAdd %575 %577 
                                       f32_4 %579 = OpLoad %67 
                                       f32_4 %580 = OpVectorShuffle %579 %578 4 5 6 3 
                                                      OpStore %67 %580 
                                       f32_4 %581 = OpLoad %67 
                                       f32_3 %582 = OpVectorShuffle %581 %581 0 1 2 
                              Uniform f32_4* %583 = OpAccessChain %41 %528 %528 
                                       f32_4 %584 = OpLoad %583 
                                       f32_3 %585 = OpVectorShuffle %584 %584 0 1 2 
                                       f32_3 %586 = OpFAdd %582 %585 
                                       f32_4 %587 = OpLoad %67 
                                       f32_4 %588 = OpVectorShuffle %587 %586 4 5 6 3 
                                                      OpStore %67 %588 
                                        bool %590 = OpLoad %535 
                                                      OpSelectionMerge %592 None 
                                                      OpBranchConditional %590 %591 %595 
                                             %591 = OpLabel 
                                       f32_4 %593 = OpLoad %67 
                                       f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
                                                      OpStore %589 %594 
                                                      OpBranch %592 
                                             %595 = OpLabel 
                                       f32_3 %596 = OpLoad %88 
                                                      OpStore %589 %596 
                                                      OpBranch %592 
                                             %592 = OpLabel 
                                       f32_3 %597 = OpLoad %589 
                                       f32_4 %598 = OpLoad %67 
                                       f32_4 %599 = OpVectorShuffle %598 %597 4 5 6 3 
                                                      OpStore %67 %599 
                                       f32_4 %600 = OpLoad %67 
                                       f32_3 %601 = OpVectorShuffle %600 %600 0 1 2 
                              Uniform f32_3* %604 = OpAccessChain %41 %602 
                                       f32_3 %605 = OpLoad %604 
                                       f32_3 %606 = OpFNegate %605 
                                       f32_3 %607 = OpFAdd %601 %606 
                                       f32_4 %608 = OpLoad %67 
                                       f32_4 %609 = OpVectorShuffle %608 %607 4 5 6 3 
                                                      OpStore %67 %609 
                                       f32_4 %610 = OpLoad %67 
                                       f32_3 %611 = OpVectorShuffle %610 %610 0 1 2 
                              Uniform f32_3* %613 = OpAccessChain %41 %612 
                                       f32_3 %614 = OpLoad %613 
                                       f32_3 %615 = OpFMul %611 %614 
                                       f32_4 %616 = OpLoad %67 
                                       f32_4 %617 = OpVectorShuffle %616 %615 0 4 5 6 
                                                      OpStore %67 %617 
                                Private f32* %618 = OpAccessChain %67 %89 
                                         f32 %619 = OpLoad %618 
                                         f32 %620 = OpFMul %619 %214 
                                         f32 %621 = OpFAdd %620 %462 
                                                      OpStore %468 %621 
                                Uniform f32* %622 = OpAccessChain %41 %514 %242 
                                         f32 %623 = OpLoad %622 
                                         f32 %624 = OpFMul %623 %145 
                                         f32 %625 = OpFAdd %624 %462 
                                                      OpStore %241 %625 
                                         f32 %626 = OpLoad %468 
                                         f32 %627 = OpLoad %241 
                                         f32 %628 = OpExtInst %1 40 %626 %627 
                                Private f32* %629 = OpAccessChain %67 %26 
                                                      OpStore %629 %628 
                  read_only Texture3DSampled %634 = OpLoad %633 
                                       f32_4 %635 = OpLoad %67 
                                       f32_3 %636 = OpVectorShuffle %635 %635 0 2 3 
                                       f32_4 %637 = OpImageSampleImplicitLod %634 %636 
                                                      OpStore %67 %637 
                                       f32_4 %639 = OpLoad %67 
                                                      OpStore %638 %639 
                                                      OpBranch %547 
                                             %640 = OpLabel 
                                Private f32* %641 = OpAccessChain %638 %26 
                                                      OpStore %641 %231 
                                Private f32* %642 = OpAccessChain %638 %89 
                                                      OpStore %642 %231 
                                Private f32* %643 = OpAccessChain %638 %242 
                                                      OpStore %643 %231 
                                Private f32* %644 = OpAccessChain %638 %397 
                                                      OpStore %644 %231 
                                                      OpBranch %547 
                                             %547 = OpLabel 
                                       f32_4 %645 = OpLoad %638 
                              Uniform f32_4* %646 = OpAccessChain %41 %496 
                                       f32_4 %647 = OpLoad %646 
                                         f32 %648 = OpDot %645 %647 
                                Private f32* %649 = OpAccessChain %345 %26 
                                                      OpStore %649 %648 
                                Private f32* %650 = OpAccessChain %345 %26 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpExtInst %1 43 %651 %255 %231 
                                Private f32* %653 = OpAccessChain %345 %26 
                                                      OpStore %653 %652 
                                       f32_4 %654 = OpLoad %20 
                                       f32_3 %655 = OpVectorShuffle %654 %654 0 1 2 
                                       f32_4 %656 = OpLoad %20 
                                       f32_3 %657 = OpVectorShuffle %656 %656 0 1 2 
                                         f32 %658 = OpDot %655 %657 
                                                      OpStore %468 %658 
                  read_only Texture2DSampled %660 = OpLoad %659 
                                         f32 %661 = OpLoad %468 
                                       f32_2 %662 = OpCompositeConstruct %661 %661 
                                       f32_4 %663 = OpImageSampleImplicitLod %660 %662 
                                         f32 %664 = OpCompositeExtract %663 3 
                                                      OpStore %468 %664 
                read_only TextureCubeSampled %669 = OpLoad %668 
                                       f32_4 %670 = OpLoad %20 
                                       f32_3 %671 = OpVectorShuffle %670 %670 0 1 2 
                                       f32_4 %672 = OpImageSampleImplicitLod %669 %671 
                                         f32 %673 = OpCompositeExtract %672 3 
                                Private f32* %674 = OpAccessChain %20 %26 
                                                      OpStore %674 %673 
                                         f32 %675 = OpLoad %468 
                                Private f32* %676 = OpAccessChain %20 %26 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFMul %675 %677 
                                                      OpStore %468 %678 
                                Private f32* %679 = OpAccessChain %345 %26 
                                         f32 %680 = OpLoad %679 
                                         f32 %681 = OpLoad %468 
                                         f32 %682 = OpFMul %680 %681 
                                                      OpStore %468 %682 
                                       f32_3 %683 = OpLoad %49 
                              Uniform f32_4* %685 = OpAccessChain %41 %684 
                                       f32_4 %686 = OpLoad %685 
                                       f32_3 %687 = OpVectorShuffle %686 %686 0 1 2 
                                       f32_3 %688 = OpFMul %683 %687 
                                                      OpStore %345 %688 
                                         f32 %689 = OpLoad %468 
                                       f32_3 %690 = OpCompositeConstruct %689 %689 %689 
                                       f32_3 %691 = OpLoad %345 
                                       f32_3 %692 = OpFMul %690 %691 
                                       f32_4 %693 = OpLoad %396 
                                       f32_4 %694 = OpVectorShuffle %693 %692 4 5 6 3 
                                                      OpStore %396 %694 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat7;
vec2 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat7.xyz = (-u_xlat10_0.xyz) + _CausticColor.xyz;
    u_xlat0.xyz = _CausticColor.www * u_xlat7.xyz + u_xlat10_0.xyz;
    u_xlat7.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat2 = u_xlat7.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat7.x = vs_TEXCOORD2.y + vs_TEXCOORD2.x;
    u_xlat3.x = u_xlat7.y * _TimeScale + u_xlat7.x;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.x = u_xlat4.x * 0.111111112;
    u_xlat4.y = u_xlat3.x * 0.166666672;
    u_xlat3.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_CausticScale);
    u_xlat15.xy = u_xlat2.zw * vec2(0.5, 0.125);
    u_xlat2.xy = u_xlat2.xy * vec2(1.25, 0.899999976) + u_xlat7.xx;
    u_xlat7.x = cos(u_xlat2.x);
    u_xlat4.x = u_xlat7.x * 0.111111112;
    u_xlat7.x = sin(u_xlat2.y);
    u_xlat4.y = u_xlat7.x * 0.166666672;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3.xy = u_xlat3.xy * vec2(0.200000003, 0.200000003) + u_xlat15.xy;
    u_xlat10_3 = texture(_CausticTex, u_xlat3.xy);
    u_xlat2.xy = u_xlat2.xy * vec2(0.142857149, 0.142857149);
    u_xlat2.xy = u_xlat2.ww * vec2(0.25, 0.166666672) + u_xlat2.xy;
    u_xlat10_2 = texture(_CausticTex, u_xlat2.xy);
    u_xlat7.x = _EmissiveBoost + 1.0;
    u_xlat20 = vs_TEXCOORD3.y * 500.0;
    u_xlat19 = u_xlat7.z * 5.0 + u_xlat20;
    u_xlat19 = sin(u_xlat19);
    u_xlat4.x = u_xlat19 * 0.00150000001;
    u_xlat4.y = 0.0;
    u_xlat4.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.0, 0.075000003);
    u_xlat10_4 = texture(_ReflMapFromPixelator, u_xlat4.xy);
    u_xlat5.xyz = vs_TEXCOORD2.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat13.x = vs_TEXCOORD2.x * 6.0 + u_xlat7.y;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat19 = cos(u_xlat5.x);
    u_xlat13.x = u_xlat19 * u_xlat13.x;
    u_xlat13.x = u_xlat13.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb19 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xy = floor(u_xlat5.yz);
    u_xlat5.xy = u_xlat5.xy * vec2(0.0625, 0.0625);
    u_xlat20 = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
    u_xlat20 = sin(u_xlat20);
    u_xlat20 = u_xlat20 * 43758.5469;
    u_xlat20 = fract(u_xlat20);
    u_xlat20 = u_xlat20 * 0.5 + 0.5;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat3.xyz = (bool(u_xlatb19)) ? vec3(u_xlat20) : u_xlat10_3.xyz;
    u_xlat13.xy = u_xlat13.xx + vec2(-0.0625, -0.25);
    u_xlatb13 = vs_COLOR0.x<u_xlat13.x;
    u_xlat5.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlatb13 = u_xlat13.y<vs_COLOR0.x;
    u_xlat1.x = (u_xlatb13) ? 1.0 : u_xlat10_1.x;
    SV_Target0.w = u_xlat10_0.w * u_xlat1.x;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LightCausticPower);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_4.xyz;
    u_xlat18 = u_xlat10_4.w * _ReflPower;
    u_xlat18 = u_xlat18 * _GlobalReflectionsEnabled;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25 + 0.75;
        u_xlat13.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat18, u_xlat13.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat18 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlat18 = u_xlat18 * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 183
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %98 %99 %112 %142 %162 %174 %175 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %162 Location 162 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 4 
                                             %111 = OpTypePointer Input %50 
                                Input f32_3* %112 = OpVariable Input 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                               Output f32_3* %142 = OpVariable Output 
                                             %150 = OpTypePointer Uniform %6 
                                         f32 %157 = OpConstant 3.67402E-40 
                                       f32_3 %158 = OpConstantComposite %157 %157 %157 
                               Output f32_4* %162 = OpVariable Output 
                               Output f32_4* %174 = OpVariable Output 
                                Input f32_4* %175 = OpVariable Input 
                                             %177 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %114 = OpAccessChain %21 %36 %28 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %113 %116 
                                Private f32* %120 = OpAccessChain %44 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %112 
                              Uniform f32_4* %122 = OpAccessChain %21 %36 %23 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %44 %88 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %112 
                              Uniform f32_4* %128 = OpAccessChain %21 %36 %36 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %44 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %44 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %44 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %143 = OpLoad %134 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                                      OpStore %142 %147 
                                Private f32* %148 = OpAccessChain %9 %88 
                                         f32 %149 = OpLoad %148 
                                Uniform f32* %151 = OpAccessChain %21 %28 %118 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %149 %152 
                                Private f32* %154 = OpAccessChain %9 %88 
                                                      OpStore %154 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 3 1 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %44 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %44 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_2 %164 = OpVectorShuffle %163 %163 2 3 
                                       f32_4 %165 = OpLoad %162 
                                       f32_4 %166 = OpVectorShuffle %165 %164 0 1 4 5 
                                                      OpStore %162 %166 
                                       f32_4 %167 = OpLoad %44 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 2 
                                       f32_4 %169 = OpLoad %44 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 3 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %162 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %162 %173 
                                       f32_4 %176 = OpLoad %175 
                                                      OpStore %174 %176 
                                 Output f32* %178 = OpAccessChain %92 %28 %88 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFNegate %179 
                                 Output f32* %181 = OpAccessChain %92 %28 %88 
                                                      OpStore %181 %180 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 679
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %88 %236 %310 %396 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 RelaxedPrecision 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 RelaxedPrecision 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpMemberDecorate %39 12 Offset 39 
                                                      OpMemberDecorate %39 13 Offset 39 
                                                      OpMemberDecorate %39 14 Offset 39 
                                                      OpMemberDecorate %39 15 Offset 39 
                                                      OpMemberDecorate %39 16 Offset 39 
                                                      OpMemberDecorate %39 17 Offset 39 
                                                      OpMemberDecorate %39 18 Offset 39 
                                                      OpMemberDecorate %39 19 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %199 DescriptorSet 199 
                                                      OpDecorate %199 Binding 199 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %266 DescriptorSet 266 
                                                      OpDecorate %266 Binding 266 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %310 Location 310 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %396 Location 396 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %404 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %409 RelaxedPrecision 
                                                      OpDecorate %412 RelaxedPrecision 
                                                      OpDecorate %420 RelaxedPrecision 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %423 RelaxedPrecision 
                                                      OpDecorate %424 RelaxedPrecision 
                                                      OpDecorate %425 RelaxedPrecision 
                                                      OpDecorate %456 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %545 SpecId 545 
                                                      OpDecorate %635 DescriptorSet 635 
                                                      OpDecorate %635 Binding 635 
                                                      OpDecorate %640 RelaxedPrecision 
                                                      OpDecorate %647 RelaxedPrecision 
                                                      OpDecorate %649 RelaxedPrecision 
                                                      OpDecorate %650 RelaxedPrecision 
                                                      OpDecorate %653 RelaxedPrecision 
                                                      OpDecorate %654 RelaxedPrecision 
                                                      OpDecorate %656 DescriptorSet 656 
                                                      OpDecorate %656 Binding 656 
                                                      OpDecorate %663 RelaxedPrecision 
                                                      OpDecorate %669 RelaxedPrecision 
                                                      OpDecorate %670 RelaxedPrecision 
                                                      OpDecorate %673 RelaxedPrecision 
                                                      OpDecorate %674 RelaxedPrecision 
                                                      OpDecorate %675 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypePointer Private %30 
                               Private f32_3* %32 = OpVariable Private 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %7 %36 
                                              %38 = OpTypeArray %7 %36 
                                              %39 = OpTypeStruct %7 %7 %7 %37 %30 %30 %7 %38 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %7 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32_4;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 9 
                                              %44 = OpTypePointer Uniform %7 
                               Private f32_3* %49 = OpVariable Private 
                                          i32 %58 = OpConstant 0 
                                          i32 %62 = OpConstant 19 
                               Private f32_4* %67 = OpVariable Private 
                                          i32 %70 = OpConstant 11 
                                              %71 = OpTypePointer Uniform %6 
                                              %87 = OpTypePointer Input %30 
                                 Input f32_3* %88 = OpVariable Input 
                                          u32 %89 = OpConstant 1 
                                              %90 = OpTypePointer Input %6 
                               Private f32_3* %97 = OpVariable Private 
                                             %107 = OpTypePointer Private %15 
                              Private f32_2* %108 = OpVariable Private 
                                         f32 %119 = OpConstant 3.67402E-40 
                                         f32 %124 = OpConstant 3.67402E-40 
                                         i32 %135 = OpConstant 8 
                              Private f32_2* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                       f32_2 %147 = OpConstantComposite %145 %146 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_2 %153 = OpConstantComposite %151 %152 
                                         f32 %192 = OpConstant 3.67402E-40 
                                       f32_2 %193 = OpConstantComposite %192 %192 
 UniformConstant read_only Texture2DSampled* %199 = OpVariable UniformConstant 
                                         f32 %207 = OpConstant 3.67402E-40 
                                       f32_2 %208 = OpConstantComposite %207 %207 
                                         f32 %214 = OpConstant 3.67402E-40 
                                       f32_2 %215 = OpConstantComposite %214 %124 
                              Private f32_3* %222 = OpVariable Private 
                                         i32 %228 = OpConstant 16 
                                         f32 %231 = OpConstant 3.67402E-40 
                                Private f32* %234 = OpVariable Private 
                                             %235 = OpTypePointer Input %7 
                                Input f32_4* %236 = OpVariable Input 
                                         f32 %239 = OpConstant 3.67402E-40 
                                Private f32* %241 = OpVariable Private 
                                         u32 %242 = OpConstant 2 
                                         f32 %245 = OpConstant 3.67402E-40 
                                         f32 %252 = OpConstant 3.67402E-40 
                                         f32 %255 = OpConstant 3.67402E-40 
                                         f32 %262 = OpConstant 3.67402E-40 
                                       f32_2 %263 = OpConstantComposite %255 %262 
                              Private f32_4* %265 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %266 = OpVariable UniformConstant 
                              Private f32_3* %270 = OpVariable Private 
                                         f32 %273 = OpConstant 3.67402E-40 
                                         f32 %274 = OpConstant 3.67402E-40 
                                       f32_3 %275 = OpConstantComposite %273 %274 %274 
                              Private f32_2* %277 = OpVariable Private 
                                         f32 %280 = OpConstant 3.67402E-40 
                                         f32 %300 = OpConstant 3.67402E-40 
                                         i32 %302 = OpConstant 18 
                                             %307 = OpTypeBool 
                                             %308 = OpTypePointer Private %307 
                               Private bool* %309 = OpVariable Private 
                                Input f32_4* %310 = OpVariable Input 
                                       f32_2 %323 = OpConstantComposite %300 %300 
                                         f32 %329 = OpConstant 3.67402E-40 
                                         f32 %330 = OpConstant 3.67402E-40 
                                       f32_2 %331 = OpConstantComposite %329 %330 
                                         f32 %336 = OpConstant 3.67402E-40 
                              Private f32_3* %345 = OpVariable Private 
                                             %346 = OpTypePointer Function %30 
                                         f32 %358 = OpConstant 3.67402E-40 
                                         f32 %359 = OpConstant 3.67402E-40 
                                       f32_2 %360 = OpConstantComposite %358 %359 
                               Private bool* %362 = OpVariable Private 
                              Private f32_3* %368 = OpVariable Private 
                                Private f32* %385 = OpVariable Private 
                                             %386 = OpTypePointer Function %6 
                                             %395 = OpTypePointer Output %7 
                               Output f32_4* %396 = OpVariable Output 
                                         u32 %397 = OpConstant 3 
                                             %402 = OpTypePointer Output %6 
                                         i32 %405 = OpConstant 14 
                                         i32 %413 = OpConstant 15 
                                         i32 %430 = OpConstant 13 
                                         i32 %439 = OpConstant 12 
                                         f32 %462 = OpConstant 3.67402E-40 
                                       f32_3 %463 = OpConstantComposite %462 %462 %462 
                                Private f32* %468 = OpVariable Private 
                                         i32 %471 = OpConstant 10 
                                         i32 %476 = OpConstant 17 
                                         i32 %495 = OpConstant 7 
                                         i32 %496 = OpConstant 1 
                                         i32 %514 = OpConstant 2 
                                         i32 %528 = OpConstant 3 
                               Private bool* %535 = OpVariable Private 
                                        bool %539 = OpConstantFalse 
                                        bool %545 = OpSpecConstantFalse 
                                         i32 %602 = OpConstant 5 
                                             %603 = OpTypePointer Uniform %30 
                                         i32 %612 = OpConstant 4 
                                             %632 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %633 = OpTypeSampledImage %632 
                                             %634 = OpTypePointer UniformConstant %633 
 UniformConstant read_only Texture3DSampled* %635 = OpVariable UniformConstant 
                              Private f32_4* %640 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %656 = OpVariable UniformConstant 
                                         i32 %667 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %347 = OpVariable Function 
                             Function f32_3* %372 = OpVariable Function 
                               Function f32* %387 = OpVariable Function 
                             Function f32_3* %589 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %22 = OpLoad %21 
                                        f32_2 %23 = OpLoad %17 
                                        f32_4 %24 = OpImageSampleImplicitLod %22 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %20 %26 
                                                      OpStore %29 %27 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                        f32_3 %35 = OpFNegate %34 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %35 %47 
                                                      OpStore %32 %48 
                               Uniform f32_4* %50 = OpAccessChain %41 %43 
                                        f32_4 %51 = OpLoad %50 
                                        f32_3 %52 = OpVectorShuffle %51 %51 3 3 3 
                                        f32_3 %53 = OpLoad %32 
                                        f32_3 %54 = OpFMul %52 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFAdd %54 %56 
                                                      OpStore %49 %57 
                               Uniform f32_4* %59 = OpAccessChain %41 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               Uniform f32_4* %63 = OpAccessChain %41 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFAdd %61 %65 
                                                      OpStore %32 %66 
                                        f32_3 %68 = OpLoad %32 
                                        f32_4 %69 = OpVectorShuffle %68 %68 1 1 0 0 
                                 Uniform f32* %72 = OpAccessChain %41 %70 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %41 %70 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %76 = OpAccessChain %41 %70 
                                          f32 %77 = OpLoad %76 
                                 Uniform f32* %78 = OpAccessChain %41 %70 
                                          f32 %79 = OpLoad %78 
                                        f32_4 %80 = OpCompositeConstruct %73 %75 %77 %79 
                                          f32 %81 = OpCompositeExtract %80 0 
                                          f32 %82 = OpCompositeExtract %80 1 
                                          f32 %83 = OpCompositeExtract %80 2 
                                          f32 %84 = OpCompositeExtract %80 3 
                                        f32_4 %85 = OpCompositeConstruct %81 %82 %83 %84 
                                        f32_4 %86 = OpFMul %69 %85 
                                                      OpStore %67 %86 
                                   Input f32* %91 = OpAccessChain %88 %89 
                                          f32 %92 = OpLoad %91 
                                   Input f32* %93 = OpAccessChain %88 %26 
                                          f32 %94 = OpLoad %93 
                                          f32 %95 = OpFAdd %92 %94 
                                 Private f32* %96 = OpAccessChain %32 %26 
                                                      OpStore %96 %95 
                                 Private f32* %98 = OpAccessChain %32 %89 
                                          f32 %99 = OpLoad %98 
                                Uniform f32* %100 = OpAccessChain %41 %70 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFMul %99 %101 
                                Private f32* %103 = OpAccessChain %32 %26 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %97 %26 
                                                      OpStore %106 %105 
                                Private f32* %109 = OpAccessChain %97 %26 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpExtInst %1 14 %110 
                                Private f32* %112 = OpAccessChain %108 %26 
                                                      OpStore %112 %111 
                                Private f32* %113 = OpAccessChain %97 %26 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpExtInst %1 13 %114 
                                Private f32* %116 = OpAccessChain %97 %26 
                                                      OpStore %116 %115 
                                Private f32* %117 = OpAccessChain %108 %26 
                                         f32 %118 = OpLoad %117 
                                         f32 %120 = OpFMul %118 %119 
                                Private f32* %121 = OpAccessChain %108 %26 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %97 %26 
                                         f32 %123 = OpLoad %122 
                                         f32 %125 = OpFMul %123 %124 
                                Private f32* %126 = OpAccessChain %108 %89 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %108 
                                       f32_3 %128 = OpLoad %88 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_3 %131 = OpLoad %97 
                                       f32_3 %132 = OpVectorShuffle %131 %130 3 4 2 
                                                      OpStore %97 %132 
                                       f32_3 %133 = OpLoad %97 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                                Uniform f32* %136 = OpAccessChain %41 %135 
                                         f32 %137 = OpLoad %136 
                                       f32_2 %138 = OpCompositeConstruct %137 %137 
                                       f32_2 %139 = OpFMul %134 %138 
                                       f32_3 %140 = OpLoad %97 
                                       f32_3 %141 = OpVectorShuffle %140 %139 3 4 2 
                                                      OpStore %97 %141 
                                       f32_4 %143 = OpLoad %67 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %148 = OpFMul %144 %147 
                                                      OpStore %142 %148 
                                       f32_4 %149 = OpLoad %67 
                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
                                       f32_2 %154 = OpFMul %150 %153 
                                       f32_3 %155 = OpLoad %32 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 0 
                                       f32_2 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %67 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 2 3 
                                                      OpStore %67 %159 
                                Private f32* %160 = OpAccessChain %67 %26 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 14 %161 
                                Private f32* %163 = OpAccessChain %32 %26 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %32 %26 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %165 %119 
                                Private f32* %167 = OpAccessChain %108 %26 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %67 %89 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpExtInst %1 13 %169 
                                Private f32* %171 = OpAccessChain %32 %26 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %32 %26 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %173 %124 
                                Private f32* %175 = OpAccessChain %108 %89 
                                                      OpStore %175 %174 
                                       f32_2 %176 = OpLoad %108 
                                       f32_3 %177 = OpLoad %88 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 1 
                                       f32_2 %179 = OpFAdd %176 %178 
                                       f32_4 %180 = OpLoad %67 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 2 3 
                                                      OpStore %67 %181 
                                       f32_4 %182 = OpLoad %67 
                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                                Uniform f32* %184 = OpAccessChain %41 %135 
                                         f32 %185 = OpLoad %184 
                                       f32_2 %186 = OpCompositeConstruct %185 %185 
                                       f32_2 %187 = OpFMul %183 %186 
                                       f32_4 %188 = OpLoad %67 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 2 3 
                                                      OpStore %67 %189 
                                       f32_3 %190 = OpLoad %97 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %194 = OpFMul %191 %193 
                                       f32_2 %195 = OpLoad %142 
                                       f32_2 %196 = OpFAdd %194 %195 
                                       f32_3 %197 = OpLoad %97 
                                       f32_3 %198 = OpVectorShuffle %197 %196 3 4 2 
                                                      OpStore %97 %198 
                  read_only Texture2DSampled %200 = OpLoad %199 
                                       f32_3 %201 = OpLoad %97 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_4 %203 = OpImageSampleImplicitLod %200 %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                                      OpStore %97 %204 
                                       f32_4 %205 = OpLoad %67 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                                       f32_2 %209 = OpFMul %206 %208 
                                       f32_4 %210 = OpLoad %67 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 5 2 3 
                                                      OpStore %67 %211 
                                       f32_4 %212 = OpLoad %67 
                                       f32_2 %213 = OpVectorShuffle %212 %212 3 3 
                                       f32_2 %216 = OpFMul %213 %215 
                                       f32_4 %217 = OpLoad %67 
                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
                                       f32_2 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %67 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 2 3 
                                                      OpStore %67 %221 
                  read_only Texture2DSampled %223 = OpLoad %199 
                                       f32_4 %224 = OpLoad %67 
                                       f32_2 %225 = OpVectorShuffle %224 %224 0 1 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                                      OpStore %222 %227 
                                Uniform f32* %229 = OpAccessChain %41 %228 
                                         f32 %230 = OpLoad %229 
                                         f32 %232 = OpFAdd %230 %231 
                                Private f32* %233 = OpAccessChain %32 %26 
                                                      OpStore %233 %232 
                                  Input f32* %237 = OpAccessChain %236 %89 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                                      OpStore %234 %240 
                                Private f32* %243 = OpAccessChain %32 %242 
                                         f32 %244 = OpLoad %243 
                                         f32 %246 = OpFMul %244 %245 
                                         f32 %247 = OpLoad %234 
                                         f32 %248 = OpFAdd %246 %247 
                                                      OpStore %241 %248 
                                         f32 %249 = OpLoad %241 
                                         f32 %250 = OpExtInst %1 13 %249 
                                                      OpStore %241 %250 
                                         f32 %251 = OpLoad %241 
                                         f32 %253 = OpFMul %251 %252 
                                Private f32* %254 = OpAccessChain %108 %26 
                                                      OpStore %254 %253 
                                Private f32* %256 = OpAccessChain %108 %89 
                                                      OpStore %256 %255 
                                       f32_2 %257 = OpLoad %108 
                                       f32_4 %258 = OpLoad %236 
                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
                                       f32_2 %260 = OpFAdd %257 %259 
                                                      OpStore %108 %260 
                                       f32_2 %261 = OpLoad %108 
                                       f32_2 %264 = OpFAdd %261 %263 
                                                      OpStore %108 %264 
                  read_only Texture2DSampled %267 = OpLoad %266 
                                       f32_2 %268 = OpLoad %108 
                                       f32_4 %269 = OpImageSampleImplicitLod %267 %268 
                                                      OpStore %265 %269 
                                       f32_3 %271 = OpLoad %88 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 0 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %270 %276 
                                  Input f32* %278 = OpAccessChain %88 %26 
                                         f32 %279 = OpLoad %278 
                                         f32 %281 = OpFMul %279 %280 
                                Private f32* %282 = OpAccessChain %32 %89 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFAdd %281 %283 
                                Private f32* %285 = OpAccessChain %277 %26 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %277 %26 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpExtInst %1 13 %287 
                                Private f32* %289 = OpAccessChain %277 %26 
                                                      OpStore %289 %288 
                                Private f32* %290 = OpAccessChain %270 %26 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpExtInst %1 14 %291 
                                                      OpStore %241 %292 
                                         f32 %293 = OpLoad %241 
                                Private f32* %294 = OpAccessChain %277 %26 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFMul %293 %295 
                                Private f32* %297 = OpAccessChain %277 %26 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %277 %26 
                                         f32 %299 = OpLoad %298 
                                         f32 %301 = OpFMul %299 %300 
                                Uniform f32* %303 = OpAccessChain %41 %302 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpFAdd %301 %304 
                                Private f32* %306 = OpAccessChain %277 %26 
                                                      OpStore %306 %305 
                                  Input f32* %311 = OpAccessChain %310 %26 
                                         f32 %312 = OpLoad %311 
                                Private f32* %313 = OpAccessChain %277 %26 
                                         f32 %314 = OpLoad %313 
                                        bool %315 = OpFOrdLessThan %312 %314 
                                                      OpStore %309 %315 
                                       f32_3 %316 = OpLoad %270 
                                       f32_2 %317 = OpVectorShuffle %316 %316 1 2 
                                       f32_2 %318 = OpExtInst %1 8 %317 
                                       f32_3 %319 = OpLoad %270 
                                       f32_3 %320 = OpVectorShuffle %319 %318 3 4 2 
                                                      OpStore %270 %320 
                                       f32_3 %321 = OpLoad %270 
                                       f32_2 %322 = OpVectorShuffle %321 %321 0 1 
                                       f32_2 %324 = OpFMul %322 %323 
                                       f32_3 %325 = OpLoad %270 
                                       f32_3 %326 = OpVectorShuffle %325 %324 3 4 2 
                                                      OpStore %270 %326 
                                       f32_3 %327 = OpLoad %270 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
                                         f32 %332 = OpDot %328 %331 
                                                      OpStore %234 %332 
                                         f32 %333 = OpLoad %234 
                                         f32 %334 = OpExtInst %1 13 %333 
                                                      OpStore %234 %334 
                                         f32 %335 = OpLoad %234 
                                         f32 %337 = OpFMul %335 %336 
                                                      OpStore %234 %337 
                                         f32 %338 = OpLoad %234 
                                         f32 %339 = OpExtInst %1 10 %338 
                                                      OpStore %234 %339 
                                         f32 %340 = OpLoad %234 
                                         f32 %341 = OpFMul %340 %145 
                                         f32 %342 = OpFAdd %341 %145 
                                                      OpStore %234 %342 
                                         f32 %343 = OpLoad %234 
                                         f32 %344 = OpFMul %343 %145 
                                                      OpStore %234 %344 
                                        bool %348 = OpLoad %309 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %348 %349 %353 
                                             %349 = OpLabel 
                                         f32 %351 = OpLoad %234 
                                       f32_3 %352 = OpCompositeConstruct %351 %351 %351 
                                                      OpStore %347 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                                       f32_3 %354 = OpLoad %97 
                                                      OpStore %347 %354 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                       f32_3 %355 = OpLoad %347 
                                                      OpStore %345 %355 
                                       f32_2 %356 = OpLoad %277 
                                       f32_2 %357 = OpVectorShuffle %356 %356 0 0 
                                       f32_2 %361 = OpFAdd %357 %360 
                                                      OpStore %277 %361 
                                  Input f32* %363 = OpAccessChain %310 %26 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %277 %26 
                                         f32 %366 = OpLoad %365 
                                        bool %367 = OpFOrdLessThan %364 %366 
                                                      OpStore %362 %367 
                                       f32_3 %369 = OpLoad %345 
                                       f32_3 %370 = OpLoad %345 
                                       f32_3 %371 = OpFAdd %369 %370 
                                                      OpStore %368 %371 
                                        bool %373 = OpLoad %362 
                                                      OpSelectionMerge %375 None 
                                                      OpBranchConditional %373 %374 %377 
                                             %374 = OpLabel 
                                       f32_3 %376 = OpLoad %368 
                                                      OpStore %372 %376 
                                                      OpBranch %375 
                                             %377 = OpLabel 
                                       f32_3 %378 = OpLoad %345 
                                                      OpStore %372 %378 
                                                      OpBranch %375 
                                             %375 = OpLabel 
                                       f32_3 %379 = OpLoad %372 
                                                      OpStore %345 %379 
                                Private f32* %380 = OpAccessChain %277 %89 
                                         f32 %381 = OpLoad %380 
                                  Input f32* %382 = OpAccessChain %310 %26 
                                         f32 %383 = OpLoad %382 
                                        bool %384 = OpFOrdLessThan %381 %383 
                                                      OpStore %362 %384 
                                        bool %388 = OpLoad %362 
                                                      OpSelectionMerge %390 None 
                                                      OpBranchConditional %388 %389 %391 
                                             %389 = OpLabel 
                                                      OpStore %387 %231 
                                                      OpBranch %390 
                                             %391 = OpLabel 
                                Private f32* %392 = OpAccessChain %20 %26 
                                         f32 %393 = OpLoad %392 
                                                      OpStore %387 %393 
                                                      OpBranch %390 
                                             %390 = OpLabel 
                                         f32 %394 = OpLoad %387 
                                                      OpStore %385 %394 
                                Private f32* %398 = OpAccessChain %9 %397 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpLoad %385 
                                         f32 %401 = OpFMul %399 %400 
                                 Output f32* %403 = OpAccessChain %396 %397 
                                                      OpStore %403 %401 
                                       f32_3 %404 = OpLoad %345 
                                Uniform f32* %406 = OpAccessChain %41 %405 
                                         f32 %407 = OpLoad %406 
                                       f32_3 %408 = OpCompositeConstruct %407 %407 %407 
                                       f32_3 %409 = OpFMul %404 %408 
                                       f32_4 %410 = OpLoad %20 
                                       f32_4 %411 = OpVectorShuffle %410 %409 4 1 5 6 
                                                      OpStore %20 %411 
                                       f32_3 %412 = OpLoad %222 
                                Uniform f32* %414 = OpAccessChain %41 %413 
                                         f32 %415 = OpLoad %414 
                                Uniform f32* %416 = OpAccessChain %41 %413 
                                         f32 %417 = OpLoad %416 
                                Uniform f32* %418 = OpAccessChain %41 %413 
                                         f32 %419 = OpLoad %418 
                                       f32_3 %420 = OpCompositeConstruct %415 %417 %419 
                                         f32 %421 = OpCompositeExtract %420 0 
                                         f32 %422 = OpCompositeExtract %420 1 
                                         f32 %423 = OpCompositeExtract %420 2 
                                       f32_3 %424 = OpCompositeConstruct %421 %422 %423 
                                       f32_3 %425 = OpFMul %412 %424 
                                       f32_4 %426 = OpLoad %67 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 6 3 
                                                      OpStore %67 %427 
                                       f32_4 %428 = OpLoad %67 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                              Uniform f32_4* %431 = OpAccessChain %41 %430 
                                       f32_4 %432 = OpLoad %431 
                                       f32_3 %433 = OpVectorShuffle %432 %432 0 1 2 
                                       f32_3 %434 = OpFMul %429 %433 
                                       f32_4 %435 = OpLoad %67 
                                       f32_4 %436 = OpVectorShuffle %435 %434 4 5 6 3 
                                                      OpStore %67 %436 
                                       f32_4 %437 = OpLoad %20 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 2 3 
                              Uniform f32_4* %440 = OpAccessChain %41 %439 
                                       f32_4 %441 = OpLoad %440 
                                       f32_3 %442 = OpVectorShuffle %441 %441 0 1 2 
                                       f32_3 %443 = OpFMul %438 %442 
                                       f32_4 %444 = OpLoad %67 
                                       f32_3 %445 = OpVectorShuffle %444 %444 0 1 2 
                                       f32_3 %446 = OpFNegate %445 
                                       f32_3 %447 = OpFAdd %443 %446 
                                       f32_4 %448 = OpLoad %20 
                                       f32_4 %449 = OpVectorShuffle %448 %447 4 1 5 6 
                                                      OpStore %20 %449 
                                       f32_3 %450 = OpLoad %49 
                                       f32_3 %451 = OpLoad %32 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 0 0 
                                       f32_3 %453 = OpFMul %450 %452 
                                                      OpStore %49 %453 
                                       f32_4 %454 = OpLoad %20 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 2 3 
                                         f32 %456 = OpLoad %385 
                                       f32_3 %457 = OpCompositeConstruct %456 %456 %456 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %459 = OpLoad %49 
                                       f32_3 %460 = OpFAdd %458 %459 
                                                      OpStore %49 %460 
                                       f32_3 %461 = OpLoad %49 
                                       f32_3 %464 = OpFMul %461 %463 
                                       f32_4 %465 = OpLoad %265 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_3 %467 = OpFAdd %464 %466 
                                                      OpStore %345 %467 
                                Private f32* %469 = OpAccessChain %265 %397 
                                         f32 %470 = OpLoad %469 
                                Uniform f32* %472 = OpAccessChain %41 %471 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFMul %470 %473 
                                                      OpStore %468 %474 
                                         f32 %475 = OpLoad %468 
                                Uniform f32* %477 = OpAccessChain %41 %476 
                                         f32 %478 = OpLoad %477 
                                         f32 %479 = OpFMul %475 %478 
                                                      OpStore %468 %479 
                                       f32_3 %480 = OpLoad %49 
                                       f32_3 %481 = OpFNegate %480 
                                       f32_3 %482 = OpLoad %345 
                                       f32_3 %483 = OpFAdd %481 %482 
                                       f32_4 %484 = OpLoad %20 
                                       f32_4 %485 = OpVectorShuffle %484 %483 4 5 6 3 
                                                      OpStore %20 %485 
                                         f32 %486 = OpLoad %468 
                                       f32_3 %487 = OpCompositeConstruct %486 %486 %486 
                                       f32_4 %488 = OpLoad %20 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 1 2 
                                       f32_3 %490 = OpFMul %487 %489 
                                       f32_3 %491 = OpLoad %49 
                                       f32_3 %492 = OpFAdd %490 %491 
                                                      OpStore %49 %492 
                                       f32_3 %493 = OpLoad %88 
                                       f32_2 %494 = OpVectorShuffle %493 %493 1 1 
                              Uniform f32_4* %497 = OpAccessChain %41 %495 %496 
                                       f32_4 %498 = OpLoad %497 
                                       f32_2 %499 = OpVectorShuffle %498 %498 0 1 
                                       f32_2 %500 = OpFMul %494 %499 
                                       f32_4 %501 = OpLoad %20 
                                       f32_4 %502 = OpVectorShuffle %501 %500 4 5 2 3 
                                                      OpStore %20 %502 
                              Uniform f32_4* %503 = OpAccessChain %41 %495 %58 
                                       f32_4 %504 = OpLoad %503 
                                       f32_2 %505 = OpVectorShuffle %504 %504 0 1 
                                       f32_3 %506 = OpLoad %88 
                                       f32_2 %507 = OpVectorShuffle %506 %506 0 0 
                                       f32_2 %508 = OpFMul %505 %507 
                                       f32_4 %509 = OpLoad %20 
                                       f32_2 %510 = OpVectorShuffle %509 %509 0 1 
                                       f32_2 %511 = OpFAdd %508 %510 
                                       f32_4 %512 = OpLoad %20 
                                       f32_4 %513 = OpVectorShuffle %512 %511 4 5 2 3 
                                                      OpStore %20 %513 
                              Uniform f32_4* %515 = OpAccessChain %41 %495 %514 
                                       f32_4 %516 = OpLoad %515 
                                       f32_2 %517 = OpVectorShuffle %516 %516 0 1 
                                       f32_3 %518 = OpLoad %88 
                                       f32_2 %519 = OpVectorShuffle %518 %518 2 2 
                                       f32_2 %520 = OpFMul %517 %519 
                                       f32_4 %521 = OpLoad %20 
                                       f32_2 %522 = OpVectorShuffle %521 %521 0 1 
                                       f32_2 %523 = OpFAdd %520 %522 
                                       f32_4 %524 = OpLoad %20 
                                       f32_4 %525 = OpVectorShuffle %524 %523 4 5 2 3 
                                                      OpStore %20 %525 
                                       f32_4 %526 = OpLoad %20 
                                       f32_2 %527 = OpVectorShuffle %526 %526 0 1 
                              Uniform f32_4* %529 = OpAccessChain %41 %495 %528 
                                       f32_4 %530 = OpLoad %529 
                                       f32_2 %531 = OpVectorShuffle %530 %530 0 1 
                                       f32_2 %532 = OpFAdd %527 %531 
                                       f32_4 %533 = OpLoad %20 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 2 3 
                                                      OpStore %20 %534 
                                Uniform f32* %536 = OpAccessChain %41 %514 %26 
                                         f32 %537 = OpLoad %536 
                                        bool %538 = OpFOrdEqual %537 %231 
                                                      OpStore %535 %538 
                                                      OpSelectionMerge %541 None 
                                                      OpBranchConditional %539 %540 %541 
                                             %540 = OpLabel 
                                        bool %542 = OpLoad %535 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %542 %543 %544 
                                             %543 = OpLabel 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                                      OpBranch %541 
                                             %541 = OpLabel 
                                                      OpSelectionMerge %547 None 
                                                      OpBranchConditional %545 %546 %642 
                                             %546 = OpLabel 
                                Uniform f32* %548 = OpAccessChain %41 %514 %89 
                                         f32 %549 = OpLoad %548 
                                        bool %550 = OpFOrdEqual %549 %231 
                                                      OpStore %535 %550 
                                       f32_3 %551 = OpLoad %88 
                                       f32_3 %552 = OpVectorShuffle %551 %551 1 1 1 
                              Uniform f32_4* %553 = OpAccessChain %41 %528 %496 
                                       f32_4 %554 = OpLoad %553 
                                       f32_3 %555 = OpVectorShuffle %554 %554 0 1 2 
                                       f32_3 %556 = OpFMul %552 %555 
                                       f32_4 %557 = OpLoad %67 
                                       f32_4 %558 = OpVectorShuffle %557 %556 4 5 6 3 
                                                      OpStore %67 %558 
                              Uniform f32_4* %559 = OpAccessChain %41 %528 %58 
                                       f32_4 %560 = OpLoad %559 
                                       f32_3 %561 = OpVectorShuffle %560 %560 0 1 2 
                                       f32_3 %562 = OpLoad %88 
                                       f32_3 %563 = OpVectorShuffle %562 %562 0 0 0 
                                       f32_3 %564 = OpFMul %561 %563 
                                       f32_4 %565 = OpLoad %67 
                                       f32_3 %566 = OpVectorShuffle %565 %565 0 1 2 
                                       f32_3 %567 = OpFAdd %564 %566 
                                       f32_4 %568 = OpLoad %67 
                                       f32_4 %569 = OpVectorShuffle %568 %567 4 5 6 3 
                                                      OpStore %67 %569 
                              Uniform f32_4* %570 = OpAccessChain %41 %528 %514 
                                       f32_4 %571 = OpLoad %570 
                                       f32_3 %572 = OpVectorShuffle %571 %571 0 1 2 
                                       f32_3 %573 = OpLoad %88 
                                       f32_3 %574 = OpVectorShuffle %573 %573 2 2 2 
                                       f32_3 %575 = OpFMul %572 %574 
                                       f32_4 %576 = OpLoad %67 
                                       f32_3 %577 = OpVectorShuffle %576 %576 0 1 2 
                                       f32_3 %578 = OpFAdd %575 %577 
                                       f32_4 %579 = OpLoad %67 
                                       f32_4 %580 = OpVectorShuffle %579 %578 4 5 6 3 
                                                      OpStore %67 %580 
                                       f32_4 %581 = OpLoad %67 
                                       f32_3 %582 = OpVectorShuffle %581 %581 0 1 2 
                              Uniform f32_4* %583 = OpAccessChain %41 %528 %528 
                                       f32_4 %584 = OpLoad %583 
                                       f32_3 %585 = OpVectorShuffle %584 %584 0 1 2 
                                       f32_3 %586 = OpFAdd %582 %585 
                                       f32_4 %587 = OpLoad %67 
                                       f32_4 %588 = OpVectorShuffle %587 %586 4 5 6 3 
                                                      OpStore %67 %588 
                                        bool %590 = OpLoad %535 
                                                      OpSelectionMerge %592 None 
                                                      OpBranchConditional %590 %591 %595 
                                             %591 = OpLabel 
                                       f32_4 %593 = OpLoad %67 
                                       f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
                                                      OpStore %589 %594 
                                                      OpBranch %592 
                                             %595 = OpLabel 
                                       f32_3 %596 = OpLoad %88 
                                                      OpStore %589 %596 
                                                      OpBranch %592 
                                             %592 = OpLabel 
                                       f32_3 %597 = OpLoad %589 
                                       f32_4 %598 = OpLoad %67 
                                       f32_4 %599 = OpVectorShuffle %598 %597 4 5 6 3 
                                                      OpStore %67 %599 
                                       f32_4 %600 = OpLoad %67 
                                       f32_3 %601 = OpVectorShuffle %600 %600 0 1 2 
                              Uniform f32_3* %604 = OpAccessChain %41 %602 
                                       f32_3 %605 = OpLoad %604 
                                       f32_3 %606 = OpFNegate %605 
                                       f32_3 %607 = OpFAdd %601 %606 
                                       f32_4 %608 = OpLoad %67 
                                       f32_4 %609 = OpVectorShuffle %608 %607 4 5 6 3 
                                                      OpStore %67 %609 
                                       f32_4 %610 = OpLoad %67 
                                       f32_3 %611 = OpVectorShuffle %610 %610 0 1 2 
                              Uniform f32_3* %613 = OpAccessChain %41 %612 
                                       f32_3 %614 = OpLoad %613 
                                       f32_3 %615 = OpFMul %611 %614 
                                       f32_4 %616 = OpLoad %67 
                                       f32_4 %617 = OpVectorShuffle %616 %615 0 4 5 6 
                                                      OpStore %67 %617 
                                Private f32* %618 = OpAccessChain %67 %89 
                                         f32 %619 = OpLoad %618 
                                         f32 %620 = OpFMul %619 %214 
                                         f32 %621 = OpFAdd %620 %462 
                                                      OpStore %468 %621 
                                Uniform f32* %622 = OpAccessChain %41 %514 %242 
                                         f32 %623 = OpLoad %622 
                                         f32 %624 = OpFMul %623 %145 
                                         f32 %625 = OpFAdd %624 %462 
                                Private f32* %626 = OpAccessChain %277 %26 
                                                      OpStore %626 %625 
                                         f32 %627 = OpLoad %468 
                                Private f32* %628 = OpAccessChain %277 %26 
                                         f32 %629 = OpLoad %628 
                                         f32 %630 = OpExtInst %1 40 %627 %629 
                                Private f32* %631 = OpAccessChain %67 %26 
                                                      OpStore %631 %630 
                  read_only Texture3DSampled %636 = OpLoad %635 
                                       f32_4 %637 = OpLoad %67 
                                       f32_3 %638 = OpVectorShuffle %637 %637 0 2 3 
                                       f32_4 %639 = OpImageSampleImplicitLod %636 %638 
                                                      OpStore %67 %639 
                                       f32_4 %641 = OpLoad %67 
                                                      OpStore %640 %641 
                                                      OpBranch %547 
                                             %642 = OpLabel 
                                Private f32* %643 = OpAccessChain %640 %26 
                                                      OpStore %643 %231 
                                Private f32* %644 = OpAccessChain %640 %89 
                                                      OpStore %644 %231 
                                Private f32* %645 = OpAccessChain %640 %242 
                                                      OpStore %645 %231 
                                Private f32* %646 = OpAccessChain %640 %397 
                                                      OpStore %646 %231 
                                                      OpBranch %547 
                                             %547 = OpLabel 
                                       f32_4 %647 = OpLoad %640 
                              Uniform f32_4* %648 = OpAccessChain %41 %496 
                                       f32_4 %649 = OpLoad %648 
                                         f32 %650 = OpDot %647 %649 
                                Private f32* %651 = OpAccessChain %345 %26 
                                                      OpStore %651 %650 
                                Private f32* %652 = OpAccessChain %345 %26 
                                         f32 %653 = OpLoad %652 
                                         f32 %654 = OpExtInst %1 43 %653 %255 %231 
                                Private f32* %655 = OpAccessChain %345 %26 
                                                      OpStore %655 %654 
                  read_only Texture2DSampled %657 = OpLoad %656 
                                       f32_4 %658 = OpLoad %20 
                                       f32_2 %659 = OpVectorShuffle %658 %658 0 1 
                                       f32_4 %660 = OpImageSampleImplicitLod %657 %659 
                                         f32 %661 = OpCompositeExtract %660 3 
                                                      OpStore %468 %661 
                                Private f32* %662 = OpAccessChain %345 %26 
                                         f32 %663 = OpLoad %662 
                                         f32 %664 = OpLoad %468 
                                         f32 %665 = OpFMul %663 %664 
                                                      OpStore %468 %665 
                                       f32_3 %666 = OpLoad %49 
                              Uniform f32_4* %668 = OpAccessChain %41 %667 
                                       f32_4 %669 = OpLoad %668 
                                       f32_3 %670 = OpVectorShuffle %669 %669 0 1 2 
                                       f32_3 %671 = OpFMul %666 %670 
                                                      OpStore %345 %671 
                                         f32 %672 = OpLoad %468 
                                       f32_3 %673 = OpCompositeConstruct %672 %672 %672 
                                       f32_3 %674 = OpLoad %345 
                                       f32_3 %675 = OpFMul %673 %674 
                                       f32_4 %676 = OpLoad %396 
                                       f32_4 %677 = OpVectorShuffle %676 %675 4 5 6 3 
                                                      OpStore %396 %677 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" }
""
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
}
}
 Pass {
  Name "META"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "META" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 171230
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	bvec4 unity_MetaVertexControl;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb6;
void main()
{
    u_xlatb0 = 0.0<in_POSITION0.z;
    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlatb6 = 0.0<u_xlat0.z;
    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	float _CausticScale;
uniform 	vec4 _CausticColor;
uniform 	float _ReflPower;
uniform 	float _TimeScale;
uniform 	vec4 _LightCausticColor;
uniform 	vec4 _DarkCausticColor;
uniform 	float _LightCausticPower;
uniform 	float _DarkCausticPower;
uniform 	float _EmissiveBoost;
uniform 	float _GlobalReflectionsEnabled;
uniform 	float _WaterFoamHeightMod;
uniform 	vec4 _BossIntroTime;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _CausticTex;
uniform  sampler2D _ReflMapFromPixelator;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb5;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD1.xxy * vec3(2.17499995, 16.0, 16.0);
    u_xlat4.xy = floor(u_xlat0.yz);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat4.xy = u_xlat4.xy * vec2(0.0625, 0.0625);
    u_xlat4.x = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 43758.5469;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 0.5 + 0.5;
    u_xlat4.x = u_xlat4.x * 0.5;
    u_xlat8 = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat1.xyz = _Time.xyz + _BossIntroTime.xyz;
    u_xlat12 = u_xlat1.y * _TimeScale + u_xlat8;
    u_xlat2.x = sin(u_xlat12);
    u_xlat3.x = cos(u_xlat12);
    u_xlat3.x = u_xlat3.x * 0.111111112;
    u_xlat3.y = u_xlat2.x * 0.166666672;
    u_xlat2.xy = u_xlat3.xy + vs_TEXCOORD1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_CausticScale);
    u_xlat3 = u_xlat1.yyxx * vec4(vec4(_TimeScale, _TimeScale, _TimeScale, _TimeScale));
    u_xlat1.xw = u_xlat3.zw * vec2(0.5, 0.125);
    u_xlat1.xw = u_xlat2.xy * vec2(0.200000003, 0.200000003) + u_xlat1.xw;
    u_xlat10_2 = texture(_CausticTex, u_xlat1.xw);
    u_xlat12 = vs_TEXCOORD1.x * 6.0 + u_xlat1.y;
    u_xlat12 = sin(u_xlat12);
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = u_xlat0.x * 0.0625 + _WaterFoamHeightMod;
    u_xlatb12 = vs_COLOR0.x<u_xlat0.x;
    u_xlat1.xy = u_xlat0.xx + vec2(-0.0625, -0.25);
    u_xlat0.xyw = (bool(u_xlatb12)) ? u_xlat4.xxx : u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat0.xyw;
    u_xlatb1 = vs_COLOR0.x<u_xlat1.x;
    u_xlatb5 = u_xlat1.y<vs_COLOR0.x;
    u_xlat0.xyw = (bool(u_xlatb1)) ? u_xlat2.xyz : u_xlat0.xyw;
    u_xlat0.xyw = u_xlat0.xyw * vec3(_LightCausticPower);
    u_xlat1.xw = u_xlat3.xy * vec2(1.25, 0.899999976) + vec2(u_xlat8);
    u_xlat8 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.w);
    u_xlat2.y = u_xlat1.x * 0.166666672;
    u_xlat2.x = u_xlat8 * 0.111111112;
    u_xlat1.xw = u_xlat2.xy + vs_TEXCOORD1.xy;
    u_xlat1.xw = u_xlat1.xw * vec2(_CausticScale);
    u_xlat1.xw = u_xlat1.xw * vec2(0.142857149, 0.142857149);
    u_xlat1.xw = u_xlat3.ww * vec2(0.25, 0.166666672) + u_xlat1.xw;
    u_xlat10_2 = texture(_CausticTex, u_xlat1.xw);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_DarkCausticPower, _DarkCausticPower, _DarkCausticPower));
    u_xlat2.xyz = u_xlat2.xyz * _DarkCausticColor.xyz;
    u_xlat0.xyz = u_xlat0.xyw * _LightCausticColor.xyz + (-u_xlat2.xyz);
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = (-u_xlat10_2.xyz) + _CausticColor.xyz;
    u_xlat2.xyz = _CausticColor.www * u_xlat3.xyz + u_xlat10_2.xyz;
    u_xlat12 = _EmissiveBoost + 1.0;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat10_3 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat12 = (u_xlatb5) ? 1.0 : u_xlat10_3.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat12 = vs_TEXCOORD2.y * 500.0;
    u_xlat12 = u_xlat1.z * 5.0 + u_xlat12;
    u_xlat12 = sin(u_xlat12);
    u_xlat1.x = u_xlat12 * 0.00150000001;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.0, 0.075000003);
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.75, 0.75, 0.75) + u_xlat10_1.xyz;
    u_xlat12 = u_xlat10_1.w * _ReflPower;
    u_xlat12 = u_xlat12 * _GlobalReflectionsEnabled;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat12 = unity_OneOverOutputBoost;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat0.w = 1.0;
    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 1.0) : u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 268
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %174 %179 %180 %223 %247 %259 %260 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 Location 89 
                                                      OpMemberDecorate %172 0 BuiltIn 172 
                                                      OpMemberDecorate %172 1 BuiltIn 172 
                                                      OpMemberDecorate %172 2 BuiltIn 172 
                                                      OpDecorate %172 Block 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %180 Location 180 
                                                      OpDecorate %223 Location 223 
                                                      OpDecorate %247 Location 247 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %259 Location 259 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %260 Location 260 
                                                      OpDecorate %261 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                          f32 %10 = OpConstant 3.67402E-40 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_4* %13 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Input %9 
                                              %20 = OpTypePointer Private %11 
                               Private f32_4* %21 = OpVariable Private 
                                              %22 = OpTypePointer Function %9 
                                          f32 %27 = OpConstant 3.67402E-40 
                                              %30 = OpTypePointer Private %9 
                                 Input f32_4* %32 = OpVariable Input 
                                              %33 = OpTypeVector %9 2 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %11 %36 
                                              %38 = OpTypeArray %11 %36 
                                              %39 = OpTypeVector %14 4 
                                              %40 = OpTypeStruct %11 %37 %38 %11 %11 %39 %11 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; u32_4; f32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 3 
                                              %45 = OpTypePointer Uniform %11 
                                              %56 = OpTypeVector %9 3 
                                              %57 = OpTypePointer Function %56 
                                          i32 %59 = OpConstant 5 
                                              %60 = OpTypeVector %6 4 
                                              %61 = OpTypePointer Uniform %39 
                                          u32 %65 = OpConstant 0 
                                Private bool* %77 = OpVariable Private 
                               Private f32_4* %81 = OpVariable Private 
                                 Input f32_4* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 4 
                                         i32 %120 = OpConstant 1 
                                         i32 %124 = OpConstant 0 
                                         i32 %132 = OpConstant 2 
                                         u32 %170 = OpConstant 1 
                                             %171 = OpTypeArray %9 %170 
                                             %172 = OpTypeStruct %11 %9 %171 
                                             %173 = OpTypePointer Output %172 
        Output struct {f32_4; f32; f32[1];}* %174 = OpVariable Output 
                                             %176 = OpTypePointer Output %11 
                                             %178 = OpTypePointer Output %33 
                               Output f32_2* %179 = OpVariable Output 
                                Input f32_4* %180 = OpVariable Input 
                                         i32 %183 = OpConstant 6 
                                             %222 = OpTypePointer Output %56 
                               Output f32_3* %223 = OpVariable Output 
                                             %235 = OpTypePointer Uniform %9 
                                         f32 %242 = OpConstant 3.67402E-40 
                                       f32_3 %243 = OpConstantComposite %242 %242 %242 
                               Output f32_4* %247 = OpVariable Output 
                               Output f32_4* %259 = OpVariable Output 
                                Input f32_4* %260 = OpVariable Input 
                                             %262 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %23 = OpVariable Function 
                              Function f32_3* %58 = OpVariable Function 
                                Function f32* %82 = OpVariable Function 
                             Function f32_3* %103 = OpVariable Function 
                                   Input f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                         bool %19 = OpFOrdLessThan %10 %18 
                                                      OpStore %8 %19 
                                         bool %24 = OpLoad %8 
                                                      OpSelectionMerge %26 None 
                                                      OpBranchConditional %24 %25 %28 
                                              %25 = OpLabel 
                                                      OpStore %23 %27 
                                                      OpBranch %26 
                                              %28 = OpLabel 
                                                      OpStore %23 %10 
                                                      OpBranch %26 
                                              %26 = OpLabel 
                                          f32 %29 = OpLoad %23 
                                 Private f32* %31 = OpAccessChain %21 %15 
                                                      OpStore %31 %29 
                                        f32_4 %34 = OpLoad %32 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpFMul %35 %48 
                               Uniform f32_4* %50 = OpAccessChain %42 %44 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 3 
                                        f32_2 %53 = OpFAdd %49 %52 
                                        f32_4 %54 = OpLoad %21 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %21 %55 
                               Uniform u32_4* %62 = OpAccessChain %42 %59 
                                        u32_4 %63 = OpLoad %62 
                                          u32 %64 = OpCompositeExtract %63 0 
                                         bool %66 = OpINotEqual %64 %65 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %71 
                                              %67 = OpLabel 
                                        f32_4 %69 = OpLoad %21 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                                      OpStore %58 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %13 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %58 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %58 
                                        f32_4 %75 = OpLoad %21 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %21 %76 
                                 Private f32* %78 = OpAccessChain %21 %15 
                                          f32 %79 = OpLoad %78 
                                         bool %80 = OpFOrdLessThan %10 %79 
                                                      OpStore %77 %80 
                                         bool %83 = OpLoad %77 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %86 
                                              %84 = OpLabel 
                                                      OpStore %82 %27 
                                                      OpBranch %85 
                                              %86 = OpLabel 
                                                      OpStore %82 %10 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                          f32 %87 = OpLoad %82 
                                 Private f32* %88 = OpAccessChain %81 %15 
                                                      OpStore %88 %87 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                               Uniform f32_4* %93 = OpAccessChain %42 %92 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %91 %95 
                               Uniform f32_4* %97 = OpAccessChain %42 %92 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                                       f32_2 %100 = OpFAdd %96 %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                      OpStore %81 %102 
                              Uniform u32_4* %104 = OpAccessChain %42 %59 
                                       u32_4 %105 = OpLoad %104 
                                         u32 %106 = OpCompositeExtract %105 1 
                                        bool %107 = OpINotEqual %106 %65 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %112 
                                             %108 = OpLabel 
                                       f32_4 %110 = OpLoad %81 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                                      OpStore %103 %111 
                                                      OpBranch %109 
                                             %112 = OpLabel 
                                       f32_4 %113 = OpLoad %21 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %103 %114 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                       f32_3 %115 = OpLoad %103 
                                       f32_4 %116 = OpLoad %21 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %21 %117 
                                       f32_4 %118 = OpLoad %21 
                                       f32_4 %119 = OpVectorShuffle %118 %118 1 1 1 1 
                              Uniform f32_4* %121 = OpAccessChain %42 %120 %120 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpFMul %119 %122 
                                                      OpStore %81 %123 
                              Uniform f32_4* %125 = OpAccessChain %42 %120 %124 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpLoad %21 
                                       f32_4 %128 = OpVectorShuffle %127 %127 0 0 0 0 
                                       f32_4 %129 = OpFMul %126 %128 
                                       f32_4 %130 = OpLoad %81 
                                       f32_4 %131 = OpFAdd %129 %130 
                                                      OpStore %81 %131 
                              Uniform f32_4* %133 = OpAccessChain %42 %120 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_4 %135 = OpLoad %21 
                                       f32_4 %136 = OpVectorShuffle %135 %135 2 2 2 2 
                                       f32_4 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %81 
                                       f32_4 %139 = OpFAdd %137 %138 
                                                      OpStore %21 %139 
                                       f32_4 %140 = OpLoad %21 
                              Uniform f32_4* %141 = OpAccessChain %42 %120 %44 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFAdd %140 %142 
                                                      OpStore %21 %143 
                                       f32_4 %144 = OpLoad %21 
                                       f32_4 %145 = OpVectorShuffle %144 %144 1 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %42 %132 %120 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpFMul %145 %147 
                                                      OpStore %81 %148 
                              Uniform f32_4* %149 = OpAccessChain %42 %132 %124 
                                       f32_4 %150 = OpLoad %149 
                                       f32_4 %151 = OpLoad %21 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
                                       f32_4 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %81 
                                       f32_4 %155 = OpFAdd %153 %154 
                                                      OpStore %81 %155 
                              Uniform f32_4* %156 = OpAccessChain %42 %132 %132 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %21 
                                       f32_4 %159 = OpVectorShuffle %158 %158 2 2 2 2 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %81 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore %81 %162 
                              Uniform f32_4* %163 = OpAccessChain %42 %132 %44 
                                       f32_4 %164 = OpLoad %163 
                                       f32_4 %165 = OpLoad %21 
                                       f32_4 %166 = OpVectorShuffle %165 %165 3 3 3 3 
                                       f32_4 %167 = OpFMul %164 %166 
                                       f32_4 %168 = OpLoad %81 
                                       f32_4 %169 = OpFAdd %167 %168 
                                                      OpStore %21 %169 
                                       f32_4 %175 = OpLoad %21 
                               Output f32_4* %177 = OpAccessChain %174 %124 
                                                      OpStore %177 %175 
                                       f32_4 %181 = OpLoad %180 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                              Uniform f32_4* %184 = OpAccessChain %42 %183 
                                       f32_4 %185 = OpLoad %184 
                                       f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                                       f32_2 %187 = OpFMul %182 %186 
                              Uniform f32_4* %188 = OpAccessChain %42 %183 
                                       f32_4 %189 = OpLoad %188 
                                       f32_2 %190 = OpVectorShuffle %189 %189 2 3 
                                       f32_2 %191 = OpFAdd %187 %190 
                                                      OpStore %179 %191 
                                       f32_4 %192 = OpLoad %13 
                                       f32_3 %193 = OpVectorShuffle %192 %192 1 1 1 
                              Uniform f32_4* %194 = OpAccessChain %42 %120 %120 
                                       f32_4 %195 = OpLoad %194 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                       f32_3 %197 = OpFMul %193 %196 
                                       f32_4 %198 = OpLoad %81 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                      OpStore %81 %199 
                              Uniform f32_4* %200 = OpAccessChain %42 %120 %124 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                       f32_4 %203 = OpLoad %13 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 0 0 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %81 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFAdd %205 %207 
                                       f32_4 %209 = OpLoad %81 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
                                                      OpStore %81 %210 
                              Uniform f32_4* %211 = OpAccessChain %42 %120 %132 
                                       f32_4 %212 = OpLoad %211 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 1 2 
                                       f32_4 %214 = OpLoad %13 
                                       f32_3 %215 = OpVectorShuffle %214 %214 2 2 2 
                                       f32_3 %216 = OpFMul %213 %215 
                                       f32_4 %217 = OpLoad %81 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %81 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %81 %221 
                              Uniform f32_4* %224 = OpAccessChain %42 %120 %44 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_4 %227 = OpLoad %13 
                                       f32_3 %228 = OpVectorShuffle %227 %227 3 3 3 
                                       f32_3 %229 = OpFMul %226 %228 
                                       f32_4 %230 = OpLoad %81 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %232 = OpFAdd %229 %231 
                                                      OpStore %223 %232 
                                Private f32* %233 = OpAccessChain %21 %170 
                                         f32 %234 = OpLoad %233 
                                Uniform f32* %236 = OpAccessChain %42 %124 %65 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFMul %234 %237 
                                Private f32* %239 = OpAccessChain %21 %170 
                                                      OpStore %239 %238 
                                       f32_4 %240 = OpLoad %21 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 3 1 
                                       f32_3 %244 = OpFMul %241 %243 
                                       f32_4 %245 = OpLoad %81 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 1 5 6 
                                                      OpStore %81 %246 
                                       f32_4 %248 = OpLoad %21 
                                       f32_2 %249 = OpVectorShuffle %248 %248 2 3 
                                       f32_4 %250 = OpLoad %247 
                                       f32_4 %251 = OpVectorShuffle %250 %249 0 1 4 5 
                                                      OpStore %247 %251 
                                       f32_4 %252 = OpLoad %81 
                                       f32_2 %253 = OpVectorShuffle %252 %252 2 2 
                                       f32_4 %254 = OpLoad %81 
                                       f32_2 %255 = OpVectorShuffle %254 %254 0 3 
                                       f32_2 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %247 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 2 3 
                                                      OpStore %247 %258 
                                       f32_4 %261 = OpLoad %260 
                                                      OpStore %259 %261 
                                 Output f32* %263 = OpAccessChain %174 %124 %170 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFNegate %264 
                                 Output f32* %266 = OpAccessChain %174 %124 %170 
                                                      OpStore %266 %265 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 593
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %207 %373 %436 %579 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpMemberDecorate %77 0 Offset 77 
                                                      OpMemberDecorate %77 1 Offset 77 
                                                      OpMemberDecorate %77 2 Offset 77 
                                                      OpMemberDecorate %77 3 Offset 77 
                                                      OpMemberDecorate %77 4 Offset 77 
                                                      OpMemberDecorate %77 5 Offset 77 
                                                      OpMemberDecorate %77 6 Offset 77 
                                                      OpMemberDecorate %77 7 Offset 77 
                                                      OpMemberDecorate %77 8 Offset 77 
                                                      OpMemberDecorate %77 9 Offset 77 
                                                      OpMemberDecorate %77 10 Offset 77 
                                                      OpMemberDecorate %77 11 Offset 77 
                                                      OpMemberDecorate %77 12 Offset 77 
                                                      OpMemberDecorate %77 13 Offset 77 
                                                      OpMemberDecorate %77 14 Offset 77 
                                                      OpMemberDecorate %77 15 Offset 77 
                                                      OpDecorate %77 Block 
                                                      OpDecorate %79 DescriptorSet 79 
                                                      OpDecorate %79 Binding 79 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 DescriptorSet 175 
                                                      OpDecorate %175 Binding 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %207 Location 207 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %370 DescriptorSet 370 
                                                      OpDecorate %370 Binding 370 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %373 Location 373 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %392 RelaxedPrecision 
                                                      OpDecorate %393 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %410 DescriptorSet 410 
                                                      OpDecorate %410 Binding 410 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %414 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %429 RelaxedPrecision 
                                                      OpDecorate %436 Location 436 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %469 DescriptorSet 469 
                                                      OpDecorate %469 Binding 469 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %479 RelaxedPrecision 
                                                      OpDecorate %480 RelaxedPrecision 
                                                      OpDecorate %484 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %550 RelaxedPrecision 
                                                      OpDecorate %576 RelaxedPrecision 
                                                      OpDecorate %579 RelaxedPrecision 
                                                      OpDecorate %579 Location 579 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %591 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                          f32 %15 = OpConstant 3.67402E-40 
                                          f32 %16 = OpConstant 3.67402E-40 
                                        f32_3 %17 = OpConstantComposite %15 %16 %16 
                                              %21 = OpTypeVector %6 2 
                                              %22 = OpTypePointer Private %21 
                               Private f32_2* %23 = OpVariable Private 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 0 
                                              %29 = OpTypePointer Private %6 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                                          f32 %39 = OpConstant 3.67402E-40 
                                          f32 %40 = OpConstant 3.67402E-40 
                                        f32_2 %41 = OpConstantComposite %39 %40 
                                          f32 %50 = OpConstant 3.67402E-40 
                                          f32 %59 = OpConstant 3.67402E-40 
                                 Private f32* %67 = OpVariable Private 
                                          u32 %68 = OpConstant 1 
                                              %69 = OpTypePointer Input %6 
                               Private f32_4* %75 = OpVariable Private 
                                              %76 = OpTypeVector %27 4 
                                              %77 = OpTypeStruct %7 %6 %7 %6 %6 %7 %7 %6 %6 %6 %6 %6 %7 %76 %6 %6 
                                              %78 = OpTypePointer Uniform %77 
Uniform struct {f32_4; f32; f32_4; f32; f32; f32_4; f32_4; f32; f32; f32; f32; f32; f32_4; u32_4; f32; f32;}* %79 = OpVariable Uniform 
                                              %80 = OpTypeInt 32 1 
                                          i32 %81 = OpConstant 0 
                                              %82 = OpTypePointer Uniform %7 
                                          i32 %86 = OpConstant 12 
                                 Private f32* %93 = OpVariable Private 
                                          i32 %96 = OpConstant 4 
                                              %97 = OpTypePointer Uniform %6 
                                             %103 = OpTypePointer Private %10 
                              Private f32_3* %104 = OpVariable Private 
                              Private f32_4* %108 = OpVariable Private 
                                         f32 %114 = OpConstant 3.67402E-40 
                                         f32 %119 = OpConstant 3.67402E-40 
                                         i32 %131 = OpConstant 1 
                                         f32 %157 = OpConstant 3.67402E-40 
                                       f32_2 %158 = OpConstantComposite %59 %157 
                                         f32 %164 = OpConstant 3.67402E-40 
                                       f32_2 %165 = OpConstantComposite %164 %164 
                                             %172 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %173 = OpTypeSampledImage %172 
                                             %174 = OpTypePointer UniformConstant %173 
 UniformConstant read_only Texture2DSampled* %175 = OpVariable UniformConstant 
                                         f32 %183 = OpConstant 3.67402E-40 
                                         i32 %198 = OpConstant 11 
                                             %203 = OpTypeBool 
                                             %204 = OpTypePointer Private %203 
                               Private bool* %205 = OpVariable Private 
                                             %206 = OpTypePointer Input %7 
                                Input f32_4* %207 = OpVariable Input 
                                         f32 %215 = OpConstant 3.67402E-40 
                                         f32 %216 = OpConstant 3.67402E-40 
                                       f32_2 %217 = OpConstantComposite %215 %216 
                              Private f32_3* %221 = OpVariable Private 
                                             %222 = OpTypePointer Function %10 
                              Private f32_3* %232 = OpVariable Private 
                               Private bool* %236 = OpVariable Private 
                               Private bool* %242 = OpVariable Private 
                                         i32 %257 = OpConstant 7 
                                         f32 %266 = OpConstant 3.67402E-40 
                                         f32 %267 = OpConstant 3.67402E-40 
                                       f32_2 %268 = OpConstantComposite %266 %267 
                                         u32 %279 = OpConstant 2 
                                       f32_2 %286 = OpConstantComposite %114 %119 
                                         f32 %307 = OpConstant 3.67402E-40 
                                       f32_2 %308 = OpConstantComposite %307 %307 
                                         f32 %314 = OpConstant 3.67402E-40 
                                       f32_2 %315 = OpConstantComposite %314 %119 
                              Private f32_4* %322 = OpVariable Private 
                                         i32 %332 = OpConstant 8 
                                         i32 %349 = OpConstant 6 
                                         i32 %358 = OpConstant 5 
                              Private f32_4* %369 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %370 = OpVariable UniformConstant 
                                             %372 = OpTypePointer Input %21 
                                Input f32_2* %373 = OpVariable Input 
                                         i32 %382 = OpConstant 2 
                                         i32 %397 = OpConstant 9 
                                         f32 %400 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %410 = OpVariable UniformConstant 
                                             %416 = OpTypePointer Function %6 
                                Input f32_4* %436 = OpVariable Input 
                                         f32 %439 = OpConstant 3.67402E-40 
                                         f32 %443 = OpConstant 3.67402E-40 
                                         f32 %450 = OpConstant 3.67402E-40 
                                         f32 %453 = OpConstant 3.67402E-40 
                                         f32 %464 = OpConstant 3.67402E-40 
                                       f32_2 %465 = OpConstantComposite %453 %464 
 UniformConstant read_only Texture2DSampled* %469 = OpVariable UniformConstant 
                                         f32 %476 = OpConstant 3.67402E-40 
                                       f32_3 %477 = OpConstantComposite %476 %476 %476 
                                         u32 %482 = OpConstant 3 
                                         i32 %485 = OpConstant 3 
                                         i32 %490 = OpConstant 10 
                                         i32 %516 = OpConstant 14 
                                         i32 %535 = OpConstant 15 
                              Private f32_4* %550 = OpVariable Private 
                                         i32 %552 = OpConstant 13 
                                             %553 = OpTypeVector %203 4 
                                             %554 = OpTypePointer Uniform %76 
                                       f32_3 %564 = OpConstantComposite %453 %453 %453 
                                             %578 = OpTypePointer Output %7 
                               Output f32_4* %579 = OpVariable Output 
                                             %580 = OpTypePointer Function %7 
                                       f32_4 %588 = OpConstantComposite %453 %453 %453 %400 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %223 = OpVariable Function 
                             Function f32_3* %248 = OpVariable Function 
                               Function f32* %417 = OpVariable Function 
                             Function f32_3* %551 = OpVariable Function 
                               Function f32* %568 = OpVariable Function 
                             Function f32_4* %581 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 0 1 
                                        f32_3 %18 = OpFMul %14 %17 
                                        f32_4 %19 = OpLoad %9 
                                        f32_4 %20 = OpVectorShuffle %19 %18 4 5 6 3 
                                                      OpStore %9 %20 
                                        f32_4 %24 = OpLoad %9 
                                        f32_2 %25 = OpVectorShuffle %24 %24 1 2 
                                        f32_2 %26 = OpExtInst %1 8 %25 
                                                      OpStore %23 %26 
                                 Private f32* %30 = OpAccessChain %9 %28 
                                          f32 %31 = OpLoad %30 
                                          f32 %32 = OpExtInst %1 14 %31 
                                 Private f32* %33 = OpAccessChain %9 %28 
                                                      OpStore %33 %32 
                                        f32_2 %34 = OpLoad %23 
                                        f32_2 %37 = OpFMul %34 %36 
                                                      OpStore %23 %37 
                                        f32_2 %38 = OpLoad %23 
                                          f32 %42 = OpDot %38 %41 
                                 Private f32* %43 = OpAccessChain %23 %28 
                                                      OpStore %43 %42 
                                 Private f32* %44 = OpAccessChain %23 %28 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpExtInst %1 13 %45 
                                 Private f32* %47 = OpAccessChain %23 %28 
                                                      OpStore %47 %46 
                                 Private f32* %48 = OpAccessChain %23 %28 
                                          f32 %49 = OpLoad %48 
                                          f32 %51 = OpFMul %49 %50 
                                 Private f32* %52 = OpAccessChain %23 %28 
                                                      OpStore %52 %51 
                                 Private f32* %53 = OpAccessChain %23 %28 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpExtInst %1 10 %54 
                                 Private f32* %56 = OpAccessChain %23 %28 
                                                      OpStore %56 %55 
                                 Private f32* %57 = OpAccessChain %23 %28 
                                          f32 %58 = OpLoad %57 
                                          f32 %60 = OpFMul %58 %59 
                                          f32 %61 = OpFAdd %60 %59 
                                 Private f32* %62 = OpAccessChain %23 %28 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %23 %28 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFMul %64 %59 
                                 Private f32* %66 = OpAccessChain %23 %28 
                                                      OpStore %66 %65 
                                   Input f32* %70 = OpAccessChain %12 %68 
                                          f32 %71 = OpLoad %70 
                                   Input f32* %72 = OpAccessChain %12 %28 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFAdd %71 %73 
                                                      OpStore %67 %74 
                               Uniform f32_4* %83 = OpAccessChain %79 %81 
                                        f32_4 %84 = OpLoad %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               Uniform f32_4* %87 = OpAccessChain %79 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFAdd %85 %89 
                                        f32_4 %91 = OpLoad %75 
                                        f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                                      OpStore %75 %92 
                                 Private f32* %94 = OpAccessChain %75 %68 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %98 = OpAccessChain %79 %96 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFMul %95 %99 
                                         f32 %101 = OpLoad %67 
                                         f32 %102 = OpFAdd %100 %101 
                                                      OpStore %93 %102 
                                         f32 %105 = OpLoad %93 
                                         f32 %106 = OpExtInst %1 13 %105 
                                Private f32* %107 = OpAccessChain %104 %28 
                                                      OpStore %107 %106 
                                         f32 %109 = OpLoad %93 
                                         f32 %110 = OpExtInst %1 14 %109 
                                Private f32* %111 = OpAccessChain %108 %28 
                                                      OpStore %111 %110 
                                Private f32* %112 = OpAccessChain %108 %28 
                                         f32 %113 = OpLoad %112 
                                         f32 %115 = OpFMul %113 %114 
                                Private f32* %116 = OpAccessChain %108 %28 
                                                      OpStore %116 %115 
                                Private f32* %117 = OpAccessChain %104 %28 
                                         f32 %118 = OpLoad %117 
                                         f32 %120 = OpFMul %118 %119 
                                Private f32* %121 = OpAccessChain %108 %68 
                                                      OpStore %121 %120 
                                       f32_4 %122 = OpLoad %108 
                                       f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                       f32_3 %124 = OpLoad %12 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_3 %127 = OpLoad %104 
                                       f32_3 %128 = OpVectorShuffle %127 %126 3 4 2 
                                                      OpStore %104 %128 
                                       f32_3 %129 = OpLoad %104 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                Uniform f32* %132 = OpAccessChain %79 %131 
                                         f32 %133 = OpLoad %132 
                                       f32_2 %134 = OpCompositeConstruct %133 %133 
                                       f32_2 %135 = OpFMul %130 %134 
                                       f32_3 %136 = OpLoad %104 
                                       f32_3 %137 = OpVectorShuffle %136 %135 3 4 2 
                                                      OpStore %104 %137 
                                       f32_4 %138 = OpLoad %75 
                                       f32_4 %139 = OpVectorShuffle %138 %138 1 1 0 0 
                                Uniform f32* %140 = OpAccessChain %79 %96 
                                         f32 %141 = OpLoad %140 
                                Uniform f32* %142 = OpAccessChain %79 %96 
                                         f32 %143 = OpLoad %142 
                                Uniform f32* %144 = OpAccessChain %79 %96 
                                         f32 %145 = OpLoad %144 
                                Uniform f32* %146 = OpAccessChain %79 %96 
                                         f32 %147 = OpLoad %146 
                                       f32_4 %148 = OpCompositeConstruct %141 %143 %145 %147 
                                         f32 %149 = OpCompositeExtract %148 0 
                                         f32 %150 = OpCompositeExtract %148 1 
                                         f32 %151 = OpCompositeExtract %148 2 
                                         f32 %152 = OpCompositeExtract %148 3 
                                       f32_4 %153 = OpCompositeConstruct %149 %150 %151 %152 
                                       f32_4 %154 = OpFMul %139 %153 
                                                      OpStore %108 %154 
                                       f32_4 %155 = OpLoad %108 
                                       f32_2 %156 = OpVectorShuffle %155 %155 2 3 
                                       f32_2 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %75 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 2 5 
                                                      OpStore %75 %161 
                                       f32_3 %162 = OpLoad %104 
                                       f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                                       f32_2 %166 = OpFMul %163 %165 
                                       f32_4 %167 = OpLoad %75 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 3 
                                       f32_2 %169 = OpFAdd %166 %168 
                                       f32_4 %170 = OpLoad %75 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 1 2 5 
                                                      OpStore %75 %171 
                  read_only Texture2DSampled %176 = OpLoad %175 
                                       f32_4 %177 = OpLoad %75 
                                       f32_2 %178 = OpVectorShuffle %177 %177 0 3 
                                       f32_4 %179 = OpImageSampleImplicitLod %176 %178 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %104 %180 
                                  Input f32* %181 = OpAccessChain %12 %28 
                                         f32 %182 = OpLoad %181 
                                         f32 %184 = OpFMul %182 %183 
                                Private f32* %185 = OpAccessChain %75 %68 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                                      OpStore %93 %187 
                                         f32 %188 = OpLoad %93 
                                         f32 %189 = OpExtInst %1 13 %188 
                                                      OpStore %93 %189 
                                Private f32* %190 = OpAccessChain %9 %28 
                                         f32 %191 = OpLoad %190 
                                         f32 %192 = OpLoad %93 
                                         f32 %193 = OpFMul %191 %192 
                                Private f32* %194 = OpAccessChain %9 %28 
                                                      OpStore %194 %193 
                                Private f32* %195 = OpAccessChain %9 %28 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %196 %35 
                                Uniform f32* %199 = OpAccessChain %79 %198 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFAdd %197 %200 
                                Private f32* %202 = OpAccessChain %9 %28 
                                                      OpStore %202 %201 
                                  Input f32* %208 = OpAccessChain %207 %28 
                                         f32 %209 = OpLoad %208 
                                Private f32* %210 = OpAccessChain %9 %28 
                                         f32 %211 = OpLoad %210 
                                        bool %212 = OpFOrdLessThan %209 %211 
                                                      OpStore %205 %212 
                                       f32_4 %213 = OpLoad %9 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 0 
                                       f32_2 %218 = OpFAdd %214 %217 
                                       f32_4 %219 = OpLoad %75 
                                       f32_4 %220 = OpVectorShuffle %219 %218 4 5 2 3 
                                                      OpStore %75 %220 
                                        bool %224 = OpLoad %205 
                                                      OpSelectionMerge %226 None 
                                                      OpBranchConditional %224 %225 %229 
                                             %225 = OpLabel 
                                       f32_2 %227 = OpLoad %23 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 0 0 
                                                      OpStore %223 %228 
                                                      OpBranch %226 
                                             %229 = OpLabel 
                                       f32_3 %230 = OpLoad %104 
                                                      OpStore %223 %230 
                                                      OpBranch %226 
                                             %226 = OpLabel 
                                       f32_3 %231 = OpLoad %223 
                                                      OpStore %221 %231 
                                       f32_3 %233 = OpLoad %221 
                                       f32_3 %234 = OpLoad %221 
                                       f32_3 %235 = OpFAdd %233 %234 
                                                      OpStore %232 %235 
                                  Input f32* %237 = OpAccessChain %207 %28 
                                         f32 %238 = OpLoad %237 
                                Private f32* %239 = OpAccessChain %75 %28 
                                         f32 %240 = OpLoad %239 
                                        bool %241 = OpFOrdLessThan %238 %240 
                                                      OpStore %236 %241 
                                Private f32* %243 = OpAccessChain %75 %68 
                                         f32 %244 = OpLoad %243 
                                  Input f32* %245 = OpAccessChain %207 %28 
                                         f32 %246 = OpLoad %245 
                                        bool %247 = OpFOrdLessThan %244 %246 
                                                      OpStore %242 %247 
                                        bool %249 = OpLoad %236 
                                                      OpSelectionMerge %251 None 
                                                      OpBranchConditional %249 %250 %253 
                                             %250 = OpLabel 
                                       f32_3 %252 = OpLoad %232 
                                                      OpStore %248 %252 
                                                      OpBranch %251 
                                             %253 = OpLabel 
                                       f32_3 %254 = OpLoad %221 
                                                      OpStore %248 %254 
                                                      OpBranch %251 
                                             %251 = OpLabel 
                                       f32_3 %255 = OpLoad %248 
                                                      OpStore %221 %255 
                                       f32_3 %256 = OpLoad %221 
                                Uniform f32* %258 = OpAccessChain %79 %257 
                                         f32 %259 = OpLoad %258 
                                       f32_3 %260 = OpCompositeConstruct %259 %259 %259 
                                       f32_3 %261 = OpFMul %256 %260 
                                       f32_4 %262 = OpLoad %75 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 6 
                                                      OpStore %75 %263 
                                       f32_4 %264 = OpLoad %108 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_2 %269 = OpFMul %265 %268 
                                         f32 %270 = OpLoad %67 
                                       f32_2 %271 = OpCompositeConstruct %270 %270 
                                       f32_2 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %9 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 1 5 3 
                                                      OpStore %9 %274 
                                Private f32* %275 = OpAccessChain %9 %28 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpExtInst %1 14 %276 
                                Private f32* %278 = OpAccessChain %9 %28 
                                                      OpStore %278 %277 
                                Private f32* %280 = OpAccessChain %9 %279 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpExtInst %1 13 %281 
                                Private f32* %283 = OpAccessChain %9 %279 
                                                      OpStore %283 %282 
                                       f32_4 %284 = OpLoad %9 
                                       f32_2 %285 = OpVectorShuffle %284 %284 0 2 
                                       f32_2 %287 = OpFMul %285 %286 
                                       f32_3 %288 = OpLoad %104 
                                       f32_3 %289 = OpVectorShuffle %288 %287 3 4 2 
                                                      OpStore %104 %289 
                                       f32_3 %290 = OpLoad %104 
                                       f32_2 %291 = OpVectorShuffle %290 %290 0 1 
                                       f32_3 %292 = OpLoad %12 
                                       f32_2 %293 = OpVectorShuffle %292 %292 0 1 
                                       f32_2 %294 = OpFAdd %291 %293 
                                       f32_4 %295 = OpLoad %9 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 1 5 3 
                                                      OpStore %9 %296 
                                       f32_4 %297 = OpLoad %9 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 2 
                                Uniform f32* %299 = OpAccessChain %79 %131 
                                         f32 %300 = OpLoad %299 
                                       f32_2 %301 = OpCompositeConstruct %300 %300 
                                       f32_2 %302 = OpFMul %298 %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_4 %304 = OpVectorShuffle %303 %302 4 1 5 3 
                                                      OpStore %9 %304 
                                       f32_4 %305 = OpLoad %9 
                                       f32_2 %306 = OpVectorShuffle %305 %305 0 2 
                                       f32_2 %309 = OpFMul %306 %308 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpVectorShuffle %310 %309 4 1 5 3 
                                                      OpStore %9 %311 
                                       f32_4 %312 = OpLoad %108 
                                       f32_2 %313 = OpVectorShuffle %312 %312 3 3 
                                       f32_2 %316 = OpFMul %313 %315 
                                       f32_4 %317 = OpLoad %9 
                                       f32_2 %318 = OpVectorShuffle %317 %317 0 2 
                                       f32_2 %319 = OpFAdd %316 %318 
                                       f32_4 %320 = OpLoad %9 
                                       f32_4 %321 = OpVectorShuffle %320 %319 4 1 5 3 
                                                      OpStore %9 %321 
                  read_only Texture2DSampled %323 = OpLoad %175 
                                       f32_4 %324 = OpLoad %9 
                                       f32_2 %325 = OpVectorShuffle %324 %324 0 2 
                                       f32_4 %326 = OpImageSampleImplicitLod %323 %325 
                                       f32_3 %327 = OpVectorShuffle %326 %326 0 1 2 
                                       f32_4 %328 = OpLoad %322 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 1 5 6 
                                                      OpStore %322 %329 
                                       f32_4 %330 = OpLoad %322 
                                       f32_3 %331 = OpVectorShuffle %330 %330 0 2 3 
                                Uniform f32* %333 = OpAccessChain %79 %332 
                                         f32 %334 = OpLoad %333 
                                Uniform f32* %335 = OpAccessChain %79 %332 
                                         f32 %336 = OpLoad %335 
                                Uniform f32* %337 = OpAccessChain %79 %332 
                                         f32 %338 = OpLoad %337 
                                       f32_3 %339 = OpCompositeConstruct %334 %336 %338 
                                         f32 %340 = OpCompositeExtract %339 0 
                                         f32 %341 = OpCompositeExtract %339 1 
                                         f32 %342 = OpCompositeExtract %339 2 
                                       f32_3 %343 = OpCompositeConstruct %340 %341 %342 
                                       f32_3 %344 = OpFMul %331 %343 
                                       f32_4 %345 = OpLoad %9 
                                       f32_4 %346 = OpVectorShuffle %345 %344 4 1 5 6 
                                                      OpStore %9 %346 
                                       f32_4 %347 = OpLoad %9 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 2 3 
                              Uniform f32_4* %350 = OpAccessChain %79 %349 
                                       f32_4 %351 = OpLoad %350 
                                       f32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                       f32_3 %353 = OpFMul %348 %352 
                                       f32_4 %354 = OpLoad %9 
                                       f32_4 %355 = OpVectorShuffle %354 %353 4 1 5 6 
                                                      OpStore %9 %355 
                                       f32_4 %356 = OpLoad %75 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 3 
                              Uniform f32_4* %359 = OpAccessChain %79 %358 
                                       f32_4 %360 = OpLoad %359 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                                       f32_3 %362 = OpFMul %357 %361 
                                       f32_4 %363 = OpLoad %9 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 2 3 
                                       f32_3 %365 = OpFNegate %364 
                                       f32_3 %366 = OpFAdd %362 %365 
                                       f32_4 %367 = OpLoad %9 
                                       f32_4 %368 = OpVectorShuffle %367 %366 4 1 5 6 
                                                      OpStore %9 %368 
                  read_only Texture2DSampled %371 = OpLoad %370 
                                       f32_2 %374 = OpLoad %373 
                                       f32_4 %375 = OpImageSampleImplicitLod %371 %374 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_4 %377 = OpLoad %369 
                                       f32_4 %378 = OpVectorShuffle %377 %376 4 5 2 6 
                                                      OpStore %369 %378 
                                       f32_4 %379 = OpLoad %369 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 3 
                                       f32_3 %381 = OpFNegate %380 
                              Uniform f32_4* %383 = OpAccessChain %79 %382 
                                       f32_4 %384 = OpLoad %383 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFAdd %381 %385 
                                                      OpStore %104 %386 
                              Uniform f32_4* %387 = OpAccessChain %79 %382 
                                       f32_4 %388 = OpLoad %387 
                                       f32_3 %389 = OpVectorShuffle %388 %388 3 3 3 
                                       f32_3 %390 = OpLoad %104 
                                       f32_3 %391 = OpFMul %389 %390 
                                       f32_4 %392 = OpLoad %369 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 3 
                                       f32_3 %394 = OpFAdd %391 %393 
                                       f32_4 %395 = OpLoad %75 
                                       f32_4 %396 = OpVectorShuffle %395 %394 4 5 2 6 
                                                      OpStore %75 %396 
                                Uniform f32* %398 = OpAccessChain %79 %397 
                                         f32 %399 = OpLoad %398 
                                         f32 %401 = OpFAdd %399 %400 
                                Private f32* %402 = OpAccessChain %104 %28 
                                                      OpStore %402 %401 
                                       f32_4 %403 = OpLoad %75 
                                       f32_3 %404 = OpVectorShuffle %403 %403 0 1 3 
                                       f32_3 %405 = OpLoad %104 
                                       f32_3 %406 = OpVectorShuffle %405 %405 0 0 0 
                                       f32_3 %407 = OpFMul %404 %406 
                                       f32_4 %408 = OpLoad %75 
                                       f32_4 %409 = OpVectorShuffle %408 %407 4 5 2 6 
                                                      OpStore %75 %409 
                  read_only Texture2DSampled %411 = OpLoad %410 
                                       f32_2 %412 = OpLoad %373 
                                       f32_4 %413 = OpImageSampleImplicitLod %411 %412 
                                         f32 %414 = OpCompositeExtract %413 0 
                                Private f32* %415 = OpAccessChain %104 %28 
                                                      OpStore %415 %414 
                                        bool %418 = OpLoad %242 
                                                      OpSelectionMerge %420 None 
                                                      OpBranchConditional %418 %419 %421 
                                             %419 = OpLabel 
                                                      OpStore %417 %400 
                                                      OpBranch %420 
                                             %421 = OpLabel 
                                Private f32* %422 = OpAccessChain %104 %28 
                                         f32 %423 = OpLoad %422 
                                                      OpStore %417 %423 
                                                      OpBranch %420 
                                             %420 = OpLabel 
                                         f32 %424 = OpLoad %417 
                                Private f32* %425 = OpAccessChain %221 %28 
                                                      OpStore %425 %424 
                                       f32_4 %426 = OpLoad %9 
                                       f32_3 %427 = OpVectorShuffle %426 %426 0 2 3 
                                       f32_3 %428 = OpLoad %221 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 0 0 
                                       f32_3 %430 = OpFMul %427 %429 
                                       f32_4 %431 = OpLoad %75 
                                       f32_3 %432 = OpVectorShuffle %431 %431 0 1 3 
                                       f32_3 %433 = OpFAdd %430 %432 
                                       f32_4 %434 = OpLoad %9 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 6 3 
                                                      OpStore %9 %435 
                                  Input f32* %437 = OpAccessChain %436 %68 
                                         f32 %438 = OpLoad %437 
                                         f32 %440 = OpFMul %438 %439 
                                                      OpStore %93 %440 
                                Private f32* %441 = OpAccessChain %75 %279 
                                         f32 %442 = OpLoad %441 
                                         f32 %444 = OpFMul %442 %443 
                                         f32 %445 = OpLoad %93 
                                         f32 %446 = OpFAdd %444 %445 
                                                      OpStore %93 %446 
                                         f32 %447 = OpLoad %93 
                                         f32 %448 = OpExtInst %1 13 %447 
                                                      OpStore %93 %448 
                                         f32 %449 = OpLoad %93 
                                         f32 %451 = OpFMul %449 %450 
                                Private f32* %452 = OpAccessChain %75 %28 
                                                      OpStore %452 %451 
                                Private f32* %454 = OpAccessChain %75 %68 
                                                      OpStore %454 %453 
                                       f32_4 %455 = OpLoad %75 
                                       f32_2 %456 = OpVectorShuffle %455 %455 0 1 
                                       f32_4 %457 = OpLoad %436 
                                       f32_2 %458 = OpVectorShuffle %457 %457 0 1 
                                       f32_2 %459 = OpFAdd %456 %458 
                                       f32_4 %460 = OpLoad %75 
                                       f32_4 %461 = OpVectorShuffle %460 %459 4 5 2 3 
                                                      OpStore %75 %461 
                                       f32_4 %462 = OpLoad %75 
                                       f32_2 %463 = OpVectorShuffle %462 %462 0 1 
                                       f32_2 %466 = OpFAdd %463 %465 
                                       f32_4 %467 = OpLoad %75 
                                       f32_4 %468 = OpVectorShuffle %467 %466 4 5 2 3 
                                                      OpStore %75 %468 
                  read_only Texture2DSampled %470 = OpLoad %469 
                                       f32_4 %471 = OpLoad %75 
                                       f32_2 %472 = OpVectorShuffle %471 %471 0 1 
                                       f32_4 %473 = OpImageSampleImplicitLod %470 %472 
                                                      OpStore %369 %473 
                                       f32_4 %474 = OpLoad %9 
                                       f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
                                       f32_3 %478 = OpFMul %475 %477 
                                       f32_4 %479 = OpLoad %369 
                                       f32_3 %480 = OpVectorShuffle %479 %479 0 1 2 
                                       f32_3 %481 = OpFAdd %478 %480 
                                                      OpStore %221 %481 
                                Private f32* %483 = OpAccessChain %369 %482 
                                         f32 %484 = OpLoad %483 
                                Uniform f32* %486 = OpAccessChain %79 %485 
                                         f32 %487 = OpLoad %486 
                                         f32 %488 = OpFMul %484 %487 
                                                      OpStore %93 %488 
                                         f32 %489 = OpLoad %93 
                                Uniform f32* %491 = OpAccessChain %79 %490 
                                         f32 %492 = OpLoad %491 
                                         f32 %493 = OpFMul %489 %492 
                                                      OpStore %93 %493 
                                       f32_4 %494 = OpLoad %9 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                                       f32_3 %496 = OpFNegate %495 
                                       f32_3 %497 = OpLoad %221 
                                       f32_3 %498 = OpFAdd %496 %497 
                                       f32_4 %499 = OpLoad %75 
                                       f32_4 %500 = OpVectorShuffle %499 %498 4 5 6 3 
                                                      OpStore %75 %500 
                                         f32 %501 = OpLoad %93 
                                       f32_3 %502 = OpCompositeConstruct %501 %501 %501 
                                       f32_4 %503 = OpLoad %75 
                                       f32_3 %504 = OpVectorShuffle %503 %503 0 1 2 
                                       f32_3 %505 = OpFMul %502 %504 
                                       f32_4 %506 = OpLoad %9 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                                       f32_3 %508 = OpFAdd %505 %507 
                                       f32_4 %509 = OpLoad %9 
                                       f32_4 %510 = OpVectorShuffle %509 %508 4 5 6 3 
                                                      OpStore %9 %510 
                                       f32_4 %511 = OpLoad %9 
                                       f32_3 %512 = OpVectorShuffle %511 %511 0 1 2 
                                       f32_3 %513 = OpExtInst %1 30 %512 
                                       f32_4 %514 = OpLoad %9 
                                       f32_4 %515 = OpVectorShuffle %514 %513 4 5 6 3 
                                                      OpStore %9 %515 
                                Uniform f32* %517 = OpAccessChain %79 %516 
                                         f32 %518 = OpLoad %517 
                                                      OpStore %93 %518 
                                         f32 %519 = OpLoad %93 
                                         f32 %520 = OpExtInst %1 43 %519 %453 %400 
                                                      OpStore %93 %520 
                                       f32_4 %521 = OpLoad %9 
                                       f32_3 %522 = OpVectorShuffle %521 %521 0 1 2 
                                         f32 %523 = OpLoad %93 
                                       f32_3 %524 = OpCompositeConstruct %523 %523 %523 
                                       f32_3 %525 = OpFMul %522 %524 
                                       f32_4 %526 = OpLoad %9 
                                       f32_4 %527 = OpVectorShuffle %526 %525 4 5 6 3 
                                                      OpStore %9 %527 
                                       f32_4 %528 = OpLoad %9 
                                       f32_3 %529 = OpVectorShuffle %528 %528 0 1 2 
                                       f32_3 %530 = OpExtInst %1 29 %529 
                                       f32_4 %531 = OpLoad %9 
                                       f32_4 %532 = OpVectorShuffle %531 %530 4 5 6 3 
                                                      OpStore %9 %532 
                                       f32_4 %533 = OpLoad %9 
                                       f32_3 %534 = OpVectorShuffle %533 %533 0 1 2 
                                Uniform f32* %536 = OpAccessChain %79 %535 
                                         f32 %537 = OpLoad %536 
                                Uniform f32* %538 = OpAccessChain %79 %535 
                                         f32 %539 = OpLoad %538 
                                Uniform f32* %540 = OpAccessChain %79 %535 
                                         f32 %541 = OpLoad %540 
                                       f32_3 %542 = OpCompositeConstruct %537 %539 %541 
                                         f32 %543 = OpCompositeExtract %542 0 
                                         f32 %544 = OpCompositeExtract %542 1 
                                         f32 %545 = OpCompositeExtract %542 2 
                                       f32_3 %546 = OpCompositeConstruct %543 %544 %545 
                                       f32_3 %547 = OpExtInst %1 37 %534 %546 
                                       f32_4 %548 = OpLoad %9 
                                       f32_4 %549 = OpVectorShuffle %548 %547 4 5 6 3 
                                                      OpStore %9 %549 
                              Uniform u32_4* %555 = OpAccessChain %79 %552 
                                       u32_4 %556 = OpLoad %555 
                                         u32 %557 = OpCompositeExtract %556 0 
                                        bool %558 = OpINotEqual %557 %28 
                                                      OpSelectionMerge %560 None 
                                                      OpBranchConditional %558 %559 %563 
                                             %559 = OpLabel 
                                       f32_4 %561 = OpLoad %9 
                                       f32_3 %562 = OpVectorShuffle %561 %561 0 1 2 
                                                      OpStore %551 %562 
                                                      OpBranch %560 
                                             %563 = OpLabel 
                                                      OpStore %551 %564 
                                                      OpBranch %560 
                                             %560 = OpLabel 
                                       f32_3 %565 = OpLoad %551 
                                       f32_4 %566 = OpLoad %550 
                                       f32_4 %567 = OpVectorShuffle %566 %565 4 5 6 3 
                                                      OpStore %550 %567 
                              Uniform u32_4* %569 = OpAccessChain %79 %552 
                                       u32_4 %570 = OpLoad %569 
                                         u32 %571 = OpCompositeExtract %570 0 
                                        bool %572 = OpINotEqual %571 %28 
                                                      OpSelectionMerge %574 None 
                                                      OpBranchConditional %572 %573 %575 
                                             %573 = OpLabel 
                                                      OpStore %568 %400 
                                                      OpBranch %574 
                                             %575 = OpLabel 
                                                      OpStore %568 %453 
                                                      OpBranch %574 
                                             %574 = OpLabel 
                                         f32 %576 = OpLoad %568 
                                Private f32* %577 = OpAccessChain %550 %482 
                                                      OpStore %577 %576 
                              Uniform u32_4* %582 = OpAccessChain %79 %552 
                                       u32_4 %583 = OpLoad %582 
                                         u32 %584 = OpCompositeExtract %583 1 
                                        bool %585 = OpINotEqual %584 %28 
                                                      OpSelectionMerge %587 None 
                                                      OpBranchConditional %585 %586 %589 
                                             %586 = OpLabel 
                                                      OpStore %581 %588 
                                                      OpBranch %587 
                                             %589 = OpLabel 
                                       f32_4 %590 = OpLoad %550 
                                                      OpStore %581 %590 
                                                      OpBranch %587 
                                             %587 = OpLabel 
                                       f32_4 %591 = OpLoad %581 
                                                      OpStore %579 %591 
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
Fallback "Transparent/Cutout/Diffuse"
}