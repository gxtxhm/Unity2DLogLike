//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/AdditiveDimensionFog" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_ExtraTex ("Extra", 2D) = "white" { }
_WorldSpaceBounds ("World Space Bounds", Vector) = (12,41,44,68)
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
  GpuProgramID 28036
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
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceBounds;
uniform  sampler2D _MainTex;
uniform  sampler2D _ExtraTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat2.xy = vs_TEXCOORD1.xy + (-_WorldSpaceBounds.xy);
    u_xlat1.xy = (-_WorldSpaceBounds.xy) + _WorldSpaceBounds.zw;
    u_xlat2.xy = u_xlat2.xy / u_xlat1.xy;
    u_xlat10_1 = texture(_ExtraTex, u_xlat2.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 109
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %51 %84 %94 %95 %99 %101 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %51 Location 51 
                                              OpMemberDecorate %82 0 BuiltIn 82 
                                              OpMemberDecorate %82 1 BuiltIn 82 
                                              OpMemberDecorate %82 2 BuiltIn 82 
                                              OpDecorate %82 Block 
                                              OpDecorate %94 RelaxedPrecision 
                                              OpDecorate %94 Location 94 
                                              OpDecorate %95 Location 95 
                                              OpDecorate %99 Location 99 
                                              OpDecorate %101 Location 101 
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
                                      %49 = OpTypeVector %6 3 
                                      %50 = OpTypePointer Output %49 
                        Output f32_3* %51 = OpVariable Output 
                                  u32 %80 = OpConstant 1 
                                      %81 = OpTypeArray %6 %80 
                                      %82 = OpTypeStruct %7 %6 %81 
                                      %83 = OpTypePointer Output %82 
 Output struct {f32_4; f32; f32[1];}* %84 = OpVariable Output 
                                      %92 = OpTypePointer Output %7 
                        Output f32_4* %94 = OpVariable Output 
                         Input f32_4* %95 = OpVariable Input 
                                      %97 = OpTypeVector %6 2 
                                      %98 = OpTypePointer Output %97 
                        Output f32_2* %99 = OpVariable Output 
                                     %100 = OpTypePointer Input %97 
                        Input f32_2* %101 = OpVariable Input 
                                     %103 = OpTypePointer Output %6 
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
                       Uniform f32_4* %52 = OpAccessChain %20 %22 %45 
                                f32_4 %53 = OpLoad %52 
                                f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                f32_4 %55 = OpLoad %11 
                                f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                f32_3 %57 = OpFMul %54 %56 
                                f32_4 %58 = OpLoad %9 
                                f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                f32_3 %60 = OpFAdd %57 %59 
                                              OpStore %51 %60 
                                f32_4 %61 = OpLoad %43 
                                f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                       Uniform f32_4* %63 = OpAccessChain %20 %23 %23 
                                f32_4 %64 = OpLoad %63 
                                f32_4 %65 = OpFMul %62 %64 
                                              OpStore %9 %65 
                       Uniform f32_4* %66 = OpAccessChain %20 %23 %22 
                                f32_4 %67 = OpLoad %66 
                                f32_4 %68 = OpLoad %43 
                                f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                f32_4 %70 = OpFMul %67 %69 
                                f32_4 %71 = OpLoad %9 
                                f32_4 %72 = OpFAdd %70 %71 
                                              OpStore %9 %72 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %35 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %43 
                                f32_4 %76 = OpVectorShuffle %75 %75 2 2 2 2 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %9 
                                f32_4 %79 = OpFAdd %77 %78 
                                              OpStore %9 %79 
                       Uniform f32_4* %85 = OpAccessChain %20 %23 %45 
                                f32_4 %86 = OpLoad %85 
                                f32_4 %87 = OpLoad %43 
                                f32_4 %88 = OpVectorShuffle %87 %87 3 3 3 3 
                                f32_4 %89 = OpFMul %86 %88 
                                f32_4 %90 = OpLoad %9 
                                f32_4 %91 = OpFAdd %89 %90 
                        Output f32_4* %93 = OpAccessChain %84 %22 
                                              OpStore %93 %91 
                                f32_4 %96 = OpLoad %95 
                                              OpStore %94 %96 
                               f32_2 %102 = OpLoad %101 
                                              OpStore %99 %102 
                         Output f32* %104 = OpAccessChain %84 %22 %80 
                                 f32 %105 = OpLoad %104 
                                 f32 %106 = OpFNegate %105 
                         Output f32* %107 = OpAccessChain %84 %22 %80 
                                              OpStore %107 %106 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 94
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %28 %46 %80 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %28 Location 28 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %46 Location 46 
                                                    OpMemberDecorate %49 0 Offset 49 
                                                    OpDecorate %49 Block 
                                                    OpDecorate %51 DescriptorSet 51 
                                                    OpDecorate %51 Binding 51 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %72 DescriptorSet 72 
                                                    OpDecorate %72 Binding 72 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %80 Location 80 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
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
                             Private f32_4* %24 = OpVariable Private 
                                            %27 = OpTypePointer Input %7 
                               Input f32_4* %28 = OpVariable Input 
                                            %34 = OpTypePointer Private %6 
                               Private f32* %35 = OpVariable Private 
                                        f32 %38 = OpConstant 3.67402E-40 
                                        f32 %39 = OpConstant 3.67402E-40 
                                        f32 %40 = OpConstant 3.67402E-40 
                                      f32_3 %41 = OpConstantComposite %38 %39 %40 
                                            %43 = OpTypePointer Private %15 
                             Private f32_2* %44 = OpVariable Private 
                                            %45 = OpTypePointer Input %20 
                               Input f32_3* %46 = OpVariable Input 
                                            %49 = OpTypeStruct %7 
                                            %50 = OpTypePointer Uniform %49 
                   Uniform struct {f32_4;}* %51 = OpVariable Uniform 
                                            %52 = OpTypeInt 32 1 
                                        i32 %53 = OpConstant 0 
                                            %54 = OpTypePointer Uniform %7 
                             Private f32_2* %60 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %72 = OpVariable UniformConstant 
                                            %79 = OpTypePointer Output %7 
                              Output f32_4* %80 = OpVariable Output 
                                            %82 = OpTypeInt 32 0 
                                        u32 %83 = OpConstant 3 
                                            %87 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %19 %19 0 1 2 
                                      f32_4 %22 = OpLoad %9 
                                      f32_4 %23 = OpVectorShuffle %22 %21 4 5 6 3 
                                                    OpStore %9 %23 
                                      f32_4 %25 = OpLoad %9 
                                      f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                      f32_4 %29 = OpLoad %28 
                                      f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                                      f32_3 %31 = OpFMul %26 %30 
                                      f32_4 %32 = OpLoad %24 
                                      f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                                    OpStore %24 %33 
                                      f32_4 %36 = OpLoad %24 
                                      f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32 %42 = OpDot %37 %41 
                                                    OpStore %35 %42 
                                      f32_3 %47 = OpLoad %46 
                                      f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                             Uniform f32_4* %55 = OpAccessChain %51 %53 
                                      f32_4 %56 = OpLoad %55 
                                      f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                      f32_2 %58 = OpFNegate %57 
                                      f32_2 %59 = OpFAdd %48 %58 
                                                    OpStore %44 %59 
                             Uniform f32_4* %61 = OpAccessChain %51 %53 
                                      f32_4 %62 = OpLoad %61 
                                      f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                      f32_2 %64 = OpFNegate %63 
                             Uniform f32_4* %65 = OpAccessChain %51 %53 
                                      f32_4 %66 = OpLoad %65 
                                      f32_2 %67 = OpVectorShuffle %66 %66 2 3 
                                      f32_2 %68 = OpFAdd %64 %67 
                                                    OpStore %60 %68 
                                      f32_2 %69 = OpLoad %44 
                                      f32_2 %70 = OpLoad %60 
                                      f32_2 %71 = OpFDiv %69 %70 
                                                    OpStore %44 %71 
                 read_only Texture2DSampled %73 = OpLoad %72 
                                      f32_2 %74 = OpLoad %44 
                                      f32_4 %75 = OpImageSampleImplicitLod %73 %74 
                                                    OpStore %9 %75 
                                      f32_4 %76 = OpLoad %9 
                                      f32_4 %77 = OpLoad %28 
                                      f32_4 %78 = OpFMul %76 %77 
                                                    OpStore %24 %78 
                                        f32 %81 = OpLoad %35 
                               Private f32* %84 = OpAccessChain %24 %83 
                                        f32 %85 = OpLoad %84 
                                        f32 %86 = OpFMul %81 %85 
                                Output f32* %88 = OpAccessChain %80 %83 
                                                    OpStore %88 %86 
                                      f32_4 %89 = OpLoad %24 
                                      f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                      f32_4 %91 = OpLoad %80 
                                      f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                                    OpStore %80 %92 
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