//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Particles/Alpha Blended" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 1044
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
uniform 	vec4 _TintColor;
uniform 	vec4 _MainTex_ST;
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
    vs_COLOR0 = in_COLOR0 * _TintColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
vec4 u_xlat10_1;
void main()
{
    u_xlat0 = vs_COLOR0 + vs_COLOR0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    SV_Target0.w = u_xlat0.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 108
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %90 %92 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 RelaxedPrecision 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %82 Location 82 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %83 Location 83 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate %92 Location 92 
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
                                Output f32_4* %82 = OpVariable Output 
                                 Input f32_4* %83 = OpVariable Input 
                                              %88 = OpTypeVector %6 2 
                                              %89 = OpTypePointer Output %88 
                                Output f32_2* %90 = OpVariable Output 
                                              %91 = OpTypePointer Input %88 
                                 Input f32_2* %92 = OpVariable Input 
                                             %102 = OpTypePointer Output %6 
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
                                        f32_4 %84 = OpLoad %83 
                               Uniform f32_4* %85 = OpAccessChain %20 %35 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpFMul %84 %86 
                                                      OpStore %82 %87 
                                        f32_2 %93 = OpLoad %92 
                               Uniform f32_4* %94 = OpAccessChain %20 %44 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %93 %96 
                               Uniform f32_4* %98 = OpAccessChain %20 %44 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                                       f32_2 %101 = OpFAdd %97 %100 
                                                      OpStore %90 %101 
                                 Output f32* %103 = OpAccessChain %72 %22 %68 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFNegate %104 
                                 Output f32* %106 = OpAccessChain %72 %22 %68 
                                                      OpStore %106 %105 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 50
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %23 %30 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %11 RelaxedPrecision 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %15 RelaxedPrecision 
                                                    OpDecorate %19 RelaxedPrecision 
                                                    OpDecorate %19 DescriptorSet 19 
                                                    OpDecorate %19 Binding 19 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %23 Location 23 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %30 Location 30 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_4* %11 = OpVariable Input 
                             Private f32_4* %15 = OpVariable Private 
                                            %16 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %17 = OpTypeSampledImage %16 
                                            %18 = OpTypePointer UniformConstant %17 
UniformConstant read_only Texture2DSampled* %19 = OpVariable UniformConstant 
                                            %21 = OpTypeVector %6 2 
                                            %22 = OpTypePointer Input %21 
                               Input f32_2* %23 = OpVariable Input 
                                            %29 = OpTypePointer Output %7 
                              Output f32_4* %30 = OpVariable Output 
                                            %31 = OpTypeInt 32 0 
                                        u32 %32 = OpConstant 3 
                                            %33 = OpTypePointer Private %6 
                                            %36 = OpTypePointer Output %6 
                                        f32 %40 = OpConstant 3.67402E-40 
                                        f32 %41 = OpConstant 3.67402E-40 
                                            %44 = OpTypeVector %6 3 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_4 %12 = OpLoad %11 
                                      f32_4 %13 = OpLoad %11 
                                      f32_4 %14 = OpFAdd %12 %13 
                                                    OpStore %9 %14 
                 read_only Texture2DSampled %20 = OpLoad %19 
                                      f32_2 %24 = OpLoad %23 
                                      f32_4 %25 = OpImageSampleImplicitLod %20 %24 
                                                    OpStore %15 %25 
                                      f32_4 %26 = OpLoad %9 
                                      f32_4 %27 = OpLoad %15 
                                      f32_4 %28 = OpFMul %26 %27 
                                                    OpStore %9 %28 
                               Private f32* %34 = OpAccessChain %9 %32 
                                        f32 %35 = OpLoad %34 
                                Output f32* %37 = OpAccessChain %30 %32 
                                                    OpStore %37 %35 
                                Output f32* %38 = OpAccessChain %30 %32 
                                        f32 %39 = OpLoad %38 
                                        f32 %42 = OpExtInst %1 43 %39 %40 %41 
                                Output f32* %43 = OpAccessChain %30 %32 
                                                    OpStore %43 %42 
                                      f32_4 %45 = OpLoad %9 
                                      f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                      f32_4 %47 = OpLoad %30 
                                      f32_4 %48 = OpVectorShuffle %47 %46 4 5 6 3 
                                                    OpStore %30 %48 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SOFTPARTICLES_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SOFTPARTICLES_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TintColor;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0 * _TintColor;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.w = u_xlat0.x * vs_COLOR0.w;
    u_xlat0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 + u_xlat0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    SV_Target0.w = u_xlat0.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SOFTPARTICLES_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 181
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %93 %95 %143 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %95 Location 95 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                              %94 = OpTypePointer Input %91 
                                 Input f32_2* %95 = OpVariable Input 
                                          i32 %97 = OpConstant 5 
                                             %106 = OpTypePointer Private %6 
                                Private f32* %107 = OpVariable Private 
                                         u32 %110 = OpConstant 2 
                                             %111 = OpTypePointer Uniform %6 
                                         u32 %117 = OpConstant 0 
                                         u32 %135 = OpConstant 3 
                               Output f32_4* %143 = OpVariable Output 
                                             %147 = OpTypePointer Output %6 
                                         f32 %157 = OpConstant 3.67402E-40 
                                       f32_2 %162 = OpConstantComposite %157 %157 
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
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %21 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_2 %96 = OpLoad %95 
                               Uniform f32_4* %98 = OpAccessChain %21 %97 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                                       f32_2 %101 = OpFMul %96 %100 
                              Uniform f32_4* %102 = OpAccessChain %21 %97 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 2 3 
                                       f32_2 %105 = OpFAdd %101 %104 
                                                      OpStore %93 %105 
                                Private f32* %108 = OpAccessChain %9 %76 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %112 = OpAccessChain %21 %36 %23 %110 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %109 %113 
                                                      OpStore %107 %114 
                                Uniform f32* %115 = OpAccessChain %21 %36 %28 %110 
                                         f32 %116 = OpLoad %115 
                                Private f32* %118 = OpAccessChain %9 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFMul %116 %119 
                                         f32 %121 = OpLoad %107 
                                         f32 %122 = OpFAdd %120 %121 
                                Private f32* %123 = OpAccessChain %9 %117 
                                                      OpStore %123 %122 
                                Uniform f32* %124 = OpAccessChain %21 %36 %36 %110 
                                         f32 %125 = OpLoad %124 
                                Private f32* %126 = OpAccessChain %9 %110 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFMul %125 %127 
                                Private f32* %129 = OpAccessChain %9 %117 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFAdd %128 %130 
                                Private f32* %132 = OpAccessChain %9 %117 
                                                      OpStore %132 %131 
                                Uniform f32* %133 = OpAccessChain %21 %36 %45 %110 
                                         f32 %134 = OpLoad %133 
                                Private f32* %136 = OpAccessChain %9 %135 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %117 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFAdd %138 %140 
                                Private f32* %142 = OpAccessChain %9 %117 
                                                      OpStore %142 %141 
                                Private f32* %144 = OpAccessChain %9 %117 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpFNegate %145 
                                 Output f32* %148 = OpAccessChain %143 %110 
                                                      OpStore %148 %146 
                                Private f32* %149 = OpAccessChain %49 %76 
                                         f32 %150 = OpLoad %149 
                                Uniform f32* %151 = OpAccessChain %21 %28 %117 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %150 %152 
                                Private f32* %154 = OpAccessChain %9 %117 
                                                      OpStore %154 %153 
                                Private f32* %155 = OpAccessChain %9 %117 
                                         f32 %156 = OpLoad %155 
                                         f32 %158 = OpFMul %156 %157 
                                Private f32* %159 = OpAccessChain %9 %135 
                                                      OpStore %159 %158 
                                       f32_4 %160 = OpLoad %49 
                                       f32_2 %161 = OpVectorShuffle %160 %160 0 3 
                                       f32_2 %163 = OpFMul %161 %162 
                                       f32_4 %164 = OpLoad %9 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 1 5 3 
                                                      OpStore %9 %165 
                                Private f32* %166 = OpAccessChain %49 %135 
                                         f32 %167 = OpLoad %166 
                                 Output f32* %168 = OpAccessChain %143 %135 
                                                      OpStore %168 %167 
                                       f32_4 %169 = OpLoad %9 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 2 
                                       f32_4 %171 = OpLoad %9 
                                       f32_2 %172 = OpVectorShuffle %171 %171 0 3 
                                       f32_2 %173 = OpFAdd %170 %172 
                                       f32_4 %174 = OpLoad %143 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 2 3 
                                                      OpStore %143 %175 
                                 Output f32* %176 = OpAccessChain %80 %28 %76 
                                         f32 %177 = OpLoad %176 
                                         f32 %178 = OpFNegate %177 
                                 Output f32* %179 = OpAccessChain %80 %28 %76 
                                                      OpStore %179 %178 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 115
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %75 %94 %101 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %23 DescriptorSet 23 
                                                    OpDecorate %23 Binding 23 
                                                    OpMemberDecorate %33 0 Offset 33 
                                                    OpMemberDecorate %33 1 Offset 33 
                                                    OpDecorate %33 Block 
                                                    OpDecorate %35 DescriptorSet 35 
                                                    OpDecorate %35 Binding 35 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %75 Location 75 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %91 DescriptorSet 91 
                                                    OpDecorate %91 Binding 91 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %94 Location 94 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %101 Location 101 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %108 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_4* %11 = OpVariable Input 
                                            %12 = OpTypeVector %6 2 
                                            %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %21 = OpTypeSampledImage %20 
                                            %22 = OpTypePointer UniformConstant %21 
UniformConstant read_only Texture2DSampled* %23 = OpVariable UniformConstant 
                                            %28 = OpTypeInt 32 0 
                                        u32 %29 = OpConstant 0 
                                            %31 = OpTypePointer Private %6 
                                            %33 = OpTypeStruct %7 %6 
                                            %34 = OpTypePointer Uniform %33 
              Uniform struct {f32_4; f32;}* %35 = OpVariable Uniform 
                                            %36 = OpTypeInt 32 1 
                                        i32 %37 = OpConstant 0 
                                        u32 %38 = OpConstant 2 
                                            %39 = OpTypePointer Uniform %6 
                                        u32 %45 = OpConstant 3 
                                        f32 %50 = OpConstant 3.67402E-40 
                                            %57 = OpTypePointer Input %6 
                                        i32 %65 = OpConstant 1 
                                        f32 %72 = OpConstant 3.67402E-40 
                               Input f32_4* %75 = OpVariable Input 
                                            %82 = OpTypeVector %6 3 
                             Private f32_4* %90 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %91 = OpVariable UniformConstant 
                                            %93 = OpTypePointer Input %12 
                               Input f32_2* %94 = OpVariable Input 
                                           %100 = OpTypePointer Output %7 
                             Output f32_4* %101 = OpVariable Output 
                                           %104 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_4 %13 = OpLoad %11 
                                      f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                      f32_4 %15 = OpLoad %11 
                                      f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                      f32_2 %17 = OpFDiv %14 %16 
                                      f32_4 %18 = OpLoad %9 
                                      f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                    OpStore %9 %19 
                 read_only Texture2DSampled %24 = OpLoad %23 
                                      f32_4 %25 = OpLoad %9 
                                      f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                      f32_4 %27 = OpImageSampleImplicitLod %24 %26 
                                        f32 %30 = OpCompositeExtract %27 0 
                               Private f32* %32 = OpAccessChain %9 %29 
                                                    OpStore %32 %30 
                               Uniform f32* %40 = OpAccessChain %35 %37 %38 
                                        f32 %41 = OpLoad %40 
                               Private f32* %42 = OpAccessChain %9 %29 
                                        f32 %43 = OpLoad %42 
                                        f32 %44 = OpFMul %41 %43 
                               Uniform f32* %46 = OpAccessChain %35 %37 %45 
                                        f32 %47 = OpLoad %46 
                                        f32 %48 = OpFAdd %44 %47 
                               Private f32* %49 = OpAccessChain %9 %29 
                                                    OpStore %49 %48 
                               Private f32* %51 = OpAccessChain %9 %29 
                                        f32 %52 = OpLoad %51 
                                        f32 %53 = OpFDiv %50 %52 
                               Private f32* %54 = OpAccessChain %9 %29 
                                                    OpStore %54 %53 
                               Private f32* %55 = OpAccessChain %9 %29 
                                        f32 %56 = OpLoad %55 
                                 Input f32* %58 = OpAccessChain %11 %38 
                                        f32 %59 = OpLoad %58 
                                        f32 %60 = OpFNegate %59 
                                        f32 %61 = OpFAdd %56 %60 
                               Private f32* %62 = OpAccessChain %9 %29 
                                                    OpStore %62 %61 
                               Private f32* %63 = OpAccessChain %9 %29 
                                        f32 %64 = OpLoad %63 
                               Uniform f32* %66 = OpAccessChain %35 %65 
                                        f32 %67 = OpLoad %66 
                                        f32 %68 = OpFMul %64 %67 
                               Private f32* %69 = OpAccessChain %9 %29 
                                                    OpStore %69 %68 
                               Private f32* %70 = OpAccessChain %9 %29 
                                        f32 %71 = OpLoad %70 
                                        f32 %73 = OpExtInst %1 43 %71 %72 %50 
                               Private f32* %74 = OpAccessChain %9 %29 
                                                    OpStore %74 %73 
                                      f32_4 %76 = OpLoad %75 
                                      f32_2 %77 = OpVectorShuffle %76 %76 3 3 
                                      f32_4 %78 = OpLoad %9 
                                      f32_2 %79 = OpVectorShuffle %78 %78 0 0 
                                        f32 %80 = OpDot %77 %79 
                               Private f32* %81 = OpAccessChain %9 %45 
                                                    OpStore %81 %80 
                                      f32_4 %83 = OpLoad %75 
                                      f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                      f32_4 %85 = OpLoad %75 
                                      f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                      f32_3 %87 = OpFAdd %84 %86 
                                      f32_4 %88 = OpLoad %9 
                                      f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                    OpStore %9 %89 
                 read_only Texture2DSampled %92 = OpLoad %91 
                                      f32_2 %95 = OpLoad %94 
                                      f32_4 %96 = OpImageSampleImplicitLod %92 %95 
                                                    OpStore %90 %96 
                                      f32_4 %97 = OpLoad %9 
                                      f32_4 %98 = OpLoad %90 
                                      f32_4 %99 = OpFMul %97 %98 
                                                    OpStore %9 %99 
                              Private f32* %102 = OpAccessChain %9 %45 
                                       f32 %103 = OpLoad %102 
                               Output f32* %105 = OpAccessChain %101 %45 
                                                    OpStore %105 %103 
                               Output f32* %106 = OpAccessChain %101 %45 
                                       f32 %107 = OpLoad %106 
                                       f32 %108 = OpExtInst %1 43 %107 %72 %50 
                               Output f32* %109 = OpAccessChain %101 %45 
                                                    OpStore %109 %108 
                                     f32_4 %110 = OpLoad %9 
                                     f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                     f32_4 %112 = OpLoad %101 
                                     f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                    OpStore %101 %113 
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
Keywords { "SOFTPARTICLES_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "vulkan " {
Keywords { "SOFTPARTICLES_ON" }
""
}
}
}
}
}