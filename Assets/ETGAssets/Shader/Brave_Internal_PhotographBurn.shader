//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/PhotographBurn" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_NoiseTex ("Noise", 2D) = "white" { }
_SliceAmount ("Slice Amount", Range(0, 1)) = 0
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
  GpuProgramID 1647
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
uniform 	vec4 _NoiseTex_ST;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _SliceAmount;
uniform  sampler2D _MainTex;
uniform  sampler2D _NoiseTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_NoiseTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0 = u_xlat16_0 + (-_SliceAmount);
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w;
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
                                                     OpDecorate %83 Location 83 
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
; Bound: 82
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %65 %69 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpMemberDecorate %35 0 Offset 35 
                                                    OpDecorate %35 Block 
                                                    OpDecorate %37 DescriptorSet 37 
                                                    OpDecorate %37 Binding 37 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %60 DescriptorSet 60 
                                                    OpDecorate %60 Binding 60 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %65 Location 65 
                                                    OpDecorate %66 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %69 Location 69 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
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
                                            %20 = OpTypeVector %6 3 
                                            %24 = OpTypePointer Private %6 
                               Private f32* %25 = OpVariable Private 
                                        f32 %28 = OpConstant 3.67402E-40 
                                        f32 %29 = OpConstant 3.67402E-40 
                                        f32 %30 = OpConstant 3.67402E-40 
                                      f32_3 %31 = OpConstantComposite %28 %29 %30 
                               Private f32* %33 = OpVariable Private 
                                            %35 = OpTypeStruct %6 
                                            %36 = OpTypePointer Uniform %35 
                     Uniform struct {f32;}* %37 = OpVariable Uniform 
                                            %38 = OpTypeInt 32 1 
                                        i32 %39 = OpConstant 0 
                                            %40 = OpTypePointer Uniform %6 
                                            %45 = OpTypeBool 
                                            %46 = OpTypePointer Private %45 
                              Private bool* %47 = OpVariable Private 
                                        f32 %49 = OpConstant 3.67402E-40 
                                        i32 %52 = OpConstant 1 
                                        i32 %54 = OpConstant -1 
UniformConstant read_only Texture2DSampled* %60 = OpVariable UniformConstant 
                                            %64 = OpTypePointer Output %7 
                              Output f32_4* %65 = OpVariable Output 
                                            %68 = OpTypePointer Input %7 
                               Input f32_4* %69 = OpVariable Input 
                                            %75 = OpTypeInt 32 0 
                                        u32 %76 = OpConstant 3 
                                            %79 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %19 %19 0 1 2 
                                      f32_4 %22 = OpLoad %9 
                                      f32_4 %23 = OpVectorShuffle %22 %21 4 5 6 3 
                                                    OpStore %9 %23 
                                      f32_4 %26 = OpLoad %9 
                                      f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32 %32 = OpDot %27 %31 
                                                    OpStore %25 %32 
                                        f32 %34 = OpLoad %25 
                               Uniform f32* %41 = OpAccessChain %37 %39 
                                        f32 %42 = OpLoad %41 
                                        f32 %43 = OpFNegate %42 
                                        f32 %44 = OpFAdd %34 %43 
                                                    OpStore %33 %44 
                                        f32 %48 = OpLoad %33 
                                       bool %50 = OpFOrdLessThan %48 %49 
                                                    OpStore %47 %50 
                                       bool %51 = OpLoad %47 
                                        i32 %53 = OpSelect %51 %52 %39 
                                        i32 %55 = OpIMul %53 %54 
                                       bool %56 = OpINotEqual %55 %39 
                                                    OpSelectionMerge %58 None 
                                                    OpBranchConditional %56 %57 %58 
                                            %57 = OpLabel 
                                                    OpKill
                                            %58 = OpLabel 
                 read_only Texture2DSampled %61 = OpLoad %60 
                                      f32_2 %62 = OpLoad %17 
                                      f32_4 %63 = OpImageSampleImplicitLod %61 %62 
                                                    OpStore %9 %63 
                                      f32_4 %66 = OpLoad %9 
                                      f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                      f32_4 %70 = OpLoad %69 
                                      f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                      f32_3 %72 = OpFMul %67 %71 
                                      f32_4 %73 = OpLoad %65 
                                      f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
                                                    OpStore %65 %74 
                               Private f32* %77 = OpAccessChain %9 %76 
                                        f32 %78 = OpLoad %77 
                                Output f32* %80 = OpAccessChain %65 %76 
                                                    OpStore %80 %78 
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
Fallback "tk2d/BlendVertexColor"
}