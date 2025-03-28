//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Daikon Forge/Dynamic Font Shader" {
Properties {
_MainTex ("Font Texture", 2D) = "white" { }
_Color ("Text Color", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Offset -1, -1
  Fog {
   Mode Off
  }
  GpuProgramID 44820
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
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_POSITION0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0.w * vs_COLOR0.w;
    u_xlat1 = max(abs(vs_TEXCOORD1.y), abs(vs_TEXCOORD1.x));
    u_xlatb1 = 1.0<u_xlat1;
    SV_Target0.w = (u_xlatb1) ? 0.0 : u_xlat0;
    SV_Target0.xyz = vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 111
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %90 %101 %103 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
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
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %82 Location 82 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %83 Location 83 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate %103 Location 103 
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
                               Output f32_2* %101 = OpVariable Output 
                                             %102 = OpTypePointer Input %88 
                                Input f32_2* %103 = OpVariable Input 
                                             %105 = OpTypePointer Output %6 
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
                               Uniform f32_4* %85 = OpAccessChain %20 %44 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpFMul %84 %86 
                                                      OpStore %82 %87 
                                        f32_4 %91 = OpLoad %11 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                               Uniform f32_4* %93 = OpAccessChain %20 %35 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %92 %95 
                               Uniform f32_4* %97 = OpAccessChain %20 %35 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                                       f32_2 %100 = OpFAdd %96 %99 
                                                      OpStore %90 %100 
                                       f32_2 %104 = OpLoad %103 
                                                      OpStore %101 %104 
                                 Output f32* %106 = OpAccessChain %72 %22 %68 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFNegate %107 
                                 Output f32* %109 = OpAccessChain %72 %22 %68 
                                                      OpStore %109 %108 
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
                                                    OpEntryPoint Fragment %4 "main" %16 %26 %32 %49 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %26 Location 26 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %32 Location 32 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %49 Location 49 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
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
                                            %25 = OpTypePointer Input %18 
                               Input f32_4* %26 = OpVariable Input 
                                            %27 = OpTypePointer Input %6 
                               Private f32* %31 = OpVariable Private 
                               Input f32_2* %32 = OpVariable Input 
                                        u32 %33 = OpConstant 1 
                                        u32 %37 = OpConstant 0 
                                            %42 = OpTypeBool 
                                            %43 = OpTypePointer Private %42 
                              Private bool* %44 = OpVariable Private 
                                        f32 %45 = OpConstant 3.67402E-40 
                                            %48 = OpTypePointer Output %18 
                              Output f32_4* %49 = OpVariable Output 
                                            %50 = OpTypePointer Function %6 
                                        f32 %55 = OpConstant 3.67402E-40 
                                            %59 = OpTypePointer Output %6 
                                            %61 = OpTypeVector %6 3 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %51 = OpVariable Function 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %24 = OpLoad %8 
                                 Input f32* %28 = OpAccessChain %26 %21 
                                        f32 %29 = OpLoad %28 
                                        f32 %30 = OpFMul %24 %29 
                                                    OpStore %23 %30 
                                 Input f32* %34 = OpAccessChain %32 %33 
                                        f32 %35 = OpLoad %34 
                                        f32 %36 = OpExtInst %1 4 %35 
                                 Input f32* %38 = OpAccessChain %32 %37 
                                        f32 %39 = OpLoad %38 
                                        f32 %40 = OpExtInst %1 4 %39 
                                        f32 %41 = OpExtInst %1 40 %36 %40 
                                                    OpStore %31 %41 
                                        f32 %46 = OpLoad %31 
                                       bool %47 = OpFOrdLessThan %45 %46 
                                                    OpStore %44 %47 
                                       bool %52 = OpLoad %44 
                                                    OpSelectionMerge %54 None 
                                                    OpBranchConditional %52 %53 %56 
                                            %53 = OpLabel 
                                                    OpStore %51 %55 
                                                    OpBranch %54 
                                            %56 = OpLabel 
                                        f32 %57 = OpLoad %23 
                                                    OpStore %51 %57 
                                                    OpBranch %54 
                                            %54 = OpLabel 
                                        f32 %58 = OpLoad %51 
                                Output f32* %60 = OpAccessChain %49 %21 
                                                    OpStore %60 %58 
                                      f32_4 %62 = OpLoad %26 
                                      f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                      f32_4 %64 = OpLoad %49 
                                      f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                    OpStore %49 %65 
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