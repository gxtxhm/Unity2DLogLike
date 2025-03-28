//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/VideoDecode" {
Properties {
_MainTex ("_MainTex (A)", 2D) = "black" { }
_SecondTex ("_SecondTex (A)", 2D) = "black" { }
_ThirdTex ("_ThirdTex (A)", 2D) = "black" { }
}
SubShader {
 Pass {
  Name "YCBCR_TO_RGB1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 28028
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
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _RightEyeUVOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = float(unity_StereoEyeIndex);
    vs_TEXCOORD0.xy = vec2(u_xlat4) * _RightEyeUVOffset.xy + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
uniform  sampler2D _SecondTex;
uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
vec4 u_xlat10_2;
float u_xlat16_3;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat10_0 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xy = u_xlat10_0.ww * vec2(0.390625, 1.984375);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.x = u_xlat10_1.w * 1.15625 + (-u_xlat16_0.x);
    u_xlat16_3 = u_xlat10_1.w * 1.15625 + u_xlat16_0.y;
    SV_Target0.z = u_xlat16_3 + -1.06861997;
    u_xlat10_2 = texture(_ThirdTex, vs_TEXCOORD0.xy);
    u_xlat0.x = (-u_xlat10_2.w) * 0.8125 + u_xlat16_0.x;
    u_xlat16_3 = u_xlat10_2.w * 1.59375;
    u_xlat0.y = u_xlat10_1.w * 1.15625 + u_xlat16_3;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 120
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %84 %104 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %104 Location 104 
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
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; i32; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
                                              %82 = OpTypeVector %6 2 
                                              %83 = OpTypePointer Input %82 
                                 Input f32_2* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                              %97 = OpTypePointer Private %6 
                                 Private f32* %98 = OpVariable Private 
                                              %99 = OpTypePointer Uniform %18 
                                             %103 = OpTypePointer Output %82 
                               Output f32_2* %104 = OpVariable Output 
                                             %114 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %22 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %28 = OpAccessChain %21 %22 %22 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %21 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %21 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %21 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %21 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %21 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                        f32_2 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                        f32_2 %90 = OpFMul %85 %89 
                               Uniform f32_4* %91 = OpAccessChain %21 %86 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 2 3 
                                        f32_2 %94 = OpFAdd %90 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
                                                      OpStore %9 %96 
                                Uniform i32* %100 = OpAccessChain %21 %35 
                                         i32 %101 = OpLoad %100 
                                         f32 %102 = OpConvertSToF %101 
                                                      OpStore %98 %102 
                                         f32 %105 = OpLoad %98 
                                       f32_2 %106 = OpCompositeConstruct %105 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %44 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_2 %113 = OpFAdd %110 %112 
                                                      OpStore %104 %113 
                                 Output f32* %115 = OpAccessChain %72 %22 %68 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                 Output f32* %118 = OpAccessChain %72 %22 %68 
                                                      OpStore %118 %117 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 93
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %9 %24 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %9 Location 9 
                                                    OpDecorate %16 RelaxedPrecision 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %20 DescriptorSet 20 
                                                    OpDecorate %20 Binding 20 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %24 Location 24 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %36 DescriptorSet 36 
                                                    OpDecorate %36 Binding 36 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %47 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %63 DescriptorSet 63 
                                                    OpDecorate %63 Binding 63 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Output %7 
                               Output f32_4* %9 = OpVariable Output 
                                        f32 %10 = OpConstant 3.67402E-40 
                                            %11 = OpTypeInt 32 0 
                                        u32 %12 = OpConstant 3 
                                            %13 = OpTypePointer Output %6 
                                            %15 = OpTypePointer Private %6 
                               Private f32* %16 = OpVariable Private 
                                            %17 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %18 = OpTypeSampledImage %17 
                                            %19 = OpTypePointer UniformConstant %18 
UniformConstant read_only Texture2DSampled* %20 = OpVariable UniformConstant 
                                            %22 = OpTypeVector %6 2 
                                            %23 = OpTypePointer Input %22 
                               Input f32_2* %24 = OpVariable Input 
                                            %28 = OpTypePointer Private %22 
                             Private f32_2* %29 = OpVariable Private 
                                        f32 %32 = OpConstant 3.67402E-40 
                                        f32 %33 = OpConstant 3.67402E-40 
                                      f32_2 %34 = OpConstantComposite %32 %33 
UniformConstant read_only Texture2DSampled* %36 = OpVariable UniformConstant 
                                        f32 %42 = OpConstant 3.67402E-40 
                                        u32 %44 = OpConstant 0 
                               Private f32* %50 = OpVariable Private 
                                        u32 %53 = OpConstant 1 
                                        f32 %58 = OpConstant 3.67402E-40 
                                        u32 %60 = OpConstant 2 
                               Private f32* %62 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %63 = OpVariable UniformConstant 
                                        f32 %70 = OpConstant 3.67402E-40 
                                        f32 %77 = OpConstant 3.67402E-40 
                                        f32 %86 = OpConstant 3.67402E-40 
                                        f32 %87 = OpConstant 3.67402E-40 
                                      f32_2 %88 = OpConstantComposite %86 %87 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                Output f32* %14 = OpAccessChain %9 %12 
                                                    OpStore %14 %10 
                 read_only Texture2DSampled %21 = OpLoad %20 
                                      f32_2 %25 = OpLoad %24 
                                      f32_4 %26 = OpImageSampleImplicitLod %21 %25 
                                        f32 %27 = OpCompositeExtract %26 3 
                                                    OpStore %16 %27 
                                        f32 %30 = OpLoad %16 
                                      f32_2 %31 = OpCompositeConstruct %30 %30 
                                      f32_2 %35 = OpFMul %31 %34 
                                                    OpStore %29 %35 
                 read_only Texture2DSampled %37 = OpLoad %36 
                                      f32_2 %38 = OpLoad %24 
                                      f32_4 %39 = OpImageSampleImplicitLod %37 %38 
                                        f32 %40 = OpCompositeExtract %39 3 
                                                    OpStore %16 %40 
                                        f32 %41 = OpLoad %16 
                                        f32 %43 = OpFMul %41 %42 
                               Private f32* %45 = OpAccessChain %29 %44 
                                        f32 %46 = OpLoad %45 
                                        f32 %47 = OpFNegate %46 
                                        f32 %48 = OpFAdd %43 %47 
                               Private f32* %49 = OpAccessChain %29 %44 
                                                    OpStore %49 %48 
                                        f32 %51 = OpLoad %16 
                                        f32 %52 = OpFMul %51 %42 
                               Private f32* %54 = OpAccessChain %29 %53 
                                        f32 %55 = OpLoad %54 
                                        f32 %56 = OpFAdd %52 %55 
                                                    OpStore %50 %56 
                                        f32 %57 = OpLoad %50 
                                        f32 %59 = OpFAdd %57 %58 
                                Output f32* %61 = OpAccessChain %9 %60 
                                                    OpStore %61 %59 
                 read_only Texture2DSampled %64 = OpLoad %63 
                                      f32_2 %65 = OpLoad %24 
                                      f32_4 %66 = OpImageSampleImplicitLod %64 %65 
                                        f32 %67 = OpCompositeExtract %66 3 
                                                    OpStore %62 %67 
                                        f32 %68 = OpLoad %62 
                                        f32 %69 = OpFNegate %68 
                                        f32 %71 = OpFMul %69 %70 
                               Private f32* %72 = OpAccessChain %29 %44 
                                        f32 %73 = OpLoad %72 
                                        f32 %74 = OpFAdd %71 %73 
                               Private f32* %75 = OpAccessChain %29 %44 
                                                    OpStore %75 %74 
                                        f32 %76 = OpLoad %62 
                                        f32 %78 = OpFMul %76 %77 
                                                    OpStore %50 %78 
                                        f32 %79 = OpLoad %16 
                                        f32 %80 = OpFMul %79 %42 
                                        f32 %81 = OpLoad %50 
                                        f32 %82 = OpFAdd %80 %81 
                               Private f32* %83 = OpAccessChain %29 %53 
                                                    OpStore %83 %82 
                                      f32_2 %84 = OpLoad %29 
                                      f32_2 %85 = OpVectorShuffle %84 %84 1 0 
                                      f32_2 %89 = OpFAdd %85 %88 
                                      f32_4 %90 = OpLoad %9 
                                      f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                    OpStore %9 %91 
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
 Pass {
  Name "YCBCRA_TO_RGBAFULL"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 113027
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
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _RightEyeUVOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = float(unity_StereoEyeIndex);
    vs_TEXCOORD0.xy = vec2(u_xlat4) * _RightEyeUVOffset.xy + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
uniform  sampler2D _SecondTex;
uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
vec4 u_xlat10_2;
float u_xlat16_3;
vec2 u_xlat16_6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.w = u_xlat10_0.w;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat10_1 = texture(_SecondTex, u_xlat0.xy);
    u_xlat16_6.xy = u_xlat10_1.ww * vec2(0.390625, 1.984375);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_2 = texture(_ThirdTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_1.w * 1.15625 + (-u_xlat16_6.x);
    u_xlat16_3 = u_xlat10_1.w * 1.15625 + u_xlat16_6.y;
    SV_Target0.z = u_xlat16_3 + -1.06861997;
    u_xlat0.x = (-u_xlat10_2.w) * 0.8125 + u_xlat16_0;
    u_xlat16_3 = u_xlat10_2.w * 1.59375;
    u_xlat0.y = u_xlat10_1.w * 1.15625 + u_xlat16_3;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 120
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %84 %104 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %104 Location 104 
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
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; i32; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
                                              %82 = OpTypeVector %6 2 
                                              %83 = OpTypePointer Input %82 
                                 Input f32_2* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                              %97 = OpTypePointer Private %6 
                                 Private f32* %98 = OpVariable Private 
                                              %99 = OpTypePointer Uniform %18 
                                             %103 = OpTypePointer Output %82 
                               Output f32_2* %104 = OpVariable Output 
                                             %114 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %22 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %28 = OpAccessChain %21 %22 %22 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %21 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %21 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %21 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %21 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %21 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                        f32_2 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                        f32_2 %90 = OpFMul %85 %89 
                               Uniform f32_4* %91 = OpAccessChain %21 %86 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 2 3 
                                        f32_2 %94 = OpFAdd %90 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
                                                      OpStore %9 %96 
                                Uniform i32* %100 = OpAccessChain %21 %35 
                                         i32 %101 = OpLoad %100 
                                         f32 %102 = OpConvertSToF %101 
                                                      OpStore %98 %102 
                                         f32 %105 = OpLoad %98 
                                       f32_2 %106 = OpCompositeConstruct %105 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %44 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_2 %113 = OpFAdd %110 %112 
                                                      OpStore %104 %113 
                                 Output f32* %115 = OpAccessChain %72 %22 %68 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                 Output f32* %118 = OpAccessChain %72 %22 %68 
                                                      OpStore %118 %117 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 108
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %34 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %25 DescriptorSet 25 
                                                    OpDecorate %25 Binding 25 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %34 Location 34 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %41 DescriptorSet 41 
                                                    OpDecorate %41 Binding 41 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %47 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %57 DescriptorSet 57 
                                                    OpDecorate %57 Binding 57 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %93 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_2* %11 = OpVariable Input 
                                        f32 %13 = OpConstant 3.67402E-40 
                                        f32 %14 = OpConstant 3.67402E-40 
                                      f32_2 %15 = OpConstantComposite %13 %14 
                                        f32 %17 = OpConstant 3.67402E-40 
                                      f32_2 %18 = OpConstantComposite %13 %17 
                                            %20 = OpTypePointer Private %6 
                               Private f32* %21 = OpVariable Private 
                                            %22 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %23 = OpTypeSampledImage %22 
                                            %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2DSampled* %25 = OpVariable UniformConstant 
                                            %28 = OpTypeVector %6 4 
                                            %30 = OpTypeInt 32 0 
                                        u32 %31 = OpConstant 3 
                                            %33 = OpTypePointer Output %28 
                              Output f32_4* %34 = OpVariable Output 
                                            %36 = OpTypePointer Output %6 
                               Private f32* %40 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %41 = OpVariable UniformConstant 
                             Private f32_2* %46 = OpVariable Private 
                                        f32 %49 = OpConstant 3.67402E-40 
                                        f32 %50 = OpConstant 3.67402E-40 
                                      f32_2 %51 = OpConstantComposite %49 %50 
UniformConstant read_only Texture2DSampled* %57 = OpVariable UniformConstant 
                                        f32 %63 = OpConstant 3.67402E-40 
                                        u32 %65 = OpConstant 0 
                               Private f32* %71 = OpVariable Private 
                                        u32 %74 = OpConstant 1 
                                        f32 %79 = OpConstant 3.67402E-40 
                                        u32 %81 = OpConstant 2 
                                        f32 %85 = OpConstant 3.67402E-40 
                                        f32 %92 = OpConstant 3.67402E-40 
                                       f32 %101 = OpConstant 3.67402E-40 
                                       f32 %102 = OpConstant 3.67402E-40 
                                     f32_2 %103 = OpConstantComposite %101 %102 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %12 = OpLoad %11 
                                      f32_2 %16 = OpFMul %12 %15 
                                      f32_2 %19 = OpFAdd %16 %18 
                                                    OpStore %9 %19 
                 read_only Texture2DSampled %26 = OpLoad %25 
                                      f32_2 %27 = OpLoad %9 
                                      f32_4 %29 = OpImageSampleImplicitLod %26 %27 
                                        f32 %32 = OpCompositeExtract %29 3 
                                                    OpStore %21 %32 
                                        f32 %35 = OpLoad %21 
                                Output f32* %37 = OpAccessChain %34 %31 
                                                    OpStore %37 %35 
                                      f32_2 %38 = OpLoad %11 
                                      f32_2 %39 = OpFMul %38 %15 
                                                    OpStore %9 %39 
                 read_only Texture2DSampled %42 = OpLoad %41 
                                      f32_2 %43 = OpLoad %9 
                                      f32_4 %44 = OpImageSampleImplicitLod %42 %43 
                                        f32 %45 = OpCompositeExtract %44 3 
                                                    OpStore %40 %45 
                                        f32 %47 = OpLoad %40 
                                      f32_2 %48 = OpCompositeConstruct %47 %47 
                                      f32_2 %52 = OpFMul %48 %51 
                                                    OpStore %46 %52 
                 read_only Texture2DSampled %53 = OpLoad %25 
                                      f32_2 %54 = OpLoad %9 
                                      f32_4 %55 = OpImageSampleImplicitLod %53 %54 
                                        f32 %56 = OpCompositeExtract %55 3 
                                                    OpStore %40 %56 
                 read_only Texture2DSampled %58 = OpLoad %57 
                                      f32_2 %59 = OpLoad %9 
                                      f32_4 %60 = OpImageSampleImplicitLod %58 %59 
                                        f32 %61 = OpCompositeExtract %60 3 
                                                    OpStore %21 %61 
                                        f32 %62 = OpLoad %40 
                                        f32 %64 = OpFMul %62 %63 
                               Private f32* %66 = OpAccessChain %46 %65 
                                        f32 %67 = OpLoad %66 
                                        f32 %68 = OpFNegate %67 
                                        f32 %69 = OpFAdd %64 %68 
                               Private f32* %70 = OpAccessChain %46 %65 
                                                    OpStore %70 %69 
                                        f32 %72 = OpLoad %40 
                                        f32 %73 = OpFMul %72 %63 
                               Private f32* %75 = OpAccessChain %46 %74 
                                        f32 %76 = OpLoad %75 
                                        f32 %77 = OpFAdd %73 %76 
                                                    OpStore %71 %77 
                                        f32 %78 = OpLoad %71 
                                        f32 %80 = OpFAdd %78 %79 
                                Output f32* %82 = OpAccessChain %34 %81 
                                                    OpStore %82 %80 
                                        f32 %83 = OpLoad %21 
                                        f32 %84 = OpFNegate %83 
                                        f32 %86 = OpFMul %84 %85 
                               Private f32* %87 = OpAccessChain %46 %65 
                                        f32 %88 = OpLoad %87 
                                        f32 %89 = OpFAdd %86 %88 
                               Private f32* %90 = OpAccessChain %46 %65 
                                                    OpStore %90 %89 
                                        f32 %91 = OpLoad %21 
                                        f32 %93 = OpFMul %91 %92 
                                                    OpStore %71 %93 
                                        f32 %94 = OpLoad %40 
                                        f32 %95 = OpFMul %94 %63 
                                        f32 %96 = OpLoad %71 
                                        f32 %97 = OpFAdd %95 %96 
                               Private f32* %98 = OpAccessChain %46 %74 
                                                    OpStore %98 %97 
                                      f32_2 %99 = OpLoad %46 
                                     f32_2 %100 = OpVectorShuffle %99 %99 1 0 
                                     f32_2 %104 = OpFAdd %100 %103 
                                     f32_4 %105 = OpLoad %34 
                                     f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                    OpStore %34 %106 
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
 Pass {
  Name "YCBCRA_TO_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 142939
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
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _RightEyeUVOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = float(unity_StereoEyeIndex);
    vs_TEXCOORD0.xy = vec2(u_xlat4) * _RightEyeUVOffset.xy + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
uniform  sampler2D _SecondTex;
uniform  sampler2D _ThirdTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
vec4 u_xlat10_2;
float u_xlat16_3;
vec2 u_xlat16_6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0.w + -0.0627449974;
    SV_Target0.w = u_xlat16_0 * 1.15625;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat10_1 = texture(_SecondTex, u_xlat0.xy);
    u_xlat16_6.xy = u_xlat10_1.ww * vec2(0.390625, 1.984375);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_2 = texture(_ThirdTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_1.w * 1.15625 + (-u_xlat16_6.x);
    u_xlat16_3 = u_xlat10_1.w * 1.15625 + u_xlat16_6.y;
    SV_Target0.z = u_xlat16_3 + -1.06861997;
    u_xlat0.x = (-u_xlat10_2.w) * 0.8125 + u_xlat16_0;
    u_xlat16_3 = u_xlat10_2.w * 1.59375;
    u_xlat0.y = u_xlat10_1.w * 1.15625 + u_xlat16_3;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 120
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %84 %104 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %104 Location 104 
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
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; i32; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
                                              %82 = OpTypeVector %6 2 
                                              %83 = OpTypePointer Input %82 
                                 Input f32_2* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                              %97 = OpTypePointer Private %6 
                                 Private f32* %98 = OpVariable Private 
                                              %99 = OpTypePointer Uniform %18 
                                             %103 = OpTypePointer Output %82 
                               Output f32_2* %104 = OpVariable Output 
                                             %114 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %22 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %28 = OpAccessChain %21 %22 %22 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %21 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %21 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %21 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %21 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %21 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                        f32_2 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                        f32_2 %90 = OpFMul %85 %89 
                               Uniform f32_4* %91 = OpAccessChain %21 %86 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 2 3 
                                        f32_2 %94 = OpFAdd %90 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
                                                      OpStore %9 %96 
                                Uniform i32* %100 = OpAccessChain %21 %35 
                                         i32 %101 = OpLoad %100 
                                         f32 %102 = OpConvertSToF %101 
                                                      OpStore %98 %102 
                                         f32 %105 = OpLoad %98 
                                       f32_2 %106 = OpCompositeConstruct %105 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %44 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_2 %113 = OpFAdd %110 %112 
                                                      OpStore %104 %113 
                                 Output f32* %115 = OpAccessChain %72 %22 %68 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                 Output f32* %118 = OpAccessChain %72 %22 %68 
                                                      OpStore %118 %117 
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
                                                    OpEntryPoint Fragment %4 "main" %11 %40 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %25 DescriptorSet 25 
                                                    OpDecorate %25 Binding 25 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %40 Location 40 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %50 DescriptorSet 50 
                                                    OpDecorate %50 Binding 50 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %65 DescriptorSet 65 
                                                    OpDecorate %65 Binding 65 
                                                    OpDecorate %66 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                                    OpDecorate %110 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_2* %11 = OpVariable Input 
                                        f32 %13 = OpConstant 3.67402E-40 
                                        f32 %14 = OpConstant 3.67402E-40 
                                      f32_2 %15 = OpConstantComposite %13 %14 
                                        f32 %17 = OpConstant 3.67402E-40 
                                      f32_2 %18 = OpConstantComposite %13 %17 
                                            %20 = OpTypePointer Private %6 
                               Private f32* %21 = OpVariable Private 
                                            %22 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %23 = OpTypeSampledImage %22 
                                            %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2DSampled* %25 = OpVariable UniformConstant 
                                            %28 = OpTypeVector %6 4 
                                            %30 = OpTypeInt 32 0 
                                        u32 %31 = OpConstant 3 
                             Private f32_2* %33 = OpVariable Private 
                                        f32 %35 = OpConstant 3.67402E-40 
                                        u32 %37 = OpConstant 0 
                                            %39 = OpTypePointer Output %28 
                              Output f32_4* %40 = OpVariable Output 
                                        f32 %43 = OpConstant 3.67402E-40 
                                            %45 = OpTypePointer Output %6 
                               Private f32* %49 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                        f32 %57 = OpConstant 3.67402E-40 
                                        f32 %58 = OpConstant 3.67402E-40 
                                      f32_2 %59 = OpConstantComposite %57 %58 
UniformConstant read_only Texture2DSampled* %65 = OpVariable UniformConstant 
                               Private f32* %77 = OpVariable Private 
                                        u32 %80 = OpConstant 1 
                                        f32 %85 = OpConstant 3.67402E-40 
                                        u32 %87 = OpConstant 2 
                                        f32 %91 = OpConstant 3.67402E-40 
                                        f32 %98 = OpConstant 3.67402E-40 
                                       f32 %107 = OpConstant 3.67402E-40 
                                       f32 %108 = OpConstant 3.67402E-40 
                                     f32_2 %109 = OpConstantComposite %107 %108 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %12 = OpLoad %11 
                                      f32_2 %16 = OpFMul %12 %15 
                                      f32_2 %19 = OpFAdd %16 %18 
                                                    OpStore %9 %19 
                 read_only Texture2DSampled %26 = OpLoad %25 
                                      f32_2 %27 = OpLoad %9 
                                      f32_4 %29 = OpImageSampleImplicitLod %26 %27 
                                        f32 %32 = OpCompositeExtract %29 3 
                                                    OpStore %21 %32 
                                        f32 %34 = OpLoad %21 
                                        f32 %36 = OpFAdd %34 %35 
                               Private f32* %38 = OpAccessChain %33 %37 
                                                    OpStore %38 %36 
                               Private f32* %41 = OpAccessChain %33 %37 
                                        f32 %42 = OpLoad %41 
                                        f32 %44 = OpFMul %42 %43 
                                Output f32* %46 = OpAccessChain %40 %31 
                                                    OpStore %46 %44 
                                      f32_2 %47 = OpLoad %11 
                                      f32_2 %48 = OpFMul %47 %15 
                                                    OpStore %9 %48 
                 read_only Texture2DSampled %51 = OpLoad %50 
                                      f32_2 %52 = OpLoad %9 
                                      f32_4 %53 = OpImageSampleImplicitLod %51 %52 
                                        f32 %54 = OpCompositeExtract %53 3 
                                                    OpStore %49 %54 
                                        f32 %55 = OpLoad %49 
                                      f32_2 %56 = OpCompositeConstruct %55 %55 
                                      f32_2 %60 = OpFMul %56 %59 
                                                    OpStore %33 %60 
                 read_only Texture2DSampled %61 = OpLoad %25 
                                      f32_2 %62 = OpLoad %9 
                                      f32_4 %63 = OpImageSampleImplicitLod %61 %62 
                                        f32 %64 = OpCompositeExtract %63 3 
                                                    OpStore %49 %64 
                 read_only Texture2DSampled %66 = OpLoad %65 
                                      f32_2 %67 = OpLoad %9 
                                      f32_4 %68 = OpImageSampleImplicitLod %66 %67 
                                        f32 %69 = OpCompositeExtract %68 3 
                                                    OpStore %21 %69 
                                        f32 %70 = OpLoad %49 
                                        f32 %71 = OpFMul %70 %43 
                               Private f32* %72 = OpAccessChain %33 %37 
                                        f32 %73 = OpLoad %72 
                                        f32 %74 = OpFNegate %73 
                                        f32 %75 = OpFAdd %71 %74 
                               Private f32* %76 = OpAccessChain %33 %37 
                                                    OpStore %76 %75 
                                        f32 %78 = OpLoad %49 
                                        f32 %79 = OpFMul %78 %43 
                               Private f32* %81 = OpAccessChain %33 %80 
                                        f32 %82 = OpLoad %81 
                                        f32 %83 = OpFAdd %79 %82 
                                                    OpStore %77 %83 
                                        f32 %84 = OpLoad %77 
                                        f32 %86 = OpFAdd %84 %85 
                                Output f32* %88 = OpAccessChain %40 %87 
                                                    OpStore %88 %86 
                                        f32 %89 = OpLoad %21 
                                        f32 %90 = OpFNegate %89 
                                        f32 %92 = OpFMul %90 %91 
                               Private f32* %93 = OpAccessChain %33 %37 
                                        f32 %94 = OpLoad %93 
                                        f32 %95 = OpFAdd %92 %94 
                               Private f32* %96 = OpAccessChain %33 %37 
                                                    OpStore %96 %95 
                                        f32 %97 = OpLoad %21 
                                        f32 %99 = OpFMul %97 %98 
                                                    OpStore %77 %99 
                                       f32 %100 = OpLoad %49 
                                       f32 %101 = OpFMul %100 %43 
                                       f32 %102 = OpLoad %77 
                                       f32 %103 = OpFAdd %101 %102 
                              Private f32* %104 = OpAccessChain %33 %80 
                                                    OpStore %104 %103 
                                     f32_2 %105 = OpLoad %33 
                                     f32_2 %106 = OpVectorShuffle %105 %105 1 0 
                                     f32_2 %110 = OpFAdd %106 %109 
                                     f32_4 %111 = OpLoad %40 
                                     f32_4 %112 = OpVectorShuffle %111 %110 4 5 2 3 
                                                    OpStore %40 %112 
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
 Pass {
  Name "COMPOSITE_RGBA_TO_RGBA"
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  Cull Off
  GpuProgramID 238344
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
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _RightEyeUVOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4 = float(unity_StereoEyeIndex);
    vs_TEXCOORD0.xy = vec2(u_xlat4) * _RightEyeUVOffset.xy + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _AlphaParam;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.w = u_xlat10_0.w * _AlphaParam;
    SV_Target0.xyz = u_xlat10_0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 120
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %84 %104 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %104 Location 104 
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
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %16 %17 %18 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; i32; f32_4; f32_4;}* %21 = OpVariable Uniform 
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
                                              %82 = OpTypeVector %6 2 
                                              %83 = OpTypePointer Input %82 
                                 Input f32_2* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                              %97 = OpTypePointer Private %6 
                                 Private f32* %98 = OpVariable Private 
                                              %99 = OpTypePointer Uniform %18 
                                             %103 = OpTypePointer Output %82 
                               Output f32_2* %104 = OpVariable Output 
                                             %114 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %22 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %28 = OpAccessChain %21 %22 %22 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %21 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %21 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %21 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %21 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %21 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                        f32_2 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                        f32_2 %90 = OpFMul %85 %89 
                               Uniform f32_4* %91 = OpAccessChain %21 %86 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 2 3 
                                        f32_2 %94 = OpFAdd %90 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
                                                      OpStore %9 %96 
                                Uniform i32* %100 = OpAccessChain %21 %35 
                                         i32 %101 = OpLoad %100 
                                         f32 %102 = OpConvertSToF %101 
                                                      OpStore %98 %102 
                                         f32 %105 = OpLoad %98 
                                       f32_2 %106 = OpCompositeConstruct %105 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %44 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_2 %113 = OpFAdd %110 %112 
                                                      OpStore %104 %113 
                                 Output f32* %115 = OpAccessChain %72 %22 %68 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                 Output f32* %118 = OpAccessChain %72 %22 %68 
                                                      OpStore %118 %117 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 39
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %36 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpMemberDecorate %25 0 Offset 25 
                                                    OpDecorate %25 Block 
                                                    OpDecorate %27 DescriptorSet 27 
                                                    OpDecorate %27 Binding 27 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %36 Location 36 
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
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                                            %22 = OpTypePointer Private %6 
                                            %25 = OpTypeStruct %6 
                                            %26 = OpTypePointer Uniform %25 
                     Uniform struct {f32;}* %27 = OpVariable Uniform 
                                            %28 = OpTypeInt 32 1 
                                        i32 %29 = OpConstant 0 
                                            %30 = OpTypePointer Uniform %6 
                                            %35 = OpTypePointer Output %7 
                              Output f32_4* %36 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %23 = OpAccessChain %9 %21 
                                        f32 %24 = OpLoad %23 
                               Uniform f32* %31 = OpAccessChain %27 %29 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFMul %24 %32 
                               Private f32* %34 = OpAccessChain %9 %21 
                                                    OpStore %34 %33 
                                      f32_4 %37 = OpLoad %9 
                                                    OpStore %36 %37 
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
 Pass {
  Name "FLIP_RGBA_TO_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 288062
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _AlphaParam;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.w = u_xlat10_0.w * _AlphaParam;
    SV_Target0.xyz = u_xlat10_0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %96 Location 96 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.67402E-40 
                                         f32 %87 = OpConstant 3.67402E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.67402E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                               Output f32_2* %96 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore %96 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 39
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %36 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpMemberDecorate %25 0 Offset 25 
                                                    OpDecorate %25 Block 
                                                    OpDecorate %27 DescriptorSet 27 
                                                    OpDecorate %27 Binding 27 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %36 Location 36 
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
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                                            %22 = OpTypePointer Private %6 
                                            %25 = OpTypeStruct %6 
                                            %26 = OpTypePointer Uniform %25 
                     Uniform struct {f32;}* %27 = OpVariable Uniform 
                                            %28 = OpTypeInt 32 1 
                                        i32 %29 = OpConstant 0 
                                            %30 = OpTypePointer Uniform %6 
                                            %35 = OpTypePointer Output %7 
                              Output f32_4* %36 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %23 = OpAccessChain %9 %21 
                                        f32 %24 = OpLoad %23 
                               Uniform f32* %31 = OpAccessChain %27 %29 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFMul %24 %32 
                               Private f32* %34 = OpAccessChain %9 %21 
                                                    OpStore %34 %33 
                                      f32_4 %37 = OpLoad %9 
                                                    OpStore %36 %37 
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
 Pass {
  Name "FLIP_RGBASPLIT_TO_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 375129
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.w = u_xlat10_0.y;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %96 Location 96 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.67402E-40 
                                         f32 %87 = OpConstant 3.67402E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.67402E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                               Output f32_2* %96 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore %96 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 52
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %12 %49 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 Location 12 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %23 DescriptorSet 23 
                                                    OpDecorate %23 Binding 23 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %49 Location 49 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypePointer Input %10 
                               Input f32_2* %12 = OpVariable Input 
                                        f32 %14 = OpConstant 3.67402E-40 
                                        f32 %15 = OpConstant 3.67402E-40 
                                      f32_2 %16 = OpConstantComposite %14 %15 
                                            %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %21 = OpTypeSampledImage %20 
                                            %22 = OpTypePointer UniformConstant %21 
UniformConstant read_only Texture2DSampled* %23 = OpVariable UniformConstant 
                                            %28 = OpTypeVector %6 3 
                                            %32 = OpTypePointer Private %10 
                             Private f32_2* %33 = OpVariable Private 
                                        f32 %36 = OpConstant 3.67402E-40 
                                      f32_2 %37 = OpConstantComposite %14 %36 
                                            %42 = OpTypeInt 32 0 
                                        u32 %43 = OpConstant 1 
                                        u32 %45 = OpConstant 3 
                                            %46 = OpTypePointer Private %6 
                                            %48 = OpTypePointer Output %7 
                              Output f32_4* %49 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %13 = OpLoad %12 
                                      f32_2 %17 = OpFMul %13 %16 
                                      f32_4 %18 = OpLoad %9 
                                      f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                    OpStore %9 %19 
                 read_only Texture2DSampled %24 = OpLoad %23 
                                      f32_4 %25 = OpLoad %9 
                                      f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                      f32_4 %27 = OpImageSampleImplicitLod %24 %26 
                                      f32_3 %29 = OpVectorShuffle %27 %27 0 1 2 
                                      f32_4 %30 = OpLoad %9 
                                      f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                    OpStore %9 %31 
                                      f32_2 %34 = OpLoad %12 
                                      f32_2 %35 = OpFMul %34 %16 
                                      f32_2 %38 = OpFAdd %35 %37 
                                                    OpStore %33 %38 
                 read_only Texture2DSampled %39 = OpLoad %23 
                                      f32_2 %40 = OpLoad %33 
                                      f32_4 %41 = OpImageSampleImplicitLod %39 %40 
                                        f32 %44 = OpCompositeExtract %41 1 
                               Private f32* %47 = OpAccessChain %9 %45 
                                                    OpStore %47 %44 
                                      f32_4 %50 = OpLoad %9 
                                                    OpStore %49 %50 
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
 Pass {
  Name "FLIP_SEMIPLANARYCBCR_TO_RGB1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 440144
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _MainTex_TexelSize;
uniform  sampler2D _MainTex;
uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
float u_xlat2;
float u_xlat16_2;
int u_xlati2;
float u_xlat4;
int u_xlati4;
bool u_xlatb4;
int u_xlati6;
bool u_xlatb6;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.z + -0.5;
    u_xlat2 = vs_TEXCOORD0.x * u_xlat0.x + 0.5;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat2 = floor(u_xlat2);
    u_xlat4 = u_xlat2 * 0.5;
    u_xlati2 = int(u_xlat2);
    u_xlatb6 = u_xlat4>=(-u_xlat4);
    u_xlat4 = fract(abs(u_xlat4));
    u_xlat4 = (u_xlatb6) ? u_xlat4 : (-u_xlat4);
    u_xlatb4 = u_xlat4==0.0;
    u_xlati6 = u_xlati2 + int(0xFFFFFFFFu);
    u_xlati2 = (u_xlatb4) ? u_xlati2 : u_xlati6;
    u_xlati4 = u_xlati2 + 1;
    u_xlat2 = float(u_xlati2);
    u_xlat1.x = u_xlat0.x * u_xlat2;
    u_xlat2 = float(u_xlati4);
    u_xlat1.z = u_xlat0.x * u_xlat2;
    u_xlat1.yw = vs_TEXCOORD0.yy;
    u_xlat10_0 = texture(_SecondTex, u_xlat1.zw);
    u_xlat10_1 = texture(_SecondTex, u_xlat1.xy);
    u_xlat16_0.xy = u_xlat10_1.ww * vec2(0.390625, 1.984375);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.x = u_xlat10_1.w * 1.15625 + (-u_xlat16_0.x);
    u_xlat16_2 = u_xlat10_1.w * 1.15625 + u_xlat16_0.y;
    SV_Target0.z = u_xlat16_2 + -1.06861997;
    u_xlat0.x = (-u_xlat10_0.w) * 0.8125 + u_xlat16_0.x;
    u_xlat16_2 = u_xlat10_0.w * 1.59375;
    u_xlat0.y = u_xlat10_1.w * 1.15625 + u_xlat16_2;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %96 Location 96 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.67402E-40 
                                         f32 %87 = OpConstant 3.67402E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.67402E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                               Output f32_2* %96 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore %96 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 183
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %25 %151 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpMemberDecorate %10 0 Offset 10 
                                                     OpDecorate %10 Block 
                                                     OpDecorate %12 DescriptorSet 12 
                                                     OpDecorate %12 Binding 12 
                                                     OpDecorate %25 Location 25 
                                                     OpDecorate %105 RelaxedPrecision 
                                                     OpDecorate %109 RelaxedPrecision 
                                                     OpDecorate %109 DescriptorSet 109 
                                                     OpDecorate %109 Binding 109 
                                                     OpDecorate %110 RelaxedPrecision 
                                                     OpDecorate %115 RelaxedPrecision 
                                                     OpDecorate %116 RelaxedPrecision 
                                                     OpDecorate %117 RelaxedPrecision 
                                                     OpDecorate %121 RelaxedPrecision 
                                                     OpDecorate %123 RelaxedPrecision 
                                                     OpDecorate %124 RelaxedPrecision 
                                                     OpDecorate %125 RelaxedPrecision 
                                                     OpDecorate %129 RelaxedPrecision 
                                                     OpDecorate %130 RelaxedPrecision 
                                                     OpDecorate %130 DescriptorSet 130 
                                                     OpDecorate %130 Binding 130 
                                                     OpDecorate %131 RelaxedPrecision 
                                                     OpDecorate %134 RelaxedPrecision 
                                                     OpDecorate %135 RelaxedPrecision 
                                                     OpDecorate %137 RelaxedPrecision 
                                                     OpDecorate %139 RelaxedPrecision 
                                                     OpDecorate %140 RelaxedPrecision 
                                                     OpDecorate %141 RelaxedPrecision 
                                                     OpDecorate %143 RelaxedPrecision 
                                                     OpDecorate %144 RelaxedPrecision 
                                                     OpDecorate %145 RelaxedPrecision 
                                                     OpDecorate %148 RelaxedPrecision 
                                                     OpDecorate %149 RelaxedPrecision 
                                                     OpDecorate %151 RelaxedPrecision 
                                                     OpDecorate %151 Location 151 
                                                     OpDecorate %152 RelaxedPrecision 
                                                     OpDecorate %154 RelaxedPrecision 
                                                     OpDecorate %157 RelaxedPrecision 
                                                     OpDecorate %158 RelaxedPrecision 
                                                     OpDecorate %160 RelaxedPrecision 
                                                     OpDecorate %162 RelaxedPrecision 
                                                     OpDecorate %163 RelaxedPrecision 
                                                     OpDecorate %165 RelaxedPrecision 
                                                     OpDecorate %167 RelaxedPrecision 
                                                     OpDecorate %168 RelaxedPrecision 
                                                     OpDecorate %169 RelaxedPrecision 
                                                     OpDecorate %170 RelaxedPrecision 
                                                     OpDecorate %171 RelaxedPrecision 
                                                     OpDecorate %173 RelaxedPrecision 
                                                     OpDecorate %174 RelaxedPrecision 
                                                     OpDecorate %178 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypePointer Private %6 
                                 Private f32* %8 = OpVariable Private 
                                              %9 = OpTypeVector %6 4 
                                             %10 = OpTypeStruct %9 
                                             %11 = OpTypePointer Uniform %10 
                    Uniform struct {f32_4;}* %12 = OpVariable Uniform 
                                             %13 = OpTypeInt 32 1 
                                         i32 %14 = OpConstant 0 
                                             %15 = OpTypeInt 32 0 
                                         u32 %16 = OpConstant 2 
                                             %17 = OpTypePointer Uniform %6 
                                         f32 %20 = OpConstant 3.67402E-40 
                                Private f32* %22 = OpVariable Private 
                                             %23 = OpTypeVector %6 2 
                                             %24 = OpTypePointer Input %23 
                                Input f32_2* %25 = OpVariable Input 
                                         u32 %26 = OpConstant 0 
                                             %27 = OpTypePointer Input %6 
                                         f32 %32 = OpConstant 3.67402E-40 
                                         f32 %34 = OpConstant 3.67402E-40 
                                Private f32* %39 = OpVariable Private 
                                             %42 = OpTypePointer Private %13 
                                Private i32* %43 = OpVariable Private 
                                             %46 = OpTypeBool 
                                             %47 = OpTypePointer Private %46 
                               Private bool* %48 = OpVariable Private 
                                             %56 = OpTypePointer Function %6 
                               Private bool* %66 = OpVariable Private 
                                         f32 %68 = OpConstant 3.67402E-40 
                                Private i32* %70 = OpVariable Private 
                                         i32 %72 = OpConstant -1 
                                             %74 = OpTypePointer Function %13 
                                Private i32* %83 = OpVariable Private 
                                         i32 %85 = OpConstant 1 
                                             %89 = OpTypePointer Private %9 
                              Private f32_4* %90 = OpVariable Private 
                               Private f32* %105 = OpVariable Private 
                                            %106 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %107 = OpTypeSampledImage %106 
                                            %108 = OpTypePointer UniformConstant %107 
UniformConstant read_only Texture2DSampled* %109 = OpVariable UniformConstant 
                                        u32 %114 = OpConstant 3 
                               Private f32* %116 = OpVariable Private 
                                            %122 = OpTypePointer Private %23 
                             Private f32_2* %123 = OpVariable Private 
                                        f32 %126 = OpConstant 3.67402E-40 
                                        f32 %127 = OpConstant 3.67402E-40 
                                      f32_2 %128 = OpConstantComposite %126 %127 
UniformConstant read_only Texture2DSampled* %130 = OpVariable UniformConstant 
                                        f32 %136 = OpConstant 3.67402E-40 
                               Private f32* %143 = OpVariable Private 
                                        u32 %146 = OpConstant 1 
                                            %150 = OpTypePointer Output %9 
                              Output f32_4* %151 = OpVariable Output 
                                        f32 %153 = OpConstant 3.67402E-40 
                                            %155 = OpTypePointer Output %6 
                                        f32 %159 = OpConstant 3.67402E-40 
                                        f32 %166 = OpConstant 3.67402E-40 
                                        f32 %175 = OpConstant 3.67402E-40 
                                        f32 %176 = OpConstant 3.67402E-40 
                                      f32_2 %177 = OpConstantComposite %175 %176 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %57 = OpVariable Function 
                               Function i32* %75 = OpVariable Function 
                                Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                         f32 %19 = OpLoad %18 
                                         f32 %21 = OpFAdd %19 %20 
                                                     OpStore %8 %21 
                                  Input f32* %28 = OpAccessChain %25 %26 
                                         f32 %29 = OpLoad %28 
                                         f32 %30 = OpLoad %8 
                                         f32 %31 = OpFMul %29 %30 
                                         f32 %33 = OpFAdd %31 %32 
                                                     OpStore %22 %33 
                                         f32 %35 = OpLoad %8 
                                         f32 %36 = OpFDiv %34 %35 
                                                     OpStore %8 %36 
                                         f32 %37 = OpLoad %22 
                                         f32 %38 = OpExtInst %1 8 %37 
                                                     OpStore %22 %38 
                                         f32 %40 = OpLoad %22 
                                         f32 %41 = OpFMul %40 %32 
                                                     OpStore %39 %41 
                                         f32 %44 = OpLoad %22 
                                         i32 %45 = OpConvertFToS %44 
                                                     OpStore %43 %45 
                                         f32 %49 = OpLoad %39 
                                         f32 %50 = OpLoad %39 
                                         f32 %51 = OpFNegate %50 
                                        bool %52 = OpFOrdGreaterThanEqual %49 %51 
                                                     OpStore %48 %52 
                                         f32 %53 = OpLoad %39 
                                         f32 %54 = OpExtInst %1 4 %53 
                                         f32 %55 = OpExtInst %1 10 %54 
                                                     OpStore %39 %55 
                                        bool %58 = OpLoad %48 
                                                     OpSelectionMerge %60 None 
                                                     OpBranchConditional %58 %59 %62 
                                             %59 = OpLabel 
                                         f32 %61 = OpLoad %39 
                                                     OpStore %57 %61 
                                                     OpBranch %60 
                                             %62 = OpLabel 
                                         f32 %63 = OpLoad %39 
                                         f32 %64 = OpFNegate %63 
                                                     OpStore %57 %64 
                                                     OpBranch %60 
                                             %60 = OpLabel 
                                         f32 %65 = OpLoad %57 
                                                     OpStore %39 %65 
                                         f32 %67 = OpLoad %39 
                                        bool %69 = OpFOrdEqual %67 %68 
                                                     OpStore %66 %69 
                                         i32 %71 = OpLoad %43 
                                         i32 %73 = OpIAdd %71 %72 
                                                     OpStore %70 %73 
                                        bool %76 = OpLoad %66 
                                                     OpSelectionMerge %78 None 
                                                     OpBranchConditional %76 %77 %80 
                                             %77 = OpLabel 
                                         i32 %79 = OpLoad %43 
                                                     OpStore %75 %79 
                                                     OpBranch %78 
                                             %80 = OpLabel 
                                         i32 %81 = OpLoad %70 
                                                     OpStore %75 %81 
                                                     OpBranch %78 
                                             %78 = OpLabel 
                                         i32 %82 = OpLoad %75 
                                                     OpStore %43 %82 
                                         i32 %84 = OpLoad %43 
                                         i32 %86 = OpIAdd %84 %85 
                                                     OpStore %83 %86 
                                         i32 %87 = OpLoad %43 
                                         f32 %88 = OpConvertSToF %87 
                                                     OpStore %22 %88 
                                         f32 %91 = OpLoad %8 
                                         f32 %92 = OpLoad %22 
                                         f32 %93 = OpFMul %91 %92 
                                Private f32* %94 = OpAccessChain %90 %26 
                                                     OpStore %94 %93 
                                         i32 %95 = OpLoad %83 
                                         f32 %96 = OpConvertSToF %95 
                                                     OpStore %22 %96 
                                         f32 %97 = OpLoad %8 
                                         f32 %98 = OpLoad %22 
                                         f32 %99 = OpFMul %97 %98 
                               Private f32* %100 = OpAccessChain %90 %16 
                                                     OpStore %100 %99 
                                      f32_2 %101 = OpLoad %25 
                                      f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                                      f32_4 %103 = OpLoad %90 
                                      f32_4 %104 = OpVectorShuffle %103 %102 0 4 2 5 
                                                     OpStore %90 %104 
                 read_only Texture2DSampled %110 = OpLoad %109 
                                      f32_4 %111 = OpLoad %90 
                                      f32_2 %112 = OpVectorShuffle %111 %111 2 3 
                                      f32_4 %113 = OpImageSampleImplicitLod %110 %112 
                                        f32 %115 = OpCompositeExtract %113 3 
                                                     OpStore %105 %115 
                 read_only Texture2DSampled %117 = OpLoad %109 
                                      f32_4 %118 = OpLoad %90 
                                      f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                      f32_4 %120 = OpImageSampleImplicitLod %117 %119 
                                        f32 %121 = OpCompositeExtract %120 3 
                                                     OpStore %116 %121 
                                        f32 %124 = OpLoad %116 
                                      f32_2 %125 = OpCompositeConstruct %124 %124 
                                      f32_2 %129 = OpFMul %125 %128 
                                                     OpStore %123 %129 
                 read_only Texture2DSampled %131 = OpLoad %130 
                                      f32_2 %132 = OpLoad %25 
                                      f32_4 %133 = OpImageSampleImplicitLod %131 %132 
                                        f32 %134 = OpCompositeExtract %133 3 
                                                     OpStore %116 %134 
                                        f32 %135 = OpLoad %116 
                                        f32 %137 = OpFMul %135 %136 
                               Private f32* %138 = OpAccessChain %123 %26 
                                        f32 %139 = OpLoad %138 
                                        f32 %140 = OpFNegate %139 
                                        f32 %141 = OpFAdd %137 %140 
                               Private f32* %142 = OpAccessChain %123 %26 
                                                     OpStore %142 %141 
                                        f32 %144 = OpLoad %116 
                                        f32 %145 = OpFMul %144 %136 
                               Private f32* %147 = OpAccessChain %123 %146 
                                        f32 %148 = OpLoad %147 
                                        f32 %149 = OpFAdd %145 %148 
                                                     OpStore %143 %149 
                                        f32 %152 = OpLoad %143 
                                        f32 %154 = OpFAdd %152 %153 
                                Output f32* %156 = OpAccessChain %151 %16 
                                                     OpStore %156 %154 
                                        f32 %157 = OpLoad %105 
                                        f32 %158 = OpFNegate %157 
                                        f32 %160 = OpFMul %158 %159 
                               Private f32* %161 = OpAccessChain %123 %26 
                                        f32 %162 = OpLoad %161 
                                        f32 %163 = OpFAdd %160 %162 
                               Private f32* %164 = OpAccessChain %123 %26 
                                                     OpStore %164 %163 
                                        f32 %165 = OpLoad %105 
                                        f32 %167 = OpFMul %165 %166 
                                                     OpStore %143 %167 
                                        f32 %168 = OpLoad %116 
                                        f32 %169 = OpFMul %168 %136 
                                        f32 %170 = OpLoad %143 
                                        f32 %171 = OpFAdd %169 %170 
                               Private f32* %172 = OpAccessChain %123 %146 
                                                     OpStore %172 %171 
                                      f32_2 %173 = OpLoad %123 
                                      f32_2 %174 = OpVectorShuffle %173 %173 1 0 
                                      f32_2 %178 = OpFAdd %174 %177 
                                      f32_4 %179 = OpLoad %151 
                                      f32_4 %180 = OpVectorShuffle %179 %178 4 5 2 3 
                                                     OpStore %151 %180 
                                Output f32* %181 = OpAccessChain %151 %114 
                                                     OpStore %181 %34 
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
 Pass {
  Name "FLIP_SEMIPLANARYCBCRA_TO_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 487501
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _MainTex_TexelSize;
uniform  sampler2D _MainTex;
uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
float u_xlat16_3;
int u_xlati3;
float u_xlat6;
int u_xlati6;
bool u_xlatb6;
int u_xlati9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.z + -0.5;
    u_xlat3.xyz = vs_TEXCOORD0.xxy * vec3(0.5, 0.5, 1.0);
    u_xlat3.x = u_xlat3.x * u_xlat0.x + 0.5;
    u_xlat0.x = 2.0 / u_xlat0.x;
    u_xlat10_1 = texture(_MainTex, u_xlat3.yz);
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat6 = u_xlat3.x * 0.5;
    u_xlati3 = int(u_xlat3.x);
    u_xlatb9 = u_xlat6>=(-u_xlat6);
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
    u_xlatb6 = u_xlat6==0.0;
    u_xlati9 = u_xlati3 + int(0xFFFFFFFFu);
    u_xlati3 = (u_xlatb6) ? u_xlati3 : u_xlati9;
    u_xlati6 = u_xlati3 + 1;
    u_xlat3.x = float(u_xlati3);
    u_xlat2.x = u_xlat0.x * u_xlat3.x;
    u_xlat3.x = float(u_xlati6);
    u_xlat2.z = u_xlat0.x * u_xlat3.x;
    u_xlat2.yw = vs_TEXCOORD0.yy;
    u_xlat10_0 = texture(_SecondTex, u_xlat2.zw);
    u_xlat10_2 = texture(_SecondTex, u_xlat2.xy);
    u_xlat16_0.xy = u_xlat10_2.ww * vec2(0.390625, 1.984375);
    u_xlat16_0.x = u_xlat10_1.w * 1.15625 + (-u_xlat16_0.x);
    u_xlat16_3 = u_xlat10_1.w * 1.15625 + u_xlat16_0.y;
    SV_Target0.z = u_xlat16_3 + -1.06861997;
    u_xlat0.x = (-u_xlat10_0.w) * 0.8125 + u_xlat16_0.x;
    u_xlat16_3 = u_xlat10_0.w * 1.59375;
    u_xlat0.y = u_xlat10_1.w * 1.15625 + u_xlat16_3;
    SV_Target0.xy = u_xlat0.yx + vec2(-0.872539997, 0.531369984);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0.x = u_xlat10_0.w + -0.0627449974;
    SV_Target0.w = u_xlat16_0.x * 1.15625;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %96 Location 96 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.67402E-40 
                                         f32 %87 = OpConstant 3.67402E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.67402E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                               Output f32_2* %96 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore %96 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 222
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %30 %174 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpMemberDecorate %11 0 Offset 11 
                                                     OpDecorate %11 Block 
                                                     OpDecorate %13 DescriptorSet 13 
                                                     OpDecorate %13 Binding 13 
                                                     OpDecorate %30 Location 30 
                                                     OpDecorate %49 RelaxedPrecision 
                                                     OpDecorate %53 RelaxedPrecision 
                                                     OpDecorate %53 DescriptorSet 53 
                                                     OpDecorate %53 Binding 53 
                                                     OpDecorate %54 RelaxedPrecision 
                                                     OpDecorate %59 RelaxedPrecision 
                                                     OpDecorate %138 RelaxedPrecision 
                                                     OpDecorate %139 RelaxedPrecision 
                                                     OpDecorate %139 DescriptorSet 139 
                                                     OpDecorate %139 Binding 139 
                                                     OpDecorate %140 RelaxedPrecision 
                                                     OpDecorate %144 RelaxedPrecision 
                                                     OpDecorate %145 RelaxedPrecision 
                                                     OpDecorate %146 RelaxedPrecision 
                                                     OpDecorate %150 RelaxedPrecision 
                                                     OpDecorate %151 RelaxedPrecision 
                                                     OpDecorate %152 RelaxedPrecision 
                                                     OpDecorate %153 RelaxedPrecision 
                                                     OpDecorate %157 RelaxedPrecision 
                                                     OpDecorate %158 RelaxedPrecision 
                                                     OpDecorate %160 RelaxedPrecision 
                                                     OpDecorate %162 RelaxedPrecision 
                                                     OpDecorate %163 RelaxedPrecision 
                                                     OpDecorate %164 RelaxedPrecision 
                                                     OpDecorate %166 RelaxedPrecision 
                                                     OpDecorate %167 RelaxedPrecision 
                                                     OpDecorate %168 RelaxedPrecision 
                                                     OpDecorate %171 RelaxedPrecision 
                                                     OpDecorate %172 RelaxedPrecision 
                                                     OpDecorate %174 RelaxedPrecision 
                                                     OpDecorate %174 Location 174 
                                                     OpDecorate %175 RelaxedPrecision 
                                                     OpDecorate %177 RelaxedPrecision 
                                                     OpDecorate %180 RelaxedPrecision 
                                                     OpDecorate %181 RelaxedPrecision 
                                                     OpDecorate %183 RelaxedPrecision 
                                                     OpDecorate %185 RelaxedPrecision 
                                                     OpDecorate %186 RelaxedPrecision 
                                                     OpDecorate %188 RelaxedPrecision 
                                                     OpDecorate %190 RelaxedPrecision 
                                                     OpDecorate %191 RelaxedPrecision 
                                                     OpDecorate %192 RelaxedPrecision 
                                                     OpDecorate %193 RelaxedPrecision 
                                                     OpDecorate %194 RelaxedPrecision 
                                                     OpDecorate %196 RelaxedPrecision 
                                                     OpDecorate %197 RelaxedPrecision 
                                                     OpDecorate %201 RelaxedPrecision 
                                                     OpDecorate %209 RelaxedPrecision 
                                                     OpDecorate %212 RelaxedPrecision 
                                                     OpDecorate %213 RelaxedPrecision 
                                                     OpDecorate %215 RelaxedPrecision 
                                                     OpDecorate %218 RelaxedPrecision 
                                                     OpDecorate %219 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Private %7 
                               Private f32_2* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 4 
                                             %11 = OpTypeStruct %10 
                                             %12 = OpTypePointer Uniform %11 
                    Uniform struct {f32_4;}* %13 = OpVariable Uniform 
                                             %14 = OpTypeInt 32 1 
                                         i32 %15 = OpConstant 0 
                                             %16 = OpTypeInt 32 0 
                                         u32 %17 = OpConstant 2 
                                             %18 = OpTypePointer Uniform %6 
                                         f32 %21 = OpConstant 3.67402E-40 
                                         u32 %23 = OpConstant 0 
                                             %24 = OpTypePointer Private %6 
                                             %26 = OpTypeVector %6 3 
                                             %27 = OpTypePointer Private %26 
                              Private f32_3* %28 = OpVariable Private 
                                             %29 = OpTypePointer Input %7 
                                Input f32_2* %30 = OpVariable Input 
                                         f32 %33 = OpConstant 3.67402E-40 
                                         f32 %34 = OpConstant 3.67402E-40 
                                       f32_3 %35 = OpConstantComposite %33 %33 %34 
                                         f32 %44 = OpConstant 3.67402E-40 
                                Private f32* %49 = OpVariable Private 
                                             %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %51 = OpTypeSampledImage %50 
                                             %52 = OpTypePointer UniformConstant %51 
 UniformConstant read_only Texture2DSampled* %53 = OpVariable UniformConstant 
                                         u32 %58 = OpConstant 3 
                                Private f32* %64 = OpVariable Private 
                                             %68 = OpTypePointer Private %14 
                                Private i32* %69 = OpVariable Private 
                                             %73 = OpTypeBool 
                                             %74 = OpTypePointer Private %73 
                               Private bool* %75 = OpVariable Private 
                                             %83 = OpTypePointer Function %6 
                               Private bool* %93 = OpVariable Private 
                                         f32 %95 = OpConstant 3.67402E-40 
                                Private i32* %97 = OpVariable Private 
                                         i32 %99 = OpConstant -1 
                                            %101 = OpTypePointer Function %14 
                               Private i32* %110 = OpVariable Private 
                                        i32 %112 = OpConstant 1 
                                            %117 = OpTypePointer Private %10 
                             Private f32_4* %118 = OpVariable Private 
                               Private f32* %138 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %139 = OpVariable UniformConstant 
                               Private f32* %145 = OpVariable Private 
                             Private f32_2* %151 = OpVariable Private 
                                        f32 %154 = OpConstant 3.67402E-40 
                                        f32 %155 = OpConstant 3.67402E-40 
                                      f32_2 %156 = OpConstantComposite %154 %155 
                                        f32 %159 = OpConstant 3.67402E-40 
                               Private f32* %166 = OpVariable Private 
                                        u32 %169 = OpConstant 1 
                                            %173 = OpTypePointer Output %10 
                              Output f32_4* %174 = OpVariable Output 
                                        f32 %176 = OpConstant 3.67402E-40 
                                            %178 = OpTypePointer Output %6 
                                        f32 %182 = OpConstant 3.67402E-40 
                                        f32 %189 = OpConstant 3.67402E-40 
                                        f32 %198 = OpConstant 3.67402E-40 
                                        f32 %199 = OpConstant 3.67402E-40 
                                      f32_2 %200 = OpConstantComposite %198 %199 
                                      f32_2 %205 = OpConstantComposite %33 %34 
                                      f32_2 %207 = OpConstantComposite %33 %95 
                                        f32 %214 = OpConstant 3.67402E-40 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %84 = OpVariable Function 
                              Function i32* %102 = OpVariable Function 
                                Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                         f32 %20 = OpLoad %19 
                                         f32 %22 = OpFAdd %20 %21 
                                Private f32* %25 = OpAccessChain %9 %23 
                                                     OpStore %25 %22 
                                       f32_2 %31 = OpLoad %30 
                                       f32_3 %32 = OpVectorShuffle %31 %31 0 0 1 
                                       f32_3 %36 = OpFMul %32 %35 
                                                     OpStore %28 %36 
                                Private f32* %37 = OpAccessChain %28 %23 
                                         f32 %38 = OpLoad %37 
                                Private f32* %39 = OpAccessChain %9 %23 
                                         f32 %40 = OpLoad %39 
                                         f32 %41 = OpFMul %38 %40 
                                         f32 %42 = OpFAdd %41 %33 
                                Private f32* %43 = OpAccessChain %28 %23 
                                                     OpStore %43 %42 
                                Private f32* %45 = OpAccessChain %9 %23 
                                         f32 %46 = OpLoad %45 
                                         f32 %47 = OpFDiv %44 %46 
                                Private f32* %48 = OpAccessChain %9 %23 
                                                     OpStore %48 %47 
                  read_only Texture2DSampled %54 = OpLoad %53 
                                       f32_3 %55 = OpLoad %28 
                                       f32_2 %56 = OpVectorShuffle %55 %55 1 2 
                                       f32_4 %57 = OpImageSampleImplicitLod %54 %56 
                                         f32 %59 = OpCompositeExtract %57 3 
                                                     OpStore %49 %59 
                                Private f32* %60 = OpAccessChain %28 %23 
                                         f32 %61 = OpLoad %60 
                                         f32 %62 = OpExtInst %1 8 %61 
                                Private f32* %63 = OpAccessChain %28 %23 
                                                     OpStore %63 %62 
                                Private f32* %65 = OpAccessChain %28 %23 
                                         f32 %66 = OpLoad %65 
                                         f32 %67 = OpFMul %66 %33 
                                                     OpStore %64 %67 
                                Private f32* %70 = OpAccessChain %28 %23 
                                         f32 %71 = OpLoad %70 
                                         i32 %72 = OpConvertFToS %71 
                                                     OpStore %69 %72 
                                         f32 %76 = OpLoad %64 
                                         f32 %77 = OpLoad %64 
                                         f32 %78 = OpFNegate %77 
                                        bool %79 = OpFOrdGreaterThanEqual %76 %78 
                                                     OpStore %75 %79 
                                         f32 %80 = OpLoad %64 
                                         f32 %81 = OpExtInst %1 4 %80 
                                         f32 %82 = OpExtInst %1 10 %81 
                                                     OpStore %64 %82 
                                        bool %85 = OpLoad %75 
                                                     OpSelectionMerge %87 None 
                                                     OpBranchConditional %85 %86 %89 
                                             %86 = OpLabel 
                                         f32 %88 = OpLoad %64 
                                                     OpStore %84 %88 
                                                     OpBranch %87 
                                             %89 = OpLabel 
                                         f32 %90 = OpLoad %64 
                                         f32 %91 = OpFNegate %90 
                                                     OpStore %84 %91 
                                                     OpBranch %87 
                                             %87 = OpLabel 
                                         f32 %92 = OpLoad %84 
                                                     OpStore %64 %92 
                                         f32 %94 = OpLoad %64 
                                        bool %96 = OpFOrdEqual %94 %95 
                                                     OpStore %93 %96 
                                         i32 %98 = OpLoad %69 
                                        i32 %100 = OpIAdd %98 %99 
                                                     OpStore %97 %100 
                                       bool %103 = OpLoad %93 
                                                     OpSelectionMerge %105 None 
                                                     OpBranchConditional %103 %104 %107 
                                            %104 = OpLabel 
                                        i32 %106 = OpLoad %69 
                                                     OpStore %102 %106 
                                                     OpBranch %105 
                                            %107 = OpLabel 
                                        i32 %108 = OpLoad %97 
                                                     OpStore %102 %108 
                                                     OpBranch %105 
                                            %105 = OpLabel 
                                        i32 %109 = OpLoad %102 
                                                     OpStore %69 %109 
                                        i32 %111 = OpLoad %69 
                                        i32 %113 = OpIAdd %111 %112 
                                                     OpStore %110 %113 
                                        i32 %114 = OpLoad %69 
                                        f32 %115 = OpConvertSToF %114 
                               Private f32* %116 = OpAccessChain %28 %23 
                                                     OpStore %116 %115 
                               Private f32* %119 = OpAccessChain %9 %23 
                                        f32 %120 = OpLoad %119 
                               Private f32* %121 = OpAccessChain %28 %23 
                                        f32 %122 = OpLoad %121 
                                        f32 %123 = OpFMul %120 %122 
                               Private f32* %124 = OpAccessChain %118 %23 
                                                     OpStore %124 %123 
                                        i32 %125 = OpLoad %110 
                                        f32 %126 = OpConvertSToF %125 
                               Private f32* %127 = OpAccessChain %28 %23 
                                                     OpStore %127 %126 
                               Private f32* %128 = OpAccessChain %9 %23 
                                        f32 %129 = OpLoad %128 
                               Private f32* %130 = OpAccessChain %28 %23 
                                        f32 %131 = OpLoad %130 
                                        f32 %132 = OpFMul %129 %131 
                               Private f32* %133 = OpAccessChain %118 %17 
                                                     OpStore %133 %132 
                                      f32_2 %134 = OpLoad %30 
                                      f32_2 %135 = OpVectorShuffle %134 %134 1 1 
                                      f32_4 %136 = OpLoad %118 
                                      f32_4 %137 = OpVectorShuffle %136 %135 0 4 2 5 
                                                     OpStore %118 %137 
                 read_only Texture2DSampled %140 = OpLoad %139 
                                      f32_4 %141 = OpLoad %118 
                                      f32_2 %142 = OpVectorShuffle %141 %141 2 3 
                                      f32_4 %143 = OpImageSampleImplicitLod %140 %142 
                                        f32 %144 = OpCompositeExtract %143 3 
                                                     OpStore %138 %144 
                 read_only Texture2DSampled %146 = OpLoad %139 
                                      f32_4 %147 = OpLoad %118 
                                      f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                      f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                        f32 %150 = OpCompositeExtract %149 3 
                                                     OpStore %145 %150 
                                        f32 %152 = OpLoad %145 
                                      f32_2 %153 = OpCompositeConstruct %152 %152 
                                      f32_2 %157 = OpFMul %153 %156 
                                                     OpStore %151 %157 
                                        f32 %158 = OpLoad %49 
                                        f32 %160 = OpFMul %158 %159 
                               Private f32* %161 = OpAccessChain %151 %23 
                                        f32 %162 = OpLoad %161 
                                        f32 %163 = OpFNegate %162 
                                        f32 %164 = OpFAdd %160 %163 
                               Private f32* %165 = OpAccessChain %151 %23 
                                                     OpStore %165 %164 
                                        f32 %167 = OpLoad %49 
                                        f32 %168 = OpFMul %167 %159 
                               Private f32* %170 = OpAccessChain %151 %169 
                                        f32 %171 = OpLoad %170 
                                        f32 %172 = OpFAdd %168 %171 
                                                     OpStore %166 %172 
                                        f32 %175 = OpLoad %166 
                                        f32 %177 = OpFAdd %175 %176 
                                Output f32* %179 = OpAccessChain %174 %17 
                                                     OpStore %179 %177 
                                        f32 %180 = OpLoad %138 
                                        f32 %181 = OpFNegate %180 
                                        f32 %183 = OpFMul %181 %182 
                               Private f32* %184 = OpAccessChain %151 %23 
                                        f32 %185 = OpLoad %184 
                                        f32 %186 = OpFAdd %183 %185 
                               Private f32* %187 = OpAccessChain %151 %23 
                                                     OpStore %187 %186 
                                        f32 %188 = OpLoad %138 
                                        f32 %190 = OpFMul %188 %189 
                                                     OpStore %166 %190 
                                        f32 %191 = OpLoad %49 
                                        f32 %192 = OpFMul %191 %159 
                                        f32 %193 = OpLoad %166 
                                        f32 %194 = OpFAdd %192 %193 
                               Private f32* %195 = OpAccessChain %151 %169 
                                                     OpStore %195 %194 
                                      f32_2 %196 = OpLoad %151 
                                      f32_2 %197 = OpVectorShuffle %196 %196 1 0 
                                      f32_2 %201 = OpFAdd %197 %200 
                                      f32_4 %202 = OpLoad %174 
                                      f32_4 %203 = OpVectorShuffle %202 %201 4 5 2 3 
                                                     OpStore %174 %203 
                                      f32_2 %204 = OpLoad %30 
                                      f32_2 %206 = OpFMul %204 %205 
                                      f32_2 %208 = OpFAdd %206 %207 
                                                     OpStore %9 %208 
                 read_only Texture2DSampled %209 = OpLoad %53 
                                      f32_2 %210 = OpLoad %9 
                                      f32_4 %211 = OpImageSampleImplicitLod %209 %210 
                                        f32 %212 = OpCompositeExtract %211 3 
                                                     OpStore %138 %212 
                                        f32 %213 = OpLoad %138 
                                        f32 %215 = OpFAdd %213 %214 
                               Private f32* %216 = OpAccessChain %151 %23 
                                                     OpStore %216 %215 
                               Private f32* %217 = OpAccessChain %151 %23 
                                        f32 %218 = OpLoad %217 
                                        f32 %219 = OpFMul %218 %159 
                                Output f32* %220 = OpAccessChain %174 %58 
                                                     OpStore %220 %219 
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
 Pass {
  Name "FLIP_NV12_TO_RGB1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 586429
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat10_0.w + -0.0625;
    u_xlat10_1 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat0.yz = u_xlat10_1.xy + vec2(-0.5, -0.5);
    SV_Target0.x = dot(vec2(1.16439998, 1.79270005), u_xlat0.xz);
    SV_Target0.y = dot(vec3(1.16439998, -0.213300005, -0.532899976), u_xlat0.xyz);
    SV_Target0.z = dot(vec2(1.16439998, 2.11240005), u_xlat0.xy);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %96 Location 96 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.67402E-40 
                                         f32 %87 = OpConstant 3.67402E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.67402E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                               Output f32_2* %96 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore %96 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 73
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %23 %70 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %15 RelaxedPrecision 
                                                    OpDecorate %19 RelaxedPrecision 
                                                    OpDecorate %19 DescriptorSet 19 
                                                    OpDecorate %19 Binding 19 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %23 Location 23 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %37 DescriptorSet 37 
                                                    OpDecorate %37 Binding 37 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %70 Location 70 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                        f32 %10 = OpConstant 3.67402E-40 
                                            %11 = OpTypeInt 32 0 
                                        u32 %12 = OpConstant 3 
                                            %13 = OpTypePointer Private %6 
                               Private f32* %15 = OpVariable Private 
                                            %16 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %17 = OpTypeSampledImage %16 
                                            %18 = OpTypePointer UniformConstant %17 
UniformConstant read_only Texture2DSampled* %19 = OpVariable UniformConstant 
                                            %21 = OpTypeVector %6 2 
                                            %22 = OpTypePointer Input %21 
                               Input f32_2* %23 = OpVariable Input 
                                            %27 = OpTypeVector %6 3 
                                            %28 = OpTypePointer Private %27 
                             Private f32_3* %29 = OpVariable Private 
                                        f32 %31 = OpConstant 3.67402E-40 
                                        u32 %33 = OpConstant 0 
                                            %35 = OpTypePointer Private %21 
                             Private f32_2* %36 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
                                        f32 %43 = OpConstant 3.67402E-40 
                                      f32_2 %44 = OpConstantComposite %43 %43 
                                        f32 %48 = OpConstant 3.67402E-40 
                                        f32 %49 = OpConstant 3.67402E-40 
                                      f32_2 %50 = OpConstantComposite %48 %49 
                                        f32 %55 = OpConstant 3.67402E-40 
                                        f32 %56 = OpConstant 3.67402E-40 
                                      f32_3 %57 = OpConstantComposite %48 %55 %56 
                                        u32 %60 = OpConstant 1 
                                        f32 %62 = OpConstant 3.67402E-40 
                                      f32_2 %63 = OpConstantComposite %48 %62 
                                        u32 %67 = OpConstant 2 
                                            %69 = OpTypePointer Output %7 
                              Output f32_4* %70 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                               Private f32* %14 = OpAccessChain %9 %12 
                                                    OpStore %14 %10 
                 read_only Texture2DSampled %20 = OpLoad %19 
                                      f32_2 %24 = OpLoad %23 
                                      f32_4 %25 = OpImageSampleImplicitLod %20 %24 
                                        f32 %26 = OpCompositeExtract %25 3 
                                                    OpStore %15 %26 
                                        f32 %30 = OpLoad %15 
                                        f32 %32 = OpFAdd %30 %31 
                               Private f32* %34 = OpAccessChain %29 %33 
                                                    OpStore %34 %32 
                 read_only Texture2DSampled %38 = OpLoad %37 
                                      f32_2 %39 = OpLoad %23 
                                      f32_4 %40 = OpImageSampleImplicitLod %38 %39 
                                      f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                                    OpStore %36 %41 
                                      f32_2 %42 = OpLoad %36 
                                      f32_2 %45 = OpFAdd %42 %44 
                                      f32_3 %46 = OpLoad %29 
                                      f32_3 %47 = OpVectorShuffle %46 %45 0 3 4 
                                                    OpStore %29 %47 
                                      f32_3 %51 = OpLoad %29 
                                      f32_2 %52 = OpVectorShuffle %51 %51 0 2 
                                        f32 %53 = OpDot %50 %52 
                               Private f32* %54 = OpAccessChain %9 %33 
                                                    OpStore %54 %53 
                                      f32_3 %58 = OpLoad %29 
                                        f32 %59 = OpDot %57 %58 
                               Private f32* %61 = OpAccessChain %9 %60 
                                                    OpStore %61 %59 
                                      f32_3 %64 = OpLoad %29 
                                      f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                        f32 %66 = OpDot %63 %65 
                               Private f32* %68 = OpAccessChain %9 %67 
                                                    OpStore %68 %66 
                                      f32_4 %71 = OpLoad %9 
                                                    OpStore %70 %71 
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
 Pass {
  Name "FLIP_NV12_TO_RGBA"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 632801
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
uniform  sampler2D _SecondTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
float u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(0.5, 0.0);
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0.x = u_xlat10_0.w + -0.0627449974;
    SV_Target0.w = u_xlat16_0.x * 1.15625;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0);
    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SecondTex, u_xlat0.xy);
    u_xlat16_0.xzw = u_xlat10_0.yxx * vec3(1.59375, 0.390625, 1.984375);
    u_xlat16_4 = u_xlat10_1.w * 1.15625 + (-u_xlat16_0.z);
    u_xlat16_0.xw = u_xlat10_1.ww * vec2(1.15625, 1.15625) + u_xlat16_0.xw;
    SV_Target0.xz = u_xlat16_0.xw + vec2(-0.872539997, -1.06861997);
    u_xlat16_0.x = (-u_xlat10_0.y) * 0.8125 + u_xlat16_4;
    SV_Target0.y = u_xlat16_0.x + 0.531369984;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %96 
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
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %96 Location 96 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         f32 %86 = OpConstant 3.67402E-40 
                                         f32 %87 = OpConstant 3.67402E-40 
                                       f32_2 %88 = OpConstantComposite %86 %87 
                                         f32 %90 = OpConstant 3.67402E-40 
                                       f32_2 %91 = OpConstantComposite %90 %86 
                                             %95 = OpTypePointer Output %82 
                               Output f32_2* %96 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                                       f32_2 %89 = OpFMul %85 %88 
                                       f32_2 %92 = OpFAdd %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
                                                     OpStore %9 %94 
                                       f32_4 %97 = OpLoad %9 
                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %99 = OpAccessChain %20 %35 
                                      f32_4 %100 = OpLoad %99 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpFMul %98 %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                      f32_2 %106 = OpFAdd %102 %105 
                                                     OpStore %96 %106 
                                Output f32* %108 = OpAccessChain %72 %22 %68 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %72 %22 %68 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 109
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %44 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %24 DescriptorSet 24 
                                                    OpDecorate %24 Binding 24 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %44 Location 44 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %58 DescriptorSet 58 
                                                    OpDecorate %58 Binding 58 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_2* %11 = OpVariable Input 
                                        f32 %13 = OpConstant 3.67402E-40 
                                        f32 %14 = OpConstant 3.67402E-40 
                                      f32_2 %15 = OpConstantComposite %13 %14 
                                        f32 %17 = OpConstant 3.67402E-40 
                                      f32_2 %18 = OpConstantComposite %13 %17 
                             Private f32_2* %20 = OpVariable Private 
                                            %21 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %22 = OpTypeSampledImage %21 
                                            %23 = OpTypePointer UniformConstant %22 
UniformConstant read_only Texture2DSampled* %24 = OpVariable UniformConstant 
                                            %27 = OpTypeVector %6 4 
                                            %29 = OpTypeInt 32 0 
                                        u32 %30 = OpConstant 3 
                                        u32 %32 = OpConstant 0 
                                            %33 = OpTypePointer Private %6 
                                            %35 = OpTypeVector %6 3 
                                            %36 = OpTypePointer Private %35 
                             Private f32_3* %37 = OpVariable Private 
                                        f32 %40 = OpConstant 3.67402E-40 
                                            %43 = OpTypePointer Output %27 
                              Output f32_4* %44 = OpVariable Output 
                                        f32 %47 = OpConstant 3.67402E-40 
                                            %49 = OpTypePointer Output %6 
                               Private f32* %53 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                        f32 %65 = OpConstant 3.67402E-40 
                                        f32 %66 = OpConstant 3.67402E-40 
                                        f32 %67 = OpConstant 3.67402E-40 
                                      f32_3 %68 = OpConstantComposite %65 %66 %67 
                               Private f32* %70 = OpVariable Private 
                                        u32 %73 = OpConstant 1 
                                      f32_2 %80 = OpConstantComposite %47 %47 
                                        f32 %89 = OpConstant 3.67402E-40 
                                        f32 %90 = OpConstant 3.67402E-40 
                                      f32_2 %91 = OpConstantComposite %89 %90 
                                        f32 %98 = OpConstant 3.67402E-40 
                                       f32 %105 = OpConstant 3.67402E-40 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %12 = OpLoad %11 
                                      f32_2 %16 = OpFMul %12 %15 
                                      f32_2 %19 = OpFAdd %16 %18 
                                                    OpStore %9 %19 
                 read_only Texture2DSampled %25 = OpLoad %24 
                                      f32_2 %26 = OpLoad %9 
                                      f32_4 %28 = OpImageSampleImplicitLod %25 %26 
                                        f32 %31 = OpCompositeExtract %28 3 
                               Private f32* %34 = OpAccessChain %20 %32 
                                                    OpStore %34 %31 
                               Private f32* %38 = OpAccessChain %20 %32 
                                        f32 %39 = OpLoad %38 
                                        f32 %41 = OpFAdd %39 %40 
                               Private f32* %42 = OpAccessChain %37 %32 
                                                    OpStore %42 %41 
                               Private f32* %45 = OpAccessChain %37 %32 
                                        f32 %46 = OpLoad %45 
                                        f32 %48 = OpFMul %46 %47 
                                Output f32* %50 = OpAccessChain %44 %30 
                                                    OpStore %50 %48 
                                      f32_2 %51 = OpLoad %11 
                                      f32_2 %52 = OpFMul %51 %15 
                                                    OpStore %9 %52 
                 read_only Texture2DSampled %54 = OpLoad %24 
                                      f32_2 %55 = OpLoad %9 
                                      f32_4 %56 = OpImageSampleImplicitLod %54 %55 
                                        f32 %57 = OpCompositeExtract %56 3 
                                                    OpStore %53 %57 
                 read_only Texture2DSampled %59 = OpLoad %58 
                                      f32_2 %60 = OpLoad %9 
                                      f32_4 %61 = OpImageSampleImplicitLod %59 %60 
                                      f32_2 %62 = OpVectorShuffle %61 %61 0 1 
                                                    OpStore %20 %62 
                                      f32_2 %63 = OpLoad %20 
                                      f32_3 %64 = OpVectorShuffle %63 %63 1 0 0 
                                      f32_3 %69 = OpFMul %64 %68 
                                                    OpStore %37 %69 
                                        f32 %71 = OpLoad %53 
                                        f32 %72 = OpFMul %71 %47 
                               Private f32* %74 = OpAccessChain %37 %73 
                                        f32 %75 = OpLoad %74 
                                        f32 %76 = OpFNegate %75 
                                        f32 %77 = OpFAdd %72 %76 
                                                    OpStore %70 %77 
                                        f32 %78 = OpLoad %53 
                                      f32_2 %79 = OpCompositeConstruct %78 %78 
                                      f32_2 %81 = OpFMul %79 %80 
                                      f32_3 %82 = OpLoad %37 
                                      f32_2 %83 = OpVectorShuffle %82 %82 0 2 
                                      f32_2 %84 = OpFAdd %81 %83 
                                      f32_3 %85 = OpLoad %37 
                                      f32_3 %86 = OpVectorShuffle %85 %84 3 1 4 
                                                    OpStore %37 %86 
                                      f32_3 %87 = OpLoad %37 
                                      f32_2 %88 = OpVectorShuffle %87 %87 0 2 
                                      f32_2 %92 = OpFAdd %88 %91 
                                      f32_4 %93 = OpLoad %44 
                                      f32_4 %94 = OpVectorShuffle %93 %92 4 1 5 3 
                                                    OpStore %44 %94 
                               Private f32* %95 = OpAccessChain %20 %73 
                                        f32 %96 = OpLoad %95 
                                        f32 %97 = OpFNegate %96 
                                        f32 %99 = OpFMul %97 %98 
                                       f32 %100 = OpLoad %70 
                                       f32 %101 = OpFAdd %99 %100 
                              Private f32* %102 = OpAccessChain %37 %32 
                                                    OpStore %102 %101 
                              Private f32* %103 = OpAccessChain %37 %32 
                                       f32 %104 = OpLoad %103 
                                       f32 %106 = OpFAdd %104 %105 
                               Output f32* %107 = OpAccessChain %44 %73 
                                                    OpStore %107 %106 
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