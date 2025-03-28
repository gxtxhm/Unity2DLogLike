//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/SimpleTextureAlphaFade" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_AlphaMod ("Alpha", Float) = 1
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 20006
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

uniform 	float _AlphaMod;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_0.w + -0.25;
    SV_Target0.xyz = u_xlat10_0.xyz;
    u_xlatb0 = u_xlat3<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.w = _AlphaMod;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
; Bound: 61
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %58 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpMemberDecorate %45 0 Offset 45 
                                                    OpDecorate %45 Block 
                                                    OpDecorate %47 DescriptorSet 47 
                                                    OpDecorate %47 Binding 47 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %58 Location 58 
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
                                            %20 = OpTypePointer Private %6 
                               Private f32* %21 = OpVariable Private 
                                            %22 = OpTypeInt 32 0 
                                        u32 %23 = OpConstant 3 
                                        f32 %26 = OpConstant 3.67402E-40 
                                            %28 = OpTypeBool 
                                            %29 = OpTypePointer Private %28 
                              Private bool* %30 = OpVariable Private 
                                        f32 %32 = OpConstant 3.67402E-40 
                                            %35 = OpTypeInt 32 1 
                                        i32 %36 = OpConstant 0 
                                        i32 %37 = OpConstant 1 
                                        i32 %39 = OpConstant -1 
                                            %45 = OpTypeStruct %6 
                                            %46 = OpTypePointer Uniform %45 
                     Uniform struct {f32;}* %47 = OpVariable Uniform 
                                            %48 = OpTypePointer Uniform %6 
                                        f32 %54 = OpConstant 3.67402E-40 
                                            %57 = OpTypePointer Output %7 
                              Output f32_4* %58 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %24 = OpAccessChain %9 %23 
                                        f32 %25 = OpLoad %24 
                                        f32 %27 = OpFAdd %25 %26 
                                                    OpStore %21 %27 
                                        f32 %31 = OpLoad %21 
                                       bool %33 = OpFOrdLessThan %31 %32 
                                                    OpStore %30 %33 
                                       bool %34 = OpLoad %30 
                                        i32 %38 = OpSelect %34 %37 %36 
                                        i32 %40 = OpIMul %38 %39 
                                       bool %41 = OpINotEqual %40 %36 
                                                    OpSelectionMerge %43 None 
                                                    OpBranchConditional %41 %42 %43 
                                            %42 = OpLabel 
                                                    OpKill
                                            %43 = OpLabel 
                               Uniform f32* %49 = OpAccessChain %47 %36 
                                        f32 %50 = OpLoad %49 
                               Private f32* %51 = OpAccessChain %9 %23 
                                                    OpStore %51 %50 
                               Private f32* %52 = OpAccessChain %9 %23 
                                        f32 %53 = OpLoad %52 
                                        f32 %55 = OpExtInst %1 43 %53 %32 %54 
                               Private f32* %56 = OpAccessChain %9 %23 
                                                    OpStore %56 %55 
                                      f32_4 %59 = OpLoad %9 
                                                    OpStore %58 %59 
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