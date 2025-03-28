//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Caster Renderer" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 LOD 200
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Cull Off
  GpuProgramID 41902
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
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = vs_COLOR0.w * u_xlat10_0.w + -0.100000001;
    u_xlat1 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat1;
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.xyz = vs_COLOR0.xyz * vec3(1.0, 1.0, -1.0) + vec3(0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 105
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 %97 
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
                                                     OpDecorate %85 Location 85 
                                                     OpDecorate %96 Location 96 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %97 Location 97 
                                                     OpDecorate %98 RelaxedPrecision 
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
                                             %83 = OpTypePointer Output %82 
                               Output f32_2* %84 = OpVariable Output 
                                Input f32_4* %85 = OpVariable Input 
                               Output f32_4* %96 = OpVariable Output 
                                Input f32_4* %97 = OpVariable Input 
                                             %99 = OpTypePointer Output %6 
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
                                       f32_4 %86 = OpLoad %85 
                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore %84 %95 
                                       f32_4 %98 = OpLoad %97 
                                                     OpStore %96 %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                        f32 %101 = OpLoad %100 
                                        f32 %102 = OpFNegate %101 
                                Output f32* %103 = OpAccessChain %72 %22 %68 
                                                     OpStore %103 %102 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 72
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %25 %39 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %25 Location 25 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %39 Location 39 
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
                                            %24 = OpTypePointer Input %18 
                               Input f32_4* %25 = OpVariable Input 
                                            %26 = OpTypePointer Input %6 
                                        f32 %31 = OpConstant 3.67402E-40 
                               Private f32* %33 = OpVariable Private 
                                            %38 = OpTypePointer Output %18 
                              Output f32_4* %39 = OpVariable Output 
                                            %41 = OpTypePointer Output %6 
                                            %43 = OpTypeBool 
                                            %44 = OpTypePointer Private %43 
                              Private bool* %45 = OpVariable Private 
                                        f32 %47 = OpConstant 3.67402E-40 
                                            %50 = OpTypeInt 32 1 
                                        i32 %51 = OpConstant 0 
                                        i32 %52 = OpConstant 1 
                                        i32 %54 = OpConstant -1 
                                            %60 = OpTypeVector %6 3 
                                        f32 %63 = OpConstant 3.67402E-40 
                                        f32 %64 = OpConstant 3.67402E-40 
                                      f32_3 %65 = OpConstantComposite %63 %63 %64 
                                      f32_3 %67 = OpConstantComposite %47 %47 %63 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                 Input f32* %27 = OpAccessChain %25 %21 
                                        f32 %28 = OpLoad %27 
                                        f32 %29 = OpLoad %8 
                                        f32 %30 = OpFMul %28 %29 
                                        f32 %32 = OpFAdd %30 %31 
                                                    OpStore %23 %32 
                                        f32 %34 = OpLoad %8 
                                 Input f32* %35 = OpAccessChain %25 %21 
                                        f32 %36 = OpLoad %35 
                                        f32 %37 = OpFMul %34 %36 
                                                    OpStore %33 %37 
                                        f32 %40 = OpLoad %33 
                                Output f32* %42 = OpAccessChain %39 %21 
                                                    OpStore %42 %40 
                                        f32 %46 = OpLoad %23 
                                       bool %48 = OpFOrdLessThan %46 %47 
                                                    OpStore %45 %48 
                                       bool %49 = OpLoad %45 
                                        i32 %53 = OpSelect %49 %52 %51 
                                        i32 %55 = OpIMul %53 %54 
                                       bool %56 = OpINotEqual %55 %51 
                                                    OpSelectionMerge %58 None 
                                                    OpBranchConditional %56 %57 %58 
                                            %57 = OpLabel 
                                                    OpKill
                                            %58 = OpLabel 
                                      f32_4 %61 = OpLoad %25 
                                      f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                      f32_3 %66 = OpFMul %62 %65 
                                      f32_3 %68 = OpFAdd %66 %67 
                                      f32_4 %69 = OpLoad %39 
                                      f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                                    OpStore %39 %70 
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
Fallback "Diffuse"
}