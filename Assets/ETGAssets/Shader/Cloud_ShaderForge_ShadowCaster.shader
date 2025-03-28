//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Cloud/ShaderForge/ShadowCaster" {
Properties {
_PerlinNormalMap ("PerlinNormalMap", 2D) = "white" { }
_Tiling ("Tiling", Float) = 3000
_Density ("Density", Float) = -0.25
_Alpha ("Alpha", Float) = 5
_AlphaCut ("AlphaCut", Float) = 0.01
_Speed ("Speed", Float) = 0.1
_SpeedSecondLayer ("SpeedSecondLayer", Float) = 4
_WindDirection ("WindDirection", Vector) = (1,0,0,0)
_MipLevel ("MipLevel", Float) = 0
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
}
SubShader {
 LOD 200
 Tags { "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Pass {
  Name "FORWARD"
  LOD 200
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
  GpuProgramID 7651
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD0.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
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
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %50 %81 %90 %91 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %50 Location 50 
                                              OpMemberDecorate %79 0 BuiltIn 79 
                                              OpMemberDecorate %79 1 BuiltIn 79 
                                              OpMemberDecorate %79 2 BuiltIn 79 
                                              OpDecorate %79 Block 
                                              OpDecorate %90 Location 90 
                                              OpDecorate %91 Location 91 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                       Private f32_4* %43 = OpVariable Private 
                                  i32 %45 = OpConstant 3 
                                      %49 = OpTypePointer Output %7 
                        Output f32_4* %50 = OpVariable Output 
                                  u32 %77 = OpConstant 1 
                                      %78 = OpTypeArray %6 %77 
                                      %79 = OpTypeStruct %7 %6 %78 
                                      %80 = OpTypePointer Output %79 
 Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                        Output f32_4* %90 = OpVariable Output 
                         Input f32_4* %91 = OpVariable Input 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %44 = OpLoad %9 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpFAdd %44 %47 
                                              OpStore %43 %48 
                       Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpLoad %11 
                                f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpFAdd %55 %56 
                                              OpStore %50 %57 
                                f32_4 %58 = OpLoad %43 
                                f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                       Uniform f32_4* %60 = OpAccessChain %20 %23 %23 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpFMul %59 %61 
                                              OpStore %9 %62 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %22 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpLoad %43 
                                f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                f32_4 %67 = OpFMul %64 %66 
                                f32_4 %68 = OpLoad %9 
                                f32_4 %69 = OpFAdd %67 %68 
                                              OpStore %9 %69 
                       Uniform f32_4* %70 = OpAccessChain %20 %23 %35 
                                f32_4 %71 = OpLoad %70 
                                f32_4 %72 = OpLoad %43 
                                f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                f32_4 %74 = OpFMul %71 %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpFAdd %74 %75 
                                              OpStore %9 %76 
                       Uniform f32_4* %82 = OpAccessChain %20 %23 %45 
                                f32_4 %83 = OpLoad %82 
                                f32_4 %84 = OpLoad %43 
                                f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                f32_4 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %9 
                                f32_4 %88 = OpFAdd %86 %87 
                        Output f32_4* %89 = OpAccessChain %81 %22 
                                              OpStore %89 %88 
                                f32_4 %92 = OpLoad %91 
                                              OpStore %90 %92 
                          Output f32* %94 = OpAccessChain %81 %22 %77 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %81 %22 %77 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %104 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD0.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
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
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %50 %81 %90 %91 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %50 Location 50 
                                              OpMemberDecorate %79 0 BuiltIn 79 
                                              OpMemberDecorate %79 1 BuiltIn 79 
                                              OpMemberDecorate %79 2 BuiltIn 79 
                                              OpDecorate %79 Block 
                                              OpDecorate %90 Location 90 
                                              OpDecorate %91 Location 91 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                       Private f32_4* %43 = OpVariable Private 
                                  i32 %45 = OpConstant 3 
                                      %49 = OpTypePointer Output %7 
                        Output f32_4* %50 = OpVariable Output 
                                  u32 %77 = OpConstant 1 
                                      %78 = OpTypeArray %6 %77 
                                      %79 = OpTypeStruct %7 %6 %78 
                                      %80 = OpTypePointer Output %79 
 Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                        Output f32_4* %90 = OpVariable Output 
                         Input f32_4* %91 = OpVariable Input 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %44 = OpLoad %9 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpFAdd %44 %47 
                                              OpStore %43 %48 
                       Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpLoad %11 
                                f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpFAdd %55 %56 
                                              OpStore %50 %57 
                                f32_4 %58 = OpLoad %43 
                                f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                       Uniform f32_4* %60 = OpAccessChain %20 %23 %23 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpFMul %59 %61 
                                              OpStore %9 %62 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %22 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpLoad %43 
                                f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                f32_4 %67 = OpFMul %64 %66 
                                f32_4 %68 = OpLoad %9 
                                f32_4 %69 = OpFAdd %67 %68 
                                              OpStore %9 %69 
                       Uniform f32_4* %70 = OpAccessChain %20 %23 %35 
                                f32_4 %71 = OpLoad %70 
                                f32_4 %72 = OpLoad %43 
                                f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                f32_4 %74 = OpFMul %71 %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpFAdd %74 %75 
                                              OpStore %9 %76 
                       Uniform f32_4* %82 = OpAccessChain %20 %23 %45 
                                f32_4 %83 = OpLoad %82 
                                f32_4 %84 = OpLoad %43 
                                f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                f32_4 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %9 
                                f32_4 %88 = OpFAdd %86 %87 
                        Output f32_4* %89 = OpAccessChain %81 %22 
                                              OpStore %89 %88 
                                f32_4 %92 = OpLoad %91 
                                              OpStore %90 %92 
                          Output f32* %94 = OpAccessChain %81 %22 %77 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %81 %22 %77 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %104 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD0.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %50 %81 %90 %91 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %50 Location 50 
                                              OpMemberDecorate %79 0 BuiltIn 79 
                                              OpMemberDecorate %79 1 BuiltIn 79 
                                              OpMemberDecorate %79 2 BuiltIn 79 
                                              OpDecorate %79 Block 
                                              OpDecorate %90 Location 90 
                                              OpDecorate %91 Location 91 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                       Private f32_4* %43 = OpVariable Private 
                                  i32 %45 = OpConstant 3 
                                      %49 = OpTypePointer Output %7 
                        Output f32_4* %50 = OpVariable Output 
                                  u32 %77 = OpConstant 1 
                                      %78 = OpTypeArray %6 %77 
                                      %79 = OpTypeStruct %7 %6 %78 
                                      %80 = OpTypePointer Output %79 
 Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                        Output f32_4* %90 = OpVariable Output 
                         Input f32_4* %91 = OpVariable Input 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %44 = OpLoad %9 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpFAdd %44 %47 
                                              OpStore %43 %48 
                       Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpLoad %11 
                                f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpFAdd %55 %56 
                                              OpStore %50 %57 
                                f32_4 %58 = OpLoad %43 
                                f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                       Uniform f32_4* %60 = OpAccessChain %20 %23 %23 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpFMul %59 %61 
                                              OpStore %9 %62 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %22 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpLoad %43 
                                f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                f32_4 %67 = OpFMul %64 %66 
                                f32_4 %68 = OpLoad %9 
                                f32_4 %69 = OpFAdd %67 %68 
                                              OpStore %9 %69 
                       Uniform f32_4* %70 = OpAccessChain %20 %23 %35 
                                f32_4 %71 = OpLoad %70 
                                f32_4 %72 = OpLoad %43 
                                f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                f32_4 %74 = OpFMul %71 %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpFAdd %74 %75 
                                              OpStore %9 %76 
                       Uniform f32_4* %82 = OpAccessChain %20 %23 %45 
                                f32_4 %83 = OpLoad %82 
                                f32_4 %84 = OpLoad %43 
                                f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                f32_4 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %9 
                                f32_4 %88 = OpFAdd %86 %87 
                        Output f32_4* %89 = OpAccessChain %81 %22 
                                              OpStore %89 %88 
                                f32_4 %92 = OpLoad %91 
                                              OpStore %90 %92 
                          Output f32* %94 = OpAccessChain %81 %22 %77 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %81 %22 %77 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %104 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD0.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %50 %81 %90 %91 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %50 Location 50 
                                              OpMemberDecorate %79 0 BuiltIn 79 
                                              OpMemberDecorate %79 1 BuiltIn 79 
                                              OpMemberDecorate %79 2 BuiltIn 79 
                                              OpDecorate %79 Block 
                                              OpDecorate %90 Location 90 
                                              OpDecorate %91 Location 91 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                       Private f32_4* %43 = OpVariable Private 
                                  i32 %45 = OpConstant 3 
                                      %49 = OpTypePointer Output %7 
                        Output f32_4* %50 = OpVariable Output 
                                  u32 %77 = OpConstant 1 
                                      %78 = OpTypeArray %6 %77 
                                      %79 = OpTypeStruct %7 %6 %78 
                                      %80 = OpTypePointer Output %79 
 Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                        Output f32_4* %90 = OpVariable Output 
                         Input f32_4* %91 = OpVariable Input 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %44 = OpLoad %9 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpFAdd %44 %47 
                                              OpStore %43 %48 
                       Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpLoad %11 
                                f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpFAdd %55 %56 
                                              OpStore %50 %57 
                                f32_4 %58 = OpLoad %43 
                                f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                       Uniform f32_4* %60 = OpAccessChain %20 %23 %23 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpFMul %59 %61 
                                              OpStore %9 %62 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %22 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpLoad %43 
                                f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                f32_4 %67 = OpFMul %64 %66 
                                f32_4 %68 = OpLoad %9 
                                f32_4 %69 = OpFAdd %67 %68 
                                              OpStore %9 %69 
                       Uniform f32_4* %70 = OpAccessChain %20 %23 %35 
                                f32_4 %71 = OpLoad %70 
                                f32_4 %72 = OpLoad %43 
                                f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                f32_4 %74 = OpFMul %71 %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpFAdd %74 %75 
                                              OpStore %9 %76 
                       Uniform f32_4* %82 = OpAccessChain %20 %23 %45 
                                f32_4 %83 = OpLoad %82 
                                f32_4 %84 = OpLoad %43 
                                f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                f32_4 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %9 
                                f32_4 %88 = OpFAdd %86 %87 
                        Output f32_4* %89 = OpAccessChain %81 %22 
                                              OpStore %89 %88 
                                f32_4 %92 = OpLoad %91 
                                              OpStore %90 %92 
                          Output f32* %94 = OpAccessChain %81 %22 %77 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %81 %22 %77 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %104 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD0.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %50 %81 %90 %91 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %50 Location 50 
                                              OpMemberDecorate %79 0 BuiltIn 79 
                                              OpMemberDecorate %79 1 BuiltIn 79 
                                              OpMemberDecorate %79 2 BuiltIn 79 
                                              OpDecorate %79 Block 
                                              OpDecorate %90 Location 90 
                                              OpDecorate %91 Location 91 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                       Private f32_4* %43 = OpVariable Private 
                                  i32 %45 = OpConstant 3 
                                      %49 = OpTypePointer Output %7 
                        Output f32_4* %50 = OpVariable Output 
                                  u32 %77 = OpConstant 1 
                                      %78 = OpTypeArray %6 %77 
                                      %79 = OpTypeStruct %7 %6 %78 
                                      %80 = OpTypePointer Output %79 
 Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                        Output f32_4* %90 = OpVariable Output 
                         Input f32_4* %91 = OpVariable Input 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %44 = OpLoad %9 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpFAdd %44 %47 
                                              OpStore %43 %48 
                       Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpLoad %11 
                                f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpFAdd %55 %56 
                                              OpStore %50 %57 
                                f32_4 %58 = OpLoad %43 
                                f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                       Uniform f32_4* %60 = OpAccessChain %20 %23 %23 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpFMul %59 %61 
                                              OpStore %9 %62 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %22 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpLoad %43 
                                f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                f32_4 %67 = OpFMul %64 %66 
                                f32_4 %68 = OpLoad %9 
                                f32_4 %69 = OpFAdd %67 %68 
                                              OpStore %9 %69 
                       Uniform f32_4* %70 = OpAccessChain %20 %23 %35 
                                f32_4 %71 = OpLoad %70 
                                f32_4 %72 = OpLoad %43 
                                f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                f32_4 %74 = OpFMul %71 %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpFAdd %74 %75 
                                              OpStore %9 %76 
                       Uniform f32_4* %82 = OpAccessChain %20 %23 %45 
                                f32_4 %83 = OpLoad %82 
                                f32_4 %84 = OpLoad %43 
                                f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                f32_4 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %9 
                                f32_4 %88 = OpFAdd %86 %87 
                        Output f32_4* %89 = OpAccessChain %81 %22 
                                              OpStore %89 %88 
                                f32_4 %92 = OpLoad %91 
                                              OpStore %90 %92 
                          Output f32* %94 = OpAccessChain %81 %22 %77 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %81 %22 %77 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %104 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD0.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
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
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %50 %81 %90 %91 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %50 Location 50 
                                              OpMemberDecorate %79 0 BuiltIn 79 
                                              OpMemberDecorate %79 1 BuiltIn 79 
                                              OpMemberDecorate %79 2 BuiltIn 79 
                                              OpDecorate %79 Block 
                                              OpDecorate %90 Location 90 
                                              OpDecorate %91 Location 91 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                       Private f32_4* %43 = OpVariable Private 
                                  i32 %45 = OpConstant 3 
                                      %49 = OpTypePointer Output %7 
                        Output f32_4* %50 = OpVariable Output 
                                  u32 %77 = OpConstant 1 
                                      %78 = OpTypeArray %6 %77 
                                      %79 = OpTypeStruct %7 %6 %78 
                                      %80 = OpTypePointer Output %79 
 Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                        Output f32_4* %90 = OpVariable Output 
                         Input f32_4* %91 = OpVariable Input 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %44 = OpLoad %9 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpFAdd %44 %47 
                                              OpStore %43 %48 
                       Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpLoad %11 
                                f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpFAdd %55 %56 
                                              OpStore %50 %57 
                                f32_4 %58 = OpLoad %43 
                                f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                       Uniform f32_4* %60 = OpAccessChain %20 %23 %23 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpFMul %59 %61 
                                              OpStore %9 %62 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %22 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpLoad %43 
                                f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                f32_4 %67 = OpFMul %64 %66 
                                f32_4 %68 = OpLoad %9 
                                f32_4 %69 = OpFAdd %67 %68 
                                              OpStore %9 %69 
                       Uniform f32_4* %70 = OpAccessChain %20 %23 %35 
                                f32_4 %71 = OpLoad %70 
                                f32_4 %72 = OpLoad %43 
                                f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                f32_4 %74 = OpFMul %71 %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpFAdd %74 %75 
                                              OpStore %9 %76 
                       Uniform f32_4* %82 = OpAccessChain %20 %23 %45 
                                f32_4 %83 = OpLoad %82 
                                f32_4 %84 = OpLoad %43 
                                f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                f32_4 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %9 
                                f32_4 %88 = OpFAdd %86 %87 
                        Output f32_4* %89 = OpAccessChain %81 %22 
                                              OpStore %89 %88 
                                f32_4 %92 = OpLoad %91 
                                              OpStore %90 %92 
                          Output f32* %94 = OpAccessChain %81 %22 %77 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %81 %22 %77 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %104 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD0.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %50 %81 %90 %91 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %50 Location 50 
                                              OpMemberDecorate %79 0 BuiltIn 79 
                                              OpMemberDecorate %79 1 BuiltIn 79 
                                              OpMemberDecorate %79 2 BuiltIn 79 
                                              OpDecorate %79 Block 
                                              OpDecorate %90 Location 90 
                                              OpDecorate %91 Location 91 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                       Private f32_4* %43 = OpVariable Private 
                                  i32 %45 = OpConstant 3 
                                      %49 = OpTypePointer Output %7 
                        Output f32_4* %50 = OpVariable Output 
                                  u32 %77 = OpConstant 1 
                                      %78 = OpTypeArray %6 %77 
                                      %79 = OpTypeStruct %7 %6 %78 
                                      %80 = OpTypePointer Output %79 
 Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                        Output f32_4* %90 = OpVariable Output 
                         Input f32_4* %91 = OpVariable Input 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %44 = OpLoad %9 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpFAdd %44 %47 
                                              OpStore %43 %48 
                       Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpLoad %11 
                                f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpFAdd %55 %56 
                                              OpStore %50 %57 
                                f32_4 %58 = OpLoad %43 
                                f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                       Uniform f32_4* %60 = OpAccessChain %20 %23 %23 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpFMul %59 %61 
                                              OpStore %9 %62 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %22 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpLoad %43 
                                f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                f32_4 %67 = OpFMul %64 %66 
                                f32_4 %68 = OpLoad %9 
                                f32_4 %69 = OpFAdd %67 %68 
                                              OpStore %9 %69 
                       Uniform f32_4* %70 = OpAccessChain %20 %23 %35 
                                f32_4 %71 = OpLoad %70 
                                f32_4 %72 = OpLoad %43 
                                f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                f32_4 %74 = OpFMul %71 %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpFAdd %74 %75 
                                              OpStore %9 %76 
                       Uniform f32_4* %82 = OpAccessChain %20 %23 %45 
                                f32_4 %83 = OpLoad %82 
                                f32_4 %84 = OpLoad %43 
                                f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                f32_4 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %9 
                                f32_4 %88 = OpFAdd %86 %87 
                        Output f32_4* %89 = OpAccessChain %81 %22 
                                              OpStore %89 %88 
                                f32_4 %92 = OpLoad %91 
                                              OpStore %90 %92 
                          Output f32* %94 = OpAccessChain %81 %22 %77 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %81 %22 %77 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %104 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD0.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %50 %81 %90 %91 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %50 Location 50 
                                              OpMemberDecorate %79 0 BuiltIn 79 
                                              OpMemberDecorate %79 1 BuiltIn 79 
                                              OpMemberDecorate %79 2 BuiltIn 79 
                                              OpDecorate %79 Block 
                                              OpDecorate %90 Location 90 
                                              OpDecorate %91 Location 91 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                       Private f32_4* %43 = OpVariable Private 
                                  i32 %45 = OpConstant 3 
                                      %49 = OpTypePointer Output %7 
                        Output f32_4* %50 = OpVariable Output 
                                  u32 %77 = OpConstant 1 
                                      %78 = OpTypeArray %6 %77 
                                      %79 = OpTypeStruct %7 %6 %78 
                                      %80 = OpTypePointer Output %79 
 Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                        Output f32_4* %90 = OpVariable Output 
                         Input f32_4* %91 = OpVariable Input 
                                      %93 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %44 = OpLoad %9 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpFAdd %44 %47 
                                              OpStore %43 %48 
                       Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpLoad %11 
                                f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpFAdd %55 %56 
                                              OpStore %50 %57 
                                f32_4 %58 = OpLoad %43 
                                f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                       Uniform f32_4* %60 = OpAccessChain %20 %23 %23 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpFMul %59 %61 
                                              OpStore %9 %62 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %22 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpLoad %43 
                                f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                f32_4 %67 = OpFMul %64 %66 
                                f32_4 %68 = OpLoad %9 
                                f32_4 %69 = OpFAdd %67 %68 
                                              OpStore %9 %69 
                       Uniform f32_4* %70 = OpAccessChain %20 %23 %35 
                                f32_4 %71 = OpLoad %70 
                                f32_4 %72 = OpLoad %43 
                                f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                f32_4 %74 = OpFMul %71 %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpFAdd %74 %75 
                                              OpStore %9 %76 
                       Uniform f32_4* %82 = OpAccessChain %20 %23 %45 
                                f32_4 %83 = OpLoad %82 
                                f32_4 %84 = OpLoad %43 
                                f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                f32_4 %86 = OpFMul %83 %85 
                                f32_4 %87 = OpLoad %9 
                                f32_4 %88 = OpFAdd %86 %87 
                        Output f32_4* %89 = OpAccessChain %81 %22 
                                              OpStore %89 %88 
                                f32_4 %92 = OpLoad %91 
                                              OpStore %90 %92 
                          Output f32* %94 = OpAccessChain %81 %22 %77 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %81 %22 %77 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %104 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
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
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "SHADOWCASTER"
  LOD 200
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
  Offset 1, 1
  GpuProgramID 82317
Program "vp" {
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_TEXCOORD1;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD1.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SHADOWS_DEPTH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 150
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %50 %120 %142 %143 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %50 Location 50 
                                                     OpMemberDecorate %118 0 BuiltIn 118 
                                                     OpMemberDecorate %118 1 BuiltIn 118 
                                                     OpMemberDecorate %118 2 BuiltIn 118 
                                                     OpDecorate %118 Block 
                                                     OpDecorate %142 Location 142 
                                                     OpDecorate %143 Location 143 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                              Private f32_4* %43 = OpVariable Private 
                                         i32 %45 = OpConstant 3 
                                             %49 = OpTypePointer Output %7 
                               Output f32_4* %50 = OpVariable Output 
                                         u32 %84 = OpConstant 0 
                                             %85 = OpTypePointer Uniform %6 
                                         u32 %88 = OpConstant 3 
                                             %89 = OpTypePointer Private %6 
                                         f32 %96 = OpConstant 3.67402E-40 
                                        f32 %101 = OpConstant 3.67402E-40 
                               Private f32* %104 = OpVariable Private 
                                        u32 %105 = OpConstant 2 
                                        u32 %116 = OpConstant 1 
                                            %117 = OpTypeArray %6 %116 
                                            %118 = OpTypeStruct %7 %6 %117 
                                            %119 = OpTypePointer Output %118 
       Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                            %121 = OpTypeVector %6 3 
                                            %140 = OpTypePointer Output %6 
                              Output f32_4* %142 = OpVariable Output 
                               Input f32_4* %143 = OpVariable Input 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %44 = OpLoad %9 
                              Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                       f32_4 %47 = OpLoad %46 
                                       f32_4 %48 = OpFAdd %44 %47 
                                                     OpStore %43 %48 
                              Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpLoad %11 
                                       f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                       f32_4 %55 = OpFMul %52 %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpFAdd %55 %56 
                                                     OpStore %50 %57 
                                       f32_4 %58 = OpLoad %43 
                                       f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                              Uniform f32_4* %60 = OpAccessChain %20 %35 %22 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFMul %59 %61 
                                                     OpStore %9 %62 
                              Uniform f32_4* %63 = OpAccessChain %20 %35 %27 
                                       f32_4 %64 = OpLoad %63 
                                       f32_4 %65 = OpLoad %43 
                                       f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                       f32_4 %67 = OpFMul %64 %66 
                                       f32_4 %68 = OpLoad %9 
                                       f32_4 %69 = OpFAdd %67 %68 
                                                     OpStore %9 %69 
                              Uniform f32_4* %70 = OpAccessChain %20 %35 %35 
                                       f32_4 %71 = OpLoad %70 
                                       f32_4 %72 = OpLoad %43 
                                       f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                       f32_4 %74 = OpFMul %71 %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpFAdd %74 %75 
                                                     OpStore %9 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %35 %45 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %43 
                                       f32_4 %80 = OpVectorShuffle %79 %79 3 3 3 3 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %9 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %9 %83 
                                Uniform f32* %86 = OpAccessChain %20 %27 %84 
                                         f32 %87 = OpLoad %86 
                                Private f32* %90 = OpAccessChain %9 %88 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFDiv %87 %91 
                                Private f32* %93 = OpAccessChain %43 %84 
                                                     OpStore %93 %92 
                                Private f32* %94 = OpAccessChain %43 %84 
                                         f32 %95 = OpLoad %94 
                                         f32 %97 = OpExtInst %1 37 %95 %96 
                                Private f32* %98 = OpAccessChain %43 %84 
                                                     OpStore %98 %97 
                                Private f32* %99 = OpAccessChain %43 %84 
                                        f32 %100 = OpLoad %99 
                                        f32 %102 = OpExtInst %1 40 %100 %101 
                               Private f32* %103 = OpAccessChain %43 %84 
                                                     OpStore %103 %102 
                               Private f32* %106 = OpAccessChain %9 %105 
                                        f32 %107 = OpLoad %106 
                               Private f32* %108 = OpAccessChain %43 %84 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFAdd %107 %109 
                                                     OpStore %104 %110 
                               Private f32* %111 = OpAccessChain %9 %88 
                                        f32 %112 = OpLoad %111 
                                        f32 %113 = OpLoad %104 
                                        f32 %114 = OpExtInst %1 37 %112 %113 
                               Private f32* %115 = OpAccessChain %43 %84 
                                                     OpStore %115 %114 
                                      f32_4 %122 = OpLoad %9 
                                      f32_3 %123 = OpVectorShuffle %122 %122 0 1 3 
                              Output f32_4* %124 = OpAccessChain %120 %27 
                                      f32_4 %125 = OpLoad %124 
                                      f32_4 %126 = OpVectorShuffle %125 %123 4 5 2 6 
                                                     OpStore %124 %126 
                                        f32 %127 = OpLoad %104 
                                        f32 %128 = OpFNegate %127 
                               Private f32* %129 = OpAccessChain %43 %84 
                                        f32 %130 = OpLoad %129 
                                        f32 %131 = OpFAdd %128 %130 
                               Private f32* %132 = OpAccessChain %9 %84 
                                                     OpStore %132 %131 
                               Uniform f32* %133 = OpAccessChain %20 %27 %116 
                                        f32 %134 = OpLoad %133 
                               Private f32* %135 = OpAccessChain %9 %84 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFMul %134 %136 
                                        f32 %138 = OpLoad %104 
                                        f32 %139 = OpFAdd %137 %138 
                                Output f32* %141 = OpAccessChain %120 %27 %105 
                                                     OpStore %141 %139 
                                      f32_4 %144 = OpLoad %143 
                                                     OpStore %142 %144 
                                Output f32* %145 = OpAccessChain %120 %27 %116 
                                        f32 %146 = OpLoad %145 
                                        f32 %147 = OpFNegate %146 
                                Output f32* %148 = OpAccessChain %120 %27 %116 
                                                     OpStore %148 %147 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 175
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %172 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 RelaxedPrecision 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 RelaxedPrecision 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %172 Location 172 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 1 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 2 
                                          i32 %49 = OpConstant 6 
                                          i32 %54 = OpConstant 7 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 9 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 10 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 3 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 4 
                                         i32 %138 = OpConstant 5 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %165 = OpConstant -1 
                                             %171 = OpTypePointer Output %9 
                               Output f32_4* %172 = OpVariable Output 
                                       f32_4 %173 = OpConstantComposite %68 %68 %68 %68 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %164 = OpSelect %163 %20 %14 
                                         i32 %166 = OpIMul %164 %165 
                                        bool %167 = OpINotEqual %166 %14 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                                      OpKill
                                             %169 = OpLabel 
                                                      OpStore %172 %173 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec3 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = u_xlat1.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD1 = u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _TimeEditor;
uniform 	float _Tiling;
uniform 	float _Density;
uniform 	float _Alpha;
uniform 	float _AlphaCut;
uniform 	float _Speed;
uniform 	float _SpeedSecondLayer;
uniform 	vec4 _WindDirection;
uniform 	vec4 _PerlinNormalMap_ST;
uniform 	float _MipLevel;
uniform  sampler2D _PerlinNormalMap;
in  vec3 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0.x = u_xlat0.x * 0.00100000005;
    u_xlat0 = u_xlat0.xxxx * _WindDirection.xzxz;
    u_xlat1 = vs_TEXCOORD1.xzxz / vec4(_Tiling);
    u_xlat0 = u_xlat0 * vec4(_Speed, _Speed, _SpeedSecondLayer, _SpeedSecondLayer) + u_xlat1;
    u_xlat4.xy = u_xlat0.zw + vec2(0.0, 0.5);
    u_xlat0.xy = u_xlat0.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat0.xy, _MipLevel);
    u_xlat0.x = u_xlat10_1.w + _Density;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xy = u_xlat4.xy * _PerlinNormalMap_ST.xy + _PerlinNormalMap_ST.zw;
    u_xlat10_1 = textureLod(_PerlinNormalMap, u_xlat2.xy, _MipLevel);
    u_xlat0.x = vs_COLOR0.w * u_xlat0.x + (-u_xlat10_1.w);
    u_xlat0.x = u_xlat0.x * _Alpha + (-_AlphaCut);
    u_xlat0.x = ceil(u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    SV_Target0 = u_xlat0.xxxx * _LightPositionRange.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SHADOWS_CUBE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %58 %67 %92 %101 %102 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %58 Location 58 
                                                     OpDecorate %67 Location 67 
                                                     OpMemberDecorate %90 0 BuiltIn 90 
                                                     OpMemberDecorate %90 1 BuiltIn 90 
                                                     OpMemberDecorate %90 2 BuiltIn 90 
                                                     OpDecorate %90 Block 
                                                     OpDecorate %101 Location 101 
                                                     OpDecorate %102 Location 102 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                              Private f32_4* %43 = OpVariable Private 
                                         i32 %44 = OpConstant 3 
                                             %56 = OpTypeVector %6 3 
                                             %57 = OpTypePointer Output %56 
                               Output f32_3* %58 = OpVariable Output 
                                             %66 = OpTypePointer Output %7 
                               Output f32_4* %67 = OpVariable Output 
                                         u32 %88 = OpConstant 1 
                                             %89 = OpTypeArray %6 %88 
                                             %90 = OpTypeStruct %7 %6 %89 
                                             %91 = OpTypePointer Output %90 
        Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                              Output f32_4* %101 = OpVariable Output 
                               Input f32_4* %102 = OpVariable Input 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpLoad %11 
                                       f32_4 %48 = OpVectorShuffle %47 %47 3 3 3 3 
                                       f32_4 %49 = OpFMul %46 %48 
                                       f32_4 %50 = OpLoad %9 
                                       f32_4 %51 = OpFAdd %49 %50 
                                                     OpStore %43 %51 
                                       f32_4 %52 = OpLoad %9 
                              Uniform f32_4* %53 = OpAccessChain %20 %22 %44 
                                       f32_4 %54 = OpLoad %53 
                                       f32_4 %55 = OpFAdd %52 %54 
                                                     OpStore %9 %55 
                                       f32_4 %59 = OpLoad %43 
                                       f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                              Uniform f32_4* %61 = OpAccessChain %20 %27 
                                       f32_4 %62 = OpLoad %61 
                                       f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                       f32_3 %64 = OpFNegate %63 
                                       f32_3 %65 = OpFAdd %60 %64 
                                                     OpStore %58 %65 
                                       f32_4 %68 = OpLoad %43 
                                                     OpStore %67 %68 
                                       f32_4 %69 = OpLoad %9 
                                       f32_4 %70 = OpVectorShuffle %69 %69 1 1 1 1 
                              Uniform f32_4* %71 = OpAccessChain %20 %35 %22 
                                       f32_4 %72 = OpLoad %71 
                                       f32_4 %73 = OpFMul %70 %72 
                                                     OpStore %43 %73 
                              Uniform f32_4* %74 = OpAccessChain %20 %35 %27 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %9 
                                       f32_4 %77 = OpVectorShuffle %76 %76 0 0 0 0 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %43 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %43 %80 
                              Uniform f32_4* %81 = OpAccessChain %20 %35 %35 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %43 
                                       f32_4 %87 = OpFAdd %85 %86 
                                                     OpStore %43 %87 
                              Uniform f32_4* %93 = OpAccessChain %20 %35 %44 
                                       f32_4 %94 = OpLoad %93 
                                       f32_4 %95 = OpLoad %9 
                                       f32_4 %96 = OpVectorShuffle %95 %95 3 3 3 3 
                                       f32_4 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %43 
                                       f32_4 %99 = OpFAdd %97 %98 
                              Output f32_4* %100 = OpAccessChain %92 %27 
                                                     OpStore %100 %99 
                                      f32_4 %103 = OpLoad %102 
                                                     OpStore %101 %103 
                                Output f32* %105 = OpAccessChain %92 %27 %88 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %92 %27 %88 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 199
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %121 %174 %191 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %10 0 Offset 10 
                                                      OpMemberDecorate %10 1 Offset 10 
                                                      OpMemberDecorate %10 2 Offset 10 
                                                      OpMemberDecorate %10 3 Offset 10 
                                                      OpMemberDecorate %10 4 RelaxedPrecision 
                                                      OpMemberDecorate %10 4 Offset 10 
                                                      OpMemberDecorate %10 5 RelaxedPrecision 
                                                      OpMemberDecorate %10 5 Offset 10 
                                                      OpMemberDecorate %10 6 RelaxedPrecision 
                                                      OpMemberDecorate %10 6 Offset 10 
                                                      OpMemberDecorate %10 7 RelaxedPrecision 
                                                      OpMemberDecorate %10 7 Offset 10 
                                                      OpMemberDecorate %10 8 RelaxedPrecision 
                                                      OpMemberDecorate %10 8 Offset 10 
                                                      OpMemberDecorate %10 9 RelaxedPrecision 
                                                      OpMemberDecorate %10 9 Offset 10 
                                                      OpMemberDecorate %10 10 RelaxedPrecision 
                                                      OpMemberDecorate %10 10 Offset 10 
                                                      OpMemberDecorate %10 11 Offset 10 
                                                      OpMemberDecorate %10 12 Offset 10 
                                                      OpDecorate %10 Block 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %40 Location 40 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %88 DescriptorSet 88 
                                                      OpDecorate %88 Binding 88 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %191 Location 191 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeStruct %9 %9 %9 %9 %6 %6 %6 %6 %6 %6 %9 %9 %6 
                                              %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 1 
                                              %17 = OpTypePointer Uniform %6 
                                          i32 %20 = OpConstant 3 
                                 Private f32* %24 = OpVariable Private 
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypePointer Private %9 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %32 = OpConstant 10 
                                              %33 = OpTypePointer Uniform %9 
                               Private f32_4* %38 = OpVariable Private 
                                              %39 = OpTypePointer Input %9 
                                 Input f32_4* %40 = OpVariable Input 
                                          i32 %43 = OpConstant 4 
                                          i32 %49 = OpConstant 8 
                                          i32 %54 = OpConstant 9 
                                              %63 = OpTypeVector %6 2 
                                              %64 = OpTypePointer Private %63 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                        f32_2 %70 = OpConstantComposite %68 %69 
                               Private f32_2* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 11 
                                 Private f32* %84 = OpVariable Private 
                                              %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %86 = OpTypeSampledImage %85 
                                              %87 = OpTypePointer UniformConstant %86 
  UniformConstant read_only Texture2DSampled* %88 = OpVariable UniformConstant 
                                          i32 %91 = OpConstant 12 
                                          u32 %95 = OpConstant 3 
                                 Private f32* %97 = OpVariable Private 
                                          i32 %99 = OpConstant 5 
                                         f32 %104 = OpConstant 3.67402E-40 
                                Input f32_4* %121 = OpVariable Input 
                                             %122 = OpTypePointer Input %6 
                                         u32 %130 = OpConstant 0 
                                         i32 %134 = OpConstant 6 
                                         i32 %138 = OpConstant 7 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %157 = OpTypeBool 
                                             %158 = OpTypePointer Private %157 
                               Private bool* %159 = OpVariable Private 
                                         i32 %164 = OpConstant 1 
                                         i32 %166 = OpConstant -1 
                                             %172 = OpTypeVector %6 3 
                                             %173 = OpTypePointer Input %172 
                                Input f32_3* %174 = OpVariable Input 
                                         i32 %185 = OpConstant 2 
                                             %190 = OpTypePointer Output %9 
                               Output f32_4* %191 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                          f32 %19 = OpLoad %18 
                                 Uniform f32* %21 = OpAccessChain %12 %20 %16 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpFAdd %19 %22 
                                                      OpStore %8 %23 
                                          f32 %25 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                          f32 %30 = OpLoad %24 
                                        f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
                               Uniform f32_4* %34 = OpAccessChain %12 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_4 %36 = OpVectorShuffle %35 %35 0 2 0 2 
                                        f32_4 %37 = OpFMul %31 %36 
                                                      OpStore %29 %37 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 2 0 2 
                                 Uniform f32* %44 = OpAccessChain %12 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_4 %46 = OpCompositeConstruct %45 %45 %45 %45 
                                        f32_4 %47 = OpFDiv %42 %46 
                                                      OpStore %38 %47 
                                        f32_4 %48 = OpLoad %29 
                                 Uniform f32* %50 = OpAccessChain %12 %49 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %12 %49 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %55 = OpAccessChain %12 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %12 %54 
                                          f32 %58 = OpLoad %57 
                                        f32_4 %59 = OpCompositeConstruct %51 %53 %56 %58 
                                        f32_4 %60 = OpFMul %48 %59 
                                        f32_4 %61 = OpLoad %38 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %29 %62 
                                        f32_4 %66 = OpLoad %29 
                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                        f32_2 %71 = OpFAdd %67 %70 
                                                      OpStore %65 %71 
                                        f32_4 %73 = OpLoad %29 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                               Uniform f32_4* %76 = OpAccessChain %12 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFMul %74 %78 
                               Uniform f32_4* %80 = OpAccessChain %12 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                                      OpStore %72 %83 
                   read_only Texture2DSampled %89 = OpLoad %88 
                                        f32_2 %90 = OpLoad %72 
                                 Uniform f32* %92 = OpAccessChain %12 %91 
                                          f32 %93 = OpLoad %92 
                                        f32_4 %94 = OpImageSampleExplicitLod %89 %90 Lod %9 
                                          f32 %96 = OpCompositeExtract %94 3 
                                                      OpStore %84 %96 
                                          f32 %98 = OpLoad %84 
                                Uniform f32* %100 = OpAccessChain %12 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFAdd %98 %101 
                                                      OpStore %97 %102 
                                         f32 %103 = OpLoad %97 
                                         f32 %105 = OpExtInst %1 43 %103 %68 %104 
                                                      OpStore %97 %105 
                                       f32_2 %106 = OpLoad %65 
                              Uniform f32_4* %107 = OpAccessChain %12 %75 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                              Uniform f32_4* %111 = OpAccessChain %12 %75 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %72 %114 
                  read_only Texture2DSampled %115 = OpLoad %88 
                                       f32_2 %116 = OpLoad %72 
                                Uniform f32* %117 = OpAccessChain %12 %91 
                                         f32 %118 = OpLoad %117 
                                       f32_4 %119 = OpImageSampleExplicitLod %115 %116 Lod %9 
                                         f32 %120 = OpCompositeExtract %119 3 
                                                      OpStore %84 %120 
                                  Input f32* %123 = OpAccessChain %121 %95 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %97 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %127 = OpLoad %84 
                                         f32 %128 = OpFNegate %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %131 = OpAccessChain %72 %130 
                                                      OpStore %131 %129 
                                Private f32* %132 = OpAccessChain %72 %130 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %12 %134 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFMul %133 %136 
                                Uniform f32* %139 = OpAccessChain %12 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %72 %130 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %72 %130 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 9 %145 
                                Private f32* %147 = OpAccessChain %72 %130 
                                                      OpStore %147 %146 
                                Private f32* %148 = OpAccessChain %72 %130 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpExtInst %1 43 %149 %68 %104 
                                Private f32* %151 = OpAccessChain %72 %130 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %72 %130 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFAdd %153 %154 
                                Private f32* %156 = OpAccessChain %72 %130 
                                                      OpStore %156 %155 
                                Private f32* %160 = OpAccessChain %72 %130 
                                         f32 %161 = OpLoad %160 
                                        bool %162 = OpFOrdLessThan %161 %68 
                                                      OpStore %159 %162 
                                        bool %163 = OpLoad %159 
                                         i32 %165 = OpSelect %163 %164 %14 
                                         i32 %167 = OpIMul %165 %166 
                                        bool %168 = OpINotEqual %167 %14 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %168 %169 %170 
                                             %169 = OpLabel 
                                                      OpKill
                                             %170 = OpLabel 
                                       f32_3 %175 = OpLoad %174 
                                       f32_3 %176 = OpLoad %174 
                                         f32 %177 = OpDot %175 %176 
                                Private f32* %178 = OpAccessChain %72 %130 
                                                      OpStore %178 %177 
                                Private f32* %179 = OpAccessChain %72 %130 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpExtInst %1 31 %180 
                                Private f32* %182 = OpAccessChain %72 %130 
                                                      OpStore %182 %181 
                                Private f32* %183 = OpAccessChain %72 %130 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %186 = OpAccessChain %12 %185 %130 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFAdd %184 %187 
                                Private f32* %189 = OpAccessChain %72 %130 
                                                      OpStore %189 %188 
                                       f32_2 %192 = OpLoad %72 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 0 0 0 
                              Uniform f32_4* %194 = OpAccessChain %12 %164 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpVectorShuffle %195 %195 3 3 3 3 
                                       f32_4 %197 = OpFMul %193 %196 
                                                      OpStore %191 %197 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "vulkan " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "vulkan " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
Fallback "Diffuse"
CustomEditor "ShaderForgeMaterialInspector"
}