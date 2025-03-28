//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Sonic Ether/Particles/Additive" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_EmissionGain ("Emission Gain", Range(0, 1)) = 0.3
_DescaleBrightness ("Descale Brightness", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 40680
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TintColor;
uniform 	float _EmissionGain;
uniform 	float _DescaleBrightness;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_2;
float u_xlat3;
float u_xlat16_3;
void main()
{
    u_xlat0 = vs_COLOR0.w * _EmissionGain;
    u_xlat0 = u_xlat0 * 7.21347523;
    u_xlat0 = exp2(u_xlat0);
    u_xlat1 = vs_COLOR0 + vs_COLOR0;
    u_xlat1 = u_xlat1 * _TintColor;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat1 * u_xlat10_2;
    u_xlat16_3 = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 * -0.25;
    u_xlat3 = _DescaleBrightness * u_xlat16_3 + 1.0;
    u_xlat1 = vec4(u_xlat0) * u_xlat1;
    SV_Target0 = vec4(u_xlat3) * u_xlat1;
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
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate %89 Location 89 
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
                               Output f32_4* %82 = OpVariable Output 
                                Input f32_4* %83 = OpVariable Input 
                                             %85 = OpTypeVector %6 2 
                                             %86 = OpTypePointer Output %85 
                               Output f32_2* %87 = OpVariable Output 
                                             %88 = OpTypePointer Input %85 
                                Input f32_2* %89 = OpVariable Input 
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
                                       f32_4 %84 = OpLoad %83 
                                                     OpStore %82 %84 
                                       f32_2 %90 = OpLoad %89 
                              Uniform f32_4* %91 = OpAccessChain %20 %35 
                                       f32_4 %92 = OpLoad %91 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                       f32_2 %94 = OpFMul %90 %93 
                              Uniform f32_4* %95 = OpAccessChain %20 %35 
                                       f32_4 %96 = OpLoad %95 
                                       f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                       f32_2 %98 = OpFAdd %94 %97 
                                                     OpStore %87 %98 
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
; Bound: 95
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %56 %92 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 RelaxedPrecision 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %16 RelaxedPrecision 
                                                    OpMemberDecorate %17 0 RelaxedPrecision 
                                                    OpMemberDecorate %17 0 Offset 17 
                                                    OpMemberDecorate %17 1 Offset 17 
                                                    OpMemberDecorate %17 2 Offset 17 
                                                    OpDecorate %17 Block 
                                                    OpDecorate %19 DescriptorSet 19 
                                                    OpDecorate %19 Binding 19 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %47 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %52 DescriptorSet 52 
                                                    OpDecorate %52 Binding 52 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %56 Location 56 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %92 Location 92 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_4* %11 = OpVariable Input 
                                            %12 = OpTypeInt 32 0 
                                        u32 %13 = OpConstant 3 
                                            %14 = OpTypePointer Input %6 
                                            %17 = OpTypeStruct %7 %6 %6 
                                            %18 = OpTypePointer Uniform %17 
         Uniform struct {f32_4; f32; f32;}* %19 = OpVariable Uniform 
                                            %20 = OpTypeInt 32 1 
                                        i32 %21 = OpConstant 1 
                                            %22 = OpTypePointer Uniform %6 
                                        u32 %26 = OpConstant 0 
                                            %27 = OpTypePointer Private %6 
                                        f32 %31 = OpConstant 3.67402E-40 
                             Private f32_4* %38 = OpVariable Private 
                                        i32 %43 = OpConstant 0 
                                            %44 = OpTypePointer Uniform %7 
                             Private f32_4* %48 = OpVariable Private 
                                            %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %50 = OpTypeSampledImage %49 
                                            %51 = OpTypePointer UniformConstant %50 
UniformConstant read_only Texture2DSampled* %52 = OpVariable UniformConstant 
                                            %54 = OpTypeVector %6 2 
                                            %55 = OpTypePointer Input %54 
                               Input f32_2* %56 = OpVariable Input 
                               Private f32* %62 = OpVariable Private 
                                            %63 = OpTypeVector %6 3 
                                        f32 %66 = OpConstant 3.67402E-40 
                                        f32 %67 = OpConstant 3.67402E-40 
                                        f32 %68 = OpConstant 3.67402E-40 
                                      f32_3 %69 = OpConstantComposite %66 %67 %68 
                                        f32 %72 = OpConstant 3.67402E-40 
                               Private f32* %74 = OpVariable Private 
                                        i32 %75 = OpConstant 2 
                                        f32 %80 = OpConstant 3.67402E-40 
                             Private f32_4* %82 = OpVariable Private 
                                            %91 = OpTypePointer Output %7 
                              Output f32_4* %92 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                 Input f32* %15 = OpAccessChain %11 %13 
                                        f32 %16 = OpLoad %15 
                               Uniform f32* %23 = OpAccessChain %19 %21 
                                        f32 %24 = OpLoad %23 
                                        f32 %25 = OpFMul %16 %24 
                               Private f32* %28 = OpAccessChain %9 %26 
                                                    OpStore %28 %25 
                               Private f32* %29 = OpAccessChain %9 %26 
                                        f32 %30 = OpLoad %29 
                                        f32 %32 = OpFMul %30 %31 
                               Private f32* %33 = OpAccessChain %9 %26 
                                                    OpStore %33 %32 
                               Private f32* %34 = OpAccessChain %9 %26 
                                        f32 %35 = OpLoad %34 
                                        f32 %36 = OpExtInst %1 29 %35 
                               Private f32* %37 = OpAccessChain %9 %26 
                                                    OpStore %37 %36 
                                      f32_4 %39 = OpLoad %11 
                                      f32_4 %40 = OpLoad %11 
                                      f32_4 %41 = OpFAdd %39 %40 
                                                    OpStore %38 %41 
                                      f32_4 %42 = OpLoad %38 
                             Uniform f32_4* %45 = OpAccessChain %19 %43 
                                      f32_4 %46 = OpLoad %45 
                                      f32_4 %47 = OpFMul %42 %46 
                                                    OpStore %38 %47 
                 read_only Texture2DSampled %53 = OpLoad %52 
                                      f32_2 %57 = OpLoad %56 
                                      f32_4 %58 = OpImageSampleImplicitLod %53 %57 
                                                    OpStore %48 %58 
                                      f32_4 %59 = OpLoad %38 
                                      f32_4 %60 = OpLoad %48 
                                      f32_4 %61 = OpFMul %59 %60 
                                                    OpStore %38 %61 
                                      f32_4 %64 = OpLoad %48 
                                      f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32 %70 = OpDot %65 %69 
                                                    OpStore %62 %70 
                                        f32 %71 = OpLoad %62 
                                        f32 %73 = OpFMul %71 %72 
                                                    OpStore %62 %73 
                               Uniform f32* %76 = OpAccessChain %19 %75 
                                        f32 %77 = OpLoad %76 
                                        f32 %78 = OpLoad %62 
                                        f32 %79 = OpFMul %77 %78 
                                        f32 %81 = OpFAdd %79 %80 
                                                    OpStore %74 %81 
                                      f32_4 %83 = OpLoad %9 
                                      f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                      f32_4 %85 = OpLoad %38 
                                      f32_4 %86 = OpFMul %84 %85 
                                                    OpStore %82 %86 
                                        f32 %87 = OpLoad %74 
                                      f32_4 %88 = OpCompositeConstruct %87 %87 %87 %87 
                                      f32_4 %89 = OpLoad %82 
                                      f32_4 %90 = OpFMul %88 %89 
                                                    OpStore %9 %90 
                                      f32_4 %93 = OpLoad %9 
                                                    OpStore %92 %93 
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TintColor;
uniform 	float _EmissionGain;
uniform 	float _DescaleBrightness;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_2;
float u_xlat3;
float u_xlat16_3;
void main()
{
    u_xlat0 = vs_COLOR0.w * _EmissionGain;
    u_xlat0 = u_xlat0 * 7.21347523;
    u_xlat0 = exp2(u_xlat0);
    u_xlat1 = vs_COLOR0 + vs_COLOR0;
    u_xlat1 = u_xlat1 * _TintColor;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat1 * u_xlat10_2;
    u_xlat16_3 = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 * -0.25;
    u_xlat3 = _DescaleBrightness * u_xlat16_3 + 1.0;
    u_xlat1 = vec4(u_xlat0) * u_xlat1;
    SV_Target0 = vec4(u_xlat3) * u_xlat1;
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
; Bound: 105
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
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
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate %89 Location 89 
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
                               Output f32_4* %82 = OpVariable Output 
                                Input f32_4* %83 = OpVariable Input 
                                             %85 = OpTypeVector %6 2 
                                             %86 = OpTypePointer Output %85 
                               Output f32_2* %87 = OpVariable Output 
                                             %88 = OpTypePointer Input %85 
                                Input f32_2* %89 = OpVariable Input 
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
                                       f32_4 %84 = OpLoad %83 
                                                     OpStore %82 %84 
                                       f32_2 %90 = OpLoad %89 
                              Uniform f32_4* %91 = OpAccessChain %20 %35 
                                       f32_4 %92 = OpLoad %91 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                       f32_2 %94 = OpFMul %90 %93 
                              Uniform f32_4* %95 = OpAccessChain %20 %35 
                                       f32_4 %96 = OpLoad %95 
                                       f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                       f32_2 %98 = OpFAdd %94 %97 
                                                     OpStore %87 %98 
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
; Bound: 95
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %56 %92 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 RelaxedPrecision 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %16 RelaxedPrecision 
                                                    OpMemberDecorate %17 0 RelaxedPrecision 
                                                    OpMemberDecorate %17 0 Offset 17 
                                                    OpMemberDecorate %17 1 Offset 17 
                                                    OpMemberDecorate %17 2 Offset 17 
                                                    OpDecorate %17 Block 
                                                    OpDecorate %19 DescriptorSet 19 
                                                    OpDecorate %19 Binding 19 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %47 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %52 DescriptorSet 52 
                                                    OpDecorate %52 Binding 52 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %56 Location 56 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %92 Location 92 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_4* %11 = OpVariable Input 
                                            %12 = OpTypeInt 32 0 
                                        u32 %13 = OpConstant 3 
                                            %14 = OpTypePointer Input %6 
                                            %17 = OpTypeStruct %7 %6 %6 
                                            %18 = OpTypePointer Uniform %17 
         Uniform struct {f32_4; f32; f32;}* %19 = OpVariable Uniform 
                                            %20 = OpTypeInt 32 1 
                                        i32 %21 = OpConstant 1 
                                            %22 = OpTypePointer Uniform %6 
                                        u32 %26 = OpConstant 0 
                                            %27 = OpTypePointer Private %6 
                                        f32 %31 = OpConstant 3.67402E-40 
                             Private f32_4* %38 = OpVariable Private 
                                        i32 %43 = OpConstant 0 
                                            %44 = OpTypePointer Uniform %7 
                             Private f32_4* %48 = OpVariable Private 
                                            %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %50 = OpTypeSampledImage %49 
                                            %51 = OpTypePointer UniformConstant %50 
UniformConstant read_only Texture2DSampled* %52 = OpVariable UniformConstant 
                                            %54 = OpTypeVector %6 2 
                                            %55 = OpTypePointer Input %54 
                               Input f32_2* %56 = OpVariable Input 
                               Private f32* %62 = OpVariable Private 
                                            %63 = OpTypeVector %6 3 
                                        f32 %66 = OpConstant 3.67402E-40 
                                        f32 %67 = OpConstant 3.67402E-40 
                                        f32 %68 = OpConstant 3.67402E-40 
                                      f32_3 %69 = OpConstantComposite %66 %67 %68 
                                        f32 %72 = OpConstant 3.67402E-40 
                               Private f32* %74 = OpVariable Private 
                                        i32 %75 = OpConstant 2 
                                        f32 %80 = OpConstant 3.67402E-40 
                             Private f32_4* %82 = OpVariable Private 
                                            %91 = OpTypePointer Output %7 
                              Output f32_4* %92 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                 Input f32* %15 = OpAccessChain %11 %13 
                                        f32 %16 = OpLoad %15 
                               Uniform f32* %23 = OpAccessChain %19 %21 
                                        f32 %24 = OpLoad %23 
                                        f32 %25 = OpFMul %16 %24 
                               Private f32* %28 = OpAccessChain %9 %26 
                                                    OpStore %28 %25 
                               Private f32* %29 = OpAccessChain %9 %26 
                                        f32 %30 = OpLoad %29 
                                        f32 %32 = OpFMul %30 %31 
                               Private f32* %33 = OpAccessChain %9 %26 
                                                    OpStore %33 %32 
                               Private f32* %34 = OpAccessChain %9 %26 
                                        f32 %35 = OpLoad %34 
                                        f32 %36 = OpExtInst %1 29 %35 
                               Private f32* %37 = OpAccessChain %9 %26 
                                                    OpStore %37 %36 
                                      f32_4 %39 = OpLoad %11 
                                      f32_4 %40 = OpLoad %11 
                                      f32_4 %41 = OpFAdd %39 %40 
                                                    OpStore %38 %41 
                                      f32_4 %42 = OpLoad %38 
                             Uniform f32_4* %45 = OpAccessChain %19 %43 
                                      f32_4 %46 = OpLoad %45 
                                      f32_4 %47 = OpFMul %42 %46 
                                                    OpStore %38 %47 
                 read_only Texture2DSampled %53 = OpLoad %52 
                                      f32_2 %57 = OpLoad %56 
                                      f32_4 %58 = OpImageSampleImplicitLod %53 %57 
                                                    OpStore %48 %58 
                                      f32_4 %59 = OpLoad %38 
                                      f32_4 %60 = OpLoad %48 
                                      f32_4 %61 = OpFMul %59 %60 
                                                    OpStore %38 %61 
                                      f32_4 %64 = OpLoad %48 
                                      f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32 %70 = OpDot %65 %69 
                                                    OpStore %62 %70 
                                        f32 %71 = OpLoad %62 
                                        f32 %73 = OpFMul %71 %72 
                                                    OpStore %62 %73 
                               Uniform f32* %76 = OpAccessChain %19 %75 
                                        f32 %77 = OpLoad %76 
                                        f32 %78 = OpLoad %62 
                                        f32 %79 = OpFMul %77 %78 
                                        f32 %81 = OpFAdd %79 %80 
                                                    OpStore %74 %81 
                                      f32_4 %83 = OpLoad %9 
                                      f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                      f32_4 %85 = OpLoad %38 
                                      f32_4 %86 = OpFMul %84 %85 
                                                    OpStore %82 %86 
                                        f32 %87 = OpLoad %74 
                                      f32_4 %88 = OpCompositeConstruct %87 %87 %87 %87 
                                      f32_4 %89 = OpLoad %82 
                                      f32_4 %90 = OpFMul %88 %89 
                                                    OpStore %9 %90 
                                      f32_4 %93 = OpLoad %9 
                                                    OpStore %92 %93 
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