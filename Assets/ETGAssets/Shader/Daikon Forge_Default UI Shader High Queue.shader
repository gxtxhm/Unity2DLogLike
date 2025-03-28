//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Daikon Forge/Default UI Shader High Queue" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "white" { }
}
SubShader {
 LOD 200
 Tags { "HighQueue" = "HighQueue" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Overlay+5500" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "HighQueue" = "HighQueue" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Overlay+5500" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Stencil {
   Ref 2
   Comp Always
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 62730
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
    vs_COLOR0 = in_COLOR0;
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
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat10_1;
bool u_xlatb1;
void main()
{
    u_xlat0.x = max(abs(vs_TEXCOORD1.y), abs(vs_TEXCOORD1.x));
    u_xlatb0 = 1.0<u_xlat0.x;
    u_xlat0.w = (u_xlatb0) ? 0.0 : vs_COLOR0.w;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlatb1 = u_xlat0.w==0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 108
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %98 %100 
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
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %83 RelaxedPrecision 
                                                     OpDecorate %83 Location 83 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate %98 Location 98 
                                                     OpDecorate %100 Location 100 
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
                               Output f32_4* %82 = OpVariable Output 
                                Input f32_4* %83 = OpVariable Input 
                                             %85 = OpTypeVector %6 2 
                                             %86 = OpTypePointer Output %85 
                               Output f32_2* %87 = OpVariable Output 
                               Output f32_2* %98 = OpVariable Output 
                                             %99 = OpTypePointer Input %85 
                               Input f32_2* %100 = OpVariable Input 
                                            %102 = OpTypePointer Output %6 
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
                                       f32_4 %88 = OpLoad %11 
                                       f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                              Uniform f32_4* %90 = OpAccessChain %20 %35 
                                       f32_4 %91 = OpLoad %90 
                                       f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                       f32_2 %93 = OpFMul %89 %92 
                              Uniform f32_4* %94 = OpAccessChain %20 %35 
                                       f32_4 %95 = OpLoad %94 
                                       f32_2 %96 = OpVectorShuffle %95 %95 2 3 
                                       f32_2 %97 = OpFAdd %93 %96 
                                                     OpStore %87 %97 
                                      f32_2 %101 = OpLoad %100 
                                                     OpStore %98 %101 
                                Output f32* %103 = OpAccessChain %72 %22 %68 
                                        f32 %104 = OpLoad %103 
                                        f32 %105 = OpFNegate %104 
                                Output f32* %106 = OpAccessChain %72 %22 %68 
                                                     OpStore %106 %105 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 82
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %40 %52 %79 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %40 Location 40 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %50 DescriptorSet 50 
                                                    OpDecorate %50 Binding 50 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %52 Location 52 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %79 Location 79 
                                                    OpDecorate %80 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeVector %6 2 
                                            %10 = OpTypePointer Input %9 
                               Input f32_2* %11 = OpVariable Input 
                                            %12 = OpTypeInt 32 0 
                                        u32 %13 = OpConstant 1 
                                            %14 = OpTypePointer Input %6 
                                        u32 %18 = OpConstant 0 
                                            %23 = OpTypeBool 
                                            %24 = OpTypePointer Private %23 
                              Private bool* %25 = OpVariable Private 
                                        f32 %26 = OpConstant 3.67402E-40 
                                            %29 = OpTypeVector %6 4 
                                            %30 = OpTypePointer Private %29 
                             Private f32_4* %31 = OpVariable Private 
                                            %32 = OpTypePointer Function %6 
                                        f32 %37 = OpConstant 3.67402E-40 
                                            %39 = OpTypePointer Input %29 
                               Input f32_4* %40 = OpVariable Input 
                                        u32 %41 = OpConstant 3 
                             Private f32_4* %46 = OpVariable Private 
                                            %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %48 = OpTypeSampledImage %47 
                                            %49 = OpTypePointer UniformConstant %48 
UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                               Input f32_2* %52 = OpVariable Input 
                                            %55 = OpTypeVector %6 3 
                              Private bool* %63 = OpVariable Private 
                                            %68 = OpTypeInt 32 1 
                                        i32 %69 = OpConstant 0 
                                        i32 %70 = OpConstant 1 
                                        i32 %72 = OpConstant -1 
                                            %78 = OpTypePointer Output %29 
                              Output f32_4* %79 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %33 = OpVariable Function 
                                 Input f32* %15 = OpAccessChain %11 %13 
                                        f32 %16 = OpLoad %15 
                                        f32 %17 = OpExtInst %1 4 %16 
                                 Input f32* %19 = OpAccessChain %11 %18 
                                        f32 %20 = OpLoad %19 
                                        f32 %21 = OpExtInst %1 4 %20 
                                        f32 %22 = OpExtInst %1 40 %17 %21 
                                                    OpStore %8 %22 
                                        f32 %27 = OpLoad %8 
                                       bool %28 = OpFOrdLessThan %26 %27 
                                                    OpStore %25 %28 
                                       bool %34 = OpLoad %25 
                                                    OpSelectionMerge %36 None 
                                                    OpBranchConditional %34 %35 %38 
                                            %35 = OpLabel 
                                                    OpStore %33 %37 
                                                    OpBranch %36 
                                            %38 = OpLabel 
                                 Input f32* %42 = OpAccessChain %40 %41 
                                        f32 %43 = OpLoad %42 
                                                    OpStore %33 %43 
                                                    OpBranch %36 
                                            %36 = OpLabel 
                                        f32 %44 = OpLoad %33 
                               Private f32* %45 = OpAccessChain %31 %41 
                                                    OpStore %45 %44 
                 read_only Texture2DSampled %51 = OpLoad %50 
                                      f32_2 %53 = OpLoad %52 
                                      f32_4 %54 = OpImageSampleImplicitLod %51 %53 
                                                    OpStore %46 %54 
                                      f32_4 %56 = OpLoad %40 
                                      f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                      f32_4 %58 = OpLoad %31 
                                      f32_4 %59 = OpVectorShuffle %58 %57 4 5 6 3 
                                                    OpStore %31 %59 
                                      f32_4 %60 = OpLoad %31 
                                      f32_4 %61 = OpLoad %46 
                                      f32_4 %62 = OpFMul %60 %61 
                                                    OpStore %31 %62 
                               Private f32* %64 = OpAccessChain %31 %41 
                                        f32 %65 = OpLoad %64 
                                       bool %66 = OpFOrdEqual %65 %37 
                                                    OpStore %63 %66 
                                       bool %67 = OpLoad %63 
                                        i32 %71 = OpSelect %67 %70 %69 
                                        i32 %73 = OpIMul %71 %72 
                                       bool %74 = OpINotEqual %73 %69 
                                                    OpSelectionMerge %76 None 
                                                    OpBranchConditional %74 %75 %76 
                                            %75 = OpLabel 
                                                    OpKill
                                            %76 = OpLabel 
                                      f32_4 %80 = OpLoad %31 
                                                    OpStore %79 %80 
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