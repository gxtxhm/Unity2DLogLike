//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/TitleSky" {
Properties {
_OverrideColor ("Color", Color) = (1,1,1,1)
_StepValue ("Step Value", Float) = 0.1
_SkyBoost ("Sky Boost", Float) = 0.5
_SkyPower ("Sky Power", Float) = 1
_DitherCohesionFactor ("Cohesion Factor", Float) = 0.5
_SpaceVector ("Space Vector", Vector) = (50,27,150,133)
_CurvePower ("CP", Float) = 0
_CurveFreq ("Curve Freq", Float) = 1
_CurveColorFactor ("CCF", Float) = 1
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 40004
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
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _OverrideColor;
uniform 	float _StepValue;
uniform 	float _SkyBoost;
uniform 	float _SkyPower;
uniform 	float _CurvePower;
uniform 	float _CurveColorFactor;
uniform 	float _CurveFreq;
uniform 	float _DitherCohesionFactor;
uniform 	vec4 _SpaceVector;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x * _CurveFreq;
    u_xlat0.x = u_xlat0.x * 3.1400001;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat4.x = _CurveColorFactor + _CurveColorFactor;
    u_xlat0.x = u_xlat0.x / u_xlat4.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = _CurvePower * u_xlat0.x + 1.0;
    u_xlat4.x = log2(vs_TEXCOORD1.y);
    u_xlat4.x = u_xlat4.x * _SkyPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + _SkyBoost;
    u_xlatb8 = u_xlat4.x<0.0;
    u_xlat4.x = (u_xlatb8) ? -1.0 : u_xlat4.x;
    u_xlat1 = u_xlat4.xxxx * _OverrideColor;
    u_xlat2 = u_xlat0.xxxx * u_xlat1;
    u_xlat3.xy = u_xlat2.zy;
    u_xlat0.xy = u_xlat1.yz * u_xlat0.xx + (-u_xlat3.xy);
    u_xlatb1 = u_xlat3.y>=u_xlat2.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat1.xxxx * u_xlat0.xywz + u_xlat3.xywz;
    u_xlatb1 = u_xlat2.x>=u_xlat0.x;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat2.x;
    SV_Target0.w = u_xlat2.w;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat1.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat5 = u_xlat1.x * 6.0 + 1.00000001e-010;
    u_xlat4.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat4.x = u_xlat4.x / u_xlat5;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat4.xyz = abs(u_xlat4.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5 = u_xlat0.x + 1.00000001e-010;
    u_xlat0.x = u_xlat0.x / _StepValue;
    u_xlat1.x = u_xlat1.x / u_xlat5;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(479.999969, 270.0);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat9.xy = u_xlat1.xy * vec2(0.00208333344, 0.00370370364);
    u_xlat2.x = dot(u_xlat9.xy, _SpaceVector.xy);
    u_xlat9.x = dot(u_xlat9.xy, _SpaceVector.zw);
    u_xlat9.x = u_xlat9.x + _Time.y;
    u_xlat9.x = sin(u_xlat9.x);
    u_xlat9.x = u_xlat9.x * 0.099999994 + 0.150000006;
    u_xlat13 = u_xlat2.x + (-_Time.y);
    u_xlat13 = sin(u_xlat13);
    u_xlat13 = u_xlat13 + 1.0;
    u_xlat13 = u_xlat13 * 0.5;
    u_xlat9.x = u_xlat13 * u_xlat9.x + 0.349999994;
    u_xlat13 = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + u_xlat9.x;
    u_xlat9.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat1.x = u_xlat1.y + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlatb1 = 0.25<u_xlat1.x;
    u_xlat5 = sin(u_xlat9.x);
    u_xlat5 = u_xlat5 * 43758.5469;
    u_xlat5 = fract(u_xlat5);
    u_xlat5 = u_xlat5 + -0.5;
    u_xlat9.x = (-u_xlat5) * _DitherCohesionFactor + u_xlat13;
    u_xlat0.x = u_xlat5 * _DitherCohesionFactor + u_xlat0.x;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _StepValue;
    u_xlat5 = ceil(u_xlat9.x);
    u_xlat5 = u_xlat5 * _StepValue;
    u_xlat0.x = (u_xlatb1) ? u_xlat5 : u_xlat0.x;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 104
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %93 
                                              OpDecorate %9 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %83 0 BuiltIn 83 
                                              OpMemberDecorate %83 1 BuiltIn 83 
                                              OpMemberDecorate %83 2 BuiltIn 83 
                                              OpDecorate %83 Block 
                                              OpDecorate %93 Location 93 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
                         Output f32_2* %9 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %81 = OpConstant 1 
                                      %82 = OpTypeArray %6 %81 
                                      %83 = OpTypeStruct %13 %6 %82 
                                      %84 = OpTypePointer Output %83 
 Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                      %87 = OpTypePointer Output %13 
                                  f32 %90 = OpConstant 3.67402E-40 
                                f32_4 %91 = OpConstantComposite %90 %90 %90 %90 
                        Output f32_4* %93 = OpVariable Output 
                                  f32 %95 = OpConstant 3.67402E-40 
                                f32_4 %96 = OpConstantComposite %95 %95 %95 %95 
                                      %98 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore %9 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %74 = OpAccessChain %26 %29 %50 
                                f32_4 %75 = OpLoad %74 
                                f32_4 %76 = OpLoad %15 
                                f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                f32_4 %78 = OpFMul %75 %77 
                                f32_4 %79 = OpLoad %54 
                                f32_4 %80 = OpFAdd %78 %79 
                                              OpStore %15 %80 
                                f32_4 %86 = OpLoad %15 
                        Output f32_4* %88 = OpAccessChain %85 %28 
                                              OpStore %88 %86 
                                f32_4 %89 = OpLoad %15 
                                f32_4 %92 = OpFAdd %89 %91 
                                              OpStore %15 %92 
                                f32_4 %94 = OpLoad %15 
                                f32_4 %97 = OpFMul %94 %96 
                                              OpStore %93 %97 
                          Output f32* %99 = OpAccessChain %85 %28 %81 
                                 f32 %100 = OpLoad %99 
                                 f32 %101 = OpFNegate %100 
                         Output f32* %102 = OpAccessChain %85 %28 %81 
                                              OpStore %102 %101 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 464
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %285 %461 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %285 Location 285 
                                                      OpDecorate %461 RelaxedPrecision 
                                                      OpDecorate %461 Location 461 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %17 = OpTypeStruct %7 %7 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 7 
                                              %22 = OpTypePointer Uniform %6 
                                              %26 = OpTypePointer Private %6 
                                          f32 %30 = OpConstant 3.67402E-40 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          i32 %45 = OpConstant 6 
                                          f32 %60 = OpConstant 3.67402E-40 
                                          i32 %63 = OpConstant 5 
                                          u32 %71 = OpConstant 1 
                                          i32 %78 = OpConstant 4 
                                          i32 %89 = OpConstant 3 
                                              %94 = OpTypeBool 
                                              %95 = OpTypePointer Private %94 
                                Private bool* %96 = OpVariable Private 
                                          f32 %99 = OpConstant 3.67402E-40 
                                             %101 = OpTypePointer Function %6 
                              Private f32_4* %111 = OpVariable Private 
                                         i32 %114 = OpConstant 1 
                                             %115 = OpTypePointer Uniform %7 
                              Private f32_4* %119 = OpVariable Private 
                              Private f32_4* %124 = OpVariable Private 
                                             %125 = OpTypeVector %6 2 
                               Private bool* %141 = OpVariable Private 
                                         u32 %144 = OpConstant 2 
                                         f32 %156 = OpConstant 3.67402E-40 
                                         u32 %157 = OpConstant 3 
                                Private f32* %214 = OpVariable Private 
                                         f32 %217 = OpConstant 3.67402E-40 
                                         f32 %219 = OpConstant 3.67402E-40 
                                         f32 %242 = OpConstant 3.67402E-40 
                                       f32_3 %243 = OpConstantComposite %39 %156 %242 
                                       f32_3 %248 = OpConstantComposite %217 %217 %217 
                                         f32 %250 = OpConstant 3.67402E-40 
                                       f32_3 %251 = OpConstantComposite %250 %250 %250 
                                       f32_3 %255 = OpConstantComposite %60 %60 %60 
                                         i32 %268 = OpConstant 2 
                                       f32_3 %282 = OpConstantComposite %39 %39 %39 
                                             %284 = OpTypePointer Input %125 
                                Input f32_2* %285 = OpVariable Input 
                                         f32 %287 = OpConstant 3.67402E-40 
                                         f32 %288 = OpConstant 3.67402E-40 
                                       f32_2 %289 = OpConstantComposite %287 %288 
                                             %298 = OpTypePointer Private %125 
                              Private f32_2* %299 = OpVariable Private 
                                         f32 %302 = OpConstant 3.67402E-40 
                                         f32 %303 = OpConstant 3.67402E-40 
                                       f32_2 %304 = OpConstantComposite %302 %303 
                                         i32 %307 = OpConstant 9 
                                         i32 %321 = OpConstant 0 
                                         f32 %332 = OpConstant 3.67402E-40 
                                         f32 %334 = OpConstant 3.67402E-40 
                                Private f32* %337 = OpVariable Private 
                                         f32 %349 = OpConstant 3.67402E-40 
                                         f32 %355 = OpConstant 3.67402E-40 
                                         f32 %372 = OpConstant 3.67402E-40 
                                         f32 %373 = OpConstant 3.67402E-40 
                                       f32_2 %374 = OpConstantComposite %372 %373 
                                         f32 %391 = OpConstant 3.67402E-40 
                                         f32 %399 = OpConstant 3.67402E-40 
                                         f32 %404 = OpConstant 3.67402E-40 
                                         i32 %408 = OpConstant 8 
                                             %460 = OpTypePointer Output %7 
                               Output f32_4* %461 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %102 = OpVariable Function 
                               Function f32* %148 = OpVariable Function 
                               Function f32* %174 = OpVariable Function 
                               Function f32* %440 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain %11 %13 
                                          f32 %16 = OpLoad %15 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                          f32 %25 = OpFMul %16 %24 
                                 Private f32* %27 = OpAccessChain %9 %13 
                                                      OpStore %27 %25 
                                 Private f32* %28 = OpAccessChain %9 %13 
                                          f32 %29 = OpLoad %28 
                                          f32 %31 = OpFMul %29 %30 
                                 Private f32* %32 = OpAccessChain %9 %13 
                                                      OpStore %32 %31 
                                 Private f32* %33 = OpAccessChain %9 %13 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpExtInst %1 13 %34 
                                 Private f32* %36 = OpAccessChain %9 %13 
                                                      OpStore %36 %35 
                                 Private f32* %37 = OpAccessChain %9 %13 
                                          f32 %38 = OpLoad %37 
                                          f32 %40 = OpFAdd %38 %39 
                                 Private f32* %41 = OpAccessChain %9 %13 
                                                      OpStore %41 %40 
                                 Uniform f32* %46 = OpAccessChain %19 %45 
                                          f32 %47 = OpLoad %46 
                                 Uniform f32* %48 = OpAccessChain %19 %45 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFAdd %47 %49 
                                 Private f32* %51 = OpAccessChain %44 %13 
                                                      OpStore %51 %50 
                                 Private f32* %52 = OpAccessChain %9 %13 
                                          f32 %53 = OpLoad %52 
                                 Private f32* %54 = OpAccessChain %44 %13 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFDiv %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %13 
                                                      OpStore %57 %56 
                                 Private f32* %58 = OpAccessChain %9 %13 
                                          f32 %59 = OpLoad %58 
                                          f32 %61 = OpFAdd %59 %60 
                                 Private f32* %62 = OpAccessChain %9 %13 
                                                      OpStore %62 %61 
                                 Uniform f32* %64 = OpAccessChain %19 %63 
                                          f32 %65 = OpLoad %64 
                                 Private f32* %66 = OpAccessChain %9 %13 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFMul %65 %67 
                                          f32 %69 = OpFAdd %68 %39 
                                 Private f32* %70 = OpAccessChain %9 %13 
                                                      OpStore %70 %69 
                                   Input f32* %72 = OpAccessChain %11 %71 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpExtInst %1 30 %73 
                                 Private f32* %75 = OpAccessChain %44 %13 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %44 %13 
                                          f32 %77 = OpLoad %76 
                                 Uniform f32* %79 = OpAccessChain %19 %78 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFMul %77 %80 
                                 Private f32* %82 = OpAccessChain %44 %13 
                                                      OpStore %82 %81 
                                 Private f32* %83 = OpAccessChain %44 %13 
                                          f32 %84 = OpLoad %83 
                                          f32 %85 = OpExtInst %1 29 %84 
                                 Private f32* %86 = OpAccessChain %44 %13 
                                                      OpStore %86 %85 
                                 Private f32* %87 = OpAccessChain %44 %13 
                                          f32 %88 = OpLoad %87 
                                 Uniform f32* %90 = OpAccessChain %19 %89 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFAdd %88 %91 
                                 Private f32* %93 = OpAccessChain %44 %13 
                                                      OpStore %93 %92 
                                 Private f32* %97 = OpAccessChain %44 %13 
                                          f32 %98 = OpLoad %97 
                                        bool %100 = OpFOrdLessThan %98 %99 
                                                      OpStore %96 %100 
                                        bool %103 = OpLoad %96 
                                                      OpSelectionMerge %105 None 
                                                      OpBranchConditional %103 %104 %106 
                                             %104 = OpLabel 
                                                      OpStore %102 %60 
                                                      OpBranch %105 
                                             %106 = OpLabel 
                                Private f32* %107 = OpAccessChain %44 %13 
                                         f32 %108 = OpLoad %107 
                                                      OpStore %102 %108 
                                                      OpBranch %105 
                                             %105 = OpLabel 
                                         f32 %109 = OpLoad %102 
                                Private f32* %110 = OpAccessChain %44 %13 
                                                      OpStore %110 %109 
                                       f32_3 %112 = OpLoad %44 
                                       f32_4 %113 = OpVectorShuffle %112 %112 0 0 0 0 
                              Uniform f32_4* %116 = OpAccessChain %19 %114 
                                       f32_4 %117 = OpLoad %116 
                                       f32_4 %118 = OpFMul %113 %117 
                                                      OpStore %111 %118 
                                       f32_4 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %120 0 0 0 0 
                                       f32_4 %122 = OpLoad %111 
                                       f32_4 %123 = OpFMul %121 %122 
                                                      OpStore %119 %123 
                                       f32_4 %126 = OpLoad %119 
                                       f32_2 %127 = OpVectorShuffle %126 %126 2 1 
                                       f32_4 %128 = OpLoad %124 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 2 3 
                                                      OpStore %124 %129 
                                       f32_4 %130 = OpLoad %111 
                                       f32_2 %131 = OpVectorShuffle %130 %130 1 2 
                                       f32_4 %132 = OpLoad %9 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 0 
                                       f32_2 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %124 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFNegate %136 
                                       f32_2 %138 = OpFAdd %134 %137 
                                       f32_4 %139 = OpLoad %9 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 2 3 
                                                      OpStore %9 %140 
                                Private f32* %142 = OpAccessChain %124 %71 
                                         f32 %143 = OpLoad %142 
                                Private f32* %145 = OpAccessChain %119 %144 
                                         f32 %146 = OpLoad %145 
                                        bool %147 = OpFOrdGreaterThanEqual %143 %146 
                                                      OpStore %141 %147 
                                        bool %149 = OpLoad %141 
                                                      OpSelectionMerge %151 None 
                                                      OpBranchConditional %149 %150 %152 
                                             %150 = OpLabel 
                                                      OpStore %148 %39 
                                                      OpBranch %151 
                                             %152 = OpLabel 
                                                      OpStore %148 %99 
                                                      OpBranch %151 
                                             %151 = OpLabel 
                                         f32 %153 = OpLoad %148 
                                Private f32* %154 = OpAccessChain %111 %13 
                                                      OpStore %154 %153 
                                Private f32* %155 = OpAccessChain %124 %144 
                                                      OpStore %155 %60 
                                Private f32* %158 = OpAccessChain %124 %157 
                                                      OpStore %158 %156 
                                Private f32* %159 = OpAccessChain %9 %144 
                                                      OpStore %159 %39 
                                Private f32* %160 = OpAccessChain %9 %157 
                                                      OpStore %160 %60 
                                       f32_4 %161 = OpLoad %111 
                                       f32_4 %162 = OpVectorShuffle %161 %161 0 0 0 0 
                                       f32_4 %163 = OpLoad %9 
                                       f32_4 %164 = OpVectorShuffle %163 %163 0 1 3 2 
                                       f32_4 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %124 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 1 3 2 
                                       f32_4 %168 = OpFAdd %165 %167 
                                                      OpStore %9 %168 
                                Private f32* %169 = OpAccessChain %119 %13 
                                         f32 %170 = OpLoad %169 
                                Private f32* %171 = OpAccessChain %9 %13 
                                         f32 %172 = OpLoad %171 
                                        bool %173 = OpFOrdGreaterThanEqual %170 %172 
                                                      OpStore %141 %173 
                                        bool %175 = OpLoad %141 
                                                      OpSelectionMerge %177 None 
                                                      OpBranchConditional %175 %176 %178 
                                             %176 = OpLabel 
                                                      OpStore %174 %39 
                                                      OpBranch %177 
                                             %178 = OpLabel 
                                                      OpStore %174 %99 
                                                      OpBranch %177 
                                             %177 = OpLabel 
                                         f32 %179 = OpLoad %174 
                                Private f32* %180 = OpAccessChain %111 %13 
                                                      OpStore %180 %179 
                                Private f32* %181 = OpAccessChain %9 %157 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %124 %144 
                                                      OpStore %183 %182 
                                Private f32* %184 = OpAccessChain %119 %13 
                                         f32 %185 = OpLoad %184 
                                Private f32* %186 = OpAccessChain %9 %157 
                                                      OpStore %186 %185 
                                       f32_4 %187 = OpLoad %9 
                                       f32_3 %188 = OpVectorShuffle %187 %187 3 1 0 
                                       f32_4 %189 = OpLoad %124 
                                       f32_4 %190 = OpVectorShuffle %189 %188 4 5 2 6 
                                                      OpStore %124 %190 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpFNegate %191 
                                       f32_4 %193 = OpLoad %124 
                                       f32_4 %194 = OpFAdd %192 %193 
                                                      OpStore %124 %194 
                                       f32_4 %195 = OpLoad %111 
                                       f32_4 %196 = OpVectorShuffle %195 %195 0 0 0 0 
                                       f32_4 %197 = OpLoad %124 
                                       f32_4 %198 = OpFMul %196 %197 
                                       f32_4 %199 = OpLoad %9 
                                       f32_4 %200 = OpFAdd %198 %199 
                                                      OpStore %9 %200 
                                Private f32* %201 = OpAccessChain %9 %71 
                                         f32 %202 = OpLoad %201 
                                Private f32* %203 = OpAccessChain %9 %157 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpExtInst %1 37 %202 %204 
                                Private f32* %206 = OpAccessChain %111 %13 
                                                      OpStore %206 %205 
                                Private f32* %207 = OpAccessChain %9 %13 
                                         f32 %208 = OpLoad %207 
                                Private f32* %209 = OpAccessChain %111 %13 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpFNegate %210 
                                         f32 %212 = OpFAdd %208 %211 
                                Private f32* %213 = OpAccessChain %111 %13 
                                                      OpStore %213 %212 
                                Private f32* %215 = OpAccessChain %111 %13 
                                         f32 %216 = OpLoad %215 
                                         f32 %218 = OpFMul %216 %217 
                                         f32 %220 = OpFAdd %218 %219 
                                                      OpStore %214 %220 
                                Private f32* %221 = OpAccessChain %9 %71 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFNegate %222 
                                Private f32* %224 = OpAccessChain %9 %157 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFAdd %223 %225 
                                Private f32* %227 = OpAccessChain %44 %13 
                                                      OpStore %227 %226 
                                Private f32* %228 = OpAccessChain %44 %13 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpLoad %214 
                                         f32 %231 = OpFDiv %229 %230 
                                Private f32* %232 = OpAccessChain %44 %13 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %44 %13 
                                         f32 %234 = OpLoad %233 
                                Private f32* %235 = OpAccessChain %9 %144 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFAdd %234 %236 
                                Private f32* %238 = OpAccessChain %44 %13 
                                                      OpStore %238 %237 
                                       f32_3 %239 = OpLoad %44 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 0 0 
                                       f32_3 %241 = OpExtInst %1 4 %240 
                                       f32_3 %244 = OpFAdd %241 %243 
                                                      OpStore %44 %244 
                                       f32_3 %245 = OpLoad %44 
                                       f32_3 %246 = OpExtInst %1 10 %245 
                                                      OpStore %44 %246 
                                       f32_3 %247 = OpLoad %44 
                                       f32_3 %249 = OpFMul %247 %248 
                                       f32_3 %252 = OpFAdd %249 %251 
                                                      OpStore %44 %252 
                                       f32_3 %253 = OpLoad %44 
                                       f32_3 %254 = OpExtInst %1 4 %253 
                                       f32_3 %256 = OpFAdd %254 %255 
                                                      OpStore %44 %256 
                                       f32_3 %257 = OpLoad %44 
                                       f32_3 %258 = OpCompositeConstruct %99 %99 %99 
                                       f32_3 %259 = OpCompositeConstruct %39 %39 %39 
                                       f32_3 %260 = OpExtInst %1 43 %257 %258 %259 
                                                      OpStore %44 %260 
                                       f32_3 %261 = OpLoad %44 
                                       f32_3 %262 = OpFAdd %261 %255 
                                                      OpStore %44 %262 
                                Private f32* %263 = OpAccessChain %9 %13 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFAdd %264 %219 
                                                      OpStore %214 %265 
                                Private f32* %266 = OpAccessChain %9 %13 
                                         f32 %267 = OpLoad %266 
                                Uniform f32* %269 = OpAccessChain %19 %268 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFDiv %267 %270 
                                Private f32* %272 = OpAccessChain %9 %13 
                                                      OpStore %272 %271 
                                Private f32* %273 = OpAccessChain %111 %13 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpLoad %214 
                                         f32 %276 = OpFDiv %274 %275 
                                Private f32* %277 = OpAccessChain %111 %13 
                                                      OpStore %277 %276 
                                       f32_4 %278 = OpLoad %111 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 0 0 
                                       f32_3 %280 = OpLoad %44 
                                       f32_3 %281 = OpFMul %279 %280 
                                       f32_3 %283 = OpFAdd %281 %282 
                                                      OpStore %44 %283 
                                       f32_2 %286 = OpLoad %285 
                                       f32_2 %290 = OpFMul %286 %289 
                                       f32_4 %291 = OpLoad %111 
                                       f32_4 %292 = OpVectorShuffle %291 %290 4 5 2 3 
                                                      OpStore %111 %292 
                                       f32_4 %293 = OpLoad %111 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                       f32_2 %295 = OpExtInst %1 8 %294 
                                       f32_4 %296 = OpLoad %111 
                                       f32_4 %297 = OpVectorShuffle %296 %295 4 5 2 3 
                                                      OpStore %111 %297 
                                       f32_4 %300 = OpLoad %111 
                                       f32_2 %301 = OpVectorShuffle %300 %300 0 1 
                                       f32_2 %305 = OpFMul %301 %304 
                                                      OpStore %299 %305 
                                       f32_2 %306 = OpLoad %299 
                              Uniform f32_4* %308 = OpAccessChain %19 %307 
                                       f32_4 %309 = OpLoad %308 
                                       f32_2 %310 = OpVectorShuffle %309 %309 0 1 
                                         f32 %311 = OpDot %306 %310 
                                Private f32* %312 = OpAccessChain %124 %13 
                                                      OpStore %312 %311 
                                       f32_2 %313 = OpLoad %299 
                              Uniform f32_4* %314 = OpAccessChain %19 %307 
                                       f32_4 %315 = OpLoad %314 
                                       f32_2 %316 = OpVectorShuffle %315 %315 2 3 
                                         f32 %317 = OpDot %313 %316 
                                Private f32* %318 = OpAccessChain %299 %13 
                                                      OpStore %318 %317 
                                Private f32* %319 = OpAccessChain %299 %13 
                                         f32 %320 = OpLoad %319 
                                Uniform f32* %322 = OpAccessChain %19 %321 %71 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFAdd %320 %323 
                                Private f32* %325 = OpAccessChain %299 %13 
                                                      OpStore %325 %324 
                                Private f32* %326 = OpAccessChain %299 %13 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpExtInst %1 13 %327 
                                Private f32* %329 = OpAccessChain %299 %13 
                                                      OpStore %329 %328 
                                Private f32* %330 = OpAccessChain %299 %13 
                                         f32 %331 = OpLoad %330 
                                         f32 %333 = OpFMul %331 %332 
                                         f32 %335 = OpFAdd %333 %334 
                                Private f32* %336 = OpAccessChain %299 %13 
                                                      OpStore %336 %335 
                                Private f32* %338 = OpAccessChain %124 %13 
                                         f32 %339 = OpLoad %338 
                                Uniform f32* %340 = OpAccessChain %19 %321 %71 
                                         f32 %341 = OpLoad %340 
                                         f32 %342 = OpFNegate %341 
                                         f32 %343 = OpFAdd %339 %342 
                                                      OpStore %337 %343 
                                         f32 %344 = OpLoad %337 
                                         f32 %345 = OpExtInst %1 13 %344 
                                                      OpStore %337 %345 
                                         f32 %346 = OpLoad %337 
                                         f32 %347 = OpFAdd %346 %39 
                                                      OpStore %337 %347 
                                         f32 %348 = OpLoad %337 
                                         f32 %350 = OpFMul %348 %349 
                                                      OpStore %337 %350 
                                         f32 %351 = OpLoad %337 
                                Private f32* %352 = OpAccessChain %299 %13 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFMul %351 %353 
                                         f32 %356 = OpFAdd %354 %355 
                                Private f32* %357 = OpAccessChain %299 %13 
                                                      OpStore %357 %356 
                                Private f32* %358 = OpAccessChain %9 %13 
                                         f32 %359 = OpLoad %358 
                                Private f32* %360 = OpAccessChain %299 %13 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFNegate %361 
                                         f32 %363 = OpFAdd %359 %362 
                                                      OpStore %337 %363 
                                Private f32* %364 = OpAccessChain %9 %13 
                                         f32 %365 = OpLoad %364 
                                Private f32* %366 = OpAccessChain %299 %13 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                Private f32* %369 = OpAccessChain %9 %13 
                                                      OpStore %369 %368 
                                       f32_4 %370 = OpLoad %111 
                                       f32_2 %371 = OpVectorShuffle %370 %370 0 1 
                                         f32 %375 = OpDot %371 %374 
                                Private f32* %376 = OpAccessChain %299 %13 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %111 %71 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %111 %13 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpFAdd %378 %380 
                                Private f32* %382 = OpAccessChain %111 %13 
                                                      OpStore %382 %381 
                                Private f32* %383 = OpAccessChain %111 %13 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFMul %384 %349 
                                Private f32* %386 = OpAccessChain %111 %13 
                                                      OpStore %386 %385 
                                Private f32* %387 = OpAccessChain %111 %13 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpExtInst %1 10 %388 
                                Private f32* %390 = OpAccessChain %111 %13 
                                                      OpStore %390 %389 
                                Private f32* %392 = OpAccessChain %111 %13 
                                         f32 %393 = OpLoad %392 
                                        bool %394 = OpFOrdLessThan %391 %393 
                                                      OpStore %141 %394 
                                Private f32* %395 = OpAccessChain %299 %13 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpExtInst %1 13 %396 
                                                      OpStore %214 %397 
                                         f32 %398 = OpLoad %214 
                                         f32 %400 = OpFMul %398 %399 
                                                      OpStore %214 %400 
                                         f32 %401 = OpLoad %214 
                                         f32 %402 = OpExtInst %1 10 %401 
                                                      OpStore %214 %402 
                                         f32 %403 = OpLoad %214 
                                         f32 %405 = OpFAdd %403 %404 
                                                      OpStore %214 %405 
                                         f32 %406 = OpLoad %214 
                                         f32 %407 = OpFNegate %406 
                                Uniform f32* %409 = OpAccessChain %19 %408 
                                         f32 %410 = OpLoad %409 
                                         f32 %411 = OpFMul %407 %410 
                                         f32 %412 = OpLoad %337 
                                         f32 %413 = OpFAdd %411 %412 
                                Private f32* %414 = OpAccessChain %299 %13 
                                                      OpStore %414 %413 
                                         f32 %415 = OpLoad %214 
                                Uniform f32* %416 = OpAccessChain %19 %408 
                                         f32 %417 = OpLoad %416 
                                         f32 %418 = OpFMul %415 %417 
                                Private f32* %419 = OpAccessChain %9 %13 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFAdd %418 %420 
                                Private f32* %422 = OpAccessChain %9 %13 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %9 %13 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpExtInst %1 2 %424 
                                Private f32* %426 = OpAccessChain %9 %13 
                                                      OpStore %426 %425 
                                Private f32* %427 = OpAccessChain %9 %13 
                                         f32 %428 = OpLoad %427 
                                Uniform f32* %429 = OpAccessChain %19 %268 
                                         f32 %430 = OpLoad %429 
                                         f32 %431 = OpFMul %428 %430 
                                Private f32* %432 = OpAccessChain %9 %13 
                                                      OpStore %432 %431 
                                Private f32* %433 = OpAccessChain %299 %13 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpExtInst %1 9 %434 
                                                      OpStore %214 %435 
                                         f32 %436 = OpLoad %214 
                                Uniform f32* %437 = OpAccessChain %19 %268 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpFMul %436 %438 
                                                      OpStore %214 %439 
                                        bool %441 = OpLoad %141 
                                                      OpSelectionMerge %443 None 
                                                      OpBranchConditional %441 %442 %445 
                                             %442 = OpLabel 
                                         f32 %444 = OpLoad %214 
                                                      OpStore %440 %444 
                                                      OpBranch %443 
                                             %445 = OpLabel 
                                Private f32* %446 = OpAccessChain %9 %13 
                                         f32 %447 = OpLoad %446 
                                                      OpStore %440 %447 
                                                      OpBranch %443 
                                             %443 = OpLabel 
                                         f32 %448 = OpLoad %440 
                                Private f32* %449 = OpAccessChain %9 %13 
                                                      OpStore %449 %448 
                                Private f32* %450 = OpAccessChain %9 %13 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpExtInst %1 40 %451 %99 
                                Private f32* %453 = OpAccessChain %9 %13 
                                                      OpStore %453 %452 
                                       f32_3 %454 = OpLoad %44 
                                       f32_4 %455 = OpLoad %9 
                                       f32_3 %456 = OpVectorShuffle %455 %455 0 0 0 
                                       f32_3 %457 = OpFMul %454 %456 
                                       f32_4 %458 = OpLoad %119 
                                       f32_4 %459 = OpVectorShuffle %458 %457 4 5 6 3 
                                                      OpStore %119 %459 
                                       f32_4 %462 = OpLoad %119 
                                                      OpStore %461 %462 
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