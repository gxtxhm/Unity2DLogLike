//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "tk2d/SpriteOutlineCutout" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_LuminanceCutoff ("Luminance Cutoff", Float) = 0
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 61312
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OverrideColor;
uniform 	float _LuminanceCutoff;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = (-u_xlat10_0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = u_xlat0.x<_LuminanceCutoff;
    u_xlat0.x = (u_xlatb0) ? 0.0 : u_xlat1.w;
    u_xlat2 = u_xlat0.x + -0.100000001;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat2<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 97
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
                        Output f32_4* %82 = OpVariable Output 
                         Input f32_4* %83 = OpVariable Input 
                                      %85 = OpTypeVector %6 2 
                                      %86 = OpTypePointer Output %85 
                        Output f32_2* %87 = OpVariable Output 
                                      %88 = OpTypePointer Input %85 
                         Input f32_2* %89 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
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
                                              OpStore %87 %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %72 %22 %68 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 110
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %23 %46 
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
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpMemberDecorate %35 0 RelaxedPrecision 
                                                    OpMemberDecorate %35 0 Offset 35 
                                                    OpMemberDecorate %35 1 Offset 35 
                                                    OpDecorate %35 Block 
                                                    OpDecorate %37 DescriptorSet 37 
                                                    OpDecorate %37 Binding 37 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %46 Location 46 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
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
                                            %26 = OpTypeVector %6 3 
                                            %27 = OpTypePointer Private %26 
                             Private f32_3* %28 = OpVariable Private 
                                            %35 = OpTypeStruct %7 %6 
                                            %36 = OpTypePointer Uniform %35 
              Uniform struct {f32_4; f32;}* %37 = OpVariable Uniform 
                                            %38 = OpTypeInt 32 1 
                                        i32 %39 = OpConstant 0 
                                            %40 = OpTypePointer Uniform %7 
                                            %45 = OpTypePointer Output %7 
                              Output f32_4* %46 = OpVariable Output 
                                        f32 %59 = OpConstant 3.67402E-40 
                                        f32 %60 = OpConstant 3.67402E-40 
                                        f32 %61 = OpConstant 3.67402E-40 
                                      f32_3 %62 = OpConstantComposite %59 %60 %61 
                                            %64 = OpTypeInt 32 0 
                                        u32 %65 = OpConstant 0 
                                            %66 = OpTypePointer Private %6 
                                            %68 = OpTypeBool 
                                            %69 = OpTypePointer Private %68 
                              Private bool* %70 = OpVariable Private 
                                        i32 %73 = OpConstant 1 
                                            %74 = OpTypePointer Uniform %6 
                                            %78 = OpTypePointer Function %6 
                                        f32 %83 = OpConstant 3.67402E-40 
                                        u32 %85 = OpConstant 3 
                               Private f32* %90 = OpVariable Private 
                                        f32 %93 = OpConstant 3.67402E-40 
                                            %97 = OpTypePointer Output %6 
                                       i32 %103 = OpConstant -1 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %79 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %21 = OpLoad %9 
                                      f32_4 %24 = OpLoad %23 
                                      f32_4 %25 = OpFMul %21 %24 
                                                    OpStore %20 %25 
                                      f32_4 %29 = OpLoad %9 
                                      f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                                      f32_3 %31 = OpFNegate %30 
                                      f32_4 %32 = OpLoad %23 
                                      f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                      f32_3 %34 = OpFMul %31 %33 
                             Uniform f32_4* %41 = OpAccessChain %37 %39 
                                      f32_4 %42 = OpLoad %41 
                                      f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                                      f32_3 %44 = OpFAdd %34 %43 
                                                    OpStore %28 %44 
                             Uniform f32_4* %47 = OpAccessChain %37 %39 
                                      f32_4 %48 = OpLoad %47 
                                      f32_3 %49 = OpVectorShuffle %48 %48 3 3 3 
                                      f32_3 %50 = OpLoad %28 
                                      f32_3 %51 = OpFMul %49 %50 
                                      f32_4 %52 = OpLoad %20 
                                      f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                      f32_3 %54 = OpFAdd %51 %53 
                                      f32_4 %55 = OpLoad %46 
                                      f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                                    OpStore %46 %56 
                                      f32_4 %57 = OpLoad %20 
                                      f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                        f32 %63 = OpDot %58 %62 
                               Private f32* %67 = OpAccessChain %28 %65 
                                                    OpStore %67 %63 
                               Private f32* %71 = OpAccessChain %28 %65 
                                        f32 %72 = OpLoad %71 
                               Uniform f32* %75 = OpAccessChain %37 %73 
                                        f32 %76 = OpLoad %75 
                                       bool %77 = OpFOrdLessThan %72 %76 
                                                    OpStore %70 %77 
                                       bool %80 = OpLoad %70 
                                                    OpSelectionMerge %82 None 
                                                    OpBranchConditional %80 %81 %84 
                                            %81 = OpLabel 
                                                    OpStore %79 %83 
                                                    OpBranch %82 
                                            %84 = OpLabel 
                               Private f32* %86 = OpAccessChain %20 %85 
                                        f32 %87 = OpLoad %86 
                                                    OpStore %79 %87 
                                                    OpBranch %82 
                                            %82 = OpLabel 
                                        f32 %88 = OpLoad %79 
                               Private f32* %89 = OpAccessChain %28 %65 
                                                    OpStore %89 %88 
                               Private f32* %91 = OpAccessChain %28 %65 
                                        f32 %92 = OpLoad %91 
                                        f32 %94 = OpFAdd %92 %93 
                                                    OpStore %90 %94 
                               Private f32* %95 = OpAccessChain %28 %65 
                                        f32 %96 = OpLoad %95 
                                Output f32* %98 = OpAccessChain %46 %85 
                                                    OpStore %98 %96 
                                        f32 %99 = OpLoad %90 
                                      bool %100 = OpFOrdLessThan %99 %83 
                                                    OpStore %70 %100 
                                      bool %101 = OpLoad %70 
                                       i32 %102 = OpSelect %101 %73 %39 
                                       i32 %104 = OpIMul %102 %103 
                                      bool %105 = OpINotEqual %104 %39 
                                                    OpSelectionMerge %107 None 
                                                    OpBranchConditional %105 %106 %107 
                                           %106 = OpLabel 
                                                    OpKill
                                           %107 = OpLabel 
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