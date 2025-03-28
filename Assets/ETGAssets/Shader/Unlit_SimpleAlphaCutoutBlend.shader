//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/SimpleAlphaCutoutBlend" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Threshold ("Threshold", Range(0, 1.25)) = 1
_BaseAlphaMax ("Alpha", Range(0, 1)) = 0.9
_AddlTex ("Additional Texture", 2D) = "black" { }
_UseAddlTex ("Use Additional Texture", Float) = 0
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
  GpuProgramID 5367
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0 = u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    vs_TEXCOORD1 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _Threshold;
uniform 	float _UseAddlTex;
uniform  sampler2D _MainTex;
uniform  sampler2D _AddlTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat10_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb0 = 0.5<_UseAddlTex;
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD1.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
        u_xlat10_1 = texture(_AddlTex, u_xlat0.xy);
        SV_Target0.xyz = u_xlat10_1.xyz;
    } else {
        SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    //ENDIF
    }
    u_xlat0.x = (-_Threshold) + 1.0;
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_0.w;
    u_xlatb2 = u_xlat0.x<0.0;
    if((int(u_xlatb2) * int(0xffffffffu))!=0){discard;}
    SV_Target0.w = u_xlat0.x * 5.0;
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
; Bound: 107
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %87 %92 %93 %97 %99 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate %87 Location 87 
                                              OpDecorate %92 RelaxedPrecision 
                                              OpDecorate %92 Location 92 
                                              OpDecorate %93 Location 93 
                                              OpDecorate %97 Location 97 
                                              OpDecorate %99 Location 99 
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
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
                                  f32 %84 = OpConstant 3.67402E-40 
                                f32_4 %85 = OpConstantComposite %84 %84 %84 %84 
                        Output f32_4* %87 = OpVariable Output 
                                  f32 %89 = OpConstant 3.67402E-40 
                                f32_4 %90 = OpConstantComposite %89 %89 %89 %89 
                        Output f32_4* %92 = OpVariable Output 
                         Input f32_4* %93 = OpVariable Input 
                                      %95 = OpTypeVector %6 2 
                                      %96 = OpTypePointer Output %95 
                        Output f32_2* %97 = OpVariable Output 
                                      %98 = OpTypePointer Input %95 
                         Input f32_2* %99 = OpVariable Input 
                                     %101 = OpTypePointer Output %6 
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
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %83 = OpLoad %9 
                                f32_4 %86 = OpFAdd %83 %85 
                                              OpStore %9 %86 
                                f32_4 %88 = OpLoad %9 
                                f32_4 %91 = OpFMul %88 %90 
                                              OpStore %87 %91 
                                f32_4 %94 = OpLoad %93 
                                              OpStore %92 %94 
                               f32_2 %100 = OpLoad %99 
                                              OpStore %97 %100 
                         Output f32* %102 = OpAccessChain %79 %22 %75 
                                 f32 %103 = OpLoad %102 
                                 f32 %104 = OpFNegate %103 
                         Output f32* %105 = OpAccessChain %79 %22 %75 
                                              OpStore %105 %104 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 102
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %51 %94 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpMemberDecorate %27 0 Offset 27 
                                                    OpMemberDecorate %27 1 Offset 27 
                                                    OpDecorate %27 Block 
                                                    OpDecorate %29 DescriptorSet 29 
                                                    OpDecorate %29 Binding 29 
                                                    OpDecorate %42 SpecId 42 
                                                    OpDecorate %47 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %48 DescriptorSet 48 
                                                    OpDecorate %48 Binding 48 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %51 Location 51 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %94 Location 94 
                                                    OpDecorate %95 RelaxedPrecision 
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
                                            %23 = OpTypeBool 
                                            %24 = OpTypePointer Private %23 
                              Private bool* %25 = OpVariable Private 
                                        f32 %26 = OpConstant 3.67402E-40 
                                            %27 = OpTypeStruct %6 %6 
                                            %28 = OpTypePointer Uniform %27 
                Uniform struct {f32; f32;}* %29 = OpVariable Uniform 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 1 
                                            %32 = OpTypePointer Uniform %6 
                                       bool %36 = OpConstantFalse 
                                       bool %42 = OpSpecConstantFalse 
                                            %45 = OpTypeVector %6 3 
                                            %46 = OpTypePointer Private %45 
                             Private f32_3* %47 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %48 = OpVariable UniformConstant 
                                            %50 = OpTypePointer Input %18 
                               Input f32_4* %51 = OpVariable Input 
                             Private f32_3* %56 = OpVariable Private 
                                        f32 %59 = OpConstant 3.67402E-40 
                                        u32 %60 = OpConstant 0 
                                        u32 %62 = OpConstant 1 
                                        u32 %64 = OpConstant 2 
                               Private f32* %66 = OpVariable Private 
                                        i32 %67 = OpConstant 0 
                                        f32 %71 = OpConstant 3.67402E-40 
                               Private f32* %73 = OpVariable Private 
                                        i32 %82 = OpConstant -1 
                                        f32 %89 = OpConstant 3.67402E-40 
                                            %93 = OpTypePointer Output %18 
                              Output f32_4* %94 = OpVariable Output 
                                            %99 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                               Uniform f32* %33 = OpAccessChain %29 %31 
                                        f32 %34 = OpLoad %33 
                                       bool %35 = OpFOrdLessThan %26 %34 
                                                    OpStore %25 %35 
                                                    OpSelectionMerge %38 None 
                                                    OpBranchConditional %36 %37 %38 
                                            %37 = OpLabel 
                                       bool %39 = OpLoad %25 
                                                    OpSelectionMerge %41 None 
                                                    OpBranchConditional %39 %40 %41 
                                            %40 = OpLabel 
                                                    OpBranch %41 
                                            %41 = OpLabel 
                                                    OpBranch %38 
                                            %38 = OpLabel 
                                                    OpSelectionMerge %44 None 
                                                    OpBranchConditional %42 %43 %58 
                                            %43 = OpLabel 
                 read_only Texture2DSampled %49 = OpLoad %48 
                                      f32_4 %52 = OpLoad %51 
                                      f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                      f32_4 %54 = OpImageSampleImplicitLod %49 %53 
                                      f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                                    OpStore %47 %55 
                                      f32_3 %57 = OpLoad %47 
                                                    OpStore %56 %57 
                                                    OpBranch %44 
                                            %58 = OpLabel 
                               Private f32* %61 = OpAccessChain %56 %60 
                                                    OpStore %61 %59 
                               Private f32* %63 = OpAccessChain %56 %62 
                                                    OpStore %63 %59 
                               Private f32* %65 = OpAccessChain %56 %64 
                                                    OpStore %65 %59 
                                                    OpBranch %44 
                                            %44 = OpLabel 
                               Uniform f32* %68 = OpAccessChain %29 %67 
                                        f32 %69 = OpLoad %68 
                                        f32 %70 = OpFNegate %69 
                                        f32 %72 = OpFAdd %70 %71 
                                                    OpStore %66 %72 
                                        f32 %74 = OpLoad %66 
                                        f32 %75 = OpFNegate %74 
                                        f32 %76 = OpLoad %8 
                                        f32 %77 = OpFAdd %75 %76 
                                                    OpStore %73 %77 
                                        f32 %78 = OpLoad %73 
                                       bool %79 = OpFOrdLessThan %78 %59 
                                                    OpStore %25 %79 
                                       bool %80 = OpLoad %25 
                                        i32 %81 = OpSelect %80 %31 %67 
                                        i32 %83 = OpIMul %81 %82 
                                       bool %84 = OpINotEqual %83 %67 
                                                    OpSelectionMerge %86 None 
                                                    OpBranchConditional %84 %85 %86 
                                            %85 = OpLabel 
                                                    OpKill
                                            %86 = OpLabel 
                                        f32 %88 = OpLoad %73 
                                        f32 %90 = OpFMul %88 %89 
                                                    OpStore %73 %90 
                                        f32 %91 = OpLoad %73 
                                        f32 %92 = OpExtInst %1 43 %91 %59 %71 
                                                    OpStore %73 %92 
                                      f32_3 %95 = OpLoad %56 
                                      f32_4 %96 = OpLoad %94 
                                      f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                    OpStore %94 %97 
                                        f32 %98 = OpLoad %73 
                               Output f32* %100 = OpAccessChain %94 %21 
                                                    OpStore %100 %98 
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