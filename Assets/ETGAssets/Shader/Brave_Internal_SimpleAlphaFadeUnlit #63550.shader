//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/SimpleAlphaFadeUnlit" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_MaskTex ("MaskTex", 2D) = "white" { }
_Fade ("Fade", Float) = 0
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 22125
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _Fade;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0.x * _Fade;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.w = u_xlat0 * u_xlat10_1.w;
    SV_Target0.xyz = u_xlat10_1.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 102
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %86 
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
                                                     OpMemberDecorate %84 0 BuiltIn 84 
                                                     OpMemberDecorate %84 1 BuiltIn 84 
                                                     OpMemberDecorate %84 2 BuiltIn 84 
                                                     OpDecorate %84 Block 
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
                                         u32 %82 = OpConstant 1 
                                             %83 = OpTypeArray %6 %82 
                                             %84 = OpTypeStruct %13 %6 %83 
                                             %85 = OpTypePointer Output %84 
        Output struct {f32_4; f32; f32[1];}* %86 = OpVariable Output 
                                             %94 = OpTypePointer Output %13 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %87 = OpAccessChain %20 %39 %58 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpVectorShuffle %89 %89 3 3 3 3 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %62 
                                       f32_4 %93 = OpFAdd %91 %92 
                               Output f32_4* %95 = OpAccessChain %86 %38 
                                                     OpStore %95 %93 
                                 Output f32* %97 = OpAccessChain %86 %38 %82 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %86 %38 %82 
                                                     OpStore %100 %99 
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
                                                    OpEntryPoint Fragment %4 "main" %16 %47 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpMemberDecorate %25 0 Offset 25 
                                                    OpDecorate %25 Block 
                                                    OpDecorate %27 DescriptorSet 27 
                                                    OpDecorate %27 Binding 27 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %36 DescriptorSet 36 
                                                    OpDecorate %36 Binding 36 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %47 RelaxedPrecision 
                                                    OpDecorate %47 Location 47 
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
                                            %25 = OpTypeStruct %6 
                                            %26 = OpTypePointer Uniform %25 
                     Uniform struct {f32;}* %27 = OpVariable Uniform 
                                            %28 = OpTypeInt 32 1 
                                        i32 %29 = OpConstant 0 
                                            %30 = OpTypePointer Uniform %6 
                                            %34 = OpTypePointer Private %18 
                             Private f32_4* %35 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %36 = OpVariable UniformConstant 
                                        u32 %41 = OpConstant 3 
                                            %46 = OpTypePointer Output %18 
                              Output f32_4* %47 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 0 
                                                    OpStore %8 %22 
                                        f32 %24 = OpLoad %8 
                               Uniform f32* %31 = OpAccessChain %27 %29 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFMul %24 %32 
                                                    OpStore %23 %33 
                 read_only Texture2DSampled %37 = OpLoad %36 
                                      f32_2 %38 = OpLoad %16 
                                      f32_4 %39 = OpImageSampleImplicitLod %37 %38 
                                                    OpStore %35 %39 
                                        f32 %40 = OpLoad %23 
                               Private f32* %42 = OpAccessChain %35 %41 
                                        f32 %43 = OpLoad %42 
                                        f32 %44 = OpFMul %40 %43 
                               Private f32* %45 = OpAccessChain %35 %41 
                                                    OpStore %45 %44 
                                      f32_4 %48 = OpLoad %35 
                                                    OpStore %47 %48 
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