//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/ItemSpecific/MetalSkinLayerShader" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 10748
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
in  vec3 in_TEXCOORD1;
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
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
bvec2 u_xlatb0;
float u_xlat2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat10_0.w + -0.100000001;
    u_xlatb0.x = u_xlat0.x<0.0;
    if((int(u_xlatb0.x) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = fract(_Time.y);
    u_xlat0.y = u_xlat0.x * 3.0;
    u_xlat2 = vs_TEXCOORD1.y + vs_TEXCOORD1.x;
    u_xlat0.z = u_xlat2 * 0.5 + -0.100000001;
    u_xlat0.x = u_xlat0.x * 3.0 + 0.100000001;
    u_xlatb0.xy = lessThan(u_xlat0.xzxx, u_xlat0.zyzz).xy;
    u_xlatb0.x = u_xlatb0.x || u_xlatb0.y;
    if((int(u_xlatb0.x) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 103
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 %93 %95 
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
                                              OpDecorate %93 Location 93 
                                              OpDecorate %95 Location 95 
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
                                      %91 = OpTypeVector %6 3 
                                      %92 = OpTypePointer Output %91 
                        Output f32_3* %93 = OpVariable Output 
                                      %94 = OpTypePointer Input %91 
                         Input f32_3* %95 = OpVariable Input 
                                      %97 = OpTypePointer Output %6 
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
                                f32_3 %96 = OpLoad %95 
                                              OpStore %93 %96 
                          Output f32* %98 = OpAccessChain %72 %22 %68 
                                  f32 %99 = OpLoad %98 
                                 f32 %100 = OpFNegate %99 
                         Output f32* %101 = OpAccessChain %72 %22 %68 
                                              OpStore %101 %100 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 114
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %68 %110 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpMemberDecorate %51 0 Offset 51 
                                                    OpDecorate %51 Block 
                                                    OpDecorate %53 DescriptorSet 53 
                                                    OpDecorate %53 Binding 53 
                                                    OpDecorate %68 Location 68 
                                                    OpDecorate %110 RelaxedPrecision 
                                                    OpDecorate %110 Location 110 
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
                                        f32 %25 = OpConstant 3.67402E-40 
                                            %27 = OpTypeBool 
                                            %28 = OpTypeVector %27 2 
                                            %29 = OpTypePointer Private %28 
                            Private bool_2* %30 = OpVariable Private 
                                        f32 %32 = OpConstant 3.67402E-40 
                                            %38 = OpTypeInt 32 1 
                                        i32 %39 = OpConstant 0 
                                        i32 %40 = OpConstant 1 
                                        i32 %42 = OpConstant -1 
                                            %48 = OpTypeVector %6 3 
                                            %49 = OpTypePointer Private %48 
                             Private f32_3* %50 = OpVariable Private 
                                            %51 = OpTypeStruct %18 
                                            %52 = OpTypePointer Uniform %51 
                   Uniform struct {f32_4;}* %53 = OpVariable Uniform 
                                        u32 %54 = OpConstant 1 
                                            %55 = OpTypePointer Uniform %6 
                                        u32 %59 = OpConstant 0 
                                        f32 %63 = OpConstant 3.67402E-40 
                               Private f32* %66 = OpVariable Private 
                                            %67 = OpTypePointer Input %48 
                               Input f32_3* %68 = OpVariable Input 
                                            %69 = OpTypePointer Input %6 
                                        f32 %76 = OpConstant 3.67402E-40 
                                        u32 %79 = OpConstant 2 
                                        f32 %84 = OpConstant 3.67402E-40 
                                            %91 = OpTypeVector %27 4 
                                           %109 = OpTypePointer Output %18 
                             Output f32_4* %110 = OpVariable Output 
                                       f32 %111 = OpConstant 3.67402E-40 
                                     f32_4 %112 = OpConstantComposite %111 %111 %111 %111 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %24 = OpLoad %8 
                                        f32 %26 = OpFAdd %24 %25 
                                                    OpStore %23 %26 
                                        f32 %31 = OpLoad %23 
                                       bool %33 = OpFOrdLessThan %31 %32 
                                     bool_2 %34 = OpLoad %30 
                                     bool_2 %35 = OpCompositeInsert %33 %34 0 
                                                    OpStore %30 %35 
                                     bool_2 %36 = OpLoad %30 
                                       bool %37 = OpCompositeExtract %36 0 
                                        i32 %41 = OpSelect %37 %40 %39 
                                        i32 %43 = OpIMul %41 %42 
                                       bool %44 = OpINotEqual %43 %39 
                                                    OpSelectionMerge %46 None 
                                                    OpBranchConditional %44 %45 %46 
                                            %45 = OpLabel 
                                                    OpKill
                                            %46 = OpLabel 
                               Uniform f32* %56 = OpAccessChain %53 %39 %54 
                                        f32 %57 = OpLoad %56 
                                        f32 %58 = OpExtInst %1 10 %57 
                               Private f32* %60 = OpAccessChain %50 %59 
                                                    OpStore %60 %58 
                               Private f32* %61 = OpAccessChain %50 %59 
                                        f32 %62 = OpLoad %61 
                                        f32 %64 = OpFMul %62 %63 
                               Private f32* %65 = OpAccessChain %50 %54 
                                                    OpStore %65 %64 
                                 Input f32* %70 = OpAccessChain %68 %54 
                                        f32 %71 = OpLoad %70 
                                 Input f32* %72 = OpAccessChain %68 %59 
                                        f32 %73 = OpLoad %72 
                                        f32 %74 = OpFAdd %71 %73 
                                                    OpStore %66 %74 
                                        f32 %75 = OpLoad %66 
                                        f32 %77 = OpFMul %75 %76 
                                        f32 %78 = OpFAdd %77 %25 
                               Private f32* %80 = OpAccessChain %50 %79 
                                                    OpStore %80 %78 
                               Private f32* %81 = OpAccessChain %50 %59 
                                        f32 %82 = OpLoad %81 
                                        f32 %83 = OpFMul %82 %63 
                                        f32 %85 = OpFAdd %83 %84 
                               Private f32* %86 = OpAccessChain %50 %59 
                                                    OpStore %86 %85 
                                      f32_3 %87 = OpLoad %50 
                                      f32_4 %88 = OpVectorShuffle %87 %87 0 2 0 0 
                                      f32_3 %89 = OpLoad %50 
                                      f32_4 %90 = OpVectorShuffle %89 %89 2 1 2 2 
                                     bool_4 %92 = OpFOrdLessThan %88 %90 
                                     bool_2 %93 = OpVectorShuffle %92 %92 0 1 
                                                    OpStore %30 %93 
                                     bool_2 %94 = OpLoad %30 
                                       bool %95 = OpCompositeExtract %94 0 
                                     bool_2 %96 = OpLoad %30 
                                       bool %97 = OpCompositeExtract %96 1 
                                       bool %98 = OpLogicalOr %95 %97 
                                     bool_2 %99 = OpLoad %30 
                                    bool_2 %100 = OpCompositeInsert %98 %99 0 
                                                    OpStore %30 %100 
                                    bool_2 %101 = OpLoad %30 
                                      bool %102 = OpCompositeExtract %101 0 
                                       i32 %103 = OpSelect %102 %40 %39 
                                       i32 %104 = OpIMul %103 %42 
                                      bool %105 = OpINotEqual %104 %39 
                                                    OpSelectionMerge %107 None 
                                                    OpBranchConditional %105 %106 %107 
                                           %106 = OpLabel 
                                                    OpKill
                                           %107 = OpLabel 
                                                    OpStore %110 %112 
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