//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SimpleCompositor" {
Properties {
_BaseTex ("base", 2D) = "white" { }
_LayerTex ("Layer", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 4287
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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

uniform  sampler2D _BaseTex;
uniform  sampler2D _LayerTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat10_0;
bvec3 u_xlatb1;
void main()
{
    u_xlat10_0 = texture(_LayerTex, vs_TEXCOORD0.xy);
    u_xlatb1.xyz = equal(u_xlat10_0.xyzx, vec4(1.0, 0.0, 0.0, 0.0)).xyz;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
    if(u_xlatb1.x){
        SV_Target0 = texture(_BaseTex, vs_TEXCOORD0.xy);
        return;
    } else {
        SV_Target0 = u_xlat10_0;
        return;
    //ENDIF
    }
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
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 
                                              OpDecorate %9 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
                         Output f32_2* %9 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore %9 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                          Output f32* %89 = OpAccessChain %78 %28 %74 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 63
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %56 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %51 DescriptorSet 51 
                                                    OpDecorate %51 Binding 51 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %56 Location 56 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
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
                                            %20 = OpTypeBool 
                                            %21 = OpTypeVector %20 3 
                                            %22 = OpTypePointer Private %21 
                            Private bool_3* %23 = OpVariable Private 
                                        f32 %26 = OpConstant 3.67402E-40 
                                        f32 %27 = OpConstant 3.67402E-40 
                                      f32_4 %28 = OpConstantComposite %26 %27 %27 %27 
                                            %29 = OpTypeVector %20 4 
                             Private f32_4* %50 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                            %55 = OpTypePointer Output %7 
                              Output f32_4* %56 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %24 = OpLoad %9 
                                      f32_4 %25 = OpVectorShuffle %24 %24 0 1 2 0 
                                     bool_4 %30 = OpFOrdEqual %25 %28 
                                     bool_3 %31 = OpVectorShuffle %30 %30 0 1 2 
                                                    OpStore %23 %31 
                                     bool_3 %32 = OpLoad %23 
                                       bool %33 = OpCompositeExtract %32 1 
                                     bool_3 %34 = OpLoad %23 
                                       bool %35 = OpCompositeExtract %34 0 
                                       bool %36 = OpLogicalAnd %33 %35 
                                     bool_3 %37 = OpLoad %23 
                                     bool_3 %38 = OpCompositeInsert %36 %37 0 
                                                    OpStore %23 %38 
                                     bool_3 %39 = OpLoad %23 
                                       bool %40 = OpCompositeExtract %39 2 
                                     bool_3 %41 = OpLoad %23 
                                       bool %42 = OpCompositeExtract %41 0 
                                       bool %43 = OpLogicalAnd %40 %42 
                                     bool_3 %44 = OpLoad %23 
                                     bool_3 %45 = OpCompositeInsert %43 %44 0 
                                                    OpStore %23 %45 
                                     bool_3 %46 = OpLoad %23 
                                       bool %47 = OpCompositeExtract %46 0 
                                                    OpSelectionMerge %49 None 
                                                    OpBranchConditional %47 %48 %59 
                                            %48 = OpLabel 
                 read_only Texture2DSampled %52 = OpLoad %51 
                                      f32_2 %53 = OpLoad %17 
                                      f32_4 %54 = OpImageSampleImplicitLod %52 %53 
                                                    OpStore %50 %54 
                                      f32_4 %57 = OpLoad %50 
                                                    OpStore %56 %57 
                                                    OpReturn
                                            %59 = OpLabel 
                                      f32_4 %60 = OpLoad %9 
                                                    OpStore %56 %60 
                                                    OpReturn
                                            %49 = OpLabel 
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