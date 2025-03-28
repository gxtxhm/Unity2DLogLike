//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/CubeBlend" {
Properties {
_TexA ("Cubemap", Cube) = "grey" { }
_TexB ("Cubemap", Cube) = "grey" { }
_value ("Value", Range(0, 1)) = 0.5
}
SubShader {
 Tags { "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "QUEUE" = "Background" "RenderType" = "Background" }
  ZTest Always
  ZWrite Off
  Fog {
   Mode Off
  }
  GpuProgramID 19854
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
in  vec3 in_TEXCOORD0;
out vec3 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TexA_HDR;
uniform 	vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
uniform  samplerCube _TexA;
uniform  samplerCube _TexB;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
float u_xlat6;
float u_xlat16_6;
void main()
{
    u_xlat10_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_6 = u_xlat10_0.w + -1.0;
    u_xlat6 = _TexA_HDR.w * u_xlat16_6 + 1.0;
    u_xlat6 = u_xlat6 * _TexA_HDR.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(u_xlat6);
    u_xlat10_1 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_6 = u_xlat10_1.w + -1.0;
    u_xlat6 = _TexB_HDR.w * u_xlat16_6 + 1.0;
    u_xlat6 = u_xlat6 * _TexB_HDR.x;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat10_1.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
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
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
                        Output f32_3* %84 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_3 %87 = OpLoad %86 
                                              OpStore %84 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %106 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %59 DescriptorSet 59 
                                                      OpDecorate %59 Binding 59 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %75 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %106 Location 106 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
UniformConstant read_only TextureCubeSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 3 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_3* %17 = OpVariable Input 
                                              %19 = OpTypeStruct %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
    Uniform struct {f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 2 
                                              %24 = OpTypePointer Uniform %6 
                                              %28 = OpTypePointer Private %15 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 3 
                                              %32 = OpTypePointer Private %6 
                                          f32 %35 = OpConstant 3.67402E-40 
                                          u32 %37 = OpConstant 0 
                                          i32 %39 = OpConstant 0 
                                          f32 %45 = OpConstant 3.67402E-40 
UniformConstant read_only TextureCubeSampled* %59 = OpVariable UniformConstant 
                                 Private f32* %65 = OpVariable Private 
                                          i32 %69 = OpConstant 1 
                               Private f32_3* %79 = OpVariable Private 
                               Private f32_3* %88 = OpVariable Private 
                                          i32 %89 = OpConstant 3 
                                             %105 = OpTypePointer Output %7 
                               Output f32_4* %106 = OpVariable Output 
                                             %110 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                 read_only TextureCubeSampled %14 = OpLoad %13 
                                        f32_3 %18 = OpLoad %17 
                                 Uniform f32* %25 = OpAccessChain %21 %23 
                                          f32 %26 = OpLoad %25 
                                        f32_4 %27 = OpImageSampleExplicitLod %14 %18 Lod %7 
                                                      OpStore %9 %27 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                          f32 %34 = OpLoad %33 
                                          f32 %36 = OpFAdd %34 %35 
                                 Private f32* %38 = OpAccessChain %29 %37 
                                                      OpStore %38 %36 
                                 Uniform f32* %40 = OpAccessChain %21 %39 %31 
                                          f32 %41 = OpLoad %40 
                                 Private f32* %42 = OpAccessChain %29 %37 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %41 %43 
                                          f32 %46 = OpFAdd %44 %45 
                                 Private f32* %47 = OpAccessChain %29 %37 
                                                      OpStore %47 %46 
                                 Private f32* %48 = OpAccessChain %29 %37 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %50 = OpAccessChain %21 %39 %37 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpFMul %49 %51 
                                 Private f32* %53 = OpAccessChain %29 %37 
                                                      OpStore %53 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpLoad %29 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 0 0 
                                        f32_3 %58 = OpFMul %55 %57 
                                                      OpStore %29 %58 
                 read_only TextureCubeSampled %60 = OpLoad %59 
                                        f32_3 %61 = OpLoad %17 
                                 Uniform f32* %62 = OpAccessChain %21 %23 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpImageSampleExplicitLod %60 %61 Lod %7 
                                                      OpStore %9 %64 
                                 Private f32* %66 = OpAccessChain %9 %31 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFAdd %67 %35 
                                                      OpStore %65 %68 
                                 Uniform f32* %70 = OpAccessChain %21 %69 %31 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpLoad %65 
                                          f32 %73 = OpFMul %71 %72 
                                          f32 %74 = OpFAdd %73 %45 
                                                      OpStore %65 %74 
                                          f32 %75 = OpLoad %65 
                                 Uniform f32* %76 = OpAccessChain %21 %69 %37 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFMul %75 %77 
                                                      OpStore %65 %78 
                                          f32 %80 = OpLoad %65 
                                        f32_3 %81 = OpCompositeConstruct %80 %80 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %29 
                                        f32_3 %86 = OpFNegate %85 
                                        f32_3 %87 = OpFAdd %84 %86 
                                                      OpStore %79 %87 
                                 Uniform f32* %90 = OpAccessChain %21 %89 
                                          f32 %91 = OpLoad %90 
                                 Uniform f32* %92 = OpAccessChain %21 %89 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %94 = OpAccessChain %21 %89 
                                          f32 %95 = OpLoad %94 
                                        f32_3 %96 = OpCompositeConstruct %91 %93 %95 
                                          f32 %97 = OpCompositeExtract %96 0 
                                          f32 %98 = OpCompositeExtract %96 1 
                                          f32 %99 = OpCompositeExtract %96 2 
                                       f32_3 %100 = OpCompositeConstruct %97 %98 %99 
                                       f32_3 %101 = OpLoad %79 
                                       f32_3 %102 = OpFMul %100 %101 
                                       f32_3 %103 = OpLoad %29 
                                       f32_3 %104 = OpFAdd %102 %103 
                                                      OpStore %88 %104 
                                       f32_3 %107 = OpLoad %88 
                                       f32_4 %108 = OpLoad %106 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %106 %109 
                                 Output f32* %111 = OpAccessChain %106 %31 
                                                      OpStore %111 %45 
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
SubShader {
 Tags { "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "QUEUE" = "Background" "RenderType" = "Background" }
  ZTest Always
  ZWrite Off
  Fog {
   Mode Off
  }
  GpuProgramID 105093
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
in  vec3 in_TEXCOORD0;
out vec3 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TexA_HDR;
uniform 	vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
uniform  samplerCube _TexA;
uniform  samplerCube _TexB;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
float u_xlat6;
float u_xlat16_6;
void main()
{
    u_xlat10_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_6 = u_xlat10_0.w + -1.0;
    u_xlat6 = _TexA_HDR.w * u_xlat16_6 + 1.0;
    u_xlat6 = u_xlat6 * _TexA_HDR.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(u_xlat6);
    u_xlat10_1 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_6 = u_xlat10_1.w + -1.0;
    u_xlat6 = _TexB_HDR.w * u_xlat16_6 + 1.0;
    u_xlat6 = u_xlat6 * _TexB_HDR.x;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat10_1.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
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
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 Location 86 
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
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
                        Output f32_3* %84 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_3 %87 = OpLoad %86 
                                              OpStore %84 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %106 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %59 DescriptorSet 59 
                                                      OpDecorate %59 Binding 59 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %75 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %106 Location 106 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
UniformConstant read_only TextureCubeSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 3 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_3* %17 = OpVariable Input 
                                              %19 = OpTypeStruct %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
    Uniform struct {f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 2 
                                              %24 = OpTypePointer Uniform %6 
                                              %28 = OpTypePointer Private %15 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 3 
                                              %32 = OpTypePointer Private %6 
                                          f32 %35 = OpConstant 3.67402E-40 
                                          u32 %37 = OpConstant 0 
                                          i32 %39 = OpConstant 0 
                                          f32 %45 = OpConstant 3.67402E-40 
UniformConstant read_only TextureCubeSampled* %59 = OpVariable UniformConstant 
                                 Private f32* %65 = OpVariable Private 
                                          i32 %69 = OpConstant 1 
                               Private f32_3* %79 = OpVariable Private 
                               Private f32_3* %88 = OpVariable Private 
                                          i32 %89 = OpConstant 3 
                                             %105 = OpTypePointer Output %7 
                               Output f32_4* %106 = OpVariable Output 
                                             %110 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                 read_only TextureCubeSampled %14 = OpLoad %13 
                                        f32_3 %18 = OpLoad %17 
                                 Uniform f32* %25 = OpAccessChain %21 %23 
                                          f32 %26 = OpLoad %25 
                                        f32_4 %27 = OpImageSampleExplicitLod %14 %18 Lod %7 
                                                      OpStore %9 %27 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                          f32 %34 = OpLoad %33 
                                          f32 %36 = OpFAdd %34 %35 
                                 Private f32* %38 = OpAccessChain %29 %37 
                                                      OpStore %38 %36 
                                 Uniform f32* %40 = OpAccessChain %21 %39 %31 
                                          f32 %41 = OpLoad %40 
                                 Private f32* %42 = OpAccessChain %29 %37 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %41 %43 
                                          f32 %46 = OpFAdd %44 %45 
                                 Private f32* %47 = OpAccessChain %29 %37 
                                                      OpStore %47 %46 
                                 Private f32* %48 = OpAccessChain %29 %37 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %50 = OpAccessChain %21 %39 %37 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpFMul %49 %51 
                                 Private f32* %53 = OpAccessChain %29 %37 
                                                      OpStore %53 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpLoad %29 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 0 0 
                                        f32_3 %58 = OpFMul %55 %57 
                                                      OpStore %29 %58 
                 read_only TextureCubeSampled %60 = OpLoad %59 
                                        f32_3 %61 = OpLoad %17 
                                 Uniform f32* %62 = OpAccessChain %21 %23 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpImageSampleExplicitLod %60 %61 Lod %7 
                                                      OpStore %9 %64 
                                 Private f32* %66 = OpAccessChain %9 %31 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFAdd %67 %35 
                                                      OpStore %65 %68 
                                 Uniform f32* %70 = OpAccessChain %21 %69 %31 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpLoad %65 
                                          f32 %73 = OpFMul %71 %72 
                                          f32 %74 = OpFAdd %73 %45 
                                                      OpStore %65 %74 
                                          f32 %75 = OpLoad %65 
                                 Uniform f32* %76 = OpAccessChain %21 %69 %37 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFMul %75 %77 
                                                      OpStore %65 %78 
                                          f32 %80 = OpLoad %65 
                                        f32_3 %81 = OpCompositeConstruct %80 %80 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %29 
                                        f32_3 %86 = OpFNegate %85 
                                        f32_3 %87 = OpFAdd %84 %86 
                                                      OpStore %79 %87 
                                 Uniform f32* %90 = OpAccessChain %21 %89 
                                          f32 %91 = OpLoad %90 
                                 Uniform f32* %92 = OpAccessChain %21 %89 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %94 = OpAccessChain %21 %89 
                                          f32 %95 = OpLoad %94 
                                        f32_3 %96 = OpCompositeConstruct %91 %93 %95 
                                          f32 %97 = OpCompositeExtract %96 0 
                                          f32 %98 = OpCompositeExtract %96 1 
                                          f32 %99 = OpCompositeExtract %96 2 
                                       f32_3 %100 = OpCompositeConstruct %97 %98 %99 
                                       f32_3 %101 = OpLoad %79 
                                       f32_3 %102 = OpFMul %100 %101 
                                       f32_3 %103 = OpLoad %29 
                                       f32_3 %104 = OpFAdd %102 %103 
                                                      OpStore %88 %104 
                                       f32_3 %107 = OpLoad %88 
                                       f32_4 %108 = OpLoad %106 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %106 %109 
                                 Output f32* %111 = OpAccessChain %106 %31 
                                                      OpStore %111 %45 
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