//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/TitleInk" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_OverrideColor ("Color", Color) = (1,1,1,1)
_StepValue ("Step Value", Float) = 0.1
_SkyBoost ("Sky Boost", Float) = 0.5
_SkyPower ("Sky Power", Float) = 1
_DitherCohesionFactor ("Cohesion Factor", Float) = 0.5
_SpaceVector ("Space Vector", Vector) = (50,27,150,133)
_CurvePower ("CP", Float) = 0
_CurveFreq ("Curve Freq", Float) = 1
_CurveColorFactor ("CCF", Float) = 1
_Wavy ("Wavy", Float) = 1
_WavePower ("Wave Power", Float) = 1
_Emission ("Emiss", Float) = 0
_AlphaMod ("Alpha", Float) = 1
_RadialFade ("RadialFade", Range(0, 2)) = 0
_YThreshold ("Y Threshold", Float) = -128.875
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 26253
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
in  vec2 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0 = u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    vs_TEXCOORD2 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _OverrideColor;
uniform 	float _StepValue;
uniform 	float _SkyBoost;
uniform 	float _SkyPower;
uniform 	float _CurvePower;
uniform 	float _CurveColorFactor;
uniform 	float _CurveFreq;
uniform 	float _DitherCohesionFactor;
uniform 	vec4 _SpaceVector;
uniform 	float _Wavy;
uniform 	float _WavePower;
uniform 	float _AlphaMod;
uniform 	float _Emission;
uniform 	float _RadialFade;
uniform 	float _YThreshold;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.yx / _MainTex_TexelSize.yx;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.z = dot(u_xlat0.yx, vec2(12.9898005, 78.2330017));
    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.xz = sin(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz * vec2(43758.5469, 43758.5469);
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = fract(u_xlat0.z);
    u_xlat10.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat10.x = inversesqrt(u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy;
    u_xlat10.x = dot(vs_TEXCOORD1.xy, vs_TEXCOORD1.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = u_xlat10.x + (-_RadialFade);
    u_xlat10.x = (-u_xlat10.x);
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat15 = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat15 * u_xlat10.x;
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + vs_TEXCOORD0.xy;
    u_xlat10.x = dot(vs_TEXCOORD0.xy, vec2(212.0, 117.0));
    u_xlat10.x = _Time.z * _WavePower + u_xlat10.x;
    u_xlat1.x = sin(u_xlat10.x);
    u_xlat2.x = cos(u_xlat10.x);
    u_xlat2.y = u_xlat1.x;
    u_xlat10.xy = u_xlat2.xy * vec2(0.00066666666, 0.00066666666) + vs_TEXCOORD0.xy;
    u_xlat10.xy = (-u_xlat0.xy) + u_xlat10.xy;
    u_xlat10.xy = vec2(_Wavy) * u_xlat10.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / _MainTex_TexelSize.xy;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat10_1 = texture(_MainTex, u_xlat10.xy);
    u_xlat10.x = u_xlat10_1.w * _OverrideColor.w + -0.25;
    u_xlat1 = u_xlat10_1 * _OverrideColor;
    u_xlatb10 = u_xlat10.x<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
    u_xlat10.x = _AlphaMod;
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat10.x = u_xlat10.x * u_xlat1.w;
    u_xlat15 = vs_TEXCOORD3.y + (-_YThreshold);
    u_xlat15 = (-u_xlat15);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat16 = u_xlat10.x * u_xlat15 + -0.00999999978;
    u_xlat2.w = u_xlat15 * u_xlat10.x;
    u_xlatb10 = u_xlat16<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
    u_xlat10.x = log2(vs_TEXCOORD2.y);
    u_xlat10.x = u_xlat10.x * _SkyPower;
    u_xlat10.x = exp2(u_xlat10.x);
    u_xlat10.x = u_xlat10.x + _SkyBoost;
    u_xlatb15 = u_xlat10.x<0.0;
    u_xlat10.x = (u_xlatb15) ? -1.0 : u_xlat10.x;
    u_xlat1.xyz = u_xlat10.xxx * u_xlat1.xyz;
    u_xlat10.x = vs_TEXCOORD2.x * _CurveFreq;
    u_xlat10.x = u_xlat10.x * 3.1400001;
    u_xlat10.x = sin(u_xlat10.x);
    u_xlat10.x = u_xlat10.x + 1.0;
    u_xlat15 = _CurveColorFactor + _CurveColorFactor;
    u_xlat10.x = u_xlat10.x / u_xlat15;
    u_xlat10.x = u_xlat10.x + -1.0;
    u_xlat10.x = _CurvePower * u_xlat10.x + 1.0;
    u_xlat3.xyw = u_xlat10.xxx * u_xlat1.yzx;
    u_xlat4.xy = u_xlat3.yx;
    u_xlat1.xy = u_xlat1.yz * u_xlat10.xx + (-u_xlat4.xy);
    u_xlatb10 = u_xlat4.y>=u_xlat3.y;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat4.z = float(-1.0);
    u_xlat4.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat1 = u_xlat10.xxxx * u_xlat1 + u_xlat4;
    u_xlatb10 = u_xlat3.w>=u_xlat1.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat3.wyx;
    u_xlat1 = (-u_xlat3) + u_xlat1;
    u_xlat1 = u_xlat10.xxxx * u_xlat1 + u_xlat3;
    u_xlat10.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat15 = u_xlat10.x * 6.0 + 1.00000001e-010;
    u_xlat6.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat15 = u_xlat6.x / u_xlat15;
    u_xlat15 = u_xlat15 + u_xlat1.z;
    u_xlat6.xyz = abs(vec3(u_xlat15)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15 = u_xlat1.x + 1.00000001e-010;
    u_xlat1.x = u_xlat1.x / _StepValue;
    u_xlat10.x = u_xlat10.x / u_xlat15;
    u_xlat6.xyz = u_xlat10.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
    u_xlat3.x = dot(u_xlat10.xy, _SpaceVector.xy);
    u_xlat10.x = dot(u_xlat10.xy, _SpaceVector.zw);
    u_xlat10.x = _Time.y * 2.0 + u_xlat10.x;
    u_xlat10.x = sin(u_xlat10.x);
    u_xlat10.x = u_xlat10.x * 0.099999994 + 0.150000006;
    u_xlat15 = (-_Time.y) * 2.0 + u_xlat3.x;
    u_xlat15 = sin(u_xlat15);
    u_xlat15 = u_xlat15 + 1.0;
    u_xlat15 = u_xlat15 * 0.5;
    u_xlat10.x = u_xlat15 * u_xlat10.x + 0.349999994;
    u_xlat15 = (-u_xlat10.x) + u_xlat1.x;
    u_xlat10.x = u_xlat10.x + u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlatb0 = 0.25<u_xlat0.x;
    u_xlat5.x = sin(u_xlat1.x);
    u_xlat5.x = u_xlat5.x * 43758.5469;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.5;
    u_xlat15 = (-u_xlat5.x) * _DitherCohesionFactor + u_xlat15;
    u_xlat5.x = u_xlat5.x * _DitherCohesionFactor + u_xlat10.x;
    u_xlat5.x = roundEven(u_xlat5.x);
    u_xlat5.y = ceil(u_xlat15);
    u_xlat5.xy = u_xlat5.xy * vec2(_StepValue);
    u_xlat0.x = (u_xlatb0) ? u_xlat5.y : u_xlat5.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat0 = u_xlat2 * u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.x = _AlphaMod * _AlphaMod;
    u_xlat1.x = u_xlat1.x * _Emission + 1.0;
    u_xlatb6 = 1.0<u_xlat1.x;
    u_xlat0 = (bool(u_xlatb6)) ? u_xlat0 : u_xlat2;
    SV_Target0 = u_xlat1.xxxx * u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 142
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %32 %33 %46 %76 %116 %128 
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
                                                     OpDecorate %32 Location 32 
                                                     OpDecorate %33 Location 33 
                                                     OpDecorate %46 Location 46 
                                                     OpDecorate %76 Location 76 
                                                     OpMemberDecorate %114 0 BuiltIn 114 
                                                     OpMemberDecorate %114 1 BuiltIn 114 
                                                     OpMemberDecorate %114 2 BuiltIn 114 
                                                     OpDecorate %114 Block 
                                                     OpDecorate %128 Location 128 
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
                               Output f32_2* %32 = OpVariable Output 
                                Input f32_2* %33 = OpVariable Input 
                                             %43 = OpTypePointer Private %13 
                              Private f32_4* %44 = OpVariable Private 
                                             %45 = OpTypePointer Input %13 
                                Input f32_4* %46 = OpVariable Input 
                                         i32 %49 = OpConstant 0 
                                         i32 %50 = OpConstant 1 
                              Private f32_4* %68 = OpVariable Private 
                                         i32 %70 = OpConstant 3 
                                             %74 = OpTypeVector %6 3 
                                             %75 = OpTypePointer Output %74 
                               Output f32_3* %76 = OpVariable Output 
                                        u32 %112 = OpConstant 1 
                                            %113 = OpTypeArray %6 %112 
                                            %114 = OpTypeStruct %13 %6 %113 
                                            %115 = OpTypePointer Output %114 
       Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                            %118 = OpTypePointer Output %13 
                                        f32 %121 = OpConstant 3.67402E-40 
                                      f32_4 %122 = OpConstantComposite %121 %121 %121 %121 
                                        f32 %125 = OpConstant 3.67402E-40 
                                      f32_4 %126 = OpConstantComposite %125 %125 %125 %125 
                              Output f32_4* %128 = OpVariable Output 
                                        f32 %130 = OpConstant 3.67402E-40 
                                      f32_4 %131 = OpConstantComposite %121 %130 %121 %121 
                                        f32 %133 = OpConstant 3.67402E-40 
                                      f32_4 %134 = OpConstantComposite %133 %121 %133 %133 
                                            %136 = OpTypePointer Output %6 
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
                                       f32_2 %34 = OpLoad %33 
                              Uniform f32_4* %35 = OpAccessChain %20 %22 
                                       f32_4 %36 = OpLoad %35 
                                       f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                                       f32_2 %38 = OpFMul %34 %37 
                              Uniform f32_4* %39 = OpAccessChain %20 %22 
                                       f32_4 %40 = OpLoad %39 
                                       f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                                       f32_2 %42 = OpFAdd %38 %41 
                                                     OpStore %32 %42 
                                       f32_4 %47 = OpLoad %46 
                                       f32_4 %48 = OpVectorShuffle %47 %47 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %49 %50 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %48 %52 
                                                     OpStore %44 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %49 %49 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %46 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %44 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %44 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %49 %22 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %46 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %44 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %44 %67 
                                       f32_4 %69 = OpLoad %44 
                              Uniform f32_4* %71 = OpAccessChain %20 %49 %70 
                                       f32_4 %72 = OpLoad %71 
                                       f32_4 %73 = OpFAdd %69 %72 
                                                     OpStore %68 %73 
                              Uniform f32_4* %77 = OpAccessChain %20 %49 %70 
                                       f32_4 %78 = OpLoad %77 
                                       f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                       f32_4 %80 = OpLoad %46 
                                       f32_3 %81 = OpVectorShuffle %80 %80 3 3 3 
                                       f32_3 %82 = OpFMul %79 %81 
                                       f32_4 %83 = OpLoad %44 
                                       f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                       f32_3 %85 = OpFAdd %82 %84 
                                                     OpStore %76 %85 
                                       f32_4 %86 = OpLoad %68 
                                       f32_4 %87 = OpVectorShuffle %86 %86 1 1 1 1 
                              Uniform f32_4* %88 = OpAccessChain %20 %50 %50 
                                       f32_4 %89 = OpLoad %88 
                                       f32_4 %90 = OpFMul %87 %89 
                                                     OpStore %44 %90 
                              Uniform f32_4* %91 = OpAccessChain %20 %50 %49 
                                       f32_4 %92 = OpLoad %91 
                                       f32_4 %93 = OpLoad %68 
                                       f32_4 %94 = OpVectorShuffle %93 %93 0 0 0 0 
                                       f32_4 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %44 
                                       f32_4 %97 = OpFAdd %95 %96 
                                                     OpStore %44 %97 
                              Uniform f32_4* %98 = OpAccessChain %20 %50 %22 
                                       f32_4 %99 = OpLoad %98 
                                      f32_4 %100 = OpLoad %68 
                                      f32_4 %101 = OpVectorShuffle %100 %100 2 2 2 2 
                                      f32_4 %102 = OpFMul %99 %101 
                                      f32_4 %103 = OpLoad %44 
                                      f32_4 %104 = OpFAdd %102 %103 
                                                     OpStore %44 %104 
                             Uniform f32_4* %105 = OpAccessChain %20 %50 %70 
                                      f32_4 %106 = OpLoad %105 
                                      f32_4 %107 = OpLoad %68 
                                      f32_4 %108 = OpVectorShuffle %107 %107 3 3 3 3 
                                      f32_4 %109 = OpFMul %106 %108 
                                      f32_4 %110 = OpLoad %44 
                                      f32_4 %111 = OpFAdd %109 %110 
                                                     OpStore %44 %111 
                                      f32_4 %117 = OpLoad %44 
                              Output f32_4* %119 = OpAccessChain %116 %49 
                                                     OpStore %119 %117 
                                      f32_4 %120 = OpLoad %44 
                                      f32_4 %123 = OpFAdd %120 %122 
                                                     OpStore %44 %123 
                                      f32_4 %124 = OpLoad %44 
                                      f32_4 %127 = OpFMul %124 %126 
                                                     OpStore %44 %127 
                                      f32_4 %129 = OpLoad %44 
                                      f32_4 %132 = OpFMul %129 %131 
                                      f32_4 %135 = OpFAdd %132 %134 
                                                     OpStore %128 %135 
                                Output f32* %137 = OpAccessChain %116 %49 %112 
                                        f32 %138 = OpLoad %137 
                                        f32 %139 = OpFNegate %138 
                                Output f32* %140 = OpAccessChain %116 %49 %112 
                                                     OpStore %140 %139 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 749
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %87 %258 %296 %746 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpMemberDecorate %15 14 Offset 15 
                                                      OpMemberDecorate %15 15 Offset 15 
                                                      OpMemberDecorate %15 16 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %87 Location 87 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %258 Location 258 
                                                      OpDecorate %296 Location 296 
                                                      OpDecorate %746 RelaxedPrecision 
                                                      OpDecorate %746 Location 746 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_2* %12 = OpVariable Input 
                                              %15 = OpTypeStruct %7 %7 %7 %6 %6 %6 %6 %6 %6 %6 %7 %6 %6 %6 %6 %6 %6 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 1 
                                              %20 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %34 %35 
                                              %38 = OpTypeInt 32 0 
                                          u32 %39 = OpConstant 2 
                                              %40 = OpTypePointer Private %6 
                                          u32 %45 = OpConstant 0 
                                          f32 %54 = OpConstant 3.67402E-40 
                                        f32_2 %55 = OpConstantComposite %54 %54 
                                          u32 %62 = OpConstant 1 
                                              %68 = OpTypePointer Private %10 
                               Private f32_2* %69 = OpVariable Private 
                                 Input f32_2* %87 = OpVariable Input 
                                          i32 %98 = OpConstant 15 
                                              %99 = OpTypePointer Uniform %6 
                                         f32 %111 = OpConstant 3.67402E-40 
                                         f32 %112 = OpConstant 3.67402E-40 
                                Private f32* %115 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                       f32_2 %136 = OpConstantComposite %135 %135 
                                         f32 %143 = OpConstant 3.67402E-40 
                                         f32 %144 = OpConstant 3.67402E-40 
                                       f32_2 %145 = OpConstantComposite %143 %144 
                                         i32 %148 = OpConstant 0 
                                         i32 %151 = OpConstant 12 
                              Private f32_4* %159 = OpVariable Private 
                              Private f32_4* %164 = OpVariable Private 
                                         f32 %174 = OpConstant 3.67402E-40 
                                       f32_2 %175 = OpConstantComposite %174 %174 
                                         i32 %184 = OpConstant 11 
                              Private f32_4* %206 = OpVariable Private 
                                             %207 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %208 = OpTypeSampledImage %207 
                                             %209 = OpTypePointer UniformConstant %208 
 UniformConstant read_only Texture2DSampled* %210 = OpVariable UniformConstant 
                                         u32 %214 = OpConstant 3 
                                         i32 %217 = OpConstant 2 
                                         f32 %221 = OpConstant 3.67402E-40 
                                             %228 = OpTypeBool 
                                             %229 = OpTypePointer Private %228 
                               Private bool* %230 = OpVariable Private 
                                         i32 %236 = OpConstant -1 
                                         i32 %242 = OpConstant 13 
                                             %256 = OpTypeVector %6 3 
                                             %257 = OpTypePointer Input %256 
                                Input f32_3* %258 = OpVariable Input 
                                             %259 = OpTypePointer Input %6 
                                         i32 %262 = OpConstant 16 
                                Private f32* %274 = OpVariable Private 
                                         f32 %279 = OpConstant 3.67402E-40 
                                             %295 = OpTypePointer Input %7 
                                Input f32_4* %296 = OpVariable Input 
                                         i32 %303 = OpConstant 5 
                                         i32 %314 = OpConstant 4 
                               Private bool* %319 = OpVariable Private 
                                             %323 = OpTypePointer Function %6 
                                         f32 %328 = OpConstant 3.67402E-40 
                                         i32 %343 = OpConstant 8 
                                         f32 %350 = OpConstant 3.67402E-40 
                                         i32 %361 = OpConstant 7 
                                         i32 %376 = OpConstant 6 
                              Private f32_4* %384 = OpVariable Private 
                              Private f32_4* %392 = OpVariable Private 
                                         f32 %421 = OpConstant 3.67402E-40 
                                         f32 %476 = OpConstant 3.67402E-40 
                                         f32 %478 = OpConstant 3.67402E-40 
                                             %480 = OpTypePointer Private %256 
                              Private f32_3* %481 = OpVariable Private 
                                         f32 %500 = OpConstant 3.67402E-40 
                                       f32_3 %501 = OpConstantComposite %112 %421 %500 
                                       f32_3 %506 = OpConstantComposite %476 %476 %476 
                                         f32 %508 = OpConstant 3.67402E-40 
                                       f32_3 %509 = OpConstantComposite %508 %508 %508 
                                       f32_3 %513 = OpConstantComposite %328 %328 %328 
                                         i32 %526 = OpConstant 3 
                                       f32_3 %540 = OpConstantComposite %112 %112 %112 
                                         i32 %549 = OpConstant 10 
                                         f32 %563 = OpConstant 3.67402E-40 
                                         f32 %575 = OpConstant 3.67402E-40 
                                         f32 %577 = OpConstant 3.67402E-40 
                                         f32 %592 = OpConstant 3.67402E-40 
                                         f32 %598 = OpConstant 3.67402E-40 
                               Private bool* %631 = OpVariable Private 
                                         f32 %632 = OpConstant 3.67402E-40 
                              Private f32_2* %636 = OpVariable Private 
                                         f32 %651 = OpConstant 3.67402E-40 
                                         i32 %657 = OpConstant 9 
                                         i32 %722 = OpConstant 14 
                               Private bool* %728 = OpVariable Private 
                                             %732 = OpTypePointer Function %7 
                                             %745 = OpTypePointer Output %7 
                               Output f32_4* %746 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %324 = OpVariable Function 
                               Function f32* %413 = OpVariable Function 
                               Function f32* %436 = OpVariable Function 
                               Function f32* %684 = OpVariable Function 
                             Function f32_4* %733 = OpVariable Function 
                                        f32_2 %13 = OpLoad %12 
                                        f32_2 %14 = OpVectorShuffle %13 %13 1 0 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 1 0 
                                        f32_2 %24 = OpFDiv %14 %23 
                                        f32_4 %25 = OpLoad %9 
                                        f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                                      OpStore %9 %26 
                                        f32_4 %27 = OpLoad %9 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpExtInst %1 8 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 1 0 
                                          f32 %37 = OpDot %33 %36 
                                 Private f32* %41 = OpAccessChain %9 %39 
                                                      OpStore %41 %37 
                                        f32_4 %42 = OpLoad %9 
                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                          f32 %44 = OpDot %43 %36 
                                 Private f32* %46 = OpAccessChain %9 %45 
                                                      OpStore %46 %44 
                                        f32_4 %47 = OpLoad %9 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 2 
                                        f32_2 %49 = OpExtInst %1 13 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 1 5 3 
                                                      OpStore %9 %51 
                                        f32_4 %52 = OpLoad %9 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 2 
                                        f32_2 %56 = OpFMul %53 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %56 4 1 5 3 
                                                      OpStore %9 %58 
                                 Private f32* %59 = OpAccessChain %9 %45 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpExtInst %1 10 %60 
                                 Private f32* %63 = OpAccessChain %9 %62 
                                                      OpStore %63 %61 
                                 Private f32* %64 = OpAccessChain %9 %39 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpExtInst %1 10 %65 
                                 Private f32* %67 = OpAccessChain %9 %45 
                                                      OpStore %67 %66 
                                        f32_4 %70 = OpLoad %9 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                        f32_4 %72 = OpLoad %9 
                                        f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                                          f32 %74 = OpDot %71 %73 
                                 Private f32* %75 = OpAccessChain %69 %45 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %69 %45 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpExtInst %1 32 %77 
                                 Private f32* %79 = OpAccessChain %69 %45 
                                                      OpStore %79 %78 
                                        f32_2 %80 = OpLoad %69 
                                        f32_2 %81 = OpVectorShuffle %80 %80 0 0 
                                        f32_4 %82 = OpLoad %9 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_2 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %9 
                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 2 3 
                                                      OpStore %9 %86 
                                        f32_2 %88 = OpLoad %87 
                                        f32_2 %89 = OpLoad %87 
                                          f32 %90 = OpDot %88 %89 
                                 Private f32* %91 = OpAccessChain %69 %45 
                                                      OpStore %91 %90 
                                 Private f32* %92 = OpAccessChain %69 %45 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpExtInst %1 31 %93 
                                 Private f32* %95 = OpAccessChain %69 %45 
                                                      OpStore %95 %94 
                                 Private f32* %96 = OpAccessChain %69 %45 
                                          f32 %97 = OpLoad %96 
                                Uniform f32* %100 = OpAccessChain %17 %98 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFNegate %101 
                                         f32 %103 = OpFAdd %97 %102 
                                Private f32* %104 = OpAccessChain %69 %45 
                                                      OpStore %104 %103 
                                Private f32* %105 = OpAccessChain %69 %45 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpFNegate %106 
                                Private f32* %108 = OpAccessChain %69 %45 
                                                      OpStore %108 %107 
                                Private f32* %109 = OpAccessChain %69 %45 
                                         f32 %110 = OpLoad %109 
                                         f32 %113 = OpExtInst %1 43 %110 %111 %112 
                                Private f32* %114 = OpAccessChain %69 %45 
                                                      OpStore %114 %113 
                                Private f32* %116 = OpAccessChain %69 %45 
                                         f32 %117 = OpLoad %116 
                                Private f32* %118 = OpAccessChain %69 %45 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFMul %117 %119 
                                                      OpStore %115 %120 
                                         f32 %121 = OpLoad %115 
                                Private f32* %122 = OpAccessChain %69 %45 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Private f32* %125 = OpAccessChain %69 %45 
                                                      OpStore %125 %124 
                                       f32_2 %126 = OpLoad %69 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 0 
                                       f32_4 %128 = OpLoad %9 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                                       f32_2 %137 = OpFMul %134 %136 
                                       f32_2 %138 = OpLoad %12 
                                       f32_2 %139 = OpFAdd %137 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 2 3 
                                                      OpStore %9 %141 
                                       f32_2 %142 = OpLoad %12 
                                         f32 %146 = OpDot %142 %145 
                                Private f32* %147 = OpAccessChain %69 %45 
                                                      OpStore %147 %146 
                                Uniform f32* %149 = OpAccessChain %17 %148 %39 
                                         f32 %150 = OpLoad %149 
                                Uniform f32* %152 = OpAccessChain %17 %151 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpFMul %150 %153 
                                Private f32* %155 = OpAccessChain %69 %45 
                                         f32 %156 = OpLoad %155 
                                         f32 %157 = OpFAdd %154 %156 
                                Private f32* %158 = OpAccessChain %69 %45 
                                                      OpStore %158 %157 
                                Private f32* %160 = OpAccessChain %69 %45 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 13 %161 
                                Private f32* %163 = OpAccessChain %159 %45 
                                                      OpStore %163 %162 
                                Private f32* %165 = OpAccessChain %69 %45 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpExtInst %1 14 %166 
                                Private f32* %168 = OpAccessChain %164 %45 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %159 %45 
                                         f32 %170 = OpLoad %169 
                                Private f32* %171 = OpAccessChain %164 %62 
                                                      OpStore %171 %170 
                                       f32_4 %172 = OpLoad %164 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 1 
                                       f32_2 %176 = OpFMul %173 %175 
                                       f32_2 %177 = OpLoad %12 
                                       f32_2 %178 = OpFAdd %176 %177 
                                                      OpStore %69 %178 
                                       f32_4 %179 = OpLoad %9 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                       f32_2 %181 = OpFNegate %180 
                                       f32_2 %182 = OpLoad %69 
                                       f32_2 %183 = OpFAdd %181 %182 
                                                      OpStore %69 %183 
                                Uniform f32* %185 = OpAccessChain %17 %184 
                                         f32 %186 = OpLoad %185 
                                       f32_2 %187 = OpCompositeConstruct %186 %186 
                                       f32_2 %188 = OpLoad %69 
                                       f32_2 %189 = OpFMul %187 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %192 = OpFAdd %189 %191 
                                                      OpStore %69 %192 
                                       f32_4 %193 = OpLoad %9 
                                       f32_2 %194 = OpVectorShuffle %193 %193 0 1 
                              Uniform f32_4* %195 = OpAccessChain %17 %19 
                                       f32_4 %196 = OpLoad %195 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_2 %198 = OpFDiv %194 %197 
                                       f32_4 %199 = OpLoad %9 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 2 3 
                                                      OpStore %9 %200 
                                       f32_4 %201 = OpLoad %9 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_2 %203 = OpExtInst %1 8 %202 
                                       f32_4 %204 = OpLoad %9 
                                       f32_4 %205 = OpVectorShuffle %204 %203 4 5 2 3 
                                                      OpStore %9 %205 
                  read_only Texture2DSampled %211 = OpLoad %210 
                                       f32_2 %212 = OpLoad %69 
                                       f32_4 %213 = OpImageSampleImplicitLod %211 %212 
                                                      OpStore %206 %213 
                                Private f32* %215 = OpAccessChain %206 %214 
                                         f32 %216 = OpLoad %215 
                                Uniform f32* %218 = OpAccessChain %17 %217 %214 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFMul %216 %219 
                                         f32 %222 = OpFAdd %220 %221 
                                Private f32* %223 = OpAccessChain %69 %45 
                                                      OpStore %223 %222 
                                       f32_4 %224 = OpLoad %206 
                              Uniform f32_4* %225 = OpAccessChain %17 %217 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpFMul %224 %226 
                                                      OpStore %159 %227 
                                Private f32* %231 = OpAccessChain %69 %45 
                                         f32 %232 = OpLoad %231 
                                        bool %233 = OpFOrdLessThan %232 %111 
                                                      OpStore %230 %233 
                                        bool %234 = OpLoad %230 
                                         i32 %235 = OpSelect %234 %19 %148 
                                         i32 %237 = OpIMul %235 %236 
                                        bool %238 = OpINotEqual %237 %148 
                                                      OpSelectionMerge %240 None 
                                                      OpBranchConditional %238 %239 %240 
                                             %239 = OpLabel 
                                                      OpKill
                                             %240 = OpLabel 
                                Uniform f32* %243 = OpAccessChain %17 %242 
                                         f32 %244 = OpLoad %243 
                                Private f32* %245 = OpAccessChain %69 %45 
                                                      OpStore %245 %244 
                                Private f32* %246 = OpAccessChain %69 %45 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpExtInst %1 43 %247 %111 %112 
                                Private f32* %249 = OpAccessChain %69 %45 
                                                      OpStore %249 %248 
                                Private f32* %250 = OpAccessChain %69 %45 
                                         f32 %251 = OpLoad %250 
                                Private f32* %252 = OpAccessChain %159 %214 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %251 %253 
                                Private f32* %255 = OpAccessChain %69 %45 
                                                      OpStore %255 %254 
                                  Input f32* %260 = OpAccessChain %258 %62 
                                         f32 %261 = OpLoad %260 
                                Uniform f32* %263 = OpAccessChain %17 %262 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFNegate %264 
                                         f32 %266 = OpFAdd %261 %265 
                                                      OpStore %115 %266 
                                         f32 %267 = OpLoad %115 
                                         f32 %268 = OpFNegate %267 
                                                      OpStore %115 %268 
                                         f32 %269 = OpLoad %115 
                                         f32 %270 = OpExtInst %1 43 %269 %111 %112 
                                                      OpStore %115 %270 
                                         f32 %271 = OpLoad %115 
                                         f32 %272 = OpFNegate %271 
                                         f32 %273 = OpFAdd %272 %112 
                                                      OpStore %115 %273 
                                Private f32* %275 = OpAccessChain %69 %45 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpLoad %115 
                                         f32 %278 = OpFMul %276 %277 
                                         f32 %280 = OpFAdd %278 %279 
                                                      OpStore %274 %280 
                                         f32 %281 = OpLoad %115 
                                Private f32* %282 = OpAccessChain %69 %45 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFMul %281 %283 
                                Private f32* %285 = OpAccessChain %164 %214 
                                                      OpStore %285 %284 
                                         f32 %286 = OpLoad %274 
                                        bool %287 = OpFOrdLessThan %286 %111 
                                                      OpStore %230 %287 
                                        bool %288 = OpLoad %230 
                                         i32 %289 = OpSelect %288 %19 %148 
                                         i32 %290 = OpIMul %289 %236 
                                        bool %291 = OpINotEqual %290 %148 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %291 %292 %293 
                                             %292 = OpLabel 
                                                      OpKill
                                             %293 = OpLabel 
                                  Input f32* %297 = OpAccessChain %296 %62 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpExtInst %1 30 %298 
                                Private f32* %300 = OpAccessChain %69 %45 
                                                      OpStore %300 %299 
                                Private f32* %301 = OpAccessChain %69 %45 
                                         f32 %302 = OpLoad %301 
                                Uniform f32* %304 = OpAccessChain %17 %303 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFMul %302 %305 
                                Private f32* %307 = OpAccessChain %69 %45 
                                                      OpStore %307 %306 
                                Private f32* %308 = OpAccessChain %69 %45 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpExtInst %1 29 %309 
                                Private f32* %311 = OpAccessChain %69 %45 
                                                      OpStore %311 %310 
                                Private f32* %312 = OpAccessChain %69 %45 
                                         f32 %313 = OpLoad %312 
                                Uniform f32* %315 = OpAccessChain %17 %314 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFAdd %313 %316 
                                Private f32* %318 = OpAccessChain %69 %45 
                                                      OpStore %318 %317 
                                Private f32* %320 = OpAccessChain %69 %45 
                                         f32 %321 = OpLoad %320 
                                        bool %322 = OpFOrdLessThan %321 %111 
                                                      OpStore %319 %322 
                                        bool %325 = OpLoad %319 
                                                      OpSelectionMerge %327 None 
                                                      OpBranchConditional %325 %326 %329 
                                             %326 = OpLabel 
                                                      OpStore %324 %328 
                                                      OpBranch %327 
                                             %329 = OpLabel 
                                Private f32* %330 = OpAccessChain %69 %45 
                                         f32 %331 = OpLoad %330 
                                                      OpStore %324 %331 
                                                      OpBranch %327 
                                             %327 = OpLabel 
                                         f32 %332 = OpLoad %324 
                                Private f32* %333 = OpAccessChain %69 %45 
                                                      OpStore %333 %332 
                                       f32_2 %334 = OpLoad %69 
                                       f32_3 %335 = OpVectorShuffle %334 %334 0 0 0 
                                       f32_4 %336 = OpLoad %159 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                                       f32_3 %338 = OpFMul %335 %337 
                                       f32_4 %339 = OpLoad %159 
                                       f32_4 %340 = OpVectorShuffle %339 %338 4 5 6 3 
                                                      OpStore %159 %340 
                                  Input f32* %341 = OpAccessChain %296 %45 
                                         f32 %342 = OpLoad %341 
                                Uniform f32* %344 = OpAccessChain %17 %343 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFMul %342 %345 
                                Private f32* %347 = OpAccessChain %69 %45 
                                                      OpStore %347 %346 
                                Private f32* %348 = OpAccessChain %69 %45 
                                         f32 %349 = OpLoad %348 
                                         f32 %351 = OpFMul %349 %350 
                                Private f32* %352 = OpAccessChain %69 %45 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %69 %45 
                                         f32 %354 = OpLoad %353 
                                         f32 %355 = OpExtInst %1 13 %354 
                                Private f32* %356 = OpAccessChain %69 %45 
                                                      OpStore %356 %355 
                                Private f32* %357 = OpAccessChain %69 %45 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFAdd %358 %112 
                                Private f32* %360 = OpAccessChain %69 %45 
                                                      OpStore %360 %359 
                                Uniform f32* %362 = OpAccessChain %17 %361 
                                         f32 %363 = OpLoad %362 
                                Uniform f32* %364 = OpAccessChain %17 %361 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFAdd %363 %365 
                                                      OpStore %115 %366 
                                Private f32* %367 = OpAccessChain %69 %45 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpLoad %115 
                                         f32 %370 = OpFDiv %368 %369 
                                Private f32* %371 = OpAccessChain %69 %45 
                                                      OpStore %371 %370 
                                Private f32* %372 = OpAccessChain %69 %45 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFAdd %373 %328 
                                Private f32* %375 = OpAccessChain %69 %45 
                                                      OpStore %375 %374 
                                Uniform f32* %377 = OpAccessChain %17 %376 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %69 %45 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFMul %378 %380 
                                         f32 %382 = OpFAdd %381 %112 
                                Private f32* %383 = OpAccessChain %69 %45 
                                                      OpStore %383 %382 
                                       f32_2 %385 = OpLoad %69 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 0 0 
                                       f32_4 %387 = OpLoad %159 
                                       f32_3 %388 = OpVectorShuffle %387 %387 1 2 0 
                                       f32_3 %389 = OpFMul %386 %388 
                                       f32_4 %390 = OpLoad %384 
                                       f32_4 %391 = OpVectorShuffle %390 %389 4 5 2 6 
                                                      OpStore %384 %391 
                                       f32_4 %393 = OpLoad %384 
                                       f32_2 %394 = OpVectorShuffle %393 %393 1 0 
                                       f32_4 %395 = OpLoad %392 
                                       f32_4 %396 = OpVectorShuffle %395 %394 4 5 2 3 
                                                      OpStore %392 %396 
                                       f32_4 %397 = OpLoad %159 
                                       f32_2 %398 = OpVectorShuffle %397 %397 1 2 
                                       f32_2 %399 = OpLoad %69 
                                       f32_2 %400 = OpVectorShuffle %399 %399 0 0 
                                       f32_2 %401 = OpFMul %398 %400 
                                       f32_4 %402 = OpLoad %392 
                                       f32_2 %403 = OpVectorShuffle %402 %402 0 1 
                                       f32_2 %404 = OpFNegate %403 
                                       f32_2 %405 = OpFAdd %401 %404 
                                       f32_4 %406 = OpLoad %159 
                                       f32_4 %407 = OpVectorShuffle %406 %405 4 5 2 3 
                                                      OpStore %159 %407 
                                Private f32* %408 = OpAccessChain %392 %62 
                                         f32 %409 = OpLoad %408 
                                Private f32* %410 = OpAccessChain %384 %62 
                                         f32 %411 = OpLoad %410 
                                        bool %412 = OpFOrdGreaterThanEqual %409 %411 
                                                      OpStore %230 %412 
                                        bool %414 = OpLoad %230 
                                                      OpSelectionMerge %416 None 
                                                      OpBranchConditional %414 %415 %417 
                                             %415 = OpLabel 
                                                      OpStore %413 %112 
                                                      OpBranch %416 
                                             %417 = OpLabel 
                                                      OpStore %413 %111 
                                                      OpBranch %416 
                                             %416 = OpLabel 
                                         f32 %418 = OpLoad %413 
                                Private f32* %419 = OpAccessChain %69 %45 
                                                      OpStore %419 %418 
                                Private f32* %420 = OpAccessChain %392 %39 
                                                      OpStore %420 %328 
                                Private f32* %422 = OpAccessChain %392 %214 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %159 %39 
                                                      OpStore %423 %112 
                                Private f32* %424 = OpAccessChain %159 %214 
                                                      OpStore %424 %328 
                                       f32_2 %425 = OpLoad %69 
                                       f32_4 %426 = OpVectorShuffle %425 %425 0 0 0 0 
                                       f32_4 %427 = OpLoad %159 
                                       f32_4 %428 = OpFMul %426 %427 
                                       f32_4 %429 = OpLoad %392 
                                       f32_4 %430 = OpFAdd %428 %429 
                                                      OpStore %159 %430 
                                Private f32* %431 = OpAccessChain %384 %214 
                                         f32 %432 = OpLoad %431 
                                Private f32* %433 = OpAccessChain %159 %45 
                                         f32 %434 = OpLoad %433 
                                        bool %435 = OpFOrdGreaterThanEqual %432 %434 
                                                      OpStore %230 %435 
                                        bool %437 = OpLoad %230 
                                                      OpSelectionMerge %439 None 
                                                      OpBranchConditional %437 %438 %440 
                                             %438 = OpLabel 
                                                      OpStore %436 %112 
                                                      OpBranch %439 
                                             %440 = OpLabel 
                                                      OpStore %436 %111 
                                                      OpBranch %439 
                                             %439 = OpLabel 
                                         f32 %441 = OpLoad %436 
                                Private f32* %442 = OpAccessChain %69 %45 
                                                      OpStore %442 %441 
                                       f32_4 %443 = OpLoad %159 
                                       f32_3 %444 = OpVectorShuffle %443 %443 0 1 3 
                                       f32_4 %445 = OpLoad %384 
                                       f32_4 %446 = OpVectorShuffle %445 %444 4 5 6 3 
                                                      OpStore %384 %446 
                                       f32_4 %447 = OpLoad %384 
                                       f32_3 %448 = OpVectorShuffle %447 %447 3 1 0 
                                       f32_4 %449 = OpLoad %159 
                                       f32_4 %450 = OpVectorShuffle %449 %448 4 5 2 6 
                                                      OpStore %159 %450 
                                       f32_4 %451 = OpLoad %384 
                                       f32_4 %452 = OpFNegate %451 
                                       f32_4 %453 = OpLoad %159 
                                       f32_4 %454 = OpFAdd %452 %453 
                                                      OpStore %159 %454 
                                       f32_2 %455 = OpLoad %69 
                                       f32_4 %456 = OpVectorShuffle %455 %455 0 0 0 0 
                                       f32_4 %457 = OpLoad %159 
                                       f32_4 %458 = OpFMul %456 %457 
                                       f32_4 %459 = OpLoad %384 
                                       f32_4 %460 = OpFAdd %458 %459 
                                                      OpStore %159 %460 
                                Private f32* %461 = OpAccessChain %159 %62 
                                         f32 %462 = OpLoad %461 
                                Private f32* %463 = OpAccessChain %159 %214 
                                         f32 %464 = OpLoad %463 
                                         f32 %465 = OpExtInst %1 37 %462 %464 
                                Private f32* %466 = OpAccessChain %69 %45 
                                                      OpStore %466 %465 
                                Private f32* %467 = OpAccessChain %69 %45 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFNegate %468 
                                Private f32* %470 = OpAccessChain %159 %45 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpFAdd %469 %471 
                                Private f32* %473 = OpAccessChain %69 %45 
                                                      OpStore %473 %472 
                                Private f32* %474 = OpAccessChain %69 %45 
                                         f32 %475 = OpLoad %474 
                                         f32 %477 = OpFMul %475 %476 
                                         f32 %479 = OpFAdd %477 %478 
                                                      OpStore %115 %479 
                                Private f32* %482 = OpAccessChain %159 %62 
                                         f32 %483 = OpLoad %482 
                                         f32 %484 = OpFNegate %483 
                                Private f32* %485 = OpAccessChain %159 %214 
                                         f32 %486 = OpLoad %485 
                                         f32 %487 = OpFAdd %484 %486 
                                Private f32* %488 = OpAccessChain %481 %45 
                                                      OpStore %488 %487 
                                Private f32* %489 = OpAccessChain %481 %45 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpLoad %115 
                                         f32 %492 = OpFDiv %490 %491 
                                                      OpStore %115 %492 
                                         f32 %493 = OpLoad %115 
                                Private f32* %494 = OpAccessChain %159 %39 
                                         f32 %495 = OpLoad %494 
                                         f32 %496 = OpFAdd %493 %495 
                                                      OpStore %115 %496 
                                         f32 %497 = OpLoad %115 
                                       f32_3 %498 = OpCompositeConstruct %497 %497 %497 
                                       f32_3 %499 = OpExtInst %1 4 %498 
                                       f32_3 %502 = OpFAdd %499 %501 
                                                      OpStore %481 %502 
                                       f32_3 %503 = OpLoad %481 
                                       f32_3 %504 = OpExtInst %1 10 %503 
                                                      OpStore %481 %504 
                                       f32_3 %505 = OpLoad %481 
                                       f32_3 %507 = OpFMul %505 %506 
                                       f32_3 %510 = OpFAdd %507 %509 
                                                      OpStore %481 %510 
                                       f32_3 %511 = OpLoad %481 
                                       f32_3 %512 = OpExtInst %1 4 %511 
                                       f32_3 %514 = OpFAdd %512 %513 
                                                      OpStore %481 %514 
                                       f32_3 %515 = OpLoad %481 
                                       f32_3 %516 = OpCompositeConstruct %111 %111 %111 
                                       f32_3 %517 = OpCompositeConstruct %112 %112 %112 
                                       f32_3 %518 = OpExtInst %1 43 %515 %516 %517 
                                                      OpStore %481 %518 
                                       f32_3 %519 = OpLoad %481 
                                       f32_3 %520 = OpFAdd %519 %513 
                                                      OpStore %481 %520 
                                Private f32* %521 = OpAccessChain %159 %45 
                                         f32 %522 = OpLoad %521 
                                         f32 %523 = OpFAdd %522 %478 
                                                      OpStore %115 %523 
                                Private f32* %524 = OpAccessChain %159 %45 
                                         f32 %525 = OpLoad %524 
                                Uniform f32* %527 = OpAccessChain %17 %526 
                                         f32 %528 = OpLoad %527 
                                         f32 %529 = OpFDiv %525 %528 
                                Private f32* %530 = OpAccessChain %159 %45 
                                                      OpStore %530 %529 
                                Private f32* %531 = OpAccessChain %69 %45 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpLoad %115 
                                         f32 %534 = OpFDiv %532 %533 
                                Private f32* %535 = OpAccessChain %69 %45 
                                                      OpStore %535 %534 
                                       f32_2 %536 = OpLoad %69 
                                       f32_3 %537 = OpVectorShuffle %536 %536 0 0 0 
                                       f32_3 %538 = OpLoad %481 
                                       f32_3 %539 = OpFMul %537 %538 
                                       f32_3 %541 = OpFAdd %539 %540 
                                                      OpStore %481 %541 
                                       f32_4 %542 = OpLoad %9 
                                       f32_2 %543 = OpVectorShuffle %542 %542 0 1 
                              Uniform f32_4* %544 = OpAccessChain %17 %19 
                                       f32_4 %545 = OpLoad %544 
                                       f32_2 %546 = OpVectorShuffle %545 %545 0 1 
                                       f32_2 %547 = OpFMul %543 %546 
                                                      OpStore %69 %547 
                                       f32_2 %548 = OpLoad %69 
                              Uniform f32_4* %550 = OpAccessChain %17 %549 
                                       f32_4 %551 = OpLoad %550 
                                       f32_2 %552 = OpVectorShuffle %551 %551 0 1 
                                         f32 %553 = OpDot %548 %552 
                                Private f32* %554 = OpAccessChain %384 %45 
                                                      OpStore %554 %553 
                                       f32_2 %555 = OpLoad %69 
                              Uniform f32_4* %556 = OpAccessChain %17 %549 
                                       f32_4 %557 = OpLoad %556 
                                       f32_2 %558 = OpVectorShuffle %557 %557 2 3 
                                         f32 %559 = OpDot %555 %558 
                                Private f32* %560 = OpAccessChain %69 %45 
                                                      OpStore %560 %559 
                                Uniform f32* %561 = OpAccessChain %17 %148 %62 
                                         f32 %562 = OpLoad %561 
                                         f32 %564 = OpFMul %562 %563 
                                Private f32* %565 = OpAccessChain %69 %45 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpFAdd %564 %566 
                                Private f32* %568 = OpAccessChain %69 %45 
                                                      OpStore %568 %567 
                                Private f32* %569 = OpAccessChain %69 %45 
                                         f32 %570 = OpLoad %569 
                                         f32 %571 = OpExtInst %1 13 %570 
                                Private f32* %572 = OpAccessChain %69 %45 
                                                      OpStore %572 %571 
                                Private f32* %573 = OpAccessChain %69 %45 
                                         f32 %574 = OpLoad %573 
                                         f32 %576 = OpFMul %574 %575 
                                         f32 %578 = OpFAdd %576 %577 
                                Private f32* %579 = OpAccessChain %69 %45 
                                                      OpStore %579 %578 
                                Uniform f32* %580 = OpAccessChain %17 %148 %62 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpFNegate %581 
                                         f32 %583 = OpFMul %582 %563 
                                Private f32* %584 = OpAccessChain %384 %45 
                                         f32 %585 = OpLoad %584 
                                         f32 %586 = OpFAdd %583 %585 
                                                      OpStore %115 %586 
                                         f32 %587 = OpLoad %115 
                                         f32 %588 = OpExtInst %1 13 %587 
                                                      OpStore %115 %588 
                                         f32 %589 = OpLoad %115 
                                         f32 %590 = OpFAdd %589 %112 
                                                      OpStore %115 %590 
                                         f32 %591 = OpLoad %115 
                                         f32 %593 = OpFMul %591 %592 
                                                      OpStore %115 %593 
                                         f32 %594 = OpLoad %115 
                                Private f32* %595 = OpAccessChain %69 %45 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFMul %594 %596 
                                         f32 %599 = OpFAdd %597 %598 
                                Private f32* %600 = OpAccessChain %69 %45 
                                                      OpStore %600 %599 
                                Private f32* %601 = OpAccessChain %69 %45 
                                         f32 %602 = OpLoad %601 
                                         f32 %603 = OpFNegate %602 
                                Private f32* %604 = OpAccessChain %159 %45 
                                         f32 %605 = OpLoad %604 
                                         f32 %606 = OpFAdd %603 %605 
                                                      OpStore %115 %606 
                                Private f32* %607 = OpAccessChain %69 %45 
                                         f32 %608 = OpLoad %607 
                                Private f32* %609 = OpAccessChain %159 %45 
                                         f32 %610 = OpLoad %609 
                                         f32 %611 = OpFAdd %608 %610 
                                Private f32* %612 = OpAccessChain %69 %45 
                                                      OpStore %612 %611 
                                       f32_4 %613 = OpLoad %9 
                                       f32_2 %614 = OpVectorShuffle %613 %613 0 1 
                                         f32 %615 = OpDot %614 %36 
                                Private f32* %616 = OpAccessChain %159 %45 
                                                      OpStore %616 %615 
                                Private f32* %617 = OpAccessChain %9 %62 
                                         f32 %618 = OpLoad %617 
                                Private f32* %619 = OpAccessChain %9 %45 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFAdd %618 %620 
                                Private f32* %622 = OpAccessChain %9 %45 
                                                      OpStore %622 %621 
                                Private f32* %623 = OpAccessChain %9 %45 
                                         f32 %624 = OpLoad %623 
                                         f32 %625 = OpFMul %624 %592 
                                Private f32* %626 = OpAccessChain %9 %45 
                                                      OpStore %626 %625 
                                Private f32* %627 = OpAccessChain %9 %45 
                                         f32 %628 = OpLoad %627 
                                         f32 %629 = OpExtInst %1 10 %628 
                                Private f32* %630 = OpAccessChain %9 %45 
                                                      OpStore %630 %629 
                                Private f32* %633 = OpAccessChain %9 %45 
                                         f32 %634 = OpLoad %633 
                                        bool %635 = OpFOrdLessThan %632 %634 
                                                      OpStore %631 %635 
                                Private f32* %637 = OpAccessChain %159 %45 
                                         f32 %638 = OpLoad %637 
                                         f32 %639 = OpExtInst %1 13 %638 
                                Private f32* %640 = OpAccessChain %636 %45 
                                                      OpStore %640 %639 
                                Private f32* %641 = OpAccessChain %636 %45 
                                         f32 %642 = OpLoad %641 
                                         f32 %643 = OpFMul %642 %54 
                                Private f32* %644 = OpAccessChain %636 %45 
                                                      OpStore %644 %643 
                                Private f32* %645 = OpAccessChain %636 %45 
                                         f32 %646 = OpLoad %645 
                                         f32 %647 = OpExtInst %1 10 %646 
                                Private f32* %648 = OpAccessChain %636 %45 
                                                      OpStore %648 %647 
                                Private f32* %649 = OpAccessChain %636 %45 
                                         f32 %650 = OpLoad %649 
                                         f32 %652 = OpFAdd %650 %651 
                                Private f32* %653 = OpAccessChain %636 %45 
                                                      OpStore %653 %652 
                                Private f32* %654 = OpAccessChain %636 %45 
                                         f32 %655 = OpLoad %654 
                                         f32 %656 = OpFNegate %655 
                                Uniform f32* %658 = OpAccessChain %17 %657 
                                         f32 %659 = OpLoad %658 
                                         f32 %660 = OpFMul %656 %659 
                                         f32 %661 = OpLoad %115 
                                         f32 %662 = OpFAdd %660 %661 
                                                      OpStore %115 %662 
                                Private f32* %663 = OpAccessChain %636 %45 
                                         f32 %664 = OpLoad %663 
                                Uniform f32* %665 = OpAccessChain %17 %657 
                                         f32 %666 = OpLoad %665 
                                         f32 %667 = OpFMul %664 %666 
                                Private f32* %668 = OpAccessChain %69 %45 
                                         f32 %669 = OpLoad %668 
                                         f32 %670 = OpFAdd %667 %669 
                                Private f32* %671 = OpAccessChain %636 %45 
                                                      OpStore %671 %670 
                                Private f32* %672 = OpAccessChain %636 %45 
                                         f32 %673 = OpLoad %672 
                                         f32 %674 = OpExtInst %1 2 %673 
                                Private f32* %675 = OpAccessChain %636 %45 
                                                      OpStore %675 %674 
                                         f32 %676 = OpLoad %115 
                                         f32 %677 = OpExtInst %1 9 %676 
                                Private f32* %678 = OpAccessChain %636 %62 
                                                      OpStore %678 %677 
                                       f32_2 %679 = OpLoad %636 
                                Uniform f32* %680 = OpAccessChain %17 %526 
                                         f32 %681 = OpLoad %680 
                                       f32_2 %682 = OpCompositeConstruct %681 %681 
                                       f32_2 %683 = OpFMul %679 %682 
                                                      OpStore %636 %683 
                                        bool %685 = OpLoad %631 
                                                      OpSelectionMerge %687 None 
                                                      OpBranchConditional %685 %686 %690 
                                             %686 = OpLabel 
                                Private f32* %688 = OpAccessChain %636 %62 
                                         f32 %689 = OpLoad %688 
                                                      OpStore %684 %689 
                                                      OpBranch %687 
                                             %690 = OpLabel 
                                Private f32* %691 = OpAccessChain %636 %45 
                                         f32 %692 = OpLoad %691 
                                                      OpStore %684 %692 
                                                      OpBranch %687 
                                             %687 = OpLabel 
                                         f32 %693 = OpLoad %684 
                                Private f32* %694 = OpAccessChain %9 %45 
                                                      OpStore %694 %693 
                                Private f32* %695 = OpAccessChain %9 %45 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpExtInst %1 40 %696 %111 
                                Private f32* %698 = OpAccessChain %9 %45 
                                                      OpStore %698 %697 
                                       f32_3 %699 = OpLoad %481 
                                       f32_4 %700 = OpLoad %9 
                                       f32_3 %701 = OpVectorShuffle %700 %700 0 0 0 
                                       f32_3 %702 = OpFMul %699 %701 
                                       f32_4 %703 = OpLoad %164 
                                       f32_4 %704 = OpVectorShuffle %703 %702 4 5 6 3 
                                                      OpStore %164 %704 
                                       f32_4 %705 = OpLoad %164 
                                       f32_4 %706 = OpLoad %164 
                                       f32_4 %707 = OpFMul %705 %706 
                                                      OpStore %9 %707 
                                       f32_4 %708 = OpLoad %9 
                                       f32_4 %709 = OpLoad %9 
                                       f32_4 %710 = OpFMul %708 %709 
                                                      OpStore %9 %710 
                                       f32_4 %711 = OpLoad %9 
                                       f32_4 %712 = OpLoad %164 
                                       f32_4 %713 = OpFMul %711 %712 
                                                      OpStore %9 %713 
                                Uniform f32* %714 = OpAccessChain %17 %242 
                                         f32 %715 = OpLoad %714 
                                Uniform f32* %716 = OpAccessChain %17 %242 
                                         f32 %717 = OpLoad %716 
                                         f32 %718 = OpFMul %715 %717 
                                Private f32* %719 = OpAccessChain %159 %45 
                                                      OpStore %719 %718 
                                Private f32* %720 = OpAccessChain %159 %45 
                                         f32 %721 = OpLoad %720 
                                Uniform f32* %723 = OpAccessChain %17 %722 
                                         f32 %724 = OpLoad %723 
                                         f32 %725 = OpFMul %721 %724 
                                         f32 %726 = OpFAdd %725 %112 
                                Private f32* %727 = OpAccessChain %159 %45 
                                                      OpStore %727 %726 
                                Private f32* %729 = OpAccessChain %159 %45 
                                         f32 %730 = OpLoad %729 
                                        bool %731 = OpFOrdLessThan %112 %730 
                                                      OpStore %728 %731 
                                        bool %734 = OpLoad %728 
                                                      OpSelectionMerge %736 None 
                                                      OpBranchConditional %734 %735 %738 
                                             %735 = OpLabel 
                                       f32_4 %737 = OpLoad %9 
                                                      OpStore %733 %737 
                                                      OpBranch %736 
                                             %738 = OpLabel 
                                       f32_4 %739 = OpLoad %164 
                                                      OpStore %733 %739 
                                                      OpBranch %736 
                                             %736 = OpLabel 
                                       f32_4 %740 = OpLoad %733 
                                                      OpStore %9 %740 
                                       f32_4 %741 = OpLoad %159 
                                       f32_4 %742 = OpVectorShuffle %741 %741 0 0 0 0 
                                       f32_4 %743 = OpLoad %9 
                                       f32_4 %744 = OpFMul %742 %743 
                                                      OpStore %9 %744 
                                       f32_4 %747 = OpLoad %9 
                                                      OpStore %746 %747 
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