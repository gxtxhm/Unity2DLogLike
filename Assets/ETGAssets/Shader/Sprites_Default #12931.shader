//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Sprites/Default" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
_RendererColor ("RendererColor", Color) = (1,1,1,1)
_Flip ("Flip", Vector) = (1,1,1,1)
_AlphaTex ("External Alpha", 2D) = "white" { }
_EnableExternalAlpha ("Enable External Alpha", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 58034
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
uniform 	vec4 _RendererColor;
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0 * _RendererColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 105
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %82 %91 %95 %97 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 RelaxedPrecision 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 RelaxedPrecision 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %82 Location 82 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %97 Location 97 
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
                                              %18 = OpTypeStruct %16 %17 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 0 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %68 = OpConstant 1 
                                              %69 = OpTypeArray %6 %68 
                                              %70 = OpTypeStruct %7 %6 %69 
                                              %71 = OpTypePointer Output %70 
         Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                              %80 = OpTypePointer Output %7 
                                 Input f32_4* %82 = OpVariable Input 
                                Output f32_4* %91 = OpVariable Output 
                                              %93 = OpTypeVector %6 2 
                                              %94 = OpTypePointer Output %93 
                                Output f32_2* %95 = OpVariable Output 
                                              %96 = OpTypePointer Input %93 
                                 Input f32_2* %97 = OpVariable Input 
                                              %99 = OpTypePointer Output %6 
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
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                        f32_4 %83 = OpLoad %82 
                               Uniform f32_4* %84 = OpAccessChain %20 %44 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFMul %83 %85 
                                                      OpStore %9 %86 
                                        f32_4 %87 = OpLoad %9 
                               Uniform f32_4* %88 = OpAccessChain %20 %35 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %87 %89 
                                                      OpStore %9 %90 
                                        f32_4 %92 = OpLoad %9 
                                                      OpStore %91 %92 
                                        f32_2 %98 = OpLoad %97 
                                                      OpStore %95 %98 
                                 Output f32* %100 = OpAccessChain %72 %22 %68 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFNegate %101 
                                 Output f32* %103 = OpAccessChain %72 %22 %68 
                                                      OpStore %103 %102 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 44
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %23 %27 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %23 Location 23 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %27 Location 27 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
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
                                            %22 = OpTypePointer Input %7 
                               Input f32_4* %23 = OpVariable Input 
                                            %26 = OpTypePointer Output %7 
                              Output f32_4* %27 = OpVariable Output 
                                            %28 = OpTypeVector %6 3 
                                            %36 = OpTypeInt 32 0 
                                        u32 %37 = OpConstant 3 
                                            %38 = OpTypePointer Private %6 
                                            %41 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %21 = OpLoad %9 
                                      f32_4 %24 = OpLoad %23 
                                      f32_4 %25 = OpFMul %21 %24 
                                                    OpStore %20 %25 
                                      f32_4 %29 = OpLoad %20 
                                      f32_3 %30 = OpVectorShuffle %29 %29 3 3 3 
                                      f32_4 %31 = OpLoad %20 
                                      f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                                      f32_3 %33 = OpFMul %30 %32 
                                      f32_4 %34 = OpLoad %27 
                                      f32_4 %35 = OpVectorShuffle %34 %33 4 5 6 3 
                                                    OpStore %27 %35 
                               Private f32* %39 = OpAccessChain %20 %37 
                                        f32 %40 = OpLoad %39 
                                Output f32* %42 = OpAccessChain %27 %37 
                                                    OpStore %42 %40 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _RendererColor;
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0 * _RendererColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _EnableExternalAlpha;
uniform  sampler2D _MainTex;
uniform  sampler2D _AlphaTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
void main()
{
    u_xlat10_0 = texture(_AlphaTex, vs_TEXCOORD0.xy);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat10_0.x + (-u_xlat1.w);
    u_xlat1.w = _EnableExternalAlpha * u_xlat0.x + u_xlat1.w;
    u_xlat0 = u_xlat1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 105
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %82 %91 %95 %97 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 RelaxedPrecision 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 RelaxedPrecision 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %82 Location 82 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %97 Location 97 
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
                                              %18 = OpTypeStruct %16 %17 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 0 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %68 = OpConstant 1 
                                              %69 = OpTypeArray %6 %68 
                                              %70 = OpTypeStruct %7 %6 %69 
                                              %71 = OpTypePointer Output %70 
         Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                              %80 = OpTypePointer Output %7 
                                 Input f32_4* %82 = OpVariable Input 
                                Output f32_4* %91 = OpVariable Output 
                                              %93 = OpTypeVector %6 2 
                                              %94 = OpTypePointer Output %93 
                                Output f32_2* %95 = OpVariable Output 
                                              %96 = OpTypePointer Input %93 
                                 Input f32_2* %97 = OpVariable Input 
                                              %99 = OpTypePointer Output %6 
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
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                        f32_4 %83 = OpLoad %82 
                               Uniform f32_4* %84 = OpAccessChain %20 %44 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFMul %83 %85 
                                                      OpStore %9 %86 
                                        f32_4 %87 = OpLoad %9 
                               Uniform f32_4* %88 = OpAccessChain %20 %35 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %87 %89 
                                                      OpStore %9 %90 
                                        f32_4 %92 = OpLoad %9 
                                                      OpStore %91 %92 
                                        f32_2 %98 = OpLoad %97 
                                                      OpStore %95 %98 
                                 Output f32* %100 = OpAccessChain %72 %22 %68 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFNegate %101 
                                 Output f32* %103 = OpAccessChain %72 %22 %68 
                                                      OpStore %103 %102 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 71
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %53 %57 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %25 DescriptorSet 25 
                                                    OpDecorate %25 Binding 25 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpMemberDecorate %36 0 Offset 36 
                                                    OpDecorate %36 Block 
                                                    OpDecorate %38 DescriptorSet 38 
                                                    OpDecorate %38 Binding 38 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %53 Location 53 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %57 Location 57 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 0 
                                            %23 = OpTypePointer Private %18 
                             Private f32_4* %24 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %25 = OpVariable UniformConstant 
                               Private f32* %29 = OpVariable Private 
                                        u32 %31 = OpConstant 3 
                                            %36 = OpTypeStruct %6 
                                            %37 = OpTypePointer Uniform %36 
                     Uniform struct {f32;}* %38 = OpVariable Uniform 
                                            %39 = OpTypeInt 32 1 
                                        i32 %40 = OpConstant 0 
                                            %41 = OpTypePointer Uniform %6 
                             Private f32_4* %50 = OpVariable Private 
                                            %52 = OpTypePointer Input %18 
                               Input f32_4* %53 = OpVariable Input 
                                            %56 = OpTypePointer Output %18 
                              Output f32_4* %57 = OpVariable Output 
                                            %58 = OpTypeVector %6 3 
                                            %68 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 0 
                                                    OpStore %8 %22 
                 read_only Texture2DSampled %26 = OpLoad %25 
                                      f32_2 %27 = OpLoad %16 
                                      f32_4 %28 = OpImageSampleImplicitLod %26 %27 
                                                    OpStore %24 %28 
                                        f32 %30 = OpLoad %8 
                               Private f32* %32 = OpAccessChain %24 %31 
                                        f32 %33 = OpLoad %32 
                                        f32 %34 = OpFNegate %33 
                                        f32 %35 = OpFAdd %30 %34 
                                                    OpStore %29 %35 
                               Uniform f32* %42 = OpAccessChain %38 %40 
                                        f32 %43 = OpLoad %42 
                                        f32 %44 = OpLoad %29 
                                        f32 %45 = OpFMul %43 %44 
                               Private f32* %46 = OpAccessChain %24 %31 
                                        f32 %47 = OpLoad %46 
                                        f32 %48 = OpFAdd %45 %47 
                               Private f32* %49 = OpAccessChain %24 %31 
                                                    OpStore %49 %48 
                                      f32_4 %51 = OpLoad %24 
                                      f32_4 %54 = OpLoad %53 
                                      f32_4 %55 = OpFMul %51 %54 
                                                    OpStore %50 %55 
                                      f32_4 %59 = OpLoad %50 
                                      f32_3 %60 = OpVectorShuffle %59 %59 3 3 3 
                                      f32_4 %61 = OpLoad %50 
                                      f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                      f32_3 %63 = OpFMul %60 %62 
                                      f32_4 %64 = OpLoad %57 
                                      f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                    OpStore %57 %65 
                               Private f32* %66 = OpAccessChain %50 %31 
                                        f32 %67 = OpLoad %66 
                                Output f32* %69 = OpAccessChain %57 %31 
                                                    OpStore %69 %67 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _RendererColor;
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0 * _RendererColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %114 %129 %139 %142 %144 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 RelaxedPrecision 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 RelaxedPrecision 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %112 0 BuiltIn 112 
                                                      OpMemberDecorate %112 1 BuiltIn 112 
                                                      OpMemberDecorate %112 2 BuiltIn 112 
                                                      OpDecorate %112 Block 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %144 Location 144 
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
                                              %18 = OpTypeStruct %7 %16 %17 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          i32 %27 = OpConstant 0 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                              %75 = OpTypeVector %6 2 
                                          f32 %86 = OpConstant 3.67402E-40 
                                        f32_2 %87 = OpConstantComposite %86 %86 
                                         u32 %110 = OpConstant 1 
                                             %111 = OpTypeArray %6 %110 
                                             %112 = OpTypeStruct %7 %6 %111 
                                             %113 = OpTypePointer Output %112 
        Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                             %120 = OpTypePointer Output %7 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %131 = OpConstant 4 
                               Output f32_4* %139 = OpVariable Output 
                                             %141 = OpTypePointer Output %75 
                               Output f32_2* %142 = OpVariable Output 
                                             %143 = OpTypePointer Input %75 
                                Input f32_2* %144 = OpVariable Input 
                                             %146 = OpTypePointer Output %6 
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
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %48 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %9 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                        f32_4 %78 = OpLoad %9 
                                        f32_2 %79 = OpVectorShuffle %78 %78 3 3 
                                        f32_2 %80 = OpFDiv %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                      OpStore %9 %82 
                               Uniform f32_4* %83 = OpAccessChain %20 %27 
                                        f32_4 %84 = OpLoad %83 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_2 %88 = OpFMul %85 %87 
                                        f32_4 %89 = OpLoad %48 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                      OpStore %48 %90 
                                        f32_4 %91 = OpLoad %9 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_4 %93 = OpLoad %48 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %9 %97 
                                        f32_4 %98 = OpLoad %9 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpExtInst %1 2 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                      OpStore %9 %102 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_4 %105 = OpLoad %48 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                       f32_2 %107 = OpFDiv %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                      OpStore %9 %109 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                       f32_4 %117 = OpLoad %9 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFMul %116 %118 
                               Output f32_4* %121 = OpAccessChain %114 %27 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpVectorShuffle %122 %119 4 5 2 3 
                                                      OpStore %121 %123 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                               Output f32_4* %126 = OpAccessChain %114 %27 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpVectorShuffle %127 %125 0 1 4 5 
                                                      OpStore %126 %128 
                                       f32_4 %130 = OpLoad %129 
                              Uniform f32_4* %132 = OpAccessChain %20 %131 
                                       f32_4 %133 = OpLoad %132 
                                       f32_4 %134 = OpFMul %130 %133 
                                                      OpStore %9 %134 
                                       f32_4 %135 = OpLoad %9 
                              Uniform f32_4* %136 = OpAccessChain %20 %44 
                                       f32_4 %137 = OpLoad %136 
                                       f32_4 %138 = OpFMul %135 %137 
                                                      OpStore %9 %138 
                                       f32_4 %140 = OpLoad %9 
                                                      OpStore %139 %140 
                                       f32_2 %145 = OpLoad %144 
                                                      OpStore %142 %145 
                                 Output f32* %147 = OpAccessChain %114 %27 %110 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %114 %27 %110 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 44
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %23 %27 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %23 Location 23 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %27 Location 27 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
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
                                            %22 = OpTypePointer Input %7 
                               Input f32_4* %23 = OpVariable Input 
                                            %26 = OpTypePointer Output %7 
                              Output f32_4* %27 = OpVariable Output 
                                            %28 = OpTypeVector %6 3 
                                            %36 = OpTypeInt 32 0 
                                        u32 %37 = OpConstant 3 
                                            %38 = OpTypePointer Private %6 
                                            %41 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %21 = OpLoad %9 
                                      f32_4 %24 = OpLoad %23 
                                      f32_4 %25 = OpFMul %21 %24 
                                                    OpStore %20 %25 
                                      f32_4 %29 = OpLoad %20 
                                      f32_3 %30 = OpVectorShuffle %29 %29 3 3 3 
                                      f32_4 %31 = OpLoad %20 
                                      f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                                      f32_3 %33 = OpFMul %30 %32 
                                      f32_4 %34 = OpLoad %27 
                                      f32_4 %35 = OpVectorShuffle %34 %33 4 5 6 3 
                                                    OpStore %27 %35 
                               Private f32* %39 = OpAccessChain %20 %37 
                                        f32 %40 = OpLoad %39 
                                Output f32* %42 = OpAccessChain %27 %37 
                                                    OpStore %42 %40 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "ETC1_EXTERNAL_ALPHA" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "ETC1_EXTERNAL_ALPHA" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _RendererColor;
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0 * _RendererColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _EnableExternalAlpha;
uniform  sampler2D _MainTex;
uniform  sampler2D _AlphaTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
void main()
{
    u_xlat10_0 = texture(_AlphaTex, vs_TEXCOORD0.xy);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat10_0.x + (-u_xlat1.w);
    u_xlat1.w = _EnableExternalAlpha * u_xlat0.x + u_xlat1.w;
    u_xlat0 = u_xlat1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "ETC1_EXTERNAL_ALPHA" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %114 %129 %139 %142 %144 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 RelaxedPrecision 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 RelaxedPrecision 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %112 0 BuiltIn 112 
                                                      OpMemberDecorate %112 1 BuiltIn 112 
                                                      OpMemberDecorate %112 2 BuiltIn 112 
                                                      OpDecorate %112 Block 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %144 Location 144 
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
                                              %18 = OpTypeStruct %7 %16 %17 %7 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          i32 %27 = OpConstant 0 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                              %75 = OpTypeVector %6 2 
                                          f32 %86 = OpConstant 3.67402E-40 
                                        f32_2 %87 = OpConstantComposite %86 %86 
                                         u32 %110 = OpConstant 1 
                                             %111 = OpTypeArray %6 %110 
                                             %112 = OpTypeStruct %7 %6 %111 
                                             %113 = OpTypePointer Output %112 
        Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                             %120 = OpTypePointer Output %7 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %131 = OpConstant 4 
                               Output f32_4* %139 = OpVariable Output 
                                             %141 = OpTypePointer Output %75 
                               Output f32_2* %142 = OpVariable Output 
                                             %143 = OpTypePointer Input %75 
                                Input f32_2* %144 = OpVariable Input 
                                             %146 = OpTypePointer Output %6 
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
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %48 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %9 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                        f32_4 %78 = OpLoad %9 
                                        f32_2 %79 = OpVectorShuffle %78 %78 3 3 
                                        f32_2 %80 = OpFDiv %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                      OpStore %9 %82 
                               Uniform f32_4* %83 = OpAccessChain %20 %27 
                                        f32_4 %84 = OpLoad %83 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_2 %88 = OpFMul %85 %87 
                                        f32_4 %89 = OpLoad %48 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                      OpStore %48 %90 
                                        f32_4 %91 = OpLoad %9 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_4 %93 = OpLoad %48 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %9 %97 
                                        f32_4 %98 = OpLoad %9 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpExtInst %1 2 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                      OpStore %9 %102 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_4 %105 = OpLoad %48 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                       f32_2 %107 = OpFDiv %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                      OpStore %9 %109 
                                       f32_4 %115 = OpLoad %9 
                                       f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                       f32_4 %117 = OpLoad %9 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFMul %116 %118 
                               Output f32_4* %121 = OpAccessChain %114 %27 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpVectorShuffle %122 %119 4 5 2 3 
                                                      OpStore %121 %123 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                               Output f32_4* %126 = OpAccessChain %114 %27 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpVectorShuffle %127 %125 0 1 4 5 
                                                      OpStore %126 %128 
                                       f32_4 %130 = OpLoad %129 
                              Uniform f32_4* %132 = OpAccessChain %20 %131 
                                       f32_4 %133 = OpLoad %132 
                                       f32_4 %134 = OpFMul %130 %133 
                                                      OpStore %9 %134 
                                       f32_4 %135 = OpLoad %9 
                              Uniform f32_4* %136 = OpAccessChain %20 %44 
                                       f32_4 %137 = OpLoad %136 
                                       f32_4 %138 = OpFMul %135 %137 
                                                      OpStore %9 %138 
                                       f32_4 %140 = OpLoad %9 
                                                      OpStore %139 %140 
                                       f32_2 %145 = OpLoad %144 
                                                      OpStore %142 %145 
                                 Output f32* %147 = OpAccessChain %114 %27 %110 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %114 %27 %110 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 71
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %53 %57 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %25 DescriptorSet 25 
                                                    OpDecorate %25 Binding 25 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpMemberDecorate %36 0 Offset 36 
                                                    OpDecorate %36 Block 
                                                    OpDecorate %38 DescriptorSet 38 
                                                    OpDecorate %38 Binding 38 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %53 Location 53 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %57 Location 57 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 0 
                                            %23 = OpTypePointer Private %18 
                             Private f32_4* %24 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %25 = OpVariable UniformConstant 
                               Private f32* %29 = OpVariable Private 
                                        u32 %31 = OpConstant 3 
                                            %36 = OpTypeStruct %6 
                                            %37 = OpTypePointer Uniform %36 
                     Uniform struct {f32;}* %38 = OpVariable Uniform 
                                            %39 = OpTypeInt 32 1 
                                        i32 %40 = OpConstant 0 
                                            %41 = OpTypePointer Uniform %6 
                             Private f32_4* %50 = OpVariable Private 
                                            %52 = OpTypePointer Input %18 
                               Input f32_4* %53 = OpVariable Input 
                                            %56 = OpTypePointer Output %18 
                              Output f32_4* %57 = OpVariable Output 
                                            %58 = OpTypeVector %6 3 
                                            %68 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 0 
                                                    OpStore %8 %22 
                 read_only Texture2DSampled %26 = OpLoad %25 
                                      f32_2 %27 = OpLoad %16 
                                      f32_4 %28 = OpImageSampleImplicitLod %26 %27 
                                                    OpStore %24 %28 
                                        f32 %30 = OpLoad %8 
                               Private f32* %32 = OpAccessChain %24 %31 
                                        f32 %33 = OpLoad %32 
                                        f32 %34 = OpFNegate %33 
                                        f32 %35 = OpFAdd %30 %34 
                                                    OpStore %29 %35 
                               Uniform f32* %42 = OpAccessChain %38 %40 
                                        f32 %43 = OpLoad %42 
                                        f32 %44 = OpLoad %29 
                                        f32 %45 = OpFMul %43 %44 
                               Private f32* %46 = OpAccessChain %24 %31 
                                        f32 %47 = OpLoad %46 
                                        f32 %48 = OpFAdd %45 %47 
                               Private f32* %49 = OpAccessChain %24 %31 
                                                    OpStore %49 %48 
                                      f32_4 %51 = OpLoad %24 
                                      f32_4 %54 = OpLoad %53 
                                      f32_4 %55 = OpFMul %51 %54 
                                                    OpStore %50 %55 
                                      f32_4 %59 = OpLoad %50 
                                      f32_3 %60 = OpVectorShuffle %59 %59 3 3 3 
                                      f32_4 %61 = OpLoad %50 
                                      f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                      f32_3 %63 = OpFMul %60 %62 
                                      f32_4 %64 = OpLoad %57 
                                      f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                    OpStore %57 %65 
                               Private f32* %66 = OpAccessChain %50 %31 
                                        f32 %67 = OpLoad %66 
                                Output f32* %69 = OpAccessChain %57 %31 
                                                    OpStore %69 %67 
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
SubProgram "d3d11 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
""
}
SubProgram "vulkan " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
""
}
SubProgram "d3d11 " {
Keywords { "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "ETC1_EXTERNAL_ALPHA" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "ETC1_EXTERNAL_ALPHA" "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "ETC1_EXTERNAL_ALPHA" "PIXELSNAP_ON" }
""
}
}
}
}
}