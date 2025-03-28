//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/Starnest_Replacement_Cheap" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_LayerTex ("Texture", 2D) = "white" { }
_PositionX ("Position X", Float) = 0
_PositionY ("Position Y", Float) = 0
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 31261
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
uniform 	vec4 _LayerTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
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

uniform 	vec4 _Time;
uniform 	float _PositionX;
uniform 	float _PositionY;
uniform  sampler2D _MainTex;
uniform  sampler2D _LayerTex;
in  vec2 vs_TEXCOORD0;
 vec4 phase0_Input0_0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat16_1;
vec4 u_xlat10_1;
void main()
{
    phase0_Input0_0 = vec4(vs_TEXCOORD0, vs_TEXCOORD1);
    u_xlat0 = vec4(_PositionX, _PositionY, _PositionX, _PositionY) * vec4(0.166666672, 0.0500000007, 0.166666672, 0.0500000007) + phase0_Input0_0;
    u_xlat0.xy = _Time.xx * vec2(0.0500000007, 0.0500000007) + u_xlat0.xy;
    u_xlat10_1 = texture(_LayerTex, u_xlat0.zw);
    u_xlat16_1 = u_xlat10_1 * vec4(1.5, 1.5, 1.5, 1.5);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = log2(u_xlat10_0);
    u_xlat16_0 = u_xlat16_0 * vec4(1.5, 1.5, 1.5, 1.5);
    u_xlat16_0 = exp2(u_xlat16_0);
    SV_Target0 = u_xlat16_1 * vec4(0.699999988, 0.699999988, 0.699999988, 0.0) + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 112
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %11 %32 %46 %96 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %46 Location 46 
                                                      OpMemberDecorate %94 0 BuiltIn 94 
                                                      OpMemberDecorate %94 1 BuiltIn 94 
                                                      OpMemberDecorate %94 2 BuiltIn 94 
                                                      OpDecorate %94 Block 
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
                                              %18 = OpTypeStruct %16 %17 %13 %13 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 2 
                                              %23 = OpTypePointer Uniform %13 
                                Output f32_2* %32 = OpVariable Output 
                                          i32 %34 = OpConstant 3 
                                              %43 = OpTypePointer Private %13 
                               Private f32_4* %44 = OpVariable Private 
                                              %45 = OpTypePointer Input %13 
                                 Input f32_4* %46 = OpVariable Input 
                                          i32 %49 = OpConstant 0 
                                          i32 %50 = OpConstant 1 
                               Private f32_4* %72 = OpVariable Private 
                                          u32 %92 = OpConstant 1 
                                              %93 = OpTypeArray %6 %92 
                                              %94 = OpTypeStruct %13 %6 %93 
                                              %95 = OpTypePointer Output %94 
         Output struct {f32_4; f32; f32[1];}* %96 = OpVariable Output 
                                             %104 = OpTypePointer Output %13 
                                             %106 = OpTypePointer Output %6 
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
                                        f32_2 %33 = OpLoad %11 
                               Uniform f32_4* %35 = OpAccessChain %20 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                                        f32_2 %38 = OpFMul %33 %37 
                               Uniform f32_4* %39 = OpAccessChain %20 %34 
                                        f32_4 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                                        f32_2 %42 = OpFAdd %38 %41 
                                                      OpStore %32 %42 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpVectorShuffle %47 %47 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %49 %50 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %48 %52 
                                                      OpStore %44 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %49 %49 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %46 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %44 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %44 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %49 %22 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %46 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %44 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %44 %67 
                                        f32_4 %68 = OpLoad %44 
                               Uniform f32_4* %69 = OpAccessChain %20 %49 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFAdd %68 %70 
                                                      OpStore %44 %71 
                                        f32_4 %73 = OpLoad %44 
                                        f32_4 %74 = OpVectorShuffle %73 %73 1 1 1 1 
                               Uniform f32_4* %75 = OpAccessChain %20 %50 %50 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpFMul %74 %76 
                                                      OpStore %72 %77 
                               Uniform f32_4* %78 = OpAccessChain %20 %50 %49 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %44 
                                        f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %72 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %72 %84 
                               Uniform f32_4* %85 = OpAccessChain %20 %50 %22 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %44 
                                        f32_4 %88 = OpVectorShuffle %87 %87 2 2 2 2 
                                        f32_4 %89 = OpFMul %86 %88 
                                        f32_4 %90 = OpLoad %72 
                                        f32_4 %91 = OpFAdd %89 %90 
                                                      OpStore %72 %91 
                               Uniform f32_4* %97 = OpAccessChain %20 %50 %34 
                                        f32_4 %98 = OpLoad %97 
                                        f32_4 %99 = OpLoad %44 
                                       f32_4 %100 = OpVectorShuffle %99 %99 3 3 3 3 
                                       f32_4 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %72 
                                       f32_4 %103 = OpFAdd %101 %102 
                               Output f32_4* %105 = OpAccessChain %96 %49 
                                                      OpStore %105 %103 
                                 Output f32* %107 = OpAccessChain %96 %49 %92 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                 Output f32* %110 = OpAccessChain %96 %49 %92 
                                                      OpStore %110 %109 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 97
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %12 %14 %94 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 Location 12 
                                                    OpDecorate %14 Location 14 
                                                    OpMemberDecorate %22 0 Offset 22 
                                                    OpMemberDecorate %22 1 Offset 22 
                                                    OpMemberDecorate %22 2 Offset 22 
                                                    OpDecorate %22 Block 
                                                    OpDecorate %24 DescriptorSet 24 
                                                    OpDecorate %24 Binding 24 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %60 DescriptorSet 60 
                                                    OpDecorate %60 Binding 60 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %66 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %74 DescriptorSet 74 
                                                    OpDecorate %74 Binding 74 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %94 Location 94 
                                                    OpDecorate %95 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypePointer Input %10 
                               Input f32_2* %12 = OpVariable Input 
                               Input f32_2* %14 = OpVariable Input 
                             Private f32_4* %21 = OpVariable Private 
                                            %22 = OpTypeStruct %7 %6 %6 
                                            %23 = OpTypePointer Uniform %22 
         Uniform struct {f32_4; f32; f32;}* %24 = OpVariable Uniform 
                                            %25 = OpTypeInt 32 1 
                                        i32 %26 = OpConstant 1 
                                            %27 = OpTypePointer Uniform %6 
                                        i32 %30 = OpConstant 2 
                                        f32 %38 = OpConstant 3.67402E-40 
                                        f32 %39 = OpConstant 3.67402E-40 
                                      f32_4 %40 = OpConstantComposite %38 %39 %38 %39 
                                        i32 %44 = OpConstant 0 
                                            %45 = OpTypePointer Uniform %7 
                                      f32_2 %49 = OpConstantComposite %39 %39 
                             Private f32_4* %56 = OpVariable Private 
                                            %57 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %58 = OpTypeSampledImage %57 
                                            %59 = OpTypePointer UniformConstant %58 
UniformConstant read_only Texture2DSampled* %60 = OpVariable UniformConstant 
                             Private f32_4* %65 = OpVariable Private 
                                        f32 %67 = OpConstant 3.67402E-40 
                                      f32_4 %68 = OpConstantComposite %67 %67 %67 %67 
                             Private f32_4* %73 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %74 = OpVariable UniformConstant 
                             Private f32_4* %79 = OpVariable Private 
                                        f32 %87 = OpConstant 3.67402E-40 
                                        f32 %88 = OpConstant 3.67402E-40 
                                      f32_4 %89 = OpConstantComposite %87 %87 %87 %88 
                                            %93 = OpTypePointer Output %7 
                              Output f32_4* %94 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %13 = OpLoad %12 
                                      f32_2 %15 = OpLoad %14 
                                        f32 %16 = OpCompositeExtract %13 0 
                                        f32 %17 = OpCompositeExtract %13 1 
                                        f32 %18 = OpCompositeExtract %15 0 
                                        f32 %19 = OpCompositeExtract %15 1 
                                      f32_4 %20 = OpCompositeConstruct %16 %17 %18 %19 
                                                    OpStore %9 %20 
                               Uniform f32* %28 = OpAccessChain %24 %26 
                                        f32 %29 = OpLoad %28 
                               Uniform f32* %31 = OpAccessChain %24 %30 
                                        f32 %32 = OpLoad %31 
                               Uniform f32* %33 = OpAccessChain %24 %26 
                                        f32 %34 = OpLoad %33 
                               Uniform f32* %35 = OpAccessChain %24 %30 
                                        f32 %36 = OpLoad %35 
                                      f32_4 %37 = OpCompositeConstruct %29 %32 %34 %36 
                                      f32_4 %41 = OpFMul %37 %40 
                                      f32_4 %42 = OpLoad %9 
                                      f32_4 %43 = OpFAdd %41 %42 
                                                    OpStore %21 %43 
                             Uniform f32_4* %46 = OpAccessChain %24 %44 
                                      f32_4 %47 = OpLoad %46 
                                      f32_2 %48 = OpVectorShuffle %47 %47 0 0 
                                      f32_2 %50 = OpFMul %48 %49 
                                      f32_4 %51 = OpLoad %21 
                                      f32_2 %52 = OpVectorShuffle %51 %51 0 1 
                                      f32_2 %53 = OpFAdd %50 %52 
                                      f32_4 %54 = OpLoad %21 
                                      f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                    OpStore %21 %55 
                 read_only Texture2DSampled %61 = OpLoad %60 
                                      f32_4 %62 = OpLoad %21 
                                      f32_2 %63 = OpVectorShuffle %62 %62 2 3 
                                      f32_4 %64 = OpImageSampleImplicitLod %61 %63 
                                                    OpStore %56 %64 
                                      f32_4 %66 = OpLoad %56 
                                      f32_4 %69 = OpFMul %66 %68 
                                                    OpStore %65 %69 
                                      f32_4 %70 = OpLoad %65 
                                      f32_4 %71 = OpLoad %65 
                                      f32_4 %72 = OpFMul %70 %71 
                                                    OpStore %65 %72 
                 read_only Texture2DSampled %75 = OpLoad %74 
                                      f32_4 %76 = OpLoad %21 
                                      f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                      f32_4 %78 = OpImageSampleImplicitLod %75 %77 
                                                    OpStore %73 %78 
                                      f32_4 %80 = OpLoad %73 
                                      f32_4 %81 = OpExtInst %1 30 %80 
                                                    OpStore %79 %81 
                                      f32_4 %82 = OpLoad %79 
                                      f32_4 %83 = OpFMul %82 %68 
                                                    OpStore %79 %83 
                                      f32_4 %84 = OpLoad %79 
                                      f32_4 %85 = OpExtInst %1 29 %84 
                                                    OpStore %79 %85 
                                      f32_4 %86 = OpLoad %65 
                                      f32_4 %90 = OpFMul %86 %89 
                                      f32_4 %91 = OpLoad %79 
                                      f32_4 %92 = OpFAdd %90 %91 
                                                    OpStore %79 %92 
                                      f32_4 %95 = OpLoad %79 
                                                    OpStore %94 %95 
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