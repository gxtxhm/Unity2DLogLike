//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Sprites/Mask" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_AlphaTex ("External Alpha", 2D) = "white" { }
_Cutoff ("Mask alpha cutoff", Range(0, 1)) = 0
_Color ("Tint", Color) = (1,1,1,0.2)
_EnableExternalAlpha ("Enable External Alpha", Float) = 0
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ColorMask 0 0
  ZWrite Off
  Cull Off
  GpuProgramID 59372
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Color;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0.w + (-_Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = _Color;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate %84 RelaxedPrecision 
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
                        Output f32_2* %84 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_2 %87 = OpLoad %86 
                                              OpStore %84 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 56
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %51 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %17 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpMemberDecorate %25 0 RelaxedPrecision 
                                                    OpMemberDecorate %25 0 Offset 25 
                                                    OpMemberDecorate %25 1 RelaxedPrecision 
                                                    OpMemberDecorate %25 1 Offset 25 
                                                    OpDecorate %25 Block 
                                                    OpDecorate %27 DescriptorSet 27 
                                                    OpDecorate %27 Binding 27 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %51 Location 51 
                                                    OpDecorate %54 RelaxedPrecision 
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
                                        u32 %21 = OpConstant 3 
                               Private f32* %23 = OpVariable Private 
                                            %25 = OpTypeStruct %18 %6 
                                            %26 = OpTypePointer Uniform %25 
              Uniform struct {f32_4; f32;}* %27 = OpVariable Uniform 
                                            %28 = OpTypeInt 32 1 
                                        i32 %29 = OpConstant 1 
                                            %30 = OpTypePointer Uniform %6 
                                            %35 = OpTypeBool 
                                            %36 = OpTypePointer Private %35 
                              Private bool* %37 = OpVariable Private 
                                        f32 %39 = OpConstant 3.67402E-40 
                                        i32 %42 = OpConstant 0 
                                        i32 %44 = OpConstant -1 
                                            %50 = OpTypePointer Output %18 
                              Output f32_4* %51 = OpVariable Output 
                                            %52 = OpTypePointer Uniform %18 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %24 = OpLoad %8 
                               Uniform f32* %31 = OpAccessChain %27 %29 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFNegate %32 
                                        f32 %34 = OpFAdd %24 %33 
                                                    OpStore %23 %34 
                                        f32 %38 = OpLoad %23 
                                       bool %40 = OpFOrdLessThan %38 %39 
                                                    OpStore %37 %40 
                                       bool %41 = OpLoad %37 
                                        i32 %43 = OpSelect %41 %29 %42 
                                        i32 %45 = OpIMul %43 %44 
                                       bool %46 = OpINotEqual %45 %42 
                                                    OpSelectionMerge %48 None 
                                                    OpBranchConditional %46 %47 %48 
                                            %47 = OpLabel 
                                                    OpKill
                                            %48 = OpLabel 
                             Uniform f32_4* %53 = OpAccessChain %27 %42 
                                      f32_4 %54 = OpLoad %53 
                                                    OpStore %51 %54 
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
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _EnableExternalAlpha;
uniform 	vec4 _Color;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _AlphaTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_AlphaTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.x + (-u_xlat10_1.w);
    u_xlat0 = _EnableExternalAlpha * u_xlat16_0 + u_xlat10_1.w;
    u_xlat0 = u_xlat0 + (-_Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = _Color;
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
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate %84 RelaxedPrecision 
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
                        Output f32_2* %84 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_2 %87 = OpLoad %86 
                                              OpStore %84 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 76
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %71 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %17 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %24 DescriptorSet 24 
                                                    OpDecorate %24 Binding 24 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpMemberDecorate %36 0 Offset 36 
                                                    OpMemberDecorate %36 1 RelaxedPrecision 
                                                    OpMemberDecorate %36 1 Offset 36 
                                                    OpMemberDecorate %36 2 RelaxedPrecision 
                                                    OpMemberDecorate %36 2 Offset 36 
                                                    OpDecorate %36 Block 
                                                    OpDecorate %38 DescriptorSet 38 
                                                    OpDecorate %38 Binding 38 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %71 Location 71 
                                                    OpDecorate %74 RelaxedPrecision 
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
                               Private f32* %23 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %24 = OpVariable UniformConstant 
                                        u32 %28 = OpConstant 3 
                               Private f32* %30 = OpVariable Private 
                               Private f32* %35 = OpVariable Private 
                                            %36 = OpTypeStruct %6 %18 %6 
                                            %37 = OpTypePointer Uniform %36 
         Uniform struct {f32; f32_4; f32;}* %38 = OpVariable Uniform 
                                            %39 = OpTypeInt 32 1 
                                        i32 %40 = OpConstant 0 
                                            %41 = OpTypePointer Uniform %6 
                               Private f32* %48 = OpVariable Private 
                                        i32 %50 = OpConstant 2 
                                            %55 = OpTypeBool 
                                            %56 = OpTypePointer Private %55 
                              Private bool* %57 = OpVariable Private 
                                        f32 %59 = OpConstant 3.67402E-40 
                                        i32 %62 = OpConstant 1 
                                        i32 %64 = OpConstant -1 
                                            %70 = OpTypePointer Output %18 
                              Output f32_4* %71 = OpVariable Output 
                                            %72 = OpTypePointer Uniform %18 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 0 
                                                    OpStore %8 %22 
                 read_only Texture2DSampled %25 = OpLoad %24 
                                      f32_2 %26 = OpLoad %16 
                                      f32_4 %27 = OpImageSampleImplicitLod %25 %26 
                                        f32 %29 = OpCompositeExtract %27 3 
                                                    OpStore %23 %29 
                                        f32 %31 = OpLoad %23 
                                        f32 %32 = OpFNegate %31 
                                        f32 %33 = OpLoad %8 
                                        f32 %34 = OpFAdd %32 %33 
                                                    OpStore %30 %34 
                               Uniform f32* %42 = OpAccessChain %38 %40 
                                        f32 %43 = OpLoad %42 
                                        f32 %44 = OpLoad %30 
                                        f32 %45 = OpFMul %43 %44 
                                        f32 %46 = OpLoad %23 
                                        f32 %47 = OpFAdd %45 %46 
                                                    OpStore %35 %47 
                                        f32 %49 = OpLoad %35 
                               Uniform f32* %51 = OpAccessChain %38 %50 
                                        f32 %52 = OpLoad %51 
                                        f32 %53 = OpFNegate %52 
                                        f32 %54 = OpFAdd %49 %53 
                                                    OpStore %48 %54 
                                        f32 %58 = OpLoad %48 
                                       bool %60 = OpFOrdLessThan %58 %59 
                                                    OpStore %57 %60 
                                       bool %61 = OpLoad %57 
                                        i32 %63 = OpSelect %61 %62 %40 
                                        i32 %65 = OpIMul %63 %64 
                                       bool %66 = OpINotEqual %65 %40 
                                                    OpSelectionMerge %68 None 
                                                    OpBranchConditional %66 %67 %68 
                                            %67 = OpLabel 
                                                    OpKill
                                            %68 = OpLabel 
                             Uniform f32_4* %73 = OpAccessChain %38 %62 
                                      f32_4 %74 = OpLoad %73 
                                                    OpStore %71 %74 
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
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Color;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0.w + (-_Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = _Color;
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
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %114 %130 %132 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
                                                     OpDecorate %130 RelaxedPrecision 
                                                     OpDecorate %130 Location 130 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %133 RelaxedPrecision 
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
                                            %129 = OpTypePointer Output %75 
                              Output f32_2* %130 = OpVariable Output 
                                            %131 = OpTypePointer Input %75 
                               Input f32_2* %132 = OpVariable Input 
                                            %134 = OpTypePointer Output %6 
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
                                      f32_2 %133 = OpLoad %132 
                                                     OpStore %130 %133 
                                Output f32* %135 = OpAccessChain %114 %27 %110 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %114 %27 %110 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 56
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %51 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %17 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpMemberDecorate %25 0 RelaxedPrecision 
                                                    OpMemberDecorate %25 0 Offset 25 
                                                    OpMemberDecorate %25 1 RelaxedPrecision 
                                                    OpMemberDecorate %25 1 Offset 25 
                                                    OpDecorate %25 Block 
                                                    OpDecorate %27 DescriptorSet 27 
                                                    OpDecorate %27 Binding 27 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %51 Location 51 
                                                    OpDecorate %54 RelaxedPrecision 
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
                                        u32 %21 = OpConstant 3 
                               Private f32* %23 = OpVariable Private 
                                            %25 = OpTypeStruct %18 %6 
                                            %26 = OpTypePointer Uniform %25 
              Uniform struct {f32_4; f32;}* %27 = OpVariable Uniform 
                                            %28 = OpTypeInt 32 1 
                                        i32 %29 = OpConstant 1 
                                            %30 = OpTypePointer Uniform %6 
                                            %35 = OpTypeBool 
                                            %36 = OpTypePointer Private %35 
                              Private bool* %37 = OpVariable Private 
                                        f32 %39 = OpConstant 3.67402E-40 
                                        i32 %42 = OpConstant 0 
                                        i32 %44 = OpConstant -1 
                                            %50 = OpTypePointer Output %18 
                              Output f32_4* %51 = OpVariable Output 
                                            %52 = OpTypePointer Uniform %18 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %24 = OpLoad %8 
                               Uniform f32* %31 = OpAccessChain %27 %29 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFNegate %32 
                                        f32 %34 = OpFAdd %24 %33 
                                                    OpStore %23 %34 
                                        f32 %38 = OpLoad %23 
                                       bool %40 = OpFOrdLessThan %38 %39 
                                                    OpStore %37 %40 
                                       bool %41 = OpLoad %37 
                                        i32 %43 = OpSelect %41 %29 %42 
                                        i32 %45 = OpIMul %43 %44 
                                       bool %46 = OpINotEqual %45 %42 
                                                    OpSelectionMerge %48 None 
                                                    OpBranchConditional %46 %47 %48 
                                            %47 = OpLabel 
                                                    OpKill
                                            %48 = OpLabel 
                             Uniform f32_4* %53 = OpAccessChain %27 %42 
                                      f32_4 %54 = OpLoad %53 
                                                    OpStore %51 %54 
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
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _EnableExternalAlpha;
uniform 	vec4 _Color;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _AlphaTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_AlphaTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0.x + (-u_xlat10_1.w);
    u_xlat0 = _EnableExternalAlpha * u_xlat16_0 + u_xlat10_1.w;
    u_xlat0 = u_xlat0 + (-_Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = _Color;
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
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %114 %130 %132 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
                                                     OpDecorate %130 RelaxedPrecision 
                                                     OpDecorate %130 Location 130 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %133 RelaxedPrecision 
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
                                            %129 = OpTypePointer Output %75 
                              Output f32_2* %130 = OpVariable Output 
                                            %131 = OpTypePointer Input %75 
                               Input f32_2* %132 = OpVariable Input 
                                            %134 = OpTypePointer Output %6 
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
                                      f32_2 %133 = OpLoad %132 
                                                     OpStore %130 %133 
                                Output f32* %135 = OpAccessChain %114 %27 %110 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %114 %27 %110 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 76
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %71 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %17 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %24 DescriptorSet 24 
                                                    OpDecorate %24 Binding 24 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpMemberDecorate %36 0 Offset 36 
                                                    OpMemberDecorate %36 1 RelaxedPrecision 
                                                    OpMemberDecorate %36 1 Offset 36 
                                                    OpMemberDecorate %36 2 RelaxedPrecision 
                                                    OpMemberDecorate %36 2 Offset 36 
                                                    OpDecorate %36 Block 
                                                    OpDecorate %38 DescriptorSet 38 
                                                    OpDecorate %38 Binding 38 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %71 Location 71 
                                                    OpDecorate %74 RelaxedPrecision 
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
                               Private f32* %23 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %24 = OpVariable UniformConstant 
                                        u32 %28 = OpConstant 3 
                               Private f32* %30 = OpVariable Private 
                               Private f32* %35 = OpVariable Private 
                                            %36 = OpTypeStruct %6 %18 %6 
                                            %37 = OpTypePointer Uniform %36 
         Uniform struct {f32; f32_4; f32;}* %38 = OpVariable Uniform 
                                            %39 = OpTypeInt 32 1 
                                        i32 %40 = OpConstant 0 
                                            %41 = OpTypePointer Uniform %6 
                               Private f32* %48 = OpVariable Private 
                                        i32 %50 = OpConstant 2 
                                            %55 = OpTypeBool 
                                            %56 = OpTypePointer Private %55 
                              Private bool* %57 = OpVariable Private 
                                        f32 %59 = OpConstant 3.67402E-40 
                                        i32 %62 = OpConstant 1 
                                        i32 %64 = OpConstant -1 
                                            %70 = OpTypePointer Output %18 
                              Output f32_4* %71 = OpVariable Output 
                                            %72 = OpTypePointer Uniform %18 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 0 
                                                    OpStore %8 %22 
                 read_only Texture2DSampled %25 = OpLoad %24 
                                      f32_2 %26 = OpLoad %16 
                                      f32_4 %27 = OpImageSampleImplicitLod %25 %26 
                                        f32 %29 = OpCompositeExtract %27 3 
                                                    OpStore %23 %29 
                                        f32 %31 = OpLoad %23 
                                        f32 %32 = OpFNegate %31 
                                        f32 %33 = OpLoad %8 
                                        f32 %34 = OpFAdd %32 %33 
                                                    OpStore %30 %34 
                               Uniform f32* %42 = OpAccessChain %38 %40 
                                        f32 %43 = OpLoad %42 
                                        f32 %44 = OpLoad %30 
                                        f32 %45 = OpFMul %43 %44 
                                        f32 %46 = OpLoad %23 
                                        f32 %47 = OpFAdd %45 %46 
                                                    OpStore %35 %47 
                                        f32 %49 = OpLoad %35 
                               Uniform f32* %51 = OpAccessChain %38 %50 
                                        f32 %52 = OpLoad %51 
                                        f32 %53 = OpFNegate %52 
                                        f32 %54 = OpFAdd %49 %53 
                                                    OpStore %48 %54 
                                        f32 %58 = OpLoad %48 
                                       bool %60 = OpFOrdLessThan %58 %59 
                                                    OpStore %57 %60 
                                       bool %61 = OpLoad %57 
                                        i32 %63 = OpSelect %61 %62 %40 
                                        i32 %65 = OpIMul %63 %64 
                                       bool %66 = OpINotEqual %65 %40 
                                                    OpSelectionMerge %68 None 
                                                    OpBranchConditional %66 %67 %68 
                                            %67 = OpLabel 
                                                    OpKill
                                            %68 = OpLabel 
                             Uniform f32_4* %73 = OpAccessChain %38 %62 
                                      f32_4 %74 = OpLoad %73 
                                                    OpStore %71 %74 
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