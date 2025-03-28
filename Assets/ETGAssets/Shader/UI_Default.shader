//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Default" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "DEFAULT"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 50738
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
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TextureSampleAdd;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
    SV_Target0 = u_xlat0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate %91 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate %95 Location 95 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                               Output f32_2* %91 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                               Output f32_4* %95 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
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
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore %91 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore %95 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 40
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %33 %37 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpMemberDecorate %22 0 RelaxedPrecision 
                                                    OpMemberDecorate %22 0 Offset 22 
                                                    OpDecorate %22 Block 
                                                    OpDecorate %24 DescriptorSet 24 
                                                    OpDecorate %24 Binding 24 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %33 Location 33 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %37 Location 37 
                                                    OpDecorate %38 RelaxedPrecision 
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
                                            %22 = OpTypeStruct %7 
                                            %23 = OpTypePointer Uniform %22 
                   Uniform struct {f32_4;}* %24 = OpVariable Uniform 
                                            %25 = OpTypeInt 32 1 
                                        i32 %26 = OpConstant 0 
                                            %27 = OpTypePointer Uniform %7 
                                            %32 = OpTypePointer Input %7 
                               Input f32_4* %33 = OpVariable Input 
                                            %36 = OpTypePointer Output %7 
                              Output f32_4* %37 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %21 = OpLoad %9 
                             Uniform f32_4* %28 = OpAccessChain %24 %26 
                                      f32_4 %29 = OpLoad %28 
                                      f32_4 %30 = OpFAdd %21 %29 
                                                    OpStore %20 %30 
                                      f32_4 %31 = OpLoad %20 
                                      f32_4 %34 = OpLoad %33 
                                      f32_4 %35 = OpFMul %31 %34 
                                                    OpStore %20 %35 
                                      f32_4 %38 = OpLoad %20 
                                                    OpStore %37 %38 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TextureSampleAdd;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + _TextureSampleAdd;
    u_xlat1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    u_xlatb0 = u_xlat1<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate %91 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate %95 Location 95 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                               Output f32_2* %91 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                               Output f32_4* %95 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
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
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore %91 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore %95 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 67
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %38 %49 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpMemberDecorate %22 0 RelaxedPrecision 
                                                    OpMemberDecorate %22 0 Offset 22 
                                                    OpDecorate %22 Block 
                                                    OpDecorate %24 DescriptorSet 24 
                                                    OpDecorate %24 Binding 24 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %38 Location 38 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %47 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %49 Location 49 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %54 RelaxedPrecision 
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
                                            %22 = OpTypeStruct %7 
                                            %23 = OpTypePointer Uniform %22 
                   Uniform struct {f32_4;}* %24 = OpVariable Uniform 
                                            %25 = OpTypeInt 32 1 
                                        i32 %26 = OpConstant 0 
                                            %27 = OpTypePointer Uniform %7 
                                            %31 = OpTypePointer Private %6 
                               Private f32* %32 = OpVariable Private 
                                            %33 = OpTypeInt 32 0 
                                        u32 %34 = OpConstant 3 
                                            %37 = OpTypePointer Input %7 
                               Input f32_4* %38 = OpVariable Input 
                                            %39 = OpTypePointer Input %6 
                                        f32 %43 = OpConstant 3.67402E-40 
                                            %48 = OpTypePointer Output %7 
                              Output f32_4* %49 = OpVariable Output 
                                            %51 = OpTypeBool 
                                            %52 = OpTypePointer Private %51 
                              Private bool* %53 = OpVariable Private 
                                        f32 %55 = OpConstant 3.67402E-40 
                                        i32 %58 = OpConstant 1 
                                        i32 %60 = OpConstant -1 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %21 = OpLoad %9 
                             Uniform f32_4* %28 = OpAccessChain %24 %26 
                                      f32_4 %29 = OpLoad %28 
                                      f32_4 %30 = OpFAdd %21 %29 
                                                    OpStore %20 %30 
                               Private f32* %35 = OpAccessChain %20 %34 
                                        f32 %36 = OpLoad %35 
                                 Input f32* %40 = OpAccessChain %38 %34 
                                        f32 %41 = OpLoad %40 
                                        f32 %42 = OpFMul %36 %41 
                                        f32 %44 = OpFAdd %42 %43 
                                                    OpStore %32 %44 
                                      f32_4 %45 = OpLoad %20 
                                      f32_4 %46 = OpLoad %38 
                                      f32_4 %47 = OpFMul %45 %46 
                                                    OpStore %20 %47 
                                      f32_4 %50 = OpLoad %20 
                                                    OpStore %49 %50 
                                        f32 %54 = OpLoad %32 
                                       bool %56 = OpFOrdLessThan %54 %55 
                                                    OpStore %53 %56 
                                       bool %57 = OpLoad %53 
                                        i32 %59 = OpSelect %57 %58 %26 
                                        i32 %61 = OpIMul %59 %60 
                                       bool %62 = OpINotEqual %61 %26 
                                                    OpSelectionMerge %64 None 
                                                    OpBranchConditional %62 %63 %64 
                                            %63 = OpLabel 
                                                    OpKill
                                            %64 = OpLabel 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate %91 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate %95 Location 95 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                               Output f32_2* %91 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                               Output f32_4* %95 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
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
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore %91 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore %95 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 98
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %13 %73 %84 %95 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %13 Location 13 
                                                    OpMemberDecorate %16 0 RelaxedPrecision 
                                                    OpMemberDecorate %16 0 Offset 16 
                                                    OpMemberDecorate %16 1 Offset 16 
                                                    OpDecorate %16 Block 
                                                    OpDecorate %18 DescriptorSet 18 
                                                    OpDecorate %18 Binding 18 
                                                    OpDecorate %66 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %70 DescriptorSet 70 
                                                    OpDecorate %70 Binding 70 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %73 Location 73 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %84 Location 84 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %95 Location 95 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeBool 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                             Private bool_4* %9 = OpVariable Private 
                                            %10 = OpTypeFloat 32 
                                            %11 = OpTypeVector %10 4 
                                            %12 = OpTypePointer Input %11 
                               Input f32_4* %13 = OpVariable Input 
                                            %16 = OpTypeStruct %11 %11 
                                            %17 = OpTypePointer Uniform %16 
            Uniform struct {f32_4; f32_4;}* %18 = OpVariable Uniform 
                                            %19 = OpTypeInt 32 1 
                                        i32 %20 = OpConstant 1 
                                            %21 = OpTypePointer Uniform %11 
                                            %26 = OpTypeVector %6 2 
                                            %39 = OpTypePointer Private %11 
                             Private f32_4* %40 = OpVariable Private 
                                        f32 %41 = OpConstant 3.67402E-40 
                                      f32_4 %42 = OpConstantComposite %41 %41 %41 %41 
                                        f32 %43 = OpConstant 3.67402E-40 
                                      f32_4 %44 = OpConstantComposite %43 %43 %43 %43 
                                            %48 = OpTypeVector %10 2 
                                            %56 = OpTypeInt 32 0 
                                        u32 %57 = OpConstant 1 
                                            %58 = OpTypePointer Private %10 
                                        u32 %61 = OpConstant 0 
                             Private f32_4* %66 = OpVariable Private 
                                            %67 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                            %68 = OpTypeSampledImage %67 
                                            %69 = OpTypePointer UniformConstant %68 
UniformConstant read_only Texture2DSampled* %70 = OpVariable UniformConstant 
                                            %72 = OpTypePointer Input %48 
                               Input f32_2* %73 = OpVariable Input 
                             Private f32_4* %76 = OpVariable Private 
                                        i32 %78 = OpConstant 0 
                             Private f32_4* %82 = OpVariable Private 
                               Input f32_4* %84 = OpVariable Input 
                                        u32 %89 = OpConstant 3 
                                            %94 = OpTypePointer Output %11 
                              Output f32_4* %95 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_4 %14 = OpLoad %13 
                                      f32_4 %15 = OpVectorShuffle %14 %14 0 1 0 0 
                             Uniform f32_4* %22 = OpAccessChain %18 %20 
                                      f32_4 %23 = OpLoad %22 
                                      f32_4 %24 = OpVectorShuffle %23 %23 0 1 0 0 
                                     bool_4 %25 = OpFOrdGreaterThanEqual %15 %24 
                                     bool_2 %27 = OpVectorShuffle %25 %25 0 1 
                                     bool_4 %28 = OpLoad %9 
                                     bool_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                    OpStore %9 %29 
                             Uniform f32_4* %30 = OpAccessChain %18 %20 
                                      f32_4 %31 = OpLoad %30 
                                      f32_4 %32 = OpVectorShuffle %31 %31 2 2 2 3 
                                      f32_4 %33 = OpLoad %13 
                                      f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 1 
                                     bool_4 %35 = OpFOrdGreaterThanEqual %32 %34 
                                     bool_2 %36 = OpVectorShuffle %35 %35 2 3 
                                     bool_4 %37 = OpLoad %9 
                                     bool_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                                    OpStore %9 %38 
                                     bool_4 %45 = OpLoad %9 
                                      f32_4 %46 = OpSelect %45 %44 %42 
                                      f32_4 %47 = OpExtInst %1 46 %42 %44 %46 
                                                    OpStore %40 %47 
                                      f32_4 %49 = OpLoad %40 
                                      f32_2 %50 = OpVectorShuffle %49 %49 2 3 
                                      f32_4 %51 = OpLoad %40 
                                      f32_2 %52 = OpVectorShuffle %51 %51 0 1 
                                      f32_2 %53 = OpFMul %50 %52 
                                      f32_4 %54 = OpLoad %40 
                                      f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                    OpStore %40 %55 
                               Private f32* %59 = OpAccessChain %40 %57 
                                        f32 %60 = OpLoad %59 
                               Private f32* %62 = OpAccessChain %40 %61 
                                        f32 %63 = OpLoad %62 
                                        f32 %64 = OpFMul %60 %63 
                               Private f32* %65 = OpAccessChain %40 %61 
                                                    OpStore %65 %64 
                 read_only Texture2DSampled %71 = OpLoad %70 
                                      f32_2 %74 = OpLoad %73 
                                      f32_4 %75 = OpImageSampleImplicitLod %71 %74 
                                                    OpStore %66 %75 
                                      f32_4 %77 = OpLoad %66 
                             Uniform f32_4* %79 = OpAccessChain %18 %78 
                                      f32_4 %80 = OpLoad %79 
                                      f32_4 %81 = OpFAdd %77 %80 
                                                    OpStore %76 %81 
                                      f32_4 %83 = OpLoad %76 
                                      f32_4 %85 = OpLoad %84 
                                      f32_4 %86 = OpFMul %83 %85 
                                                    OpStore %82 %86 
                               Private f32* %87 = OpAccessChain %40 %61 
                                        f32 %88 = OpLoad %87 
                               Private f32* %90 = OpAccessChain %82 %89 
                                        f32 %91 = OpLoad %90 
                                        f32 %92 = OpFMul %88 %91 
                               Private f32* %93 = OpAccessChain %82 %89 
                                                    OpStore %93 %92 
                                      f32_4 %96 = OpLoad %82 
                                                    OpStore %95 %96 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_CLIP_RECT" "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_CLIP_RECT" "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
float u_xlat2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0.x = u_xlat2<0.0;
    if((int(u_xlatb0.x) * int(0xffffffffu))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_CLIP_RECT" "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate %91 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate %95 Location 95 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                               Output f32_2* %91 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                               Output f32_4* %95 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
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
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore %91 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore %95 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 119
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %13 %73 %84 %103 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %13 Location 13 
                                                    OpMemberDecorate %16 0 RelaxedPrecision 
                                                    OpMemberDecorate %16 0 Offset 16 
                                                    OpMemberDecorate %16 1 Offset 16 
                                                    OpDecorate %16 Block 
                                                    OpDecorate %18 DescriptorSet 18 
                                                    OpDecorate %18 Binding 18 
                                                    OpDecorate %66 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %70 DescriptorSet 70 
                                                    OpDecorate %70 Binding 70 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %73 Location 73 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %84 Location 84 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %103 Location 103 
                                                    OpDecorate %105 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeBool 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                             Private bool_4* %9 = OpVariable Private 
                                            %10 = OpTypeFloat 32 
                                            %11 = OpTypeVector %10 4 
                                            %12 = OpTypePointer Input %11 
                               Input f32_4* %13 = OpVariable Input 
                                            %16 = OpTypeStruct %11 %11 
                                            %17 = OpTypePointer Uniform %16 
            Uniform struct {f32_4; f32_4;}* %18 = OpVariable Uniform 
                                            %19 = OpTypeInt 32 1 
                                        i32 %20 = OpConstant 1 
                                            %21 = OpTypePointer Uniform %11 
                                            %26 = OpTypeVector %6 2 
                                            %39 = OpTypePointer Private %11 
                             Private f32_4* %40 = OpVariable Private 
                                        f32 %41 = OpConstant 3.67402E-40 
                                      f32_4 %42 = OpConstantComposite %41 %41 %41 %41 
                                        f32 %43 = OpConstant 3.67402E-40 
                                      f32_4 %44 = OpConstantComposite %43 %43 %43 %43 
                                            %48 = OpTypeVector %10 2 
                                            %56 = OpTypeInt 32 0 
                                        u32 %57 = OpConstant 1 
                                            %58 = OpTypePointer Private %10 
                                        u32 %61 = OpConstant 0 
                             Private f32_4* %66 = OpVariable Private 
                                            %67 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                            %68 = OpTypeSampledImage %67 
                                            %69 = OpTypePointer UniformConstant %68 
UniformConstant read_only Texture2DSampled* %70 = OpVariable UniformConstant 
                                            %72 = OpTypePointer Input %48 
                               Input f32_2* %73 = OpVariable Input 
                             Private f32_4* %76 = OpVariable Private 
                                        i32 %78 = OpConstant 0 
                             Private f32_4* %82 = OpVariable Private 
                               Input f32_4* %84 = OpVariable Input 
                               Private f32* %87 = OpVariable Private 
                                        u32 %88 = OpConstant 3 
                                        f32 %94 = OpConstant 3.67402E-40 
                                           %102 = OpTypePointer Output %11 
                             Output f32_4* %103 = OpVariable Output 
                                       i32 %112 = OpConstant -1 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_4 %14 = OpLoad %13 
                                      f32_4 %15 = OpVectorShuffle %14 %14 0 1 0 0 
                             Uniform f32_4* %22 = OpAccessChain %18 %20 
                                      f32_4 %23 = OpLoad %22 
                                      f32_4 %24 = OpVectorShuffle %23 %23 0 1 0 0 
                                     bool_4 %25 = OpFOrdGreaterThanEqual %15 %24 
                                     bool_2 %27 = OpVectorShuffle %25 %25 0 1 
                                     bool_4 %28 = OpLoad %9 
                                     bool_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                    OpStore %9 %29 
                             Uniform f32_4* %30 = OpAccessChain %18 %20 
                                      f32_4 %31 = OpLoad %30 
                                      f32_4 %32 = OpVectorShuffle %31 %31 2 2 2 3 
                                      f32_4 %33 = OpLoad %13 
                                      f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 1 
                                     bool_4 %35 = OpFOrdGreaterThanEqual %32 %34 
                                     bool_2 %36 = OpVectorShuffle %35 %35 2 3 
                                     bool_4 %37 = OpLoad %9 
                                     bool_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                                    OpStore %9 %38 
                                     bool_4 %45 = OpLoad %9 
                                      f32_4 %46 = OpSelect %45 %44 %42 
                                      f32_4 %47 = OpExtInst %1 46 %42 %44 %46 
                                                    OpStore %40 %47 
                                      f32_4 %49 = OpLoad %40 
                                      f32_2 %50 = OpVectorShuffle %49 %49 2 3 
                                      f32_4 %51 = OpLoad %40 
                                      f32_2 %52 = OpVectorShuffle %51 %51 0 1 
                                      f32_2 %53 = OpFMul %50 %52 
                                      f32_4 %54 = OpLoad %40 
                                      f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                    OpStore %40 %55 
                               Private f32* %59 = OpAccessChain %40 %57 
                                        f32 %60 = OpLoad %59 
                               Private f32* %62 = OpAccessChain %40 %61 
                                        f32 %63 = OpLoad %62 
                                        f32 %64 = OpFMul %60 %63 
                               Private f32* %65 = OpAccessChain %40 %61 
                                                    OpStore %65 %64 
                 read_only Texture2DSampled %71 = OpLoad %70 
                                      f32_2 %74 = OpLoad %73 
                                      f32_4 %75 = OpImageSampleImplicitLod %71 %74 
                                                    OpStore %66 %75 
                                      f32_4 %77 = OpLoad %66 
                             Uniform f32_4* %79 = OpAccessChain %18 %78 
                                      f32_4 %80 = OpLoad %79 
                                      f32_4 %81 = OpFAdd %77 %80 
                                                    OpStore %76 %81 
                                      f32_4 %83 = OpLoad %76 
                                      f32_4 %85 = OpLoad %84 
                                      f32_4 %86 = OpFMul %83 %85 
                                                    OpStore %82 %86 
                               Private f32* %89 = OpAccessChain %82 %88 
                                        f32 %90 = OpLoad %89 
                               Private f32* %91 = OpAccessChain %40 %61 
                                        f32 %92 = OpLoad %91 
                                        f32 %93 = OpFMul %90 %92 
                                        f32 %95 = OpFAdd %93 %94 
                                                    OpStore %87 %95 
                               Private f32* %96 = OpAccessChain %40 %61 
                                        f32 %97 = OpLoad %96 
                               Private f32* %98 = OpAccessChain %82 %88 
                                        f32 %99 = OpLoad %98 
                                       f32 %100 = OpFMul %97 %99 
                              Private f32* %101 = OpAccessChain %82 %88 
                                                    OpStore %101 %100 
                                     f32_4 %104 = OpLoad %82 
                                                    OpStore %103 %104 
                                       f32 %105 = OpLoad %87 
                                      bool %106 = OpFOrdLessThan %105 %41 
                                    bool_4 %107 = OpLoad %9 
                                    bool_4 %108 = OpCompositeInsert %106 %107 0 
                                                    OpStore %9 %108 
                                    bool_4 %109 = OpLoad %9 
                                      bool %110 = OpCompositeExtract %109 0 
                                       i32 %111 = OpSelect %110 %20 %78 
                                       i32 %113 = OpIMul %111 %112 
                                      bool %114 = OpINotEqual %113 %78 
                                                    OpSelectionMerge %116 None 
                                                    OpBranchConditional %114 %115 %116 
                                           %115 = OpLabel 
                                                    OpKill
                                           %116 = OpLabel 
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
Keywords { "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "d3d11 " {
Keywords { "UNITY_UI_CLIP_RECT" "UNITY_UI_ALPHACLIP" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_UI_CLIP_RECT" "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_UI_CLIP_RECT" "UNITY_UI_ALPHACLIP" }
""
}
}
}
}
}