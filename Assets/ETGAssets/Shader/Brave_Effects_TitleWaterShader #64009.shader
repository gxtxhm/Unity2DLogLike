//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/TitleWaterShader" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_NoiseTex ("Noise", 2D) = "white" { }
_OverrideColor ("Color", Color) = (1,1,1,1)
_StepValue ("Step Value", Float) = 0.1
_SkyBoost ("Sky Boost", Float) = 0.5
_SkyPower ("Sky Power", Float) = 1
_DitherCohesionFactor ("Cohesion Factor", Float) = 0.5
_SpaceVector ("Space Vector", Vector) = (50,27,150,133)
_CurvePower ("CP", Float) = 0
_CurveFreq ("Curve Freq", Float) = 1
_CurveColorFactor ("CCF", Float) = 1
_OverrideBGColor ("Override BG Color", Color) = (0,0,0,1)
_UseScrPosCutoff ("Use ScrPos Cutoff", Float) = 1
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 26275
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
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0 = u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    vs_TEXCOORD1 = u_xlat0 * vec4(1.0, -1.0, 1.0, 1.0) + vec4(0.0, 1.0, 0.0, 0.0);
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
uniform 	vec4 _OverrideBGColor;
uniform 	float _UseScrPosCutoff;
uniform  sampler2D _NoiseTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat16_13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlatb0 = 0.920000017<vs_TEXCOORD1.y;
    u_xlatb6 = 0.5<_UseScrPosCutoff;
    u_xlatb0 = u_xlatb6 && u_xlatb0;
    if(u_xlatb0){
        SV_Target0 = _OverrideBGColor;
        return;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy / _MainTex_TexelSize.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat12.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
    u_xlat1.xy = u_xlat12.xy + u_xlat12.xy;
    u_xlat13.xy = vs_TEXCOORD1.xy * vec2(480.0, 270.0);
    u_xlat13.xy = roundEven(u_xlat13.xy);
    u_xlat19 = (-u_xlat13.y) * 0.00370370364 + 1.0;
    u_xlat19 = u_xlat19 * 8.0;
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _SkyPower;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 + _SkyBoost;
    u_xlatb2 = u_xlat19<0.0;
    u_xlat19 = (u_xlatb2) ? -1.0 : u_xlat19;
    u_xlat2 = vec4(u_xlat19) * _OverrideColor;
    u_xlat13.x = u_xlat13.x * _CurveFreq;
    u_xlat13.x = u_xlat13.x * 0.00654166704;
    u_xlat13.x = sin(u_xlat13.x);
    u_xlat13.x = u_xlat13.x + 1.0;
    u_xlat19 = _CurveColorFactor + _CurveColorFactor;
    u_xlat13.x = u_xlat13.x / u_xlat19;
    u_xlat13.x = u_xlat13.x + -1.0;
    u_xlat13.x = _CurvePower * u_xlat13.x + 1.0;
    u_xlat3 = u_xlat13.xxxx * u_xlat2;
    u_xlat12.xy = u_xlat12.xy * vec2(16.0, 16.0);
    u_xlat10_4 = texture(_NoiseTex, u_xlat12.xy);
    u_xlatb12 = u_xlat3.y>=u_xlat3.z;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat3.zy;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat2.xy = u_xlat2.yz * u_xlat13.xx + (-u_xlat5.xy);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat2 = u_xlat12.xxxx * u_xlat2 + u_xlat5;
    u_xlatb12 = u_xlat3.x>=u_xlat2.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat2.xyw;
    u_xlat5.w = u_xlat3.x;
    u_xlat2.xyw = u_xlat5.wyx;
    u_xlat2 = (-u_xlat5) + u_xlat2;
    u_xlat2 = u_xlat12.xxxx * u_xlat2 + u_xlat5;
    u_xlat12.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat12.x = (-u_xlat12.x) + u_xlat2.x;
    u_xlat18 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-010;
    u_xlat18 = u_xlat18 / u_xlat13.x;
    u_xlat18 = u_xlat18 + u_xlat2.z;
    u_xlat13.x = u_xlat2.x + 1.00000001e-010;
    u_xlat12.x = u_xlat12.x / u_xlat13.x;
    u_xlat16_13 = dot(u_xlat10_4.xx, u_xlat10_4.xx);
    u_xlat13.x = (-u_xlat16_13) + u_xlat2.x;
    u_xlat19 = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat19 = sin(u_xlat19);
    u_xlat19 = u_xlat19 * 43758.5469;
    u_xlat19 = fract(u_xlat19);
    u_xlat19 = u_xlat19 + -0.5;
    u_xlat2.x = dot(u_xlat1.xy, _SpaceVector.xy);
    u_xlat2.x = u_xlat2.x + (-_Time.z);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 0.5;
    u_xlat1.x = dot(u_xlat1.xy, _SpaceVector.zw);
    u_xlat1.x = u_xlat1.x + _Time.z;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 0.099999994 + 0.150000006;
    u_xlat1.x = u_xlat2.x * u_xlat1.x + 0.349999994;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlatb0 = 0.25<u_xlat0.x;
    u_xlat6.x = u_xlat13.x / _StepValue;
    u_xlat7 = (-u_xlat1.x) + u_xlat6.x;
    u_xlat7 = (-u_xlat19) * _DitherCohesionFactor + u_xlat7;
    u_xlat7 = ceil(u_xlat7);
    u_xlat7 = u_xlat7 * _StepValue;
    u_xlat6.x = u_xlat1.x + u_xlat6.x;
    u_xlat6.x = u_xlat19 * _DitherCohesionFactor + u_xlat6.x;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _StepValue;
    u_xlat0.x = (u_xlatb0) ? u_xlat7 : u_xlat6.x;
    u_xlatb6 = 2.5<u_xlat0.x;
    u_xlat1.x = u_xlat0.x * 1.25;
    u_xlat0.x = (u_xlatb6) ? u_xlat1.x : u_xlat0.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat1.xyz = abs(vec3(u_xlat18)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat12.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.x = u_xlat0.x * 100.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + (-_OverrideBGColor.xyz);
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz + _OverrideBGColor.xyz;
    SV_Target0.w = u_xlat3.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 112
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %93 %101 
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
                                                     OpMemberDecorate %91 0 BuiltIn 91 
                                                     OpMemberDecorate %91 1 BuiltIn 91 
                                                     OpMemberDecorate %91 2 BuiltIn 91 
                                                     OpDecorate %91 Block 
                                                     OpDecorate %101 Location 101 
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
                                         i32 %58 = OpConstant 3 
                              Private f32_4* %62 = OpVariable Private 
                                         u32 %89 = OpConstant 1 
                                             %90 = OpTypeArray %6 %89 
                                             %91 = OpTypeStruct %13 %6 %90 
                                             %92 = OpTypePointer Output %91 
        Output struct {f32_4; f32; f32[1];}* %93 = OpVariable Output 
                                             %95 = OpTypePointer Output %13 
                                         f32 %98 = OpConstant 3.67402E-40 
                                       f32_4 %99 = OpConstantComposite %98 %98 %98 %98 
                              Output f32_4* %101 = OpVariable Output 
                                        f32 %103 = OpConstant 3.67402E-40 
                                      f32_4 %104 = OpConstantComposite %103 %103 %103 %103 
                                            %106 = OpTypePointer Output %6 
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
                                       f32_4 %57 = OpLoad %33 
                              Uniform f32_4* %59 = OpAccessChain %20 %38 %58 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFAdd %57 %60 
                                                     OpStore %33 %61 
                                       f32_4 %63 = OpLoad %33 
                                       f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                              Uniform f32_4* %65 = OpAccessChain %20 %39 %39 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpFMul %64 %66 
                                                     OpStore %62 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %39 %38 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %62 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %62 %74 
                              Uniform f32_4* %75 = OpAccessChain %20 %39 %22 
                                       f32_4 %76 = OpLoad %75 
                                       f32_4 %77 = OpLoad %33 
                                       f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
                                       f32_4 %79 = OpFMul %76 %78 
                                       f32_4 %80 = OpLoad %62 
                                       f32_4 %81 = OpFAdd %79 %80 
                                                     OpStore %62 %81 
                              Uniform f32_4* %82 = OpAccessChain %20 %39 %58 
                                       f32_4 %83 = OpLoad %82 
                                       f32_4 %84 = OpLoad %33 
                                       f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                       f32_4 %86 = OpFMul %83 %85 
                                       f32_4 %87 = OpLoad %62 
                                       f32_4 %88 = OpFAdd %86 %87 
                                                     OpStore %33 %88 
                                       f32_4 %94 = OpLoad %33 
                               Output f32_4* %96 = OpAccessChain %93 %38 
                                                     OpStore %96 %94 
                                       f32_4 %97 = OpLoad %33 
                                      f32_4 %100 = OpFAdd %97 %99 
                                                     OpStore %33 %100 
                                      f32_4 %102 = OpLoad %33 
                                      f32_4 %105 = OpFMul %102 %104 
                                                     OpStore %101 %105 
                                Output f32* %107 = OpAccessChain %93 %38 %89 
                                        f32 %108 = OpLoad %107 
                                        f32 %109 = OpFNegate %108 
                                Output f32* %110 = OpAccessChain %93 %38 %89 
                                                     OpStore %110 %109 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 570
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %13 %38 %49 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 Location 13 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpMemberDecorate %22 8 Offset 22 
                                                      OpMemberDecorate %22 9 Offset 22 
                                                      OpMemberDecorate %22 10 Offset 22 
                                                      OpMemberDecorate %22 11 Offset 22 
                                                      OpMemberDecorate %22 12 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %38 Location 38 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %196 DescriptorSet 196 
                                                      OpDecorate %196 Binding 196 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
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
                                          u32 %15 = OpConstant 1 
                                              %16 = OpTypePointer Input %9 
                                Private bool* %20 = OpVariable Private 
                                          f32 %21 = OpConstant 3.67402E-40 
                                              %22 = OpTypeStruct %11 %11 %11 %9 %9 %9 %9 %9 %9 %9 %11 %11 %9 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 12 
                                              %27 = OpTypePointer Uniform %9 
                                              %37 = OpTypePointer Output %11 
                                Output f32_4* %38 = OpVariable Output 
                                          i32 %39 = OpConstant 11 
                                              %40 = OpTypePointer Uniform %11 
                                              %44 = OpTypeVector %9 3 
                                              %45 = OpTypePointer Private %44 
                               Private f32_3* %46 = OpVariable Private 
                                              %47 = OpTypeVector %9 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                                        f32_2 %51 = OpConstantComposite %21 %21 
                                          i32 %57 = OpConstant 1 
                                              %69 = OpTypePointer Private %47 
                               Private f32_2* %70 = OpVariable Private 
                               Private f32_3* %77 = OpVariable Private 
                               Private f32_2* %83 = OpVariable Private 
                                          f32 %86 = OpConstant 3.67402E-40 
                                          f32 %87 = OpConstant 3.67402E-40 
                                        f32_2 %88 = OpConstantComposite %86 %87 
                                              %92 = OpTypePointer Private %9 
                                 Private f32* %93 = OpVariable Private 
                                          f32 %97 = OpConstant 3.67402E-40 
                                          f32 %99 = OpConstant 3.67402E-40 
                                         f32 %102 = OpConstant 3.67402E-40 
                                         i32 %107 = OpConstant 5 
                                         i32 %114 = OpConstant 4 
                               Private bool* %118 = OpVariable Private 
                                         f32 %120 = OpConstant 3.67402E-40 
                                             %122 = OpTypePointer Function %9 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %131 = OpTypePointer Private %11 
                              Private f32_4* %132 = OpVariable Private 
                                         i32 %135 = OpConstant 2 
                                         u32 %139 = OpConstant 0 
                                         i32 %142 = OpConstant 8 
                                         f32 %149 = OpConstant 3.67402E-40 
                                         i32 %160 = OpConstant 7 
                                         i32 %175 = OpConstant 6 
                              Private f32_4* %183 = OpVariable Private 
                                         f32 %189 = OpConstant 3.67402E-40 
                                       f32_2 %190 = OpConstantComposite %189 %189 
                                Private f32* %192 = OpVariable Private 
                                             %193 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
                                             %194 = OpTypeSampledImage %193 
                                             %195 = OpTypePointer UniformConstant %194 
 UniformConstant read_only Texture2DSampled* %196 = OpVariable UniformConstant 
                               Private bool* %201 = OpVariable Private 
                                         u32 %204 = OpConstant 2 
                                Private f32* %208 = OpVariable Private 
                              Private f32_4* %215 = OpVariable Private 
                                         f32 %221 = OpConstant 3.67402E-40 
                                         u32 %222 = OpConstant 3 
                                         f32 %293 = OpConstant 3.67402E-40 
                                         f32 %295 = OpConstant 3.67402E-40 
                                Private f32* %314 = OpVariable Private 
                                         f32 %328 = OpConstant 3.67402E-40 
                                         f32 %329 = OpConstant 3.67402E-40 
                                       f32_2 %330 = OpConstantComposite %328 %329 
                                         f32 %335 = OpConstant 3.67402E-40 
                                         f32 %340 = OpConstant 3.67402E-40 
                                         i32 %344 = OpConstant 10 
                                         i32 %352 = OpConstant 0 
                                         f32 %389 = OpConstant 3.67402E-40 
                                         f32 %391 = OpConstant 3.67402E-40 
                                         f32 %399 = OpConstant 3.67402E-40 
                                         f32 %416 = OpConstant 3.67402E-40 
                              Private f32_3* %420 = OpVariable Private 
                                         i32 %423 = OpConstant 3 
                                         i32 %437 = OpConstant 9 
                                         f32 %486 = OpConstant 3.67402E-40 
                                         f32 %492 = OpConstant 3.67402E-40 
                                         f32 %513 = OpConstant 3.67402E-40 
                                       f32_3 %514 = OpConstantComposite %99 %221 %513 
                                       f32_3 %519 = OpConstantComposite %293 %293 %293 
                                         f32 %521 = OpConstant 3.67402E-40 
                                       f32_3 %522 = OpConstantComposite %521 %521 %521 
                                       f32_3 %526 = OpConstantComposite %127 %127 %127 
                                       f32_3 %538 = OpConstantComposite %99 %99 %99 
                                         f32 %542 = OpConstant 3.67402E-40 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %123 = OpVariable Function 
                               Function f32* %209 = OpVariable Function 
                               Function f32* %248 = OpVariable Function 
                               Function f32* %475 = OpVariable Function 
                               Function f32* %495 = OpVariable Function 
                                   Input f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                         bool %19 = OpFOrdLessThan %10 %18 
                                                      OpStore %8 %19 
                                 Uniform f32* %28 = OpAccessChain %24 %26 
                                          f32 %29 = OpLoad %28 
                                         bool %30 = OpFOrdLessThan %21 %29 
                                                      OpStore %20 %30 
                                         bool %31 = OpLoad %20 
                                         bool %32 = OpLoad %8 
                                         bool %33 = OpLogicalAnd %31 %32 
                                                      OpStore %8 %33 
                                         bool %34 = OpLoad %8 
                                                      OpSelectionMerge %36 None 
                                                      OpBranchConditional %34 %35 %36 
                                              %35 = OpLabel 
                               Uniform f32_4* %41 = OpAccessChain %24 %39 
                                        f32_4 %42 = OpLoad %41 
                                                      OpStore %38 %42 
                                                      OpReturn
                                              %36 = OpLabel 
                                        f32_2 %50 = OpLoad %49 
                                        f32_2 %52 = OpFMul %50 %51 
                                        f32_3 %53 = OpLoad %46 
                                        f32_3 %54 = OpVectorShuffle %53 %52 3 4 2 
                                                      OpStore %46 %54 
                                        f32_3 %55 = OpLoad %46 
                                        f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                               Uniform f32_4* %58 = OpAccessChain %24 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_2 %61 = OpFDiv %56 %60 
                                        f32_3 %62 = OpLoad %46 
                                        f32_3 %63 = OpVectorShuffle %62 %61 3 4 2 
                                                      OpStore %46 %63 
                                        f32_3 %64 = OpLoad %46 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                        f32_2 %66 = OpExtInst %1 2 %65 
                                        f32_3 %67 = OpLoad %46 
                                        f32_3 %68 = OpVectorShuffle %67 %66 3 4 2 
                                                      OpStore %46 %68 
                                        f32_3 %71 = OpLoad %46 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                               Uniform f32_4* %73 = OpAccessChain %24 %57 
                                        f32_4 %74 = OpLoad %73 
                                        f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                                        f32_2 %76 = OpFMul %72 %75 
                                                      OpStore %70 %76 
                                        f32_2 %78 = OpLoad %70 
                                        f32_2 %79 = OpLoad %70 
                                        f32_2 %80 = OpFAdd %78 %79 
                                        f32_3 %81 = OpLoad %77 
                                        f32_3 %82 = OpVectorShuffle %81 %80 3 4 2 
                                                      OpStore %77 %82 
                                        f32_4 %84 = OpLoad %13 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_2 %89 = OpFMul %85 %88 
                                                      OpStore %83 %89 
                                        f32_2 %90 = OpLoad %83 
                                        f32_2 %91 = OpExtInst %1 2 %90 
                                                      OpStore %83 %91 
                                 Private f32* %94 = OpAccessChain %83 %15 
                                          f32 %95 = OpLoad %94 
                                          f32 %96 = OpFNegate %95 
                                          f32 %98 = OpFMul %96 %97 
                                         f32 %100 = OpFAdd %98 %99 
                                                      OpStore %93 %100 
                                         f32 %101 = OpLoad %93 
                                         f32 %103 = OpFMul %101 %102 
                                                      OpStore %93 %103 
                                         f32 %104 = OpLoad %93 
                                         f32 %105 = OpExtInst %1 30 %104 
                                                      OpStore %93 %105 
                                         f32 %106 = OpLoad %93 
                                Uniform f32* %108 = OpAccessChain %24 %107 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %106 %109 
                                                      OpStore %93 %110 
                                         f32 %111 = OpLoad %93 
                                         f32 %112 = OpExtInst %1 29 %111 
                                                      OpStore %93 %112 
                                         f32 %113 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %24 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                                      OpStore %93 %117 
                                         f32 %119 = OpLoad %93 
                                        bool %121 = OpFOrdLessThan %119 %120 
                                                      OpStore %118 %121 
                                        bool %124 = OpLoad %118 
                                                      OpSelectionMerge %126 None 
                                                      OpBranchConditional %124 %125 %128 
                                             %125 = OpLabel 
                                                      OpStore %123 %127 
                                                      OpBranch %126 
                                             %128 = OpLabel 
                                         f32 %129 = OpLoad %93 
                                                      OpStore %123 %129 
                                                      OpBranch %126 
                                             %126 = OpLabel 
                                         f32 %130 = OpLoad %123 
                                                      OpStore %93 %130 
                                         f32 %133 = OpLoad %93 
                                       f32_4 %134 = OpCompositeConstruct %133 %133 %133 %133 
                              Uniform f32_4* %136 = OpAccessChain %24 %135 
                                       f32_4 %137 = OpLoad %136 
                                       f32_4 %138 = OpFMul %134 %137 
                                                      OpStore %132 %138 
                                Private f32* %140 = OpAccessChain %83 %139 
                                         f32 %141 = OpLoad %140 
                                Uniform f32* %143 = OpAccessChain %24 %142 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFMul %141 %144 
                                Private f32* %146 = OpAccessChain %83 %139 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %83 %139 
                                         f32 %148 = OpLoad %147 
                                         f32 %150 = OpFMul %148 %149 
                                Private f32* %151 = OpAccessChain %83 %139 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %83 %139 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpExtInst %1 13 %153 
                                Private f32* %155 = OpAccessChain %83 %139 
                                                      OpStore %155 %154 
                                Private f32* %156 = OpAccessChain %83 %139 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFAdd %157 %99 
                                Private f32* %159 = OpAccessChain %83 %139 
                                                      OpStore %159 %158 
                                Uniform f32* %161 = OpAccessChain %24 %160 
                                         f32 %162 = OpLoad %161 
                                Uniform f32* %163 = OpAccessChain %24 %160 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFAdd %162 %164 
                                                      OpStore %93 %165 
                                Private f32* %166 = OpAccessChain %83 %139 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpLoad %93 
                                         f32 %169 = OpFDiv %167 %168 
                                Private f32* %170 = OpAccessChain %83 %139 
                                                      OpStore %170 %169 
                                Private f32* %171 = OpAccessChain %83 %139 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %172 %127 
                                Private f32* %174 = OpAccessChain %83 %139 
                                                      OpStore %174 %173 
                                Uniform f32* %176 = OpAccessChain %24 %175 
                                         f32 %177 = OpLoad %176 
                                Private f32* %178 = OpAccessChain %83 %139 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFMul %177 %179 
                                         f32 %181 = OpFAdd %180 %99 
                                Private f32* %182 = OpAccessChain %83 %139 
                                                      OpStore %182 %181 
                                       f32_2 %184 = OpLoad %83 
                                       f32_4 %185 = OpVectorShuffle %184 %184 0 0 0 0 
                                       f32_4 %186 = OpLoad %132 
                                       f32_4 %187 = OpFMul %185 %186 
                                                      OpStore %183 %187 
                                       f32_2 %188 = OpLoad %70 
                                       f32_2 %191 = OpFMul %188 %190 
                                                      OpStore %70 %191 
                  read_only Texture2DSampled %197 = OpLoad %196 
                                       f32_2 %198 = OpLoad %70 
                                       f32_4 %199 = OpImageSampleImplicitLod %197 %198 
                                         f32 %200 = OpCompositeExtract %199 0 
                                                      OpStore %192 %200 
                                Private f32* %202 = OpAccessChain %183 %15 
                                         f32 %203 = OpLoad %202 
                                Private f32* %205 = OpAccessChain %183 %204 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %203 %206 
                                                      OpStore %201 %207 
                                        bool %210 = OpLoad %201 
                                                      OpSelectionMerge %212 None 
                                                      OpBranchConditional %210 %211 %213 
                                             %211 = OpLabel 
                                                      OpStore %209 %99 
                                                      OpBranch %212 
                                             %213 = OpLabel 
                                                      OpStore %209 %120 
                                                      OpBranch %212 
                                             %212 = OpLabel 
                                         f32 %214 = OpLoad %209 
                                                      OpStore %208 %214 
                                       f32_4 %216 = OpLoad %183 
                                       f32_2 %217 = OpVectorShuffle %216 %216 2 1 
                                       f32_4 %218 = OpLoad %215 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
                                                      OpStore %215 %219 
                                Private f32* %220 = OpAccessChain %215 %204 
                                                      OpStore %220 %127 
                                Private f32* %223 = OpAccessChain %215 %222 
                                                      OpStore %223 %221 
                                       f32_4 %224 = OpLoad %132 
                                       f32_2 %225 = OpVectorShuffle %224 %224 1 2 
                                       f32_2 %226 = OpLoad %83 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 0 
                                       f32_2 %228 = OpFMul %225 %227 
                                       f32_4 %229 = OpLoad %215 
                                       f32_2 %230 = OpVectorShuffle %229 %229 0 1 
                                       f32_2 %231 = OpFNegate %230 
                                       f32_2 %232 = OpFAdd %228 %231 
                                       f32_4 %233 = OpLoad %132 
                                       f32_4 %234 = OpVectorShuffle %233 %232 4 5 2 3 
                                                      OpStore %132 %234 
                                Private f32* %235 = OpAccessChain %132 %204 
                                                      OpStore %235 %99 
                                Private f32* %236 = OpAccessChain %132 %222 
                                                      OpStore %236 %127 
                                         f32 %237 = OpLoad %208 
                                       f32_4 %238 = OpCompositeConstruct %237 %237 %237 %237 
                                       f32_4 %239 = OpLoad %132 
                                       f32_4 %240 = OpFMul %238 %239 
                                       f32_4 %241 = OpLoad %215 
                                       f32_4 %242 = OpFAdd %240 %241 
                                                      OpStore %132 %242 
                                Private f32* %243 = OpAccessChain %183 %139 
                                         f32 %244 = OpLoad %243 
                                Private f32* %245 = OpAccessChain %132 %139 
                                         f32 %246 = OpLoad %245 
                                        bool %247 = OpFOrdGreaterThanEqual %244 %246 
                                                      OpStore %201 %247 
                                        bool %249 = OpLoad %201 
                                                      OpSelectionMerge %251 None 
                                                      OpBranchConditional %249 %250 %252 
                                             %250 = OpLabel 
                                                      OpStore %248 %99 
                                                      OpBranch %251 
                                             %252 = OpLabel 
                                                      OpStore %248 %120 
                                                      OpBranch %251 
                                             %251 = OpLabel 
                                         f32 %253 = OpLoad %248 
                                                      OpStore %208 %253 
                                       f32_4 %254 = OpLoad %132 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 3 
                                       f32_4 %256 = OpLoad %215 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                                      OpStore %215 %257 
                                Private f32* %258 = OpAccessChain %183 %139 
                                         f32 %259 = OpLoad %258 
                                Private f32* %260 = OpAccessChain %215 %222 
                                                      OpStore %260 %259 
                                       f32_4 %261 = OpLoad %215 
                                       f32_3 %262 = OpVectorShuffle %261 %261 3 1 0 
                                       f32_4 %263 = OpLoad %132 
                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 2 6 
                                                      OpStore %132 %264 
                                       f32_4 %265 = OpLoad %215 
                                       f32_4 %266 = OpFNegate %265 
                                       f32_4 %267 = OpLoad %132 
                                       f32_4 %268 = OpFAdd %266 %267 
                                                      OpStore %132 %268 
                                         f32 %269 = OpLoad %208 
                                       f32_4 %270 = OpCompositeConstruct %269 %269 %269 %269 
                                       f32_4 %271 = OpLoad %132 
                                       f32_4 %272 = OpFMul %270 %271 
                                       f32_4 %273 = OpLoad %215 
                                       f32_4 %274 = OpFAdd %272 %273 
                                                      OpStore %132 %274 
                                Private f32* %275 = OpAccessChain %132 %15 
                                         f32 %276 = OpLoad %275 
                                Private f32* %277 = OpAccessChain %132 %222 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpExtInst %1 37 %276 %278 
                                                      OpStore %208 %279 
                                         f32 %280 = OpLoad %208 
                                         f32 %281 = OpFNegate %280 
                                Private f32* %282 = OpAccessChain %132 %139 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFAdd %281 %283 
                                                      OpStore %208 %284 
                                Private f32* %285 = OpAccessChain %132 %15 
                                         f32 %286 = OpLoad %285 
                                         f32 %287 = OpFNegate %286 
                                Private f32* %288 = OpAccessChain %132 %222 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFAdd %287 %289 
                                Private f32* %291 = OpAccessChain %83 %139 
                                                      OpStore %291 %290 
                                         f32 %292 = OpLoad %208 
                                         f32 %294 = OpFMul %292 %293 
                                         f32 %296 = OpFAdd %294 %295 
                                                      OpStore %93 %296 
                                Private f32* %297 = OpAccessChain %83 %139 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpLoad %93 
                                         f32 %300 = OpFDiv %298 %299 
                                Private f32* %301 = OpAccessChain %83 %139 
                                                      OpStore %301 %300 
                                Private f32* %302 = OpAccessChain %83 %139 
                                         f32 %303 = OpLoad %302 
                                Private f32* %304 = OpAccessChain %132 %204 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFAdd %303 %305 
                                Private f32* %307 = OpAccessChain %83 %139 
                                                      OpStore %307 %306 
                                Private f32* %308 = OpAccessChain %132 %139 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpFAdd %309 %295 
                                                      OpStore %93 %310 
                                         f32 %311 = OpLoad %208 
                                         f32 %312 = OpLoad %93 
                                         f32 %313 = OpFDiv %311 %312 
                                                      OpStore %208 %313 
                                         f32 %315 = OpLoad %192 
                                       f32_2 %316 = OpCompositeConstruct %315 %315 
                                         f32 %317 = OpLoad %192 
                                       f32_2 %318 = OpCompositeConstruct %317 %317 
                                         f32 %319 = OpDot %316 %318 
                                                      OpStore %314 %319 
                                         f32 %320 = OpLoad %314 
                                         f32 %321 = OpFNegate %320 
                                Private f32* %322 = OpAccessChain %132 %139 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFAdd %321 %323 
                                Private f32* %325 = OpAccessChain %70 %139 
                                                      OpStore %325 %324 
                                       f32_3 %326 = OpLoad %77 
                                       f32_2 %327 = OpVectorShuffle %326 %326 0 1 
                                         f32 %331 = OpDot %327 %330 
                                                      OpStore %93 %331 
                                         f32 %332 = OpLoad %93 
                                         f32 %333 = OpExtInst %1 13 %332 
                                                      OpStore %93 %333 
                                         f32 %334 = OpLoad %93 
                                         f32 %336 = OpFMul %334 %335 
                                                      OpStore %93 %336 
                                         f32 %337 = OpLoad %93 
                                         f32 %338 = OpExtInst %1 10 %337 
                                                      OpStore %93 %338 
                                         f32 %339 = OpLoad %93 
                                         f32 %341 = OpFAdd %339 %340 
                                                      OpStore %93 %341 
                                       f32_3 %342 = OpLoad %77 
                                       f32_2 %343 = OpVectorShuffle %342 %342 0 1 
                              Uniform f32_4* %345 = OpAccessChain %24 %344 
                                       f32_4 %346 = OpLoad %345 
                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                                         f32 %348 = OpDot %343 %347 
                                Private f32* %349 = OpAccessChain %132 %139 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %132 %139 
                                         f32 %351 = OpLoad %350 
                                Uniform f32* %353 = OpAccessChain %24 %352 %204 
                                         f32 %354 = OpLoad %353 
                                         f32 %355 = OpFNegate %354 
                                         f32 %356 = OpFAdd %351 %355 
                                Private f32* %357 = OpAccessChain %132 %139 
                                                      OpStore %357 %356 
                                Private f32* %358 = OpAccessChain %132 %139 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpExtInst %1 13 %359 
                                Private f32* %361 = OpAccessChain %132 %139 
                                                      OpStore %361 %360 
                                Private f32* %362 = OpAccessChain %132 %139 
                                         f32 %363 = OpLoad %362 
                                         f32 %364 = OpFAdd %363 %99 
                                Private f32* %365 = OpAccessChain %132 %139 
                                                      OpStore %365 %364 
                                Private f32* %366 = OpAccessChain %132 %139 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFMul %367 %21 
                                Private f32* %369 = OpAccessChain %132 %139 
                                                      OpStore %369 %368 
                                       f32_3 %370 = OpLoad %77 
                                       f32_2 %371 = OpVectorShuffle %370 %370 0 1 
                              Uniform f32_4* %372 = OpAccessChain %24 %344 
                                       f32_4 %373 = OpLoad %372 
                                       f32_2 %374 = OpVectorShuffle %373 %373 2 3 
                                         f32 %375 = OpDot %371 %374 
                                Private f32* %376 = OpAccessChain %77 %139 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %77 %139 
                                         f32 %378 = OpLoad %377 
                                Uniform f32* %379 = OpAccessChain %24 %352 %204 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFAdd %378 %380 
                                Private f32* %382 = OpAccessChain %77 %139 
                                                      OpStore %382 %381 
                                Private f32* %383 = OpAccessChain %77 %139 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpExtInst %1 13 %384 
                                Private f32* %386 = OpAccessChain %77 %139 
                                                      OpStore %386 %385 
                                Private f32* %387 = OpAccessChain %77 %139 
                                         f32 %388 = OpLoad %387 
                                         f32 %390 = OpFMul %388 %389 
                                         f32 %392 = OpFAdd %390 %391 
                                Private f32* %393 = OpAccessChain %77 %139 
                                                      OpStore %393 %392 
                                Private f32* %394 = OpAccessChain %132 %139 
                                         f32 %395 = OpLoad %394 
                                Private f32* %396 = OpAccessChain %77 %139 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFMul %395 %397 
                                         f32 %400 = OpFAdd %398 %399 
                                Private f32* %401 = OpAccessChain %77 %139 
                                                      OpStore %401 %400 
                                Private f32* %402 = OpAccessChain %46 %15 
                                         f32 %403 = OpLoad %402 
                                Private f32* %404 = OpAccessChain %46 %139 
                                         f32 %405 = OpLoad %404 
                                         f32 %406 = OpFAdd %403 %405 
                                Private f32* %407 = OpAccessChain %46 %139 
                                                      OpStore %407 %406 
                                Private f32* %408 = OpAccessChain %46 %139 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpFMul %409 %21 
                                Private f32* %411 = OpAccessChain %46 %139 
                                                      OpStore %411 %410 
                                Private f32* %412 = OpAccessChain %46 %139 
                                         f32 %413 = OpLoad %412 
                                         f32 %414 = OpExtInst %1 10 %413 
                                Private f32* %415 = OpAccessChain %46 %139 
                                                      OpStore %415 %414 
                                Private f32* %417 = OpAccessChain %46 %139 
                                         f32 %418 = OpLoad %417 
                                        bool %419 = OpFOrdLessThan %416 %418 
                                                      OpStore %8 %419 
                                Private f32* %421 = OpAccessChain %70 %139 
                                         f32 %422 = OpLoad %421 
                                Uniform f32* %424 = OpAccessChain %24 %423 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpFDiv %422 %425 
                                Private f32* %427 = OpAccessChain %420 %139 
                                                      OpStore %427 %426 
                                Private f32* %428 = OpAccessChain %77 %139 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFNegate %429 
                                Private f32* %431 = OpAccessChain %420 %139 
                                         f32 %432 = OpLoad %431 
                                         f32 %433 = OpFAdd %430 %432 
                                Private f32* %434 = OpAccessChain %70 %139 
                                                      OpStore %434 %433 
                                         f32 %435 = OpLoad %93 
                                         f32 %436 = OpFNegate %435 
                                Uniform f32* %438 = OpAccessChain %24 %437 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFMul %436 %439 
                                Private f32* %441 = OpAccessChain %70 %139 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpFAdd %440 %442 
                                Private f32* %444 = OpAccessChain %70 %139 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %70 %139 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpExtInst %1 9 %446 
                                Private f32* %448 = OpAccessChain %420 %15 
                                                      OpStore %448 %447 
                                Private f32* %449 = OpAccessChain %77 %139 
                                         f32 %450 = OpLoad %449 
                                Private f32* %451 = OpAccessChain %420 %139 
                                         f32 %452 = OpLoad %451 
                                         f32 %453 = OpFAdd %450 %452 
                                Private f32* %454 = OpAccessChain %420 %139 
                                                      OpStore %454 %453 
                                         f32 %455 = OpLoad %93 
                                Uniform f32* %456 = OpAccessChain %24 %437 
                                         f32 %457 = OpLoad %456 
                                         f32 %458 = OpFMul %455 %457 
                                Private f32* %459 = OpAccessChain %420 %139 
                                         f32 %460 = OpLoad %459 
                                         f32 %461 = OpFAdd %458 %460 
                                Private f32* %462 = OpAccessChain %420 %139 
                                                      OpStore %462 %461 
                                Private f32* %463 = OpAccessChain %420 %139 
                                         f32 %464 = OpLoad %463 
                                         f32 %465 = OpExtInst %1 2 %464 
                                Private f32* %466 = OpAccessChain %420 %139 
                                                      OpStore %466 %465 
                                       f32_3 %467 = OpLoad %420 
                                       f32_2 %468 = OpVectorShuffle %467 %467 0 1 
                                Uniform f32* %469 = OpAccessChain %24 %423 
                                         f32 %470 = OpLoad %469 
                                       f32_2 %471 = OpCompositeConstruct %470 %470 
                                       f32_2 %472 = OpFMul %468 %471 
                                       f32_3 %473 = OpLoad %420 
                                       f32_3 %474 = OpVectorShuffle %473 %472 3 4 2 
                                                      OpStore %420 %474 
                                        bool %476 = OpLoad %8 
                                                      OpSelectionMerge %478 None 
                                                      OpBranchConditional %476 %477 %481 
                                             %477 = OpLabel 
                                Private f32* %479 = OpAccessChain %420 %15 
                                         f32 %480 = OpLoad %479 
                                                      OpStore %475 %480 
                                                      OpBranch %478 
                                             %481 = OpLabel 
                                Private f32* %482 = OpAccessChain %420 %139 
                                         f32 %483 = OpLoad %482 
                                                      OpStore %475 %483 
                                                      OpBranch %478 
                                             %478 = OpLabel 
                                         f32 %484 = OpLoad %475 
                                Private f32* %485 = OpAccessChain %46 %139 
                                                      OpStore %485 %484 
                                Private f32* %487 = OpAccessChain %46 %139 
                                         f32 %488 = OpLoad %487 
                                        bool %489 = OpFOrdLessThan %486 %488 
                                                      OpStore %20 %489 
                                Private f32* %490 = OpAccessChain %46 %139 
                                         f32 %491 = OpLoad %490 
                                         f32 %493 = OpFMul %491 %492 
                                Private f32* %494 = OpAccessChain %70 %139 
                                                      OpStore %494 %493 
                                        bool %496 = OpLoad %20 
                                                      OpSelectionMerge %498 None 
                                                      OpBranchConditional %496 %497 %501 
                                             %497 = OpLabel 
                                Private f32* %499 = OpAccessChain %70 %139 
                                         f32 %500 = OpLoad %499 
                                                      OpStore %495 %500 
                                                      OpBranch %498 
                                             %501 = OpLabel 
                                Private f32* %502 = OpAccessChain %46 %139 
                                         f32 %503 = OpLoad %502 
                                                      OpStore %495 %503 
                                                      OpBranch %498 
                                             %498 = OpLabel 
                                         f32 %504 = OpLoad %495 
                                Private f32* %505 = OpAccessChain %46 %139 
                                                      OpStore %505 %504 
                                Private f32* %506 = OpAccessChain %46 %139 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpExtInst %1 40 %507 %120 
                                Private f32* %509 = OpAccessChain %46 %139 
                                                      OpStore %509 %508 
                                       f32_2 %510 = OpLoad %83 
                                       f32_3 %511 = OpVectorShuffle %510 %510 0 0 0 
                                       f32_3 %512 = OpExtInst %1 4 %511 
                                       f32_3 %515 = OpFAdd %512 %514 
                                                      OpStore %77 %515 
                                       f32_3 %516 = OpLoad %77 
                                       f32_3 %517 = OpExtInst %1 10 %516 
                                                      OpStore %77 %517 
                                       f32_3 %518 = OpLoad %77 
                                       f32_3 %520 = OpFMul %518 %519 
                                       f32_3 %523 = OpFAdd %520 %522 
                                                      OpStore %77 %523 
                                       f32_3 %524 = OpLoad %77 
                                       f32_3 %525 = OpExtInst %1 4 %524 
                                       f32_3 %527 = OpFAdd %525 %526 
                                                      OpStore %77 %527 
                                       f32_3 %528 = OpLoad %77 
                                       f32_3 %529 = OpCompositeConstruct %120 %120 %120 
                                       f32_3 %530 = OpCompositeConstruct %99 %99 %99 
                                       f32_3 %531 = OpExtInst %1 43 %528 %529 %530 
                                                      OpStore %77 %531 
                                       f32_3 %532 = OpLoad %77 
                                       f32_3 %533 = OpFAdd %532 %526 
                                                      OpStore %77 %533 
                                         f32 %534 = OpLoad %208 
                                       f32_3 %535 = OpCompositeConstruct %534 %534 %534 
                                       f32_3 %536 = OpLoad %77 
                                       f32_3 %537 = OpFMul %535 %536 
                                       f32_3 %539 = OpFAdd %537 %538 
                                                      OpStore %420 %539 
                                Private f32* %540 = OpAccessChain %46 %139 
                                         f32 %541 = OpLoad %540 
                                         f32 %543 = OpFMul %541 %542 
                                Private f32* %544 = OpAccessChain %77 %139 
                                                      OpStore %544 %543 
                                Private f32* %545 = OpAccessChain %77 %139 
                                         f32 %546 = OpLoad %545 
                                         f32 %547 = OpExtInst %1 37 %546 %99 
                                Private f32* %548 = OpAccessChain %77 %139 
                                                      OpStore %548 %547 
                                       f32_3 %549 = OpLoad %46 
                                       f32_3 %550 = OpVectorShuffle %549 %549 0 0 0 
                                       f32_3 %551 = OpLoad %420 
                                       f32_3 %552 = OpFMul %550 %551 
                              Uniform f32_4* %553 = OpAccessChain %24 %39 
                                       f32_4 %554 = OpLoad %553 
                                       f32_3 %555 = OpVectorShuffle %554 %554 0 1 2 
                                       f32_3 %556 = OpFNegate %555 
                                       f32_3 %557 = OpFAdd %552 %556 
                                                      OpStore %46 %557 
                                       f32_3 %558 = OpLoad %77 
                                       f32_3 %559 = OpVectorShuffle %558 %558 0 0 0 
                                       f32_3 %560 = OpLoad %46 
                                       f32_3 %561 = OpFMul %559 %560 
                              Uniform f32_4* %562 = OpAccessChain %24 %39 
                                       f32_4 %563 = OpLoad %562 
                                       f32_3 %564 = OpVectorShuffle %563 %563 0 1 2 
                                       f32_3 %565 = OpFAdd %561 %564 
                                       f32_4 %566 = OpLoad %183 
                                       f32_4 %567 = OpVectorShuffle %566 %565 4 5 6 3 
                                                      OpStore %183 %567 
                                       f32_4 %568 = OpLoad %183 
                                                      OpStore %38 %568 
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